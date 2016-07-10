using System;
using System.Data;
using System.Data.Common;
using System.Configuration;
using System.Reflection;
using ExameAbril.DataBase.Generics.DataManager;

namespace ExameAbril.DataBase.Generics
{
	public class CData : IData
	{
        public CData() { }

        private const string EXCEPTIONMESSAGE = "Não foi possível criar uma Conexão. \r" +
                        "É necessário ter um <connectionString/> em seu App.Config ou Web.config com os seguintes valores.\r\r" +
                        "<connectionStrings>\r" +
                        "   <add name=\"connectionString\" connectionString=\"connectionString do Banco de Dados\" ProviderName=\"providerName\"/>\r" +
                        "</connectionStrings>\r\r" +
                        "Onde o atributo Name deve ser exatamente connectionString, o connectionString deve conter a string de conexão ao banco" +
                        " e ProviderName deve conter um dos seguintes nomes: \rSqlServer \rMsAccess.\r";

        private DbConnection _cn = null;
        private DbCommand _cmd = null;
        /// <summary>
        /// Controla se o campo primary key fou preenchido, usado para delete
        /// </summary>
        private bool pkValue = false;

        protected internal DbConnection Cn
        {
            get { return _cn; }
            set { _cn = value; }
        }

        protected internal DbCommand Cmd
        {
            get { return _cmd; }
            set { _cmd = value; }
        }
        /// <summary>
        /// Retorna a conexao com o banco
        /// </summary>
        protected internal string ConnectionString
        {
            get
            {
                try
                {
                    return ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
                }
                catch { throw new Exception(EXCEPTIONMESSAGE); }
            }
        }
        /// <summary>
        /// Retorna o provider do web.config
        /// </summary>
        protected internal DataBaseType BaseType
        {
            get
            {
                try
                {
                    return (DataBaseType)Enum.Parse(typeof(DataBaseType),
                        ConfigurationManager.ConnectionStrings["connectionString"].ProviderName);
                }
                catch { throw new Exception(EXCEPTIONMESSAGE); }
            }
        }

        /// <summary>
        /// Abre a conexão com o banco de dados
        /// </summary>
        protected internal void OpenConnection()
        {
            Cn = DataBaseGeneric.CreateConnection(BaseType, ConnectionString);
            Cn.Open();
            Cmd.Connection = Cn;
        }

        /// <summary>
        /// Fecha a conexão com o banco de dados
        /// </summary>
        protected internal void CloseConnection(IType iType)
        {
            if (Cn != null)
            {
                if (Cn.State == ConnectionState.Open && iType.Transaction == null)
                {
                    Cn.Close();
                    Cn.Dispose();
                }
            }
        }

        /// <summary>
        /// Abre a conexão ultilizando transação
        /// </summary>
        protected internal void OpenConnectionTrans(IType iType)
        {
            if (iType.IsTransaction)
            {
                if (iType.Transaction == null)
                {
                    OpenConnection();
                    Cmd.Transaction = Cmd.Connection.BeginTransaction();
                    iType.Transaction = Cmd.Transaction;
                }
                else
                {
                    Cmd.Connection = iType.Transaction.Connection;
                    Cmd.Transaction = iType.Transaction;
                }
            }
            else OpenConnection();
        }
        /// <summary>
        /// Seta parâmetros para procedure
        /// </summary>
        /// <param name="iType">interface do objeto</param>
        /// <param name="pi">proprieade do objeto</param>
        /// <param name="cmd">comando de execução</param>
        private void setParan(IType iType, PropertyInfo pi, DbCommand cmd)
        {
            DbParameter paran = Cmd.CreateParameter();
            paran.ParameterName = "@" + pi.Name;
            if (pi.GetValue(iType, null) == null || pkValue) paran.Value = DBNull.Value;
            else paran.Value = pi.GetValue(iType, null);
            Cmd.Parameters.Add(paran);
        }
        /// <summary>
        /// Seta parâmetros para procedure, usado em delete
        /// </summary>
        /// <param name="iType">interface do objeto</param>
        /// <param name="pi">proprieade do objeto</param>
        /// <param name="cmd">comando de execução</param>
       
        private void setParanDel(IType iType, PropertyInfo pi, DbCommand cmd)
        {
            DbParameter paran = Cmd.CreateParameter();
            paran.ParameterName = "@" + pi.Name;
            if (pi.GetValue(iType, null) == null || pkValue) paran.Value = DBNull.Value;
            else
            {
                paran.Value = pi.GetValue(iType, null);

                PropertyAttribute[] pAttProperty = (PropertyAttribute[])pi.GetCustomAttributes(typeof(PropertyAttribute), false);
                if (pAttProperty != null && pAttProperty.Length > 0 && pAttProperty[0].IsPk)
                    pkValue = true;
            }
            Cmd.Parameters.Add(paran);
        }
        /// <summary>
        /// Seta parâmetros para o processo de save
        /// </summary>
        /// <param name="iType">interface do objeto</param>
        protected internal virtual PropertyInfo SetParanSave(IType iType)
        {
            PropertyInfo pInfo = null;
            foreach (PropertyInfo pi in iType.GetType().GetProperties())
            {
                OperationsAttribute[] pAttOperation = (OperationsAttribute[])pi.GetCustomAttributes(typeof(OperationsAttribute), false);
                PropertyAttribute[] pAttProperty = (PropertyAttribute[])pi.GetCustomAttributes(typeof(PropertyAttribute), false);
                if (pAttOperation != null && pAttOperation.Length > 0 && pAttOperation[0].UseSave)
                    setParan(iType, pi, Cmd);
                if (pInfo == null && pAttProperty != null && pAttProperty.Length > 0 && pAttProperty[0].IsPk)
                   pInfo = pi;
            }
            return pInfo;
        }
        /// <summary>
        /// Seta parâmetros para o processo de delete
        /// </summary>
        /// <param name="iType">interface do objeto</param>      
        protected internal virtual void SetParanDelete(IType iType)
        {
            foreach (PropertyInfo pi in iType.GetType().GetProperties())
            {
                OperationsAttribute[] pAttOperation = (OperationsAttribute[])pi.GetCustomAttributes(typeof(OperationsAttribute), false);
                if (pAttOperation != null && pAttOperation.Length > 0 && pAttOperation[0].UseDelete)
                    setParanDel(iType, pi, Cmd);
            }
        }
        /// <summary>
        /// Seta parâmetros para o processo de Get
        /// </summary>
        /// <param name="iType">interface do objeto</param>      
        protected internal virtual void SetParanGet(IType iType)
        {
            foreach (PropertyInfo pi in iType.GetType().GetProperties())
            {
                OperationsAttribute[] pAttOperation = (OperationsAttribute[])pi.GetCustomAttributes(typeof(OperationsAttribute), false);
                if (pAttOperation != null && pAttOperation.Length > 0 && pAttOperation[0].UseGet)
                    setParan(iType, pi, Cmd);
            }
        }
        /// <summary>
        /// Metodo interno para setar e retorna um objeto pedido através de um DataReader
        /// </summary>
        /// <param name="dr">DataReader de cliente</param>
        /// <param name="objCliente">Referência para objeto Cliente</param>
        public virtual IType SetObject(DbDataReader dr, IType iType)
        {
            foreach (PropertyInfo pi in iType.GetType().GetProperties())
            {
                PropertyAttribute[] pAttribute = (PropertyAttribute[])pi.GetCustomAttributes(typeof(PropertyAttribute), false);
                if (pAttribute != null && pAttribute.Length > 0 && (pAttribute[0].IsPk || pAttribute[0].IsField))
                    pi.SetValue(iType, changeType(dr[pi.Name], pi.PropertyType), null);
            }
            iType.IsFull = true;
            return iType;
        }
        /// <summary>
        /// Seta seta o valor para a propriedade
        /// </summary>
        /// <param name="object">valor do banco de dados</param>
        /// <param name="iType">interface do objeto</param>      
        private object changeType(object value, Type type)
        {
            if (value == null && type.IsGenericType) return Activator.CreateInstance(type);
            if (value == null || value == DBNull.Value) return null;
            if (type == value.GetType()) return value;

            if (type.IsEnum)
            {
                if (value is string)
                    return Enum.Parse(type, value as string);
                else
                    return Enum.ToObject(type, value);
            }

            if (!type.IsInterface && type.IsGenericType)
            {
                Type innerType = type.GetGenericArguments()[0];
                object innerValue = changeType(value, innerType);
                return Activator.CreateInstance(type, new object[] { innerValue });
            }

            if (value is string && type == typeof(Guid)) return new Guid(value as string);
            if (value is string && type == typeof(Version)) return new Version(value as string);
            if (!(value is IConvertible)) return value;

            return Convert.ChangeType(value, type);
        }
        /// <summary>
        /// Salva os dados na base através de parâmetros
        /// </summary>
        public virtual void Save(IType iType)
        {
            try
            {
                Cmd = DataBaseGeneric.CreateCommand(BaseType);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.CommandText = "usp_Save" + iType.GetType().Name;
                PropertyInfo cPk = SetParanSave(iType);
                OpenConnectionTrans(iType);
                if (cPk != null) cPk.SetValue(iType, changeType(Cmd.ExecuteScalar(), cPk.PropertyType), null);
                else Cmd.ExecuteNonQuery();
            }
            catch (Exception ex) { throw ex; }
            finally { CloseConnection(iType); }
        }
        /// <summary>
        /// Exclui os dados na base através dos parâmetros
        /// </summary>
        public virtual void Delete(IType iType)
        {
            try
            {
                Cmd = DataBaseGeneric.CreateCommand(BaseType);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.CommandText = "usp_Del" + iType.GetType().Name;
                SetParanDelete(iType);
                OpenConnectionTrans(iType);
                Cmd.ExecuteNonQuery();
            }
            catch (Exception ex) { throw ex; }
            finally { CloseConnection(iType); }
        }
        /// <summary>
        /// Busca os dados da base através dos parâmetros
        /// </summary>
        public virtual LIType Get(IType iType)
        {
            try
            {
                Cmd = DataBaseGeneric.CreateCommand(BaseType);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.CommandText = "usp_Get" + iType.GetType().Name;
                SetParanGet(iType);
                OpenConnection();
                LIType l = new LIType();
                DbDataReader dr = Cmd.ExecuteReader();
                if (dr != null)
                    while (dr.Read())
                        l.Add(SetObject(dr, (IType)Activator.CreateInstance(iType.GetType())));
                return l;
            }
            catch (Exception ex) { throw ex; }
            finally { CloseConnection(iType); }
        }
        /// <summary>
        /// Busca os dados da base e seta a referencia
        /// </summary>
        public virtual IType Get(ref IType iType)
        {   
            try
            {
                Cmd = DataBaseGeneric.CreateCommand(BaseType);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.CommandText = "usp_Get" + iType.GetType().Name;
                SetParanGet(iType);
                OpenConnection();
                LIType l = new LIType();
                DbDataReader dr = Cmd.ExecuteReader();
                if (dr != null && dr.Read()) SetObject(dr, iType);
                return iType;
            }
            catch (Exception ex) { throw ex; }
            finally { CloseConnection(iType); }
        }
	}
}
