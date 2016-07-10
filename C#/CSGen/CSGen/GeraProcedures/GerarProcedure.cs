namespace CSGen.GeraProcedures
{
    using CSGen;
    using CSGen.Code;
    using System;
    using System.Collections.Generic;

    public class GerarProcedure
    {
        private const string ASSINATURA = "create proc usp_{1}{0}\n";
        private const string CABECALHO = "-- *****************************************************\n-- *** Criado em ........ {0}\n-- *** Criado por ....... CSGen\n-- *** Descricao ........ Procedure criada para {1} registros na tabela {2}\n-- *** Alterado em ......\n-- *** Alterado por .....\n-- *** Motivo alteracao .\n-- *****************************************************\n\n";
        private const string DROPPROC = "IF EXISTS (SELECT * FROM sysobjects \nWHERE name = N'{0}'\nAND type = 'P')\nDROP PROCEDURE {0} \n#go#\n\n";
        private const string ELSECOMMAND = "ELSE \n\t begin\n\t\t{0}\n\tend";
        private const string ELSEIFCOMMAND = "IF {0} \n\t begin\n\t\t{1}\n\tend\n";
        private const string IFCOMMAND = "IF {0} \n\t begin\n\t\t{1}\n\tend\n";
        private const string PROCNAME = "usp_{1}{0}";

        public static string ConvertSqlVarchar(SqlColumn sqlColumn)
        {
            string format = "convert(varchar({0}), @{1})";
            switch (sqlColumn.SqlDataType)
            {
                case "bigint":
                    return string.Format(format, "30", sqlColumn.Name);

                case "binary":
                    return string.Format(format, sqlColumn.Length.ToString(), sqlColumn.Name);

                case "bit":
                    return string.Format(format, "1", sqlColumn.Name);

                case "char":
                    return string.Format(format, sqlColumn.Length.ToString(), sqlColumn.Name);

                case "datetime":
                    return string.Format(format, "20", sqlColumn.Name);

                case "decimal":
                    return string.Format(format, "30", sqlColumn.Name);

                case "float":
                    return string.Format(format, "30", sqlColumn.Name);

                case "image":
                    return string.Format(format, "2500", sqlColumn.Name);

                case "int":
                    return string.Format(format, "30", sqlColumn.Name);

                case "money":
                    return string.Format(format, "30", sqlColumn.Name);

                case "nchar":
                    return string.Format(format, sqlColumn.Length.ToString(), sqlColumn.Name);

                case "ntext":
                    return string.Format(format, "2500", sqlColumn.Name);

                case "numeric":
                    return string.Format(format, "2500", sqlColumn.Name);

                case "nvarchar":
                    return string.Format(format, sqlColumn.Length.ToString(), sqlColumn.Name);

                case "real":
                    return string.Format(format, "30", sqlColumn.Name);

                case "smalldatetime":
                    return string.Format(format, "25", sqlColumn.Name);

                case "smallint":
                    return string.Format(format, "20", sqlColumn.Name);

                case "smallmoney":
                    return string.Format(format, "20", sqlColumn.Name);

                case "sql_variant":
                    return string.Format(format, "2500", sqlColumn.Name);

                case "sysname":
                    return string.Format(format, "25", sqlColumn.Name);

                case "text":
                    return string.Format(format, "25", sqlColumn.Name);

                case "timestamp":
                    return string.Format(format, "25", sqlColumn.Name);

                case "tinyint":
                    return string.Format(format, "3", sqlColumn.Name);

                case "uniqueidentifier":
                    return string.Format(format, "30", sqlColumn.Name);

                case "varbinary":
                    return string.Format(format, sqlColumn.Length.ToString(), sqlColumn.Name);

                case "varchar":
                    return ("@" + sqlColumn.Name);

                case "xml":
                    return string.Format(format, sqlColumn.Length.ToString(), sqlColumn.Name);
            }
            return format;
        }

        public static string GerarDelete(SqlTable sqlTable)
        {
            string str = "";
            str = str + string.Format("-- *****************************************************\n-- *** Criado em ........ {0}\n-- *** Criado por ....... CSGen\n-- *** Descricao ........ Procedure criada para {1} registros na tabela {2}\n-- *** Alterado em ......\n-- *** Alterado por .....\n-- *** Motivo alteracao .\n-- *****************************************************\n\n", string.Format("{0:dd/MM/yyyy HH:mm}", DateTime.Now), "excluir", sqlTable.Nome);
            str = (str + string.Format("IF EXISTS (SELECT * FROM sysobjects \nWHERE name = N'{0}'\nAND type = 'P')\nDROP PROCEDURE {0} \n#go#\n\n", string.Format("usp_{1}{0}", sqlTable.ProcNome, Program.sulfixDelete)) + string.Format("create proc usp_{1}{0}\n", sqlTable.ProcNome, Program.sulfixDelete) + GerarParametros(sqlTable.Colunas) + "set nocount on\ndelete from " + sqlTable.Nome + " \n") + "where ";
            foreach (SqlColumn column in sqlTable.Colunas)
            {
                if (column.SqlDataType != "text")
                {
                    string str3 = str;
                    str = str3 + "(" + column.Name + " = @" + column.Name + " or  @" + column.Name + " is null) and \n";
                }
            }
            return str.Substring(0, str.Length - 6);
        }

        public static string GerarInsertUpdate(SqlTable sqlTable)
        {
            string format = "";
            if (!sqlTable.IsTableNo)
            {
                format = format + string.Format("-- *****************************************************\n-- *** Criado em ........ {0}\n-- *** Criado por ....... CSGen\n-- *** Descricao ........ Procedure criada para {1} registros na tabela {2}\n-- *** Alterado em ......\n-- *** Alterado por .....\n-- *** Motivo alteracao .\n-- *****************************************************\n\n", string.Format("{0:dd/MM/yyyy HH:mm}", DateTime.Now), "inserir ou atualizar", sqlTable.Nome);
                format = format + string.Format("IF EXISTS (SELECT * FROM sysobjects \nWHERE name = N'{0}'\nAND type = 'P')\nDROP PROCEDURE {0} \n#go#\n\n", string.Format("usp_{1}{0}", sqlTable.ProcNome, Program.sulfixInsert)) + string.Format("create proc usp_{1}{0}\n", sqlTable.ProcNome, Program.sulfixInsert) + GerarParametros(sqlTable.Colunas) + "set nocount on\n";
                foreach (SqlColumn column in sqlTable.Colunas)
                {
                    if (column.IsIdentity)
                    {
                        format = format + string.Format("if( {0} )\nbegin\n\t{1}\nend\n", string.Format("@{0} is null or @{0} = 0", column.Name), "{0}");
                    }
                }
                string str2 = "";
                string str3 = "";
                string str4 = "";
                str2 = "insert into " + sqlTable.Nome + " ({0}) \n\tvalues ({1}) \n\tselect SCOPE_IDENTITY() as 'identity'";
                foreach (SqlColumn column2 in sqlTable.Colunas)
                {
                    if (!column2.IsIdentity)
                    {
                        str3 = str3 + "" + column2.Name + ", ";
                        str4 = str4 + "@" + column2.Name + ", ";
                    }
                }
                if (str3 != string.Empty)
                {
                    str3 = str3.Remove(str3.Length - 2);
                }
                if (str4 != string.Empty)
                {
                    str4 = str4.Remove(str4.Length - 2);
                }
                str2 = string.Format(str2, str3, str4);
                format = string.Format(format, string.Format(str2, str2)) + "else \nbegin\n\t{0}\nend";
                string str5 = "update " + sqlTable.Nome + " set ";
                foreach (SqlColumn column3 in sqlTable.Colunas)
                {
                    if (!column3.IsIdentity)
                    {
                        string str6 = str5;
                        str5 = str6 + "" + column3.Name + " = @" + column3.Name + ", ";
                    }
                }
                if (str5 != string.Empty)
                {
                    str5 = str5.Remove(str5.Length - 2) + "\n\tWhere ";
                }
                foreach (SqlColumn column4 in sqlTable.Colunas)
                {
                    if (column4.IsIdentity)
                    {
                        string str7 = str5;
                        str5 = str7 + "" + column4.Name + " = @" + column4.Name + " and";
                    }
                }
                if (str5 != string.Empty)
                {
                    str5 = str5.Remove(str5.Length - 3);
                }
                str5 = str5 + "\n\tselect @" + sqlTable.GetIdentityColumn().Name;
                format = string.Format(format, str5);
            }
            else
            {
                format = format + string.Format("-- *****************************************************\n-- *** Criado em ........ {0}\n-- *** Criado por ....... CSGen\n-- *** Descricao ........ Procedure criada para {1} registros na tabela {2}\n-- *** Alterado em ......\n-- *** Alterado por .....\n-- *** Motivo alteracao .\n-- *****************************************************\n\n", string.Format("{0:dd/MM/yyyy HH:mm}", DateTime.Now), "inserir ou atualizar", sqlTable.Nome);
                format = format + string.Format("IF EXISTS (SELECT * FROM sysobjects \nWHERE name = N'{0}'\nAND type = 'P')\nDROP PROCEDURE {0} \n#go#\n\n", string.Format("usp_{1}{0}", sqlTable.ProcNome, Program.sulfixInsert)) + string.Format("create proc usp_{1}{0}\n", sqlTable.ProcNome, Program.sulfixInsert) + GerarParametros(sqlTable.Colunas) + "set nocount on\n";
                string str8 = "";
                string str9 = "";
                string str10 = "";
                str8 = "insert into " + sqlTable.Nome + " ({0}) \nvalues ({1}) \n";
                foreach (SqlColumn column5 in sqlTable.Colunas)
                {
                    if (!column5.IsIdentity)
                    {
                        str9 = str9 + "" + column5.Name + ", ";
                        str10 = str10 + "@" + column5.Name + ", ";
                    }
                }
                if (str9 != string.Empty)
                {
                    str9 = str9.Remove(str9.Length - 2);
                }
                if (str10 != string.Empty)
                {
                    str10 = str10.Remove(str10.Length - 2);
                }
                str8 = string.Format(str8, str9, str10);
                format = format + str8;
            }
            return (format + "\n\n#go#\n\n");
        }

        public static string GerarParametros(List<SqlColumn> listColunas)
        {
            string str = "";
            foreach (SqlColumn column in listColunas)
            {
                if (IsNumberType(column))
                {
                    if (!IsScaleAndPrecision(column))
                    {
                        string str2 = str;
                        str = str2 + "@" + column.Name + " " + column.SqlDataType + " = null,\n";
                    }
                    else
                    {
                        object obj2 = str;
                        str = string.Concat(new object[] { obj2, "@", column.Name, " ", column.SqlDataType, "(", column.Precision, ",", column.Scale, ") = null,\n" });
                    }
                    continue;
                }
                object obj3 = str;
                if (column.SqlDataType != "text")
                    str = string.Concat(new object[] { obj3, "@", column.Name, " ", column.SqlDataType, "(", column.Length, ")  = null,\n" });

            }
            if (str != string.Empty)
            {
                str = str.Remove(str.Length - 2) + "\nas\n";
            }
            return str;
        }

        public static string GerarSelect(SqlTable sqlTable)
        {
            string str = "";
            if (!sqlTable.IsTableNo)
            {
                str = str + string.Format("-- *****************************************************\n-- *** Criado em ........ {0}\n-- *** Criado por ....... CSGen\n-- *** Descricao ........ Procedure criada para {1} registros na tabela {2}\n-- *** Alterado em ......\n-- *** Alterado por .....\n-- *** Motivo alteracao .\n-- *****************************************************\n\n", string.Format("{0:dd/MM/yyyy HH:mm}", DateTime.Now), "selecionar", sqlTable.Nome);
                str = str + string.Format("IF EXISTS (SELECT * FROM sysobjects \nWHERE name = N'{0}'\nAND type = 'P')\nDROP PROCEDURE {0} \n#go#\n\n", string.Format("usp_{1}{0}", sqlTable.ProcNome, Program.sulfixSelect)) + string.Format("create proc usp_{1}{0}\n", sqlTable.ProcNome, Program.sulfixSelect) + GerarParametros(sqlTable.Colunas) + "set nocount on\n";
                string str2 = "";
                foreach (SqlColumn column in sqlTable.Colunas)
                {
                    str2 = str2 + "" + column.Name + ", ";
                }
                if (str2 != string.Empty)
                {
                    str2 = str2.Remove(str2.Length - 2, 1);
                }
                string str3 = str;
                str = str3 + "select " + str2 + " from " + sqlTable.Nome + " where \n";
                foreach (SqlColumn column2 in sqlTable.Colunas)
                {
                    if (column2.SqlDataType != "text")
                    {
                        string str11 = str;
                        str = str11 + "(" + column2.Name + " = @" + column2.Name + " or @" + column2.Name + " is null) and \n";
                    }
                }
                return str.Substring(0, str.Length - 6);
            }
            List<SqlTable> list = new List<SqlTable>();
            foreach (SqlReference reference in sqlTable.References)
            {
                list.Add(SqlTable.GetTable(reference.PkTable));
            }
            for (int i = 0; i < list.Count; i++)
            {
                string str4;
                string str5;
                char ch;
                str = str + string.Format("-- *****************************************************\n-- *** Criado em ........ {0}\n-- *** Criado por ....... CSGen\n-- *** Descricao ........ Procedure criada para {1} registros na tabela {2}\n-- *** Alterado em ......\n-- *** Alterado por .....\n-- *** Motivo alteracao .\n-- *****************************************************\n\n", string.Format("{0:dd/MM/yyyy HH:mm}", DateTime.Now), "selecionar ", sqlTable.Nome + " & " + list[i].Nome);
                if (list.Count > 1)
                {
                    if (i == 0)
                    {
                        ch = list[1].Colunas[0].Name[0];
                        str4 = SqlTable.GetBusinessClassName(sqlTable.References[0].PkTable) + "By" + ch.ToString().ToUpper() + list[1].Colunas[0].Name.Substring(1);
                        str5 = string.Format("IF EXISTS (SELECT * FROM sysobjects WHERE name = N'{0}' AND type = 'P') DROP PROCEDURE {0} \n#go#\n\n", string.Format("usp_{1}{0}", str4, Program.sulfixSelect));
                        string str6 = str + str5 + string.Format("create proc usp_{1}{0}", str4 + "\n", Program.sulfixSelect);
                        str = str6 + "@" + list[1].Colunas[0].Name + " " + list[1].Colunas[0].SqlDataType;
                    }
                    else
                    {
                        ch = list[0].Colunas[0].Name[0];
                        str4 = SqlTable.GetBusinessClassName(sqlTable.References[1].PkTable) + "By" + ch.ToString().ToUpper() + list[0].Colunas[0].Name.Substring(1);
                        str5 = string.Format("IF EXISTS (SELECT * FROM sysobjects WHERE name = N'{0}' AND type = 'P') DROP PROCEDURE {0} \n#go#\n\n", string.Format("usp_{1}{0}", str4, Program.sulfixSelect));
                        string str7 = str + str5 + string.Format("create proc usp_{1}{0}", str4 + "\n", Program.sulfixSelect);
                        str = str7 + "@" + list[0].Colunas[0].Name + " " + list[0].Colunas[0].SqlDataType;
                    }
                }
                else if (list.Count == 1)
                {
                    ch = list[0].Colunas[0].Name[0];
                    str4 = SqlTable.GetBusinessClassName(sqlTable.References[0].PkTable) + "By" + ch.ToString().ToUpper() + list[0].Colunas[0].Name.Substring(1);
                    str5 = string.Format("IF EXISTS (SELECT * FROM sysobjects WHERE name = N'{0}' AND type = 'P') DROP PROCEDURE {0} \n#go#\n\n", string.Format("usp_{1}{0}", str4, Program.sulfixSelect));
                    string str7 = str + str5 + string.Format("create proc usp_{1}{0}", str4 + "\n", Program.sulfixSelect);
                    str = str7 + "@" + list[0].Colunas[0].Name + " " + list[0].Colunas[0].SqlDataType;
                }

                str = str + "\nas\nset nocount on\nselect ";
                foreach (SqlColumn column3 in list[i].Colunas)
                {
                    str = str + column3.Name + ", ";
                }
                str = str.Remove(str.Length - 2, 2);
                if (list.Count > 1)
                {
                    switch (i)
                    {
                        case 0:
                            {
                                string str8 = str;
                                str = str8 + " from " + list[i].Nome + " \nwhere " + list[0].Colunas[0].Name + " in \n(\n\tselect " + sqlTable.References[0].PkColumnName + " from " + sqlTable.Nome + " \n\twhere " + sqlTable.References[1].PkColumnName + " = @" + list[1].Colunas[0].Name + "\n)";
                                break;
                            }
                        case 1:
                            {
                                string str9 = str;
                                str = str9 + " from " + list[i].Nome + " \nwhere " + list[1].Colunas[0].Name + " in \n(\n\tselect " + sqlTable.References[1].PkColumnName + " from " + sqlTable.Nome + " \n\twhere " + sqlTable.References[0].PkColumnName + " = @" + list[0].Colunas[0].Name + "\n)";
                                break;
                            }
                    }
                }
                else if (list.Count == 1)
                {
                    string str9 = str;
                    str = str9 + " from " + list[0].Nome + " \nwhere " + list[0].Colunas[0].Name + " in \n(\n\tselect " + sqlTable.References[0].PkColumnName + " from " + sqlTable.Nome + " \n\twhere " + sqlTable.References[0].PkColumnName + " = @" + list[0].Colunas[0].Name + "\n)";
                    break;
                }
                str = str + "\n\n#go#\n\n\n";
            }
            return str;
        }

        public static string GerarSqlServer(List<SqlTable> listTables)
        {
            string str;
            try
            {
                string str2 = "";
                str2 = "-- ########################### GENARATE QUERIES TO SELECT ##################### \n\n";
                foreach (SqlTable table in listTables)
                {
                    str2 = str2 + GerarSelect(table);
                }
                str2 = str2 + "-- ########################### GENARATE QUERIES TO INSERT OR UPDATE ##################### \n\n";
                foreach (SqlTable table2 in listTables)
                {
                    str2 = str2 + GerarInsertUpdate(table2);
                }
                str2 = str2 + "-- ########################### GENARATE QUERIES TO DELETE ##################### \n\n";
                foreach (SqlTable table3 in listTables)
                {
                    str2 = str2 + GerarDelete(table3);
                }
                str = str2;
            }
            catch (Exception exception)
            {
                throw exception;
            }
            return str;
        }

        public static bool IsNumberType(SqlColumn sqlColunm)
        {
            if (((((sqlColunm.SqlDataType != "tinyint") && (sqlColunm.SqlDataType != "smallint")) && ((sqlColunm.SqlDataType != "int") && (sqlColunm.SqlDataType != "smalldatetime"))) && (((sqlColunm.SqlDataType != "real") && (sqlColunm.SqlDataType != "money")) && ((sqlColunm.SqlDataType != "datetime") && (sqlColunm.SqlDataType != "float")))) && (((sqlColunm.SqlDataType != "bit") && (sqlColunm.SqlDataType != "decimal")) && (((sqlColunm.SqlDataType != "numeric") && (sqlColunm.SqlDataType != "smallmoney")) && (sqlColunm.SqlDataType != "bigint"))))
            {
                return false;
            }
            return true;
        }

        public static bool IsScaleAndPrecision(SqlColumn sqlColunm)
        {
            if (((sqlColunm.SqlDataType != "money") && (sqlColunm.SqlDataType != "decimal")) && ((sqlColunm.SqlDataType != "numeric") && (sqlColunm.SqlDataType != "smallmoney")))
            {
                return false;
            }
            return true;
        }

        public static string VerificaAspas(SqlColumn sqlColumn)
        {
            if (!IsNumberType(sqlColumn))
            {
                return "''";
            }
            if (sqlColumn.SqlDataType == "datetime")
            {
                return "''";
            }
            return "";
        }
    }
}

