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
            table._classBusinessNome = table._nome.Replace(Program.stringRemoveClass, "");
            char ch2 = table._classBusinessNome[0];
            table._classBusinessNome = ch2.ToString().ToUpper() + table._classBusinessNome.Substring(1);
            table._procNome = table._nome.Replace(Program.stringRemoveProc, "");
            table._ignore = false;
            table._isTableNo = true;
            foreach (SqlColumn column in table.Colunas)
            {
                if (!column.IsFk && !column.IsPk)
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

        public string GetColumnsInObjectThis()
        {
            string str = "new " + this.ClassBusinessNome + "(";
            foreach (SqlColumn column in this.Colunas)
            {
                string str2 = str;
                if (!column.IsFk)
                    str = str2 + column.Name + "_, ";
                else
                    str = str2 + "new " + getReferenceTable(this._references, column.Name) + "(" + column.Name + "_, true), ";
            }
            return str + "true)";
        }

        public string GetColumnsInParams()
        {
            string str = "";
            foreach (SqlColumn column in this.Colunas)
            {
                if (column.SqlDataType != "text")
                {
                    string str2 = str;
                    str = str2 + column.NetDataType + " " + column.Name + "_, ";
                }
            }
            if (str != "")
            {
                str = str.Remove(str.Length - 2, 2);
            }
            return str;
        }

        private static string getReferenceTable(List<SqlReference> refs, string colunName)
        {
            foreach (SqlReference reference in refs)
            {
                if (reference.PkColumnName == colunName)
                {
                    return reference.ClassBusinessName;
                }
            }
            return "";
        }

        public string GetColumnsInParamsObjects()
        {
            string str = "";
            foreach (SqlColumn column in this.Colunas)
            {
                string str2 = str;
                if (column.IsPk || column.IsFk)
                {
                    if(column.IsFk)
                        str = str2 + getReferenceTable(this._references, column.Name) + " R" + getReferenceTable(this._references, column.Name) + "_, ";
                    else
                        str = str2 + this.ClassBusinessNome + " R" + this.ClassBusinessNome + "_, ";
                }
            }
            if (str != "")
            {
                str = str.Remove(str.Length - 2, 2);
            }
            return str;
        }

        public string GetColumnsOutParamsObject()
        {
            string str = "";
            foreach (SqlColumn column in this.Colunas)
            {
                if (column.SqlDataType != "text")
                {
                    if (column.IsFk)
                        str = str + "R" + this.ClassBusinessNome + "_.R" + getReferenceTable(this._references, column.Name) + "." + column.Name[0].ToString().ToUpper() + column.Name.Substring(1).ToLower() + ", ";
                    else
                        str = str + "R" + this.ClassBusinessNome + "_." + column.Name[0].ToString().ToUpper() + column.Name.Substring(1).ToLower() + ", ";
                }
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

            foreach (SqlColumn column in this.Colunas)
            {
                if (column.IsPk)
                {
                    return column;
                }
            }

            foreach (SqlColumn column in this.Colunas)
            {
                if (column.IsFk)
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
                return this._classBusinessNome[0].ToString().ToUpper() + _classBusinessNome.Substring(1).ToLower();
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
                return this._classDataBaseNome[0].ToString().ToUpper() + _classDataBaseNome.Substring(1).ToLower();
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
                return this._nome.ToLower();
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
                return this._procNome[0].ToString().ToUpper() + _procNome.Substring(1).ToLower();
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

