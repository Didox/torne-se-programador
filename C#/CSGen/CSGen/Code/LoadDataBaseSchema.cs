namespace CSGen.Code
{
    using CSGen;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;

    public class LoadDataBaseSchema
    {
        public const string QUERYCOLUMNS = " select  b.name 'Tabela',  a.name 'Coluna',  'Identity' =   (  \tselect case when count(*) = 1 then 'Identity' else '' end from sys.identity_columns f  \twhere f.object_id = b.id and f.column_id = a.colid  ),  'Indice' = case when (select rtrim([type]) + 'K' from sys.foreign_keys g  where [object_id] = (  \tselect top 1 h.constraint_object_id  from sys.foreign_key_columns h  \twhere h.parent_object_id = b.id and h.parent_column_id = a.colid)) = 'FK'  then   'FK'   else   isnull((select    case when i.is_primary_key = 1 then 'PK'   else  case when i.is_unique = 1 then 'UQ'  else  \t''  end  end  from sys.indexes i  where i.[object_id] = b.id  and index_id =   (  \tselect  top 1 index_id  from sys.index_columns j  \twhere j.[object_id] = b.id and j.[column_id] = a.colid  )),'')  end,  e.name 'Tipo',  a.length 'Tamanho',  a.xprec 'Precisao',  a.xscale 'Escala',  case a.isnullable when 1 then 'Sim' else 'N\x00e3o' end as 'Nulo',  'Descri\x00e7\x00e3o' =   (select  top 1 [value] from sys.extended_properties c   where c.major_id = a.id and c.minor_id = a.colid)  from sys.syscolumns a inner join sys.sysobjects b on a.id = b.id  inner join sys.systypes e on a.xtype = e.xtype  where b.xtype = 'U' and b.name <> 'sysdiagrams'   and b.name = '{0}'  order by b.name, a.colorder";

        public static string ConvertSqlTypeToDBtype(string sqlType)
        {
            string str = string.Empty;
            switch (sqlType)
            {
                case "System.Data.SqlTypes.SqlBinary":
                    return "DbType.Binary";

                case "System.Data.SqlTypes.SqlBoolean":
                    return "DbType.Boolean";

                case "System.Data.SqlTypes.SqlByte":
                    return "DbType.Byte";

                case "System.Data.SqlTypes.SqlBytes":
                    return "DbType.Byte";

                case "System.Data.SqlTypes.SqlChars":
                    return "DbType.String";

                case "System.Data.SqlTypes.SqlDateTime":
                    return "DbType.DateTime";

                case "System.Data.SqlTypes.SqlDecimal":
                    return "DbType.Decimal";

                case "System.Data.SqlTypes.SqlDouble":
                    return "DbType.Double";

                case "System.Data.SqlTypes.SqlGuid":
                    return "DbType.Guid";

                case "System.Data.SqlTypes.SqlInt16":
                    return "DbType.Int16";

                case "System.Data.SqlTypes.SqlInt32":
                    return "DbType.Int32";

                case "System.Data.SqlTypes.SqlInt64":
                    return "DbType.Int64";

                case "System.Data.SqlTypes.SqlMoney":
                    return "DbType.Currency";

                case "System.Data.SqlTypes.SqlSingle":
                    return "DbType.Single";

                case "System.Data.SqlTypes.SqlString":
                    return "DbType.String";

                case "System.Data.SqlTypes.SqlXml":
                    return "DbType.Xml";
            }
            return str;
        }

        public static List<SqlColumn> GetColumns(string tableName)
        {
            SqlConnection selectConnection = null;
            DataTable table = null;
            List<SqlColumn> list;
            try
            {
                try
                {
                    selectConnection = new SqlConnection(Program.stringConexao);
                    selectConnection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(string.Format(" select  b.name 'Tabela',  a.name 'Coluna',  'Identity' =   (  \tselect case when count(*) = 1 then 'Identity' else '' end from sys.identity_columns f  \twhere f.object_id = b.id and f.column_id = a.colid  ),  'Indice' = case when (select rtrim([type]) + 'K' from sys.foreign_keys g  where [object_id] = (  \tselect top 1 h.constraint_object_id  from sys.foreign_key_columns h  \twhere h.parent_object_id = b.id and h.parent_column_id = a.colid)) = 'FK'  then   'FK'   else   isnull((select    case when i.is_primary_key = 1 then 'PK'   else  case when i.is_unique = 1 then 'UQ'  else  \t''  end  end  from sys.indexes i  where i.[object_id] = b.id  and index_id =   (  \tselect  top 1 index_id  from sys.index_columns j  \twhere j.[object_id] = b.id and j.[column_id] = a.colid  )),'')  end,  e.name 'Tipo',  a.length 'Tamanho',  a.xprec 'Precisao',  a.xscale 'Escala',  case a.isnullable when 1 then 'Sim' else 'N\x00e3o' end as 'Nulo',  'Descri\x00e7\x00e3o' =   (select  top 1 [value] from sys.extended_properties c   where c.major_id = a.id and c.minor_id = a.colid)  from sys.syscolumns a inner join sys.sysobjects b on a.id = b.id  inner join sys.systypes e on a.xtype = e.xtype  where b.xtype = 'U' and b.name <> 'sysdiagrams'   and b.name = '{0}'  order by b.name, a.colorder", tableName), selectConnection);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet);
                    table = dataSet.Tables[0];
                    List<SqlColumn> list2 = new List<SqlColumn>();
                    if ((table != null) && (table.Rows.Count > 0))
                    {
                        foreach (DataRow row in table.Rows)
                        {
                            list2.Add(SqlColumn.ConvertToObject(row));
                        }
                    }
                    list = list2;
                }
                catch (Exception exception)
                {
                    throw exception;
                }
            }
            finally
            {
                if (selectConnection != null)
                {
                    if (selectConnection.State == ConnectionState.Open)
                    {
                        selectConnection.Close();
                    }
                    selectConnection.Dispose();
                }
                if (table != null)
                {
                    table.Dispose();
                }
            }
            return list;
        }

        public static List<SqlReference> GetReferences(string tableName)
        {
            SqlConnection connection = null;
            SqlCommand selectCommand = null;
            List<SqlReference> list;
            try
            {
                try
                {
                    connection = new SqlConnection(Program.stringConexao);
                    selectCommand = new SqlCommand(string.Format("exec sp_MStablerefs N'{0}', N'actualtables', N'both', null", tableName), connection);
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet);
                    List<SqlReference> list2 = new List<SqlReference>();
                    if ((dataSet != null) && (dataSet.Tables[0].Rows.Count > 0))
                    {
                        foreach (DataRow row in dataSet.Tables[0].Rows)
                        {
                            SqlReference item = SqlReference.ConvertToObject(row);
                            if (item.PkTable.ToLower() == tableName.ToLower())
                            {
                                item.IsCollection = true;
                                item.TipoRelacao = SqlReference.TpRelacao.Um_Para_Muitos;
                            }
                            list2.Add(item);
                        }
                    }
                    list = list2;
                }
                catch (Exception exception)
                {
                    throw exception;
                }
            }
            finally
            {
                if (connection != null)
                {
                    if (connection.State == ConnectionState.Open)
                    {
                        connection.Close();
                    }
                    connection.Dispose();
                }
                if (selectCommand != null)
                {
                    selectCommand.Dispose();
                }
            }
            return list;
        }

        public static List<SqlTable> GetTables()
        {
            SqlConnection connection = null;
            SqlCommand selectCommand = null;
            DataTable table = null;
            List<SqlTable> list;
            try
            {
                try
                {
                    connection = new SqlConnection(Program.stringConexao);
                    string cmdText = "select a.[name], a.[id], a.[crdate] from sysobjects a  where a.[xtype] = 'U' and a.[name] <> 'dtproperties'  and a.[name] <> 'sysdiagrams' order by a.[name]";
                    selectCommand = new SqlCommand(cmdText, connection);
                    DataSet dataSet = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
                    connection.Open();
                    adapter.Fill(dataSet);
                    if (dataSet != null)
                    {
                        table = dataSet.Tables[0];
                    }
                    List<SqlTable> list2 = new List<SqlTable>();
                    if ((table != null) && (table.Rows.Count > 0))
                    {
                        foreach (DataRow row in table.Rows)
                        {
                            try
                            {
                                list2.Add(SqlTable.ConvertToObject(row));
                                continue;
                            }
                            catch
                            {
                                continue;
                            }
                        }
                    }
                    connection.Close();
                    connection.Dispose();
                    list = list2;
                }
                catch (Exception exception)
                {
                    throw exception;
                }
            }
            finally
            {
                if (connection != null)
                {
                    if (connection.State == ConnectionState.Open)
                    {
                        connection.Close();
                    }
                    connection.Dispose();
                }
                if (table != null)
                {
                    table.Dispose();
                }
                if (selectCommand != null)
                {
                    selectCommand.Dispose();
                }
            }
            return list;
        }
    }
}

