namespace CSGen.Code
{
    using CSGen;
    using System;
    using System.Collections.Generic;
    using System.Data;

    public class SqlTable
    {
        private string _classBusinessNome;
        private string _classDataBaseNome;
        private int _codigo;
        private List<SqlColumn> _colunas;
        private DateTime _dataCriacao;
        private bool _ignore;
        private bool _isTableNo;
        private string _nome;
        private string _procNome;
        private List<SqlReference> _references;

        public SqlTable()
        {
        }

        public SqlTable(int codigo_, string nome_, DateTime dataCriacao_, List<SqlColumn> colunas_)
        {
            this._codigo = codigo_;
            this._nome = nome_;
            this._dataCriacao = dataCriacao_;
            this._colunas = colunas_;
        }

        protected internal static SqlTable ConvertToObject(DataRow tableDataRow)
        {
            List<SqlColumn> columns = LoadDataBaseSchema.GetColumns(tableDataRow["name"].ToString());
            List<SqlReference> references = LoadDataBaseSchema.GetReferences(tableDataRow["name"].ToString());
            SqlTable table = new SqlTable(Convert.ToInt32(tableDataRow["id"]), tableDataRow["name"].ToString(), Convert.ToDateTime(tableDataRow["crdate"].ToString()), columns);
            table._references = references;
            table._classDataBaseNome = table._nome.Replace(Program.stringRemoveClass, "");
            char ch = table._classDataBaseNome[0];
            table._classDataBaseNome = ch.ToString().ToUpper() + table._classDataBaseNome.Substring(1);
            table._classBusinessNome = table._nome.Replace(Program.stringRemoveClass, "");
            char ch2 = table._classBusinessNome[0];
            table._classBusinessNome = ch2.ToString().ToUpper() + table._classBusinessNome.Substring(1);
            table._procNome = table._nome.Replace(Program.stringRemoveProc, "");
            table._ignore = false;
            table._isTableNo = true;
            foreach (SqlColumn column in table.Colunas)
            {
                if (!column.IsFk)
                {
                    table._isTableNo = false;
                    return table;
                }
            }
            return table;
        }

        public static string GetBusinessClassName(string TableName)
        {
            if (Program.SqlTableList != null)
            {
                foreach (SqlTable table in Program.SqlTableList)
                {
                    if (table.Nome.ToLower() == TableName.ToLower())
                    {
                        return table.ClassBusinessNome;
                    }
                }
            }
            return "";
        }

        public SqlColumn GetColumn(string columnName)
        {
            foreach (SqlColumn column in this.Colunas)
            {
                if (column.Name.ToLower() == columnName.ToLower())
                {
                    return column;
                }
            }
            return null;
        }

        public string GetColumnsInParams()
        {
            string str = "";
            foreach (SqlColumn column in this.Colunas)
            {
                string str2 = str;
                str = str2 + column.NetDataType + " " + column.Name + "_, ";
            }
            if (str != "")
            {
                str = str.Remove(str.Length - 2, 2);
            }
            return str;
        }

        public string GetColumnsOutParams()
        {
            string str = "";
            foreach (SqlColumn column in this.Colunas)
            {
                str = str + column.Name + "_, ";
            }
            if (str != "")
            {
                str = str.Remove(str.Length - 2, 2);
            }
            return str;
        }

        public SqlColumn GetIdentityColumn()
        {
            foreach (SqlColumn column in this.Colunas)
            {
                if (column.IsIdentity)
                {
                    return column;
                }
            }
            return null;
        }

        public static SqlTable GetTable(string tablename)
        {
            if (Program.SqlTableList != null)
            {
                foreach (SqlTable table in Program.SqlTableList)
                {
                    if ((tablename.ToLower() != table.ClassBusinessNome.ToLower()) && (tablename.ToLower() != table._nome.ToLower()))
                    {
                        continue;
                    }
                    return table;
                }
            }
            return null;
        }

        public string ClassBusinessNome
        {
            get
            {
                return this._classBusinessNome;
            }
            set
            {
                this._classBusinessNome = value;
            }
        }

        public string ClassDataBaseNome
        {
            get
            {
                return this._classDataBaseNome;
            }
            set
            {
                this._classDataBaseNome = value;
            }
        }

        public int Codigo
        {
            get
            {
                return this._codigo;
            }
            set
            {
                this._codigo = value;
            }
        }

        public List<SqlColumn> Colunas
        {
            get
            {
                return this._colunas;
            }
            set
            {
                this._colunas = value;
            }
        }

        public DateTime DataCriacao
        {
            get
            {
                return this._dataCriacao;
            }
            set
            {
                this._dataCriacao = value;
            }
        }

        public bool Ignore
        {
            get
            {
                return this._ignore;
            }
            set
            {
                this._ignore = value;
            }
        }

        public bool IsTableNo
        {
            get
            {
                return this._isTableNo;
            }
            set
            {
                this._isTableNo = value;
            }
        }

        public string Nome
        {
            get
            {
                return this._nome;
            }
            set
            {
                this._nome = value;
            }
        }

        public string ProcNome
        {
            get
            {
                return this._procNome;
            }
            set
            {
                this._procNome = value;
            }
        }

        public List<SqlReference> References
        {
            get
            {
                return this._references;
            }
            set
            {
                this._references = value;
            }
        }
    }
}

