namespace CSGen.GeraModelClass
{
    using CSGen;
    using CSGen.Code;
    using System;
    using System.Collections.Generic;
    using System.Collections.Specialized;
    using System.Text;

    internal class GerarModelClass
    {
        private static List<AtributesForClass> camposClass = new List<AtributesForClass>();
        private static string parametros = "";
        private static StringCollection sc = new StringCollection();

        private static void BildCamposClass(SqlTable sqlTable)
        {
            int num = 0;
            foreach (SqlColumn column in sqlTable.Colunas)
            {
                AtributesForClass class2;
                if ((column.IsPk && !column.IsFk) && !column.IsUk)
                {
                    char ch = column.Name[0];
                    class2 = new AtributesForClass(column.NetDataType, ch.ToString().ToLower() + column.Name.Substring(1), false, "", "PK", column.IsIdentity, null);
                    if (!ExisteCampo(class2))
                    {
                        camposClass.Add(class2);
                    }
                    foreach (SqlReference reference in column.GetReferencesForPk(sqlTable))
                    {
                        if (reference.Ignore)
                        {
                            continue;
                        }
                        if (reference.IsCollection)
                        {
                            SqlTable sqlTableNo = SqlTable.GetTable(reference.FkTable);
                            SqlTable tableToNo = GetTableToNo(sqlTable, sqlTableNo);
                            if (!sqlTableNo.IsTableNo)
                            {
                                char ch2 = reference.ClassModelName[0];
                                class2 = new AtributesForClass(reference.ClassModelName, ch2.ToString().ToLower() + reference.ClassModelName.Substring(1), true, "list_", "PK", false, null);
                                if (!ExisteCampo(class2))
                                {
                                    camposClass.Add(class2);
                                }
                            }
                            else
                            {
                                char ch3 = tableToNo.ClassModelNome[0];
                                class2 = new AtributesForClass(tableToNo.ClassModelNome, ch3.ToString().ToLower() + tableToNo.ClassModelNome.Substring(1), true, "list_", "PK", false, null);
                                if (!ExisteCampo(class2))
                                {
                                    camposClass.Add(class2);
                                }
                            }
                            continue;
                        }
                        char ch4 = reference.ClassModelName[0];
                        class2 = new AtributesForClass(reference.ClassModelName, ch4.ToString().ToLower() + reference.ClassModelName.Substring(1), false, "ref_", "PK", false, null);
                        if (!ExisteCampo(class2))
                        {
                            camposClass.Add(class2);
                        }
                    }
                    continue;
                }
                if ((!column.IsPk && column.IsFk) && !column.IsUk)
                {
                    char ch5 = column.Name[0];
                    AtributesForClass campo = new AtributesForClass(column.NetDataType, ch5.ToString().ToLower() + column.Name.Substring(1), false, "", "FK", column.IsIdentity, null);
                    if (!ExisteCampo(campo))
                    {
                        camposClass.Add(campo);
                    }
                    foreach (SqlReference reference2 in column.GetReferencesForFk(sqlTable))
                    {
                        if (reference2.Ignore)
                        {
                            continue;
                        }
                        if (reference2.IsCollection && (reference2.FkTable != reference2.PkTable))
                        {
                            char ch6 = reference2.ClassModelName[0];
                            class2 = new AtributesForClass(reference2.ClassModelName, ch6.ToString().ToLower() + reference2.ClassModelName.Substring(1), true, "list_", "FK", false, null);
                            if (!ExisteCampo(class2))
                            {
                                camposClass.Add(class2);
                            }
                            continue;
                        }
                        if (num == 0)
                        {
                            char ch7 = reference2.ClassModelName[0];
                            class2 = new AtributesForClass(reference2.ClassModelName, ch7.ToString().ToLower() + reference2.ClassModelName.Substring(1), false, "ref_", "FK", false, sqlTable.Colunas[0].Name);
                        }
                        else
                        {
                            char ch8 = reference2.ClassModelName[0];
                            class2 = new AtributesForClass(reference2.ClassModelName, ch8.ToString().ToLower() + reference2.ClassModelName.Substring(1), false, "ref_", "FK", false, sqlTable.Colunas[1].Name);
                        }
                        if (!ExisteCampo(class2))
                        {
                            camposClass.Add(class2);
                        }
                        if (sqlTable.IsTableNo)
                        {
                            if (num == 0)
                            {
                                char ch9 = reference2.ClassModelName[0];
                                class2 = new AtributesForClass(reference2.ClassModelName, ch9.ToString().ToLower() + reference2.ClassModelName.Substring(1), true, "list_", "FK", false, sqlTable.Colunas[1].Name);
                            }
                            else
                            {
                                char ch10 = reference2.ClassModelName[0];
                                class2 = new AtributesForClass(reference2.ClassModelName, ch10.ToString().ToLower() + reference2.ClassModelName.Substring(1), true, "list_", "FK", false, sqlTable.Colunas[0].Name);
                            }
                            num++;
                        }
                        if (!ExisteCampo(class2))
                        {
                            camposClass.Add(class2);
                        }
                    }
                    continue;
                }
                if ((!column.IsPk && !column.IsFk) && column.IsUk)
                {
                    char ch11 = column.Name[0];
                    class2 = new AtributesForClass(column.NetDataType, ch11.ToString().ToLower() + column.Name.Substring(1), false, "", "UK", column.IsIdentity, null);
                    if (!ExisteCampo(class2))
                    {
                        camposClass.Add(class2);
                    }
                    foreach (SqlReference reference3 in column.GetReferencesForPk(sqlTable))
                    {
                        if (reference3.Ignore)
                        {
                            continue;
                        }
                        if (reference3.IsCollection)
                        {
                            char ch12 = reference3.ClassModelName[0];
                            class2 = new AtributesForClass(reference3.ClassModelName, ch12.ToString().ToLower() + reference3.ClassModelName.Substring(1), true, "list_", "UK", false, null);
                            if (!ExisteCampo(class2))
                            {
                                camposClass.Add(class2);
                            }
                            continue;
                        }
                        char ch13 = reference3.ClassModelName[0];
                        class2 = new AtributesForClass(reference3.ClassModelName, ch13.ToString().ToLower() + reference3.ClassModelName.Substring(1), false, "ref_", "UK", false, null);
                        if (!ExisteCampo(class2))
                        {
                            camposClass.Add(class2);
                        }
                    }
                    continue;
                }
                char ch14 = column.Name[0];
                class2 = new AtributesForClass(column.NetDataType, ch14.ToString().ToLower() + column.Name.Substring(1), false, "", "", column.IsIdentity, null);
                if (!ExisteCampo(class2))
                {
                    camposClass.Add(class2);
                }
            }
        }

        private static bool ExisteCampo(AtributesForClass campo)
        {
            foreach (AtributesForClass class2 in camposClass)
            {
                if ((class2.ClearName.ToLower() == campo.ClearName.ToLower()) && (class2.IniName == campo.IniName))
                {
                    return true;
                }
            }
            return false;
        }

        private static string GerarAtributos()
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine(Tab(2) + "#region Atributos");
            builder.AppendLine(Tab(2) + "public SqlTransaction InstanceSqlTransaction;");
            builder.AppendLine(Tab(2) + "public bool isTransaction;");
            foreach (AtributesForClass class2 in camposClass)
            {
                builder.AppendLine(Tab(2) + "private " + class2.IniList + class2.Tipo + class2.FimList + " _" + class2.IniName + class2.ClearName + ";");
            }
            builder.AppendLine(Tab(2) + "#endregion");
            return builder.ToString();
        }

        public static string GerarClasse(SqlTable sqlTable)
        {
            camposClass.Clear();
            BildCamposClass(sqlTable);
            GerarParametros();
            string str = GerarCorpo(sqlTable);
            string newValue = GerarConstrutores(sqlTable);
            string str3 = GerarAtributos();
            string str4 = GerarPropriedades(sqlTable);
            string str5 = GerarMembrosEstaticos(sqlTable);
            string str6 = GerarMetodos(sqlTable);
            return str.Replace("*construtor*", newValue).Replace("*atributos*", str3).Replace("*propriedades*", str4).Replace("*membrosestaticos*", str5).Replace("*metodos*", str6);
        }

        private static string GerarConstrutores(SqlTable sqlTable)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine(Tab(2) + "#region Construtores");
            builder.AppendLine(Tab(2) + string.Format("public {0}()", sqlTable.ClassModelNome));
            builder.AppendLine(Tab(2) + "{");
            builder.AppendLine(Tab(2) + "}");
            builder.AppendLine(Tab(2) + string.Format("public {0}({1})", sqlTable.ClassModelNome, parametros));
            builder.AppendLine(Tab(2) + "{");
            foreach (AtributesForClass class2 in camposClass)
            {
                if (class2.IniName == "")
                {
                    builder.AppendLine(Tab(3) + "this._" + class2.IniName + class2.ClearName + " = " + class2.IniName + class2.ClearName + "_;");
                }
            }
            builder.AppendLine(Tab(2) + "}");
            builder.AppendLine(Tab(2) + "#endregion");
            return builder.ToString();
        }

        private static string GerarCorpo(SqlTable sqlTable)
        {
            string classDataBaseNome = sqlTable.ClassDataBaseNome;
            StringBuilder builder = new StringBuilder();
            builder.AppendLine("using System;");
            builder.AppendLine("using System.Collections.Generic;");
            builder.AppendLine("using System.Data;");
            builder.AppendLine("using System.Data.SqlClient;");
            builder.AppendLine();
            builder.AppendLine(string.Format("namespace {0}Model", Program.prefixNamespace));
            builder.AppendLine("{");
            builder.AppendLine(Tab(1) + "public class " + sqlTable.ClassModelNome);
            builder.AppendLine(Tab(1) + "{");
            builder.AppendLine("*construtor*");
            builder.AppendLine("*atributos*");
            builder.AppendLine("*propriedades*");
            builder.AppendLine("*membrosestaticos*");
            builder.AppendLine("*metodos*");
            builder.AppendLine(Tab(1) + "}");
            builder.AppendLine("}");
            return builder.ToString();
        }

        private static string GerarMembrosEstaticos(SqlTable sqlTable)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine(Tab(2) + "#region Membros Estaticos");
            builder.AppendLine(Tab(2) + "#region Atributos");
            builder.AppendLine(Tab(2) + "public static SqlTransaction SharedSqlTransaction;");
            builder.AppendLine(Tab(2) + "public static bool isSharedTransaction;");
            builder.AppendLine(Tab(2) + "#endregion");
            builder.AppendLine();
            builder.AppendLine(Tab(2) + "#region Metodos");
            builder.AppendLine(Tab(2) + "protected internal static " + sqlTable.ClassDataBaseNome + " ConvertToObject(DataRow dr)");
            builder.AppendLine(Tab(2) + "{");
            builder.AppendLine(Tab(3) + "try");
            builder.AppendLine(Tab(3) + "{");
            builder.AppendLine(Tab(4) + sqlTable.ClassDataBaseNome + " return" + sqlTable.ClassDataBaseNome + " = new " + sqlTable.ClassDataBaseNome + "();");
            foreach (SqlColumn column in sqlTable.Colunas)
            {
                if (column.NetDataType == "string")
                {
                    if (column.Null)
                    {
                        builder.AppendLine(Tab(4) + "if(dr[\"" + column.Name + "\"].ToString() == \"\")");
                        builder.AppendLine(Tab(5) + "return" + sqlTable.ClassDataBaseNome + "._" + column.Name + " = null;");
                        builder.AppendLine(Tab(4) + "else");
                        builder.AppendLine(Tab(5) + "return" + sqlTable.ClassDataBaseNome + "._" + column.Name + " = dr[\"" + column.Name + "\"].ToString();");
                    }
                    else
                    {
                        builder.AppendLine(Tab(4) + "return" + sqlTable.ClassDataBaseNome + "._" + column.Name + " = dr[\"" + column.Name + "\"].ToString();");
                    }
                    continue;
                }
                if (column.Null)
                {
                    builder.AppendLine(Tab(4) + "if(dr[\"" + column.Name + "\"].ToString() == \"\")");
                    builder.AppendLine(Tab(5) + "return" + sqlTable.ClassDataBaseNome + "._" + column.Name + " = null;");
                    builder.AppendLine(Tab(4) + "else");
                    builder.AppendLine(Tab(5) + "return" + sqlTable.ClassDataBaseNome + "._" + column.Name + " = " + column.NetDataType.Replace("?", "") + ".Parse(dr[\"" + column.Name + "\"].ToString());");
                    continue;
                }
                builder.AppendLine(Tab(4) + "return" + sqlTable.ClassDataBaseNome + "._" + column.Name + " = " + column.NetDataType.Replace("?", "") + ".Parse(dr[\"" + column.Name + "\"].ToString());");
            }
            builder.AppendLine(Tab(4) + "return return" + sqlTable.ClassDataBaseNome + ";");
            builder.AppendLine(Tab(3) + "}");
            builder.AppendLine(Tab(3) + "catch");
            builder.AppendLine(Tab(3) + "{");
            builder.AppendLine(Tab(4) + "return null;");
            builder.AppendLine(Tab(3) + "}");
            builder.AppendLine(Tab(2) + "}");
            if (!sqlTable.IsTableNo)
            {
                builder.AppendLine(Tab(2) + "public static List<" + sqlTable.ClassModelNome + "> GetAll()");
                builder.AppendLine(Tab(2) + "{");
                builder.AppendLine(Tab(3) + "try");
                builder.AppendLine(Tab(3) + "{");
                builder.AppendLine(Tab(4) + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + " db = new " + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + "();");
                builder.AppendLine(Tab(4) + "if (SharedSqlTransaction != null)");
                builder.AppendLine(Tab(4) + "{");
                builder.AppendLine(Tab(5) + "db.sqlTrans = SharedSqlTransaction;");
                builder.AppendLine(Tab(5) + "isSharedTransaction = true;");
                builder.AppendLine(Tab(4) + "}");
                builder.AppendLine(Tab(4) + "db.isTransaction = isSharedTransaction;");
                builder.AppendLine();
                builder.AppendLine(Tab(4) + "List<" + sqlTable.ClassModelNome + "> " + sqlTable.ClassModelNome.ToLower() + "List = new List<" + sqlTable.ClassModelNome + ">();");
                builder.AppendLine(Tab(4) + "DataTable dt = db.Selecionar(" + GerarNulls(sqlTable.Colunas.Count) + ");");
                builder.AppendLine(Tab(4) + "SharedSqlTransaction = db.sqlTrans;");
                builder.AppendLine(Tab(4) + "if (dt != null && dt.Rows.Count > 0)");
                builder.AppendLine(Tab(4) + "{");
                builder.AppendLine(Tab(5) + "foreach (DataRow dr in dt.Rows)");
                builder.AppendLine(Tab(5) + "{");
                builder.AppendLine(Tab(6) + sqlTable.ClassDataBaseNome.ToLower() + "List.Add(ConvertToObject(dr));");
                builder.AppendLine(Tab(5) + "}");
                builder.AppendLine(Tab(4) + "}");
                builder.AppendLine(Tab(4) + "return " + sqlTable.ClassDataBaseNome.ToLower() + "List;");
                builder.AppendLine(Tab(3) + "}");
                builder.AppendLine(Tab(3) + "catch");
                builder.AppendLine(Tab(3) + "{");
                builder.AppendLine(Tab(4) + "return null;");
                builder.AppendLine(Tab(3) + "}");
                builder.AppendLine(Tab(2) + "}");
                builder.AppendLine(Tab(2) + "public static " + sqlTable.ClassModelNome + " GetById(" + sqlTable.GetIdentityColumn().NetDataType + " id)");
                builder.AppendLine(Tab(2) + "{");
                builder.AppendLine(Tab(3) + "try");
                builder.AppendLine(Tab(3) + "{");
                builder.AppendLine(Tab(4) + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + " db = new " + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + "();");
                builder.AppendLine(Tab(4) + "if (SharedSqlTransaction != null)");
                builder.AppendLine(Tab(4) + "{");
                builder.AppendLine(Tab(5) + "db.sqlTrans = SharedSqlTransaction;");
                builder.AppendLine(Tab(5) + "isSharedTransaction = true;");
                builder.AppendLine(Tab(4) + "}");
                builder.AppendLine(Tab(4) + "db.isTransaction = isSharedTransaction;");
                builder.AppendLine();
                builder.AppendLine(Tab(4) + "DataTable dt = db.Selecionar(id, " + GerarNulls(sqlTable.Colunas.Count - 1) + ");");
                builder.AppendLine(Tab(4) + "SharedSqlTransaction = db.sqlTrans;");
                builder.AppendLine(Tab(4) + "if (dt != null && dt.Rows.Count > 0)");
                builder.AppendLine(Tab(4) + "{");
                builder.AppendLine(Tab(5) + "return ConvertToObject(dt.Rows[0]);");
                builder.AppendLine(Tab(4) + "}");
                builder.AppendLine(Tab(4) + "else ");
                builder.AppendLine(Tab(5) + "return null;");
                builder.AppendLine(Tab(3) + "}");
                builder.AppendLine(Tab(3) + "catch");
                builder.AppendLine(Tab(3) + "{");
                builder.AppendLine(Tab(4) + "return null;");
                builder.AppendLine(Tab(3) + "}");
                builder.AppendLine(Tab(2) + "}");
                builder.AppendLine(Tab(2) + "public static List<" + sqlTable.ClassModelNome + "> GetByParameters(" + sqlTable.GetColumnsInParams() + ")");
                builder.AppendLine(Tab(2) + "{");
                builder.AppendLine(Tab(3) + "try");
                builder.AppendLine(Tab(3) + "{");
                builder.AppendLine(Tab(4) + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + " db = new " + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + "();");
                builder.AppendLine(Tab(4) + "if (SharedSqlTransaction != null)");
                builder.AppendLine(Tab(4) + "{");
                builder.AppendLine(Tab(5) + "db.sqlTrans = SharedSqlTransaction;");
                builder.AppendLine(Tab(5) + "isSharedTransaction = true;");
                builder.AppendLine(Tab(4) + "}");
                builder.AppendLine(Tab(4) + "db.isTransaction = isSharedTransaction;");
                builder.AppendLine();
                builder.AppendLine(Tab(4) + "List<" + sqlTable.ClassModelNome + "> " + sqlTable.ClassModelNome.ToLower() + "List = new List<" + sqlTable.ClassModelNome + ">();");
                builder.AppendLine(Tab(4) + "DataTable dt = db.Selecionar(" + sqlTable.GetColumnsOutParams() + ");");
                builder.AppendLine(Tab(4) + "SharedSqlTransaction = db.sqlTrans;");
                builder.AppendLine(Tab(4) + "if (dt != null && dt.Rows.Count > 0)");
                builder.AppendLine(Tab(4) + "{");
                builder.AppendLine(Tab(5) + "foreach (DataRow dr in dt.Rows)");
                builder.AppendLine(Tab(5) + "{");
                builder.AppendLine(Tab(6) + sqlTable.ClassDataBaseNome.ToLower() + "List.Add(ConvertToObject(dr));");
                builder.AppendLine(Tab(5) + "}");
                builder.AppendLine(Tab(4) + "}");
                builder.AppendLine(Tab(4) + "return " + sqlTable.ClassDataBaseNome.ToLower() + "List;");
                builder.AppendLine(Tab(3) + "}");
                builder.AppendLine(Tab(3) + "catch");
                builder.AppendLine(Tab(3) + "{");
                builder.AppendLine(Tab(4) + "return null;");
                builder.AppendLine(Tab(3) + "}");
                builder.AppendLine(Tab(2) + "}");
            }
            builder.AppendLine(Tab(2) + "public static void Delete(" + sqlTable.GetColumnsInParams() + ")");
            builder.AppendLine(Tab(2) + "{");
            builder.AppendLine(Tab(3) + "try");
            builder.AppendLine(Tab(3) + "{");
            builder.AppendLine(Tab(4) + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + " db = new " + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + "();");
            builder.AppendLine(Tab(4) + "if (SharedSqlTransaction != null)");
            builder.AppendLine(Tab(4) + "{");
            builder.AppendLine(Tab(5) + "db.sqlTrans = SharedSqlTransaction;");
            builder.AppendLine(Tab(5) + "isSharedTransaction = true;");
            builder.AppendLine(Tab(4) + "}");
            builder.AppendLine(Tab(4) + "db.isTransaction = isSharedTransaction;");
            builder.AppendLine();
            builder.AppendLine(Tab(4) + "db.Excluir(" + sqlTable.GetColumnsOutParams() + ");");
            builder.AppendLine(Tab(4) + "SharedSqlTransaction = db.sqlTrans;");
            builder.AppendLine(Tab(3) + "}");
            builder.AppendLine(Tab(3) + "catch(Exception ex)");
            builder.AppendLine(Tab(3) + "{");
            builder.AppendLine(Tab(4) + "throw ex;");
            builder.AppendLine(Tab(3) + "}");
            builder.AppendLine(Tab(2) + "}");
            string str = "int";
            if (!sqlTable.IsTableNo)
            {
                if (sqlTable.GetIdentityColumn().NetDataType == "decimal?")
                {
                    str = "decimal";
                }
            }
            else
            {
                str = "void";
            }
            builder.AppendLine(Tab(2) + "public static " + str + " InserirAtualizar(" + sqlTable.GetColumnsInParams() + ")");
            builder.AppendLine(Tab(2) + "{");
            builder.AppendLine(Tab(3) + "try");
            builder.AppendLine(Tab(3) + "{");
            builder.AppendLine(Tab(4) + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + " db = new " + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + "();");
            builder.AppendLine(Tab(4) + "if (SharedSqlTransaction != null)");
            builder.AppendLine(Tab(4) + "{");
            builder.AppendLine(Tab(5) + "db.sqlTrans = SharedSqlTransaction;");
            builder.AppendLine(Tab(5) + "isSharedTransaction = true;");
            builder.AppendLine(Tab(4) + "}");
            builder.AppendLine(Tab(4) + "db.isTransaction = isSharedTransaction;");
            builder.AppendLine();
            if (!sqlTable.IsTableNo)
            {
                builder.AppendLine(Tab(4) + str + " id = db.GravarOuAtualizar(" + sqlTable.GetColumnsOutParams() + ");");
                builder.AppendLine(Tab(4) + "SharedSqlTransaction = db.sqlTrans;");
                builder.AppendLine(Tab(4) + "return id;");
            }
            else
            {
                builder.AppendLine(Tab(4) + "db.GravarOuAtualizar(" + sqlTable.GetColumnsOutParams() + ");");
                builder.AppendLine(Tab(4) + "SharedSqlTransaction = db.sqlTrans;");
            }
            builder.AppendLine(Tab(3) + "}");
            builder.AppendLine(Tab(3) + "catch(Exception ex)");
            builder.AppendLine(Tab(3) + "{");
            builder.AppendLine(Tab(4) + "throw ex;");
            builder.AppendLine(Tab(3) + "}");
            builder.AppendLine(Tab(2) + "}");
            if (sqlTable.IsTableNo)
            {
                int num = 0;
                foreach (SqlColumn column2 in sqlTable.Colunas)
                {
                    List<SqlReference> referencesForFk = column2.GetReferencesForFk(sqlTable);
                    SqlColumn column3 = null;
                    if (num == 0)
                    {
                        column3 = sqlTable.GetColumn(sqlTable.Colunas[1].Name);
                    }
                    else
                    {
                        column3 = sqlTable.GetColumn(sqlTable.Colunas[0].Name);
                    }
                    string[] strArray19 = new string[11];
                    strArray19[0] = Tab(2);
                    strArray19[1] = "public static List<";
                    strArray19[2] = referencesForFk[0].ClassModelName;
                    strArray19[3] = "> Get";
                    char ch = referencesForFk[0].ClassModelName[0];
                    strArray19[4] = ch.ToString().ToUpper();
                    strArray19[5] = referencesForFk[0].ClassModelName.Substring(1);
                    strArray19[6] = "(";
                    strArray19[7] = column3.NetDataType;
                    strArray19[8] = " ";
                    strArray19[9] = column3.Name;
                    strArray19[10] = "_)";
                    builder.AppendLine(string.Concat(strArray19));
                    builder.AppendLine(Tab(2) + "{");
                    builder.AppendLine(Tab(3) + "try");
                    builder.AppendLine(Tab(3) + "{");
                    builder.AppendLine(Tab(4) + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + " db = new " + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + "();");
                    builder.AppendLine(Tab(4) + "if (SharedSqlTransaction != null)");
                    builder.AppendLine(Tab(4) + "{");
                    builder.AppendLine(Tab(5) + "db.sqlTrans = SharedSqlTransaction;");
                    builder.AppendLine(Tab(5) + "isSharedTransaction = true;");
                    builder.AppendLine(Tab(4) + "}");
                    builder.AppendLine(Tab(4) + "db.isTransaction = isSharedTransaction;");
                    builder.AppendLine();
                    builder.AppendLine(Tab(4) + "List<" + referencesForFk[0].ClassModelName + "> " + referencesForFk[0].ClassModelName.ToLower() + "List = new List<" + referencesForFk[0].ClassModelName + ">();");
                    string[] strArray22 = new string[7];
                    strArray22[0] = Tab(4);
                    strArray22[1] = "DataTable dt = db.Selecionar_";
                    char ch2 = referencesForFk[0].ClassModelName[0];
                    strArray22[2] = ch2.ToString().ToUpper();
                    strArray22[3] = referencesForFk[0].ClassModelName.Substring(1);
                    strArray22[4] = "(";
                    strArray22[5] = column3.Name;
                    strArray22[6] = "_);";
                    builder.AppendLine(string.Concat(strArray22));
                    builder.AppendLine(Tab(4) + "SharedSqlTransaction = db.sqlTrans;");
                    builder.AppendLine(Tab(4) + "if (dt != null && dt.Rows.Count > 0)");
                    builder.AppendLine(Tab(4) + "{");
                    builder.AppendLine(Tab(5) + "foreach (DataRow dr in dt.Rows)");
                    builder.AppendLine(Tab(5) + "{");
                    builder.AppendLine(Tab(6) + referencesForFk[0].ClassModelName.ToLower() + "List.Add(" + referencesForFk[0].ClassModelName + ".ConvertToObject(dr));");
                    builder.AppendLine(Tab(5) + "}");
                    builder.AppendLine(Tab(4) + "}");
                    builder.AppendLine(Tab(4) + "return " + referencesForFk[0].ClassModelName.ToLower() + "List;");
                    builder.AppendLine(Tab(3) + "}");
                    builder.AppendLine(Tab(3) + "catch");
                    builder.AppendLine(Tab(3) + "{");
                    builder.AppendLine(Tab(4) + "return null;");
                    builder.AppendLine(Tab(3) + "}");
                    builder.AppendLine(Tab(2) + "}");
                    num++;
                }
            }
            builder.AppendLine(Tab(2) + "#endregion");
            builder.AppendLine(Tab(2) + "#endregion");
            return builder.ToString();
        }

        private static string GerarMetodos(SqlTable sqlTable)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine(Tab(2) + "#region Metodos");
            string str = "int?";
            if (!sqlTable.IsTableNo)
            {
                if (sqlTable.GetIdentityColumn().NetDataType == "decimal?")
                {
                    str = "decimal?";
                }
                builder.AppendLine(Tab(2) + "public " + str + " InserirAtualizar()");
            }
            else
            {
                builder.AppendLine(Tab(2) + "public void InserirAtualizar()");
            }
            builder.AppendLine(Tab(2) + "{");
            builder.AppendLine(Tab(3) + "try");
            builder.AppendLine(Tab(3) + "{");
            builder.AppendLine(Tab(4) + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + " db = new " + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + "();");
            builder.AppendLine(Tab(4) + "if (InstanceSqlTransaction != null)");
            builder.AppendLine(Tab(4) + "{");
            builder.AppendLine(Tab(5) + "db.sqlTrans = InstanceSqlTransaction;");
            builder.AppendLine(Tab(5) + "isTransaction = true;");
            builder.AppendLine(Tab(4) + "}");
            builder.AppendLine(Tab(4) + "db.isTransaction = isTransaction;");
            builder.AppendLine();
            if (!sqlTable.IsTableNo)
            {
                builder.AppendLine(Tab(4) + "this._" + sqlTable.GetIdentityColumn().Name + " = db.GravarOuAtualizar(" + GetInsertParams() + ");");
                builder.AppendLine(Tab(4) + "InstanceSqlTransaction = db.sqlTrans;");
                builder.AppendLine(Tab(4) + "return this._" + sqlTable.GetIdentityColumn().Name + ";");
            }
            else
            {
                builder.AppendLine(Tab(4) + "db.GravarOuAtualizar(this._" + sqlTable.Colunas[0].Name + ", this._" + sqlTable.Colunas[1].Name + ");");
                builder.AppendLine(Tab(4) + "InstanceSqlTransaction = db.sqlTrans;");
            }
            builder.AppendLine(Tab(3) + "}");
            builder.AppendLine(Tab(3) + "catch(Exception ex)");
            builder.AppendLine(Tab(3) + "{");
            builder.AppendLine(Tab(4) + "throw ex;");
            builder.AppendLine(Tab(3) + "}");
            builder.AppendLine(Tab(2) + "}");
            builder.AppendLine(Tab(2) + "public void Delete()");
            builder.AppendLine(Tab(2) + "{");
            builder.AppendLine(Tab(3) + "try");
            builder.AppendLine(Tab(3) + "{");
            builder.AppendLine(Tab(4) + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + " db = new " + Program.prefixNamespace + "DataBase." + sqlTable.ClassDataBaseNome + "();");
            builder.AppendLine(Tab(4) + "if (InstanceSqlTransaction != null)");
            builder.AppendLine(Tab(4) + "{");
            builder.AppendLine(Tab(5) + "db.sqlTrans = InstanceSqlTransaction;");
            builder.AppendLine(Tab(5) + "isTransaction = true;");
            builder.AppendLine(Tab(4) + "}");
            builder.AppendLine(Tab(4) + "db.isTransaction = isTransaction;");
            builder.AppendLine();
            if (!sqlTable.IsTableNo)
            {
                builder.AppendLine(Tab(4) + "db.Excluir(" + GetInsertParams() + ");");
            }
            else
            {
                builder.AppendLine(Tab(4) + "db.Excluir(this._" + sqlTable.Colunas[0].Name + ", this._" + sqlTable.Colunas[1].Name + ");");
            }
            builder.AppendLine(Tab(4) + "InstanceSqlTransaction = db.sqlTrans;");
            builder.AppendLine(Tab(3) + "}");
            builder.AppendLine(Tab(3) + "catch(Exception ex)");
            builder.AppendLine(Tab(3) + "{");
            builder.AppendLine(Tab(4) + "throw ex;");
            builder.AppendLine(Tab(3) + "}");
            builder.AppendLine(Tab(2) + "}");
            builder.AppendLine(Tab(2) + "#endregion");
            return builder.ToString();
        }

        private static string GerarNulls(int qtde)
        {
            string str = "";
            for (int i = 0; i < qtde; i++)
            {
                str = str + "null, ";
            }
            if (str != "")
            {
                str = str.Remove(str.Length - 2, 2);
            }
            return str;
        }

        private static void GerarParametros()
        {
            StringBuilder builder = new StringBuilder();
            foreach (AtributesForClass class2 in camposClass)
            {
                if (class2.IniName == "")
                {
                    builder.Append(class2.IniList + class2.Tipo + class2.FimList + " " + class2.IniName + class2.ClearName + "_, ");
                }
            }
            if (builder.Length > 2)
            {
                builder.Remove(builder.Length - 2, 2);
            }
            parametros = builder.ToString();
        }

        private static string GerarPropriedades(SqlTable sqlTable)
        {
            sc.Clear();
            StringBuilder builder = new StringBuilder();
            builder.AppendLine(Tab(2) + "#region Propriedades");
            foreach (AtributesForClass class2 in camposClass)
            {
                if (class2.IniName == "")
                {
                    builder.AppendLine(Tab(2) + "public " + class2.PropertiesType + " " + class2.PropertiesName);
                    builder.AppendLine(Tab(2) + "{");
                    builder.AppendLine(Tab(3) + "get");
                    builder.AppendLine(Tab(3) + "{");
                    builder.AppendLine(Tab(4) + "return this._" + class2.IniName + class2.ClearName + ";");
                    builder.AppendLine(Tab(3) + "}");
                    builder.AppendLine(Tab(3) + "set");
                    builder.AppendLine(Tab(3) + "{");
                    builder.AppendLine(Tab(4) + "this._" + class2.IniName + class2.ClearName + " = value;");
                    builder.AppendLine(Tab(3) + "}");
                    builder.AppendLine(Tab(2) + "}");
                    continue;
                }
                if (class2.IniName == "ref_")
                {
                    builder.AppendLine(Tab(2) + "public " + class2.PropertiesType + " " + class2.PropertiesName);
                    builder.AppendLine(Tab(2) + "{");
                    builder.AppendLine(Tab(3) + "get");
                    builder.AppendLine(Tab(3) + "{");
                    SqlTable.GetTable(class2.ClearName).GetIdentityColumn();
                    if (!sqlTable.IsTableNo)
                    {
                        string[] strArray5 = new string[7];
                        strArray5[0] = Tab(4);
                        strArray5[1] = "return ";
                        char ch = class2.ClearName[0];
                        strArray5[2] = ch.ToString().ToUpper();
                        strArray5[3] = class2.ClearName.Substring(1);
                        strArray5[4] = ".GetById(";
                        strArray5[5] = GetSelectById(sqlTable, class2.ClearName);
                        strArray5[6] = ");";
                        builder.AppendLine(string.Concat(strArray5));
                    }
                    else
                    {
                        AtributesForClass atributo = AtributesForClass.GetAtributo(class2.PropertiesName);
                        if (atributo != null)
                        {
                            string[] strArray6 = new string[8];
                            strArray6[0] = Tab(4);
                            strArray6[1] = "return ";
                            char ch2 = class2.ClearName[0];
                            strArray6[2] = ch2.ToString().ToUpper();
                            strArray6[3] = class2.ClearName.Substring(1);
                            strArray6[4] = ".GetById(this.";
                            char ch3 = atributo.AtributeRef[0];
                            strArray6[5] = ch3.ToString().ToUpper();
                            strArray6[6] = atributo.AtributeRef.Substring(1);
                            strArray6[7] = ");";
                            builder.AppendLine(string.Concat(strArray6));
                        }
                    }
                    builder.AppendLine(Tab(3) + "}");
                    builder.AppendLine(Tab(3) + "set");
                    builder.AppendLine(Tab(3) + "{");
                    builder.AppendLine(Tab(4) + "this._" + class2.IniName + class2.ClearName + " = value;");
                    builder.AppendLine(Tab(3) + "}");
                    builder.AppendLine(Tab(2) + "}");
                    continue;
                }
                builder.AppendLine(Tab(2) + "public " + class2.PropertiesType + " " + class2.PropertiesName);
                builder.AppendLine(Tab(2) + "{");
                builder.AppendLine(Tab(3) + "get");
                builder.AppendLine(Tab(3) + "{");
                SqlTable.GetTable(class2.ClearName).GetIdentityColumn();
                if (!sqlTable.IsTableNo)
                {
                    SqlTable tableNo = GetTableNo(sqlTable, class2);
                    if (tableNo == null)
                    {
                        string[] strArray9 = new string[7];
                        strArray9[0] = Tab(4);
                        strArray9[1] = "return ";
                        char ch4 = class2.ClearName[0];
                        strArray9[2] = ch4.ToString().ToUpper();
                        strArray9[3] = class2.ClearName.Substring(1);
                        strArray9[4] = ".GetByParameters(";
                        strArray9[5] = GetSelectParams(sqlTable, class2.ClearName);
                        strArray9[6] = ");";
                        builder.AppendLine(string.Concat(strArray9));
                    }
                    else
                    {
                        SqlTable tableToNo = GetTableToNo(sqlTable, tableNo);
                        if ((tableToNo != null) && (tableToNo.ClassModelNome != class2.Tipo))
                        {
                            string[] strArray10 = new string[7];
                            strArray10[0] = Tab(4);
                            strArray10[1] = "return ";
                            char ch5 = class2.ClearName[0];
                            strArray10[2] = ch5.ToString().ToUpper();
                            strArray10[3] = class2.ClearName.Substring(1);
                            strArray10[4] = ".GetByParameters(";
                            strArray10[5] = GetSelectParams(sqlTable, class2.ClearName);
                            strArray10[6] = ");";
                            builder.AppendLine(string.Concat(strArray10));
                        }
                        else
                        {
                            SqlTable table3 = GetTableToNo(sqlTable, tableNo);
                            SqlColumn identityColumn = sqlTable.GetIdentityColumn();
                            string[] strArray11 = new string[9];
                            strArray11[0] = Tab(4);
                            strArray11[1] = "return ";
                            strArray11[2] = tableNo.ClassModelNome;
                            strArray11[3] = ".Get";
                            strArray11[4] = table3.ClassModelNome;
                            strArray11[5] = "(this.";
                            char ch6 = identityColumn.Name[0];
                            strArray11[6] = ch6.ToString().ToUpper();
                            strArray11[7] = identityColumn.Name.Substring(1);
                            strArray11[8] = ");";
                            builder.AppendLine(string.Concat(strArray11));
                        }
                    }
                }
                else
                {
                    AtributesForClass class4 = AtributesForClass.GetAtributo(class2.PropertiesName);
                    if (class4 != null)
                    {
                        string[] strArray12 = new string[10];
                        strArray12[0] = Tab(4);
                        strArray12[1] = "return ";
                        strArray12[2] = sqlTable.ClassModelNome;
                        strArray12[3] = ".Get";
                        char ch7 = class2.ClearName[0];
                        strArray12[4] = ch7.ToString().ToUpper();
                        strArray12[5] = class2.ClearName.Substring(1);
                        strArray12[6] = "(this.";
                        char ch8 = class4.AtributeRef[0];
                        strArray12[7] = ch8.ToString().ToUpper();
                        strArray12[8] = class4.AtributeRef.Substring(1);
                        strArray12[9] = ");";
                        builder.AppendLine(string.Concat(strArray12));
                    }
                }
                builder.AppendLine(Tab(3) + "}");
                builder.AppendLine(Tab(3) + "set");
                builder.AppendLine(Tab(3) + "{");
                builder.AppendLine(Tab(4) + "this._" + class2.IniName + class2.ClearName + " = value;");
                builder.AppendLine(Tab(3) + "}");
                builder.AppendLine(Tab(2) + "}");
            }
            builder.AppendLine(Tab(2) + "#endregion");
            return builder.ToString();
        }

        private static string GetInsertParams()
        {
            StringBuilder builder = new StringBuilder();
            foreach (AtributesForClass class2 in camposClass)
            {
                if ((class2.TipoKey != "FK") && (class2.TipoKey != "UK"))
                {
                    if (((class2.TipoKey == "PK") && class2.IsIdentity) || (class2.TipoKey == ""))
                    {
                        builder.Append("this._" + class2.ClearName + ", ");
                    }
                    continue;
                }
                if (class2.IniName != "")
                {
                    SqlColumn identityColumn = SqlTable.GetTable(class2.ClearName).GetIdentityColumn();
                    string[] strArray = new string[6];
                    strArray[0] = "this.Ref_";
                    strArray[1] = class2.ClearName;
                    strArray[2] = ".";
                    char ch = identityColumn.Name[0];
                    strArray[3] = ch.ToString().ToUpper();
                    strArray[4] = identityColumn.Name.Substring(1);
                    strArray[5] = ", ";
                    builder.Append(string.Concat(strArray));
                }
            }
            if (builder.Length > 2)
            {
                builder.Remove(builder.Length - 2, 2);
            }
            return builder.ToString();
        }

        private static string GetParamsNulls(int qtdeRemove)
        {
            int num = camposClass.Count - qtdeRemove;
            string str = "";
            for (int i = 0; i < num; i++)
            {
                str = str + "null, ";
            }
            if (str != "")
            {
                str = str.Remove(str.Length - 2, 2);
            }
            return str;
        }

        private static string GetSelectById(SqlTable actualTable, string referenceObject)
        {
            StringBuilder builder = new StringBuilder();
            actualTable.GetIdentityColumn();
            foreach (SqlColumn column in actualTable.Colunas)
            {
                if (column.IsFk)
                {
                    foreach (SqlReference reference in actualTable.References)
                    {
                        if (((referenceObject.ToLower() == reference.ClassModelName.ToLower()) && (reference.PkColumnName.ToLower() == column.Name.ToLower())) && (actualTable.Nome.ToLower() == reference.FkTable.ToLower()))
                        {
                            char ch = reference.PkColumnName[0];
                            builder.Append("this." + ch.ToString().ToUpper() + reference.PkColumnName.Substring(1) + ", ");
                        }
                    }
                }
            }
            if (builder.Length > 2)
            {
                builder.Remove(builder.Length - 2, 2);
            }
            return builder.ToString();
        }

        private static string GetSelectParams(SqlTable actualTable, string referenceObject)
        {
            StringBuilder builder = new StringBuilder();
            SqlTable table = SqlTable.GetTable(referenceObject);
            SqlColumn identityColumn = actualTable.GetIdentityColumn();
            bool flag = false;
            foreach (SqlColumn column2 in table.Colunas)
            {
                if (column2.IsFk)
                {
                    foreach (SqlReference reference in table.References)
                    {
                        if ((reference.PkTable.ToLower() == actualTable.Nome.ToLower()) && (reference.PkColumnName.ToLower() == column2.Name.ToLower()))
                        {
                            builder.Append("this._" + identityColumn.Name + ", ");
                            flag = true;
                            break;
                        }
                    }
                    if (flag)
                    {
                        flag = false;
                    }
                    else
                    {
                        builder.Append("null, ");
                    }
                    continue;
                }
                builder.Append("null, ");
            }
            if (builder.Length > 2)
            {
                builder.Remove(builder.Length - 2, 2);
            }
            return builder.ToString();
        }

        private static SqlTable GetTableNo(SqlTable table, AtributesForClass clearName)
        {
            foreach (SqlReference reference in table.References)
            {
                SqlTable table2 = SqlTable.GetTable(reference.FkTable);
                if ((table2 != null) && table2.IsTableNo)
                {
                    foreach (SqlReference reference2 in table2.References)
                    {
                        SqlTable table3 = SqlTable.GetTable(reference2.PkTable);
                        if (((table3.ClassModelNome.ToLower() == clearName.ClearName.ToLower()) && (table3.ClassModelNome.ToLower() != table.ClassModelNome.ToLower())) && !sc.Contains(table2.Nome))
                        {
                            sc.Add(table2.Nome);
                            return table2;
                        }
                    }
                }
            }
            return null;
        }

        private static SqlTable GetTableNo2(SqlTable table, AtributesForClass clearName)
        {
            if (Program.SqlTableList != null)
            {
                foreach (SqlTable table2 in Program.SqlTableList)
                {
                    if (table2.IsTableNo)
                    {
                        foreach (SqlReference reference in table2.References)
                        {
                            if ((reference.PkTable.ToLower() == table.Nome.ToLower()) && !sc.Contains(table.Nome.ToLower()))
                            {
                                sc.Add(table.Nome.ToLower());
                                return table2;
                            }
                        }
                    }
                }
            }
            return null;
        }

        private static SqlTable GetTableToNo(SqlTable sqlTable, SqlTable sqlTableNo)
        {
            if ((Program.SqlTableList != null) && (Program.SqlTableList.Count > 0))
            {
                foreach (SqlTable table in Program.SqlTableList)
                {
                    foreach (SqlReference reference in table.References)
                    {
                        if (((reference.FkTable.ToLower() == sqlTableNo.Nome.ToLower()) && (reference.PkTable.ToLower() != sqlTable.Nome.ToLower())) && (table.Nome.ToLower() != sqlTableNo.Nome.ToLower()))
                        {
                            return table;
                        }
                    }
                }
            }
            return null;
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

        public class AtributesForClass
        {
            private string _clearName;
            private string _fimList;
            private string _iniList;
            private string _iniName;
            private bool _isCollection;
            private bool _isIdentity;
            private string _propertiesName;
            private string _propertiesType;
            private string _tipo;
            private string _tipoKey;
            private string atributeRef;

            public AtributesForClass(string tipo_, string clearName_, bool isCollection_, string iniName_, string tipoKey_, bool isIdentity_, string atributeRef_)
            {
                this._tipo = tipo_;
                this._clearName = clearName_;
                this._isCollection = isCollection_;
                this.IniName = iniName_;
                this._tipoKey = tipoKey_;
                this._isIdentity = isIdentity_;
                this.atributeRef = atributeRef_;
                if (isCollection_ && (iniName_ == "list_"))
                {
                    this._iniList = "List<";
                    this._fimList = ">";
                    this._propertiesType = "List<" + tipo_ + ">";
                    char ch = iniName_[0];
                    this.PropertiesName = ch.ToString().ToUpper() + iniName_.Substring(1) + clearName_;
                }
                else if (iniName_ == "ref_")
                {
                    this._iniList = "";
                    this._fimList = "";
                    this._propertiesType = tipo_;
                    char ch2 = iniName_[0];
                    this.PropertiesName = ch2.ToString().ToUpper() + iniName_.Substring(1) + clearName_;
                }
                else
                {
                    this._propertiesType = tipo_;
                    char ch3 = clearName_[0];
                    this.PropertiesName = ch3.ToString().ToUpper() + clearName_.Substring(1);
                }
            }

            public static GerarModelClass.AtributesForClass GetAtributo(string propertiesName)
            {
                if ((GerarModelClass.camposClass != null) && (GerarModelClass.camposClass.Count > 0))
                {
                    foreach (GerarModelClass.AtributesForClass class2 in GerarModelClass.camposClass)
                    {
                        if (propertiesName.ToLower() == class2.PropertiesName.ToLower())
                        {
                            return class2;
                        }
                    }
                }
                return null;
            }

            public string AtributeRef
            {
                get
                {
                    return this.atributeRef;
                }
                set
                {
                    this.atributeRef = value;
                }
            }

            public string ClearName
            {
                get
                {
                    return this._clearName;
                }
                set
                {
                    this._clearName = value;
                }
            }

            public string FimList
            {
                get
                {
                    return this._fimList;
                }
                set
                {
                    this._fimList = value;
                }
            }

            public string IniList
            {
                get
                {
                    return this._iniList;
                }
                set
                {
                    this._iniList = value;
                }
            }

            public string IniName
            {
                get
                {
                    return this._iniName;
                }
                set
                {
                    this._iniName = value;
                }
            }

            public bool IsCollection
            {
                get
                {
                    return this._isCollection;
                }
                set
                {
                    this._isCollection = value;
                }
            }

            public bool IsIdentity
            {
                get
                {
                    return this._isIdentity;
                }
                set
                {
                    this._isIdentity = value;
                }
            }

            public string PropertiesName
            {
                get
                {
                    return this._propertiesName;
                }
                set
                {
                    this._propertiesName = value;
                }
            }

            public string PropertiesType
            {
                get
                {
                    return this._propertiesType;
                }
                set
                {
                    this._propertiesType = value;
                }
            }

            public string Tipo
            {
                get
                {
                    return this._tipo;
                }
                set
                {
                    this._tipo = value;
                }
            }

            public string TipoKey
            {
                get
                {
                    return this._tipoKey;
                }
                set
                {
                    this._tipoKey = value;
                }
            }
        }
    }
}

