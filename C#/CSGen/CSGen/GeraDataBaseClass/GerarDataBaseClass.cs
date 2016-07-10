namespace CSGen.GeraDataBaseClass
{
    using CSGen;
    using CSGen.Code;
    using System;
    using System.Text;

    internal class GerarDataBaseClass
    {
        private static string GerarClasse(SqlTable sqlTable)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(GerarCorpo(sqlTable).Replace("*metodos*", GerarMetodos(sqlTable)));
            return builder.ToString();
        }

        public static string GerarClasses(SqlTable table)
        {
            string str;
            try
            {
                str = GerarClasse(table);
            }
            catch (Exception exception)
            {
                throw exception;
            }
            return str;
        }

        private static string GerarConnections(SqlTable sqlTable)
        {
            return "\n\t\t/// <summary>\n\t\t/// Abre a conex\x00e3o com o banco de dados\n\t\t/// </summary>\n\t\tprivate void OpenConnection()\n\t\t{\n\t\t\tcn = new SqlConnection(strConn);\n\t\t\tcn.Open();\n\t\t\tcmd.Connection = cn;\n\t\t}\n\n\t\t/// <summary>\n\t\t/// Fecha a conex\x00e3o com o banco de dados\n\t\t/// </summary>\n\t\tprivate void CloseConnection()\n\t\t{\n\t\t\tif (cn != null)\n\t\t\t{\n\t\t\t\tif (cn.State == ConnectionState.Open && sqlTrans == null)\n\t\t\t\t{\n\t\t\t\t\tcn.Close();\n\t\t\t\t\tcn.Dispose();\n\t\t\t\t}\n\t\t\t}\n\t\t\tif (cmd != null) cmd.Dispose();\n\t\t}\n\n\t\t/// <summary>\n\t\t/// Abre a conex\x00e3o ultilizando transa\x00e7\x00e3o\n\t\t/// </summary>\n\t\tprivate void OpenConnectionTrans()\n\t\t{\n\t\t\tif (isTransaction)\n\t\t\t{\n\t\t\t\tif (sqlTrans == null)\n\t\t\t\t{\n\t\t\t\t\tOpenConnection();\n\t\t\t\t\tcmd.Transaction = cmd.Connection.BeginTransaction();\n\t\t\t\t\tsqlTrans = cmd.Transaction;\n\t\t\t\t}\n\t\t\t\telse\n\t\t\t\t{\n\t\t\t\t\tcmd.Connection = (SqlConnection)sqlTrans.Connection;\n\t\t\t\t\tcmd.Transaction = (SqlTransaction)sqlTrans;\n\t\t\t\t}\n\t\t\t}\n\t\t\telse OpenConnection();\n\t\t}\n\n";
        }

        private static string GerarCorpo(SqlTable sqlTable)
        {
            string classDataBaseNome = sqlTable.ClassDataBaseNome;
            StringBuilder builder = new StringBuilder();
            string str = "";
            str += "using System;\nusing System.Data;\nusing System.Data.SqlClient;\nusing System.Data.Common;\nusing System.Configuration;\n\nnamespace ";
            str += Program.prefixNamespace;
            str += "DataBase\n{\n\t #region Class " + classDataBaseNome + "\n\t/// <summary>\n\t/// Classe de opera\x00e7\x00f5es de " + classDataBaseNome.ToLower() + " na base\n\t/// </summary>\n\t/// <remarks>Danilo Aparecido</remarks>\n\tpublic class " + classDataBaseNome;
            str += "\n\t{\n\t\t#region Atributos\n\t\tprivate readonly string strConn = string.Empty;\n\t\tpublic DbTransaction sqlTrans;\n\t\tpublic bool isTransaction;\n\t\tprivate SqlConnection cn = null;\n\t\tprivate SqlCommand cmd = null;\n\t\t#endregion\n\n\t\t#region Construtor\n\t\t/// <summary>\n\t\t/// Contrutor padr\x00e3o sem argumentos, seta e vari\x00e1vel com o caminho do banco\n\t\t/// </summary>\n\t\t/// <remarks>Danilo Aparecido</remarks>\n\t\tpublic ";
            str += classDataBaseNome;
            str += "()\n\t\t{\n\t\t\ttry{ strConn = ConfigurationManager.ConnectionStrings[\"";
            str += Program.webConfigConnection;
            str += "\"].ConnectionString; }\n\t\t\tcatch(Exception ex){ throw ex; }\n\t\t}\n\t\t#endregion\n\t\n\t\t*metodos*\n\t}\n\t #endregion\n}";
            builder.Append(str);
            return builder.ToString();
        }

        private static string GerarDelete(SqlTable sqlTable)
        {
            StringBuilder builder = new StringBuilder();
            StringBuilder builder2 = new StringBuilder();
            foreach (SqlColumn column in sqlTable.Colunas)
            {
                if (column.SqlDataType != "text")
                   builder2.Append(column.NetDataType + " " + column.Name + "_, ");
            }
            builder.AppendLine("\t\t/// <summary>\n\t\t/// Exclui os dados na base atrav\x00e9s dos par\x00e2metros\n\t\t/// </summary>\n\t\tpublic DbTransaction Delete(" + builder2.Remove(builder2.Length - 2, 2) + ")");
            builder.AppendLine("\t\t{");
            builder.AppendLine("\t\t\ttry");
            builder.AppendLine("\t\t\t{");
            builder.AppendLine("\t\t\t\tcmd = new SqlCommand();");
            builder.AppendLine("\t\t\t\tcmd.CommandType = CommandType.StoredProcedure;");
            builder.AppendLine("\t\t\t\tcmd.CommandText = \"usp_" + Program.sulfixDelete + sqlTable.ProcNome + "\";");
            builder.AppendLine();
            foreach (SqlColumn column2 in sqlTable.Colunas)
            {
                if (column2.SqlDataType != "text")
                {
                    builder.AppendLine("\t\t\t\tif (" + column2.Name + "_ == null) cmd.Parameters.AddWithValue(\"@" + column2.Name + "\", DBNull.Value);");
                    builder.AppendLine("\t\t\t\telse cmd.Parameters.AddWithValue(\"@" + column2.Name + "\", " + column2.Name + "_);");
                    builder.AppendLine();
                }
            }
            builder.AppendLine(Tab(4) + "OpenConnectionTrans();");
            builder.AppendLine("\t\t\t\tcmd.ExecuteNonQuery();");
            builder.AppendLine("\t\t\t\treturn sqlTrans;");
            builder.AppendLine("\t\t\t}");
            builder.AppendLine("\t\t\tcatch (SqlException sex){ throw sex; }");
            builder.AppendLine("\t\t\tcatch (Exception ex){ throw ex; }");
            builder.AppendLine("\t\t\tfinally { CloseConnection(); }");
            builder.AppendLine("\t\t}");
            return builder.ToString();
        }

        private static string GerarInsertOrUpdate(SqlTable sqlTable)
        {
            StringBuilder builder = new StringBuilder();
            StringBuilder builder2 = new StringBuilder();
            string str = "int";
            if (!(sqlTable.IsTableNo || !(sqlTable.GetIdentityColumn().NetDataType == "decimal?")))
            {
                str = "decimal";
            }
            string str2 = "";
            foreach (SqlColumn column in sqlTable.Colunas)
            {
                if (column.IsIdentity)
                {
                    builder2.Append("ref " + column.NetDataType + " " + column.Name + "_, ");
                    str2 = column.Name + "_";
                }
                else
                {
                    builder2.Append(column.NetDataType + " " + column.Name + "_, ");
                }
            }
            builder.AppendLine("\t\t/// <summary>\n\t\t/// Salva os dados na base atrav\x00e9s de par\x00e2metros\n\t\t/// </summary>\n\t\tpublic DbTransaction Save(" + builder2.Remove(builder2.Length - 2, 2) + ")");
            builder.AppendLine("\t\t{");
            builder.AppendLine("\t\t\ttry");
            builder.AppendLine("\t\t\t{");
            builder.AppendLine("\t\t\t\tcmd = new SqlCommand();");
            builder.AppendLine("\t\t\t\tcmd.CommandType = CommandType.StoredProcedure;");
            builder.AppendLine("\t\t\t\tcmd.CommandText = \"usp_" + Program.sulfixInsert + sqlTable.ProcNome + "\";");
            builder.AppendLine();
            foreach (SqlColumn column2 in sqlTable.Colunas)
            {
                builder.AppendLine("\t\t\t\tif (" + column2.Name + "_ == null) cmd.Parameters.AddWithValue(\"@" + column2.Name + "\", DBNull.Value);");
                builder.AppendLine("\t\t\t\telse cmd.Parameters.AddWithValue(\"@" + column2.Name + "\", " + column2.Name + "_);");
                builder.AppendLine();
            }
            builder.AppendLine(Tab(4) + "OpenConnectionTrans();");
            if (!sqlTable.IsTableNo)
            {
                if (str2 != "")
                {
                    if (str == "int")
                    {
                        builder.AppendLine("\t\t\t\t" + str2 + " = Convert.ToInt32(\"0\" + cmd.ExecuteScalar());");
                    }
                    else
                    {
                        builder.AppendLine("\t\t\t\t" + str2 + " = Convert.ToDecimal(\"0\" + cmd.ExecuteScalar());");
                    }
                }
                else
                    builder.AppendLine("\t\t\t\tcmd.ExecuteNonQuery();");
            }
            else
            {
                builder.AppendLine("\t\t\t\tcmd.ExecuteNonQuery().ToString();");
            }
            builder.AppendLine("\t\t\t\treturn sqlTrans;");
            builder.AppendLine("\t\t\t}");
            builder.AppendLine("\t\t\tcatch (SqlException sex){ throw sex; }");
            builder.AppendLine("\t\t\tcatch (Exception ex){ throw ex; }");
            builder.AppendLine("\t\t\tfinally { CloseConnection(); }");
            builder.AppendLine("\t\t}");
            return builder.ToString();
        }

        private static string GerarMetodos(SqlTable sqlTable)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine("#region M\x00e9todos");
            builder.Append(GerarConnections(sqlTable));
            builder.Append(GerarInsertOrUpdate(sqlTable));
            builder.Append(GerarDelete(sqlTable));
            builder.Append(GerarSelect(sqlTable));
            builder.Append("\t\t#endregion");
            return builder.ToString();
        }

        private static string GerarSelect(SqlTable sqlTable)
        {
            StringBuilder builder = new StringBuilder();
            StringBuilder builder2 = new StringBuilder();
            if (!sqlTable.IsTableNo || sqlTable.References.Count == 1)
            {
                foreach (SqlColumn column in sqlTable.Colunas)
                {
                    if (column.SqlDataType != "text")                   
                        builder2.Append(column.NetDataType + " " + column.Name + "_, ");
                }
                builder.AppendLine("\t\t/// <summary>\n\t\t/// Busca os dados da base atrav\x00e9s dos par\x00e2metros\n\t\t/// </summary>\n\t\tpublic DbDataReader Get(" + builder2.Remove(builder2.Length - 2, 2) + ")");
                builder.AppendLine("\t\t{");
                builder.AppendLine("\t\t\ttry");
                builder.AppendLine("\t\t\t{");
                builder.AppendLine("\t\t\t\tcmd = new SqlCommand();");
                builder.AppendLine("\t\t\t\tcmd.CommandType = CommandType.StoredProcedure;");
                builder.AppendLine("\t\t\t\tcmd.CommandText = \"usp_" + Program.sulfixSelect + sqlTable.ProcNome + "\";");
                builder.AppendLine();
                foreach (SqlColumn column2 in sqlTable.Colunas)
                {
                    if (column2.SqlDataType != "text")
                    {
                        builder.AppendLine("\t\t\t\tif (" + column2.Name + "_ == null) cmd.Parameters.AddWithValue(\"@" + column2.Name + "\", DBNull.Value);");
                        builder.AppendLine("\t\t\t\telse cmd.Parameters.AddWithValue(\"@" + column2.Name + "\", " + column2.Name + "_);");
                        builder.AppendLine();
                    }
                }
                builder.AppendLine(Tab(4) + "OpenConnection();");
                builder.AppendLine("\t\t\t\treturn cmd.ExecuteReader(CommandBehavior.CloseConnection);");
                builder.AppendLine("\t\t\t}");
                builder.AppendLine("\t\t\tcatch (SqlException sex){ throw sex; }");
                builder.AppendLine("\t\t\tcatch (Exception ex){ throw ex; }");
                builder.AppendLine("\t\t}");
            }
            else
            {
                builder.Append(GerarSolectNode2(sqlTable));
            }
            return builder.ToString();
        }

        private static string GerarSolectNode(SqlTable sqlTable, SqlReference sref, int seq)
        {
            StringBuilder builder = new StringBuilder();
            StringBuilder builder2 = new StringBuilder();
            SqlTable table = SqlTable.GetTable(sref.PkTable);
            if (seq == 0)
            {
                sref = sqlTable.References[1];
            }
            else
            {
                sref = sqlTable.References[0];
            }
            if (seq == 0)
            {
                if (sqlTable.Colunas[1].SqlDataType != "text")                                       
                    builder2.Append(sqlTable.Colunas[1].NetDataType + " " + sqlTable.Colunas[1].Name + "_, ");
            }
            else
            {
                if (sqlTable.Colunas[0].SqlDataType != "text")
                    builder2.Append(sqlTable.Colunas[0].NetDataType + " " + sqlTable.Colunas[0].Name + "_, ");
            }
            builder.AppendLine(string.Concat(new object[] { "\t\t/// <summary>\n\t\t/// Busca os " + table.ClassBusinessNome + " na base atrav\x00e9s do parametro\n\t\t/// </summary>\n\t\tpublic DbDataReader Get_", table.ClassBusinessNome, "(", builder2.Remove(builder2.Length - 2, 2), ")" }));
            builder.AppendLine("\t\t{");
            builder.AppendLine("\t\t\ttry");
            builder.AppendLine("\t\t\t{");
            builder.AppendLine("\t\t\t\tcmd = new SqlCommand();");
            builder.AppendLine("\t\t\t\tcmd.CommandType = CommandType.StoredProcedure;");
            builder.AppendLine("\t\t\t\tcmd.CommandText = \"usp_" + Program.sulfixSelect + sqlTable.ProcNome + "\";");
            if (seq == 0)
            {
                if (sqlTable.Colunas[1].SqlDataType != "text")
                    builder.AppendLine("\t\t\t\tcmd.Parameters.AddWithValue(\"@" + sref.FkColumnName + "\", " + sqlTable.Colunas[1].Name + "_);");
            }
            else
            {
                if (sqlTable.Colunas[0].SqlDataType != "text")
                    builder.AppendLine("\t\t\t\tcmd.Parameters.AddWithValue(\"@" + sref.FkColumnName + "\", " + sqlTable.Colunas[0].Name + "_);");
            }
            builder.AppendLine();
            builder.AppendLine(Tab(4) + "OpenConnection();");
            builder.AppendLine("\t\t\t\treturn cmd.ExecuteReader(CommandBehavior.CloseConnection);");
            builder.AppendLine("\t\t\t}");
            builder.AppendLine("\t\t\tcatch (SqlException sex){ throw sex; }");
            builder.AppendLine("\t\t\tcatch (Exception ex){ throw ex; }");
            builder.AppendLine("\t\t}");
            return builder.ToString();
        }

        private static string GerarSolectNode2(SqlTable sqlTable)
        {
            StringBuilder builder = new StringBuilder();
            StringBuilder builder2 = new StringBuilder();
            SqlTable table = SqlTable.GetTable(sqlTable.References[0].PkTable);
            SqlTable table2 = SqlTable.GetTable(sqlTable.References[1].PkTable);
            builder2.Append(table2.GetIdentityColumn().NetDataType + " " + table2.GetIdentityColumn().Name + "_, ");
            builder.AppendLine(string.Concat(new object[] { "\t\t/// <summary>\n\t\t/// Busca os " + table.ClassBusinessNome + " na base atrav\x00e9s do par\x00e2metro\n\t\t/// </summary>\n\t\tpublic DbDataReader Get_", table.ClassBusinessNome, "(", builder2.Remove(builder2.Length - 2, 2), ")" }));
            builder.AppendLine("\t\t{");
            builder.AppendLine("\t\t\ttry");
            builder.AppendLine("\t\t\t{");
            builder.AppendLine("\t\t\t\tcmd = new SqlCommand();");
            builder.AppendLine("\t\t\t\tcmd.CommandType = CommandType.StoredProcedure;");
            string str = "";
            str += "\t\t\t\tcmd.CommandText = \"usp_";
            str += Program.sulfixSelect;
            str += table.ClassBusinessNome;
            str += "By";
            str += table2.GetIdentityColumn().Name[0].ToString().ToUpper()+table2.GetIdentityColumn().Name.Substring(1);
            str += "\";";
            builder.AppendLine(str);
            builder.AppendLine("\t\t\t\tcmd.Parameters.AddWithValue(\"@" + table2.GetIdentityColumn().Name + "\", " + table2.GetIdentityColumn().Name + "_);");
            builder.AppendLine();
            builder.AppendLine(Tab(4) + "OpenConnection();");
            builder.AppendLine("\t\t\t\treturn cmd.ExecuteReader(CommandBehavior.CloseConnection);");
            builder.AppendLine("\t\t\t}");
            builder.AppendLine("\t\t\tcatch (SqlException sex){ throw sex; }");
            builder.AppendLine("\t\t\tcatch (Exception ex){ throw ex; }");
            builder.AppendLine("\t\t}");
            builder.AppendLine();
            builder.AppendLine();
            StringBuilder builder3 = new StringBuilder();
            builder3.Append(table.GetIdentityColumn().NetDataType + " " + table.GetIdentityColumn().Name + "_, ");
            builder.AppendLine(string.Concat(new object[] { "\t\t/// <summary>\n\t\t/// Busca os " + table2.ClassBusinessNome + " na base atrav\x00e9s do par\x00e2metro\n\t\t/// </summary>\n\t\tpublic DbDataReader Get_", table2.ClassBusinessNome, "(", builder3.Remove(builder3.Length - 2, 2), ")" }));
            builder.AppendLine("\t\t{");
            builder.AppendLine("\t\t\ttry");
            builder.AppendLine("\t\t\t{");
            builder.AppendLine("\t\t\t\tcmd = new SqlCommand();");
            builder.AppendLine("\t\t\t\tcmd.CommandType = CommandType.StoredProcedure;");
            builder.AppendLine("\t\t\t\tcmd.CommandText = \"usp_" + Program.sulfixSelect + table2.ClassBusinessNome + "By" + table.GetIdentityColumn().Name[0].ToString().ToUpper()+table.GetIdentityColumn().Name.Substring(1) + "\";");
            builder.AppendLine("\t\t\t\tcmd.Parameters.AddWithValue(\"@" + table.GetIdentityColumn().Name + "\", " + table.GetIdentityColumn().Name + "_);");
            builder.AppendLine();
            builder.AppendLine(Tab(4) + "OpenConnection();");
            builder.AppendLine("\t\t\t\treturn cmd.ExecuteReader(CommandBehavior.CloseConnection);");
            builder.AppendLine("\t\t\t}");
            builder.AppendLine("\t\t\tcatch (SqlException sex){ throw sex; }");
            builder.AppendLine("\t\t\tcatch (Exception ex){ throw ex; }");
            builder.AppendLine("\t\t}");
            return builder.ToString();
        }

        private static string InsereNullnable(SqlColumn column)
        {
            Type type = Type.GetType(column.NetDataType, false, true);
            if ((type != null) && type.IsValueType)
            {
                return "?";
            }
            return "";
        }

        private static string Tab(int qtde)
        {
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < qtde; i++)
            {
                builder.Append("\t");
            }
            return builder.ToString();
        }
    }
}

