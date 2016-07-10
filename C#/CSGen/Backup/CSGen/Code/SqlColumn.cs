namespace CSGen.Code
{
    using CSGen;
    using System;
    using System.Collections.Generic;
    using System.Data;

    public class SqlColumn
    {
        private string _adoDataType;
        private string _description;
        private bool _isFk;
        private bool _isIdentity;
        private bool _isPk;
        private bool _isUk;
        private int _length;
        private string _name;
        private string _netDataType;
        private bool _null;
        private int _precision;
        private int _scale;
        private string _sqlDataType;

        public SqlColumn()
        {
        }

        public SqlColumn(string name_, string netDataType_, string sqlDataType_, string adoDataType_, int length_, int precision_, int scale_, bool isPk_, bool isFk_, bool isUk_, bool null_, bool isIdentity_, string description_)
        {
            this._name = name_;
            this._netDataType = netDataType_;
            this._sqlDataType = sqlDataType_;
            this._adoDataType = adoDataType_;
            this._length = length_;
            this._precision = precision_;
            this._scale = scale_;
            this._isPk = isPk_;
            this._isFk = isFk_;
            this._isUk = isUk_;
            this._null = null_;
            this._isIdentity = isIdentity_;
            this._description = description_;
        }

        protected internal static SqlColumn ConvertToObject(DataRow dr)
        {
            SqlColumn column = new SqlColumn();
            column.AdoDataType = GetAdoDataType(dr[4].ToString());
            column.Description = dr[9].ToString();
            column.IsFk = dr[3].ToString() == "FK";
            column.IsIdentity = dr[2].ToString() == "Identity";
            column.IsPk = dr[3].ToString() == "PK";
            column.IsUk = dr[3].ToString() == "UK";
            column.Length = int.Parse(dr[5].ToString());
            column.Name = dr[1].ToString();
            column.NetDataType = GetNetDataType(dr[4].ToString());
            column.Null = dr[8].ToString() == "Sim";
            column.Precision = int.Parse(dr[6].ToString());
            column.Scale = int.Parse(dr[7].ToString());
            column.SqlDataType = dr[4].ToString();
            return column;
        }

        private static string GetAdoDataType(string sqlDataType)
        {
            switch (sqlDataType)
            {
                case "bigint":
                    return "SqlDbType.BigInt";

                case "binary":
                    return "SqlDbType.Binary";

                case "bit":
                    return "SqlDbType.Bit";

                case "char":
                    return "SqlDbType.Char";

                case "datetime":
                    return "SqlDbType.DateTime";

                case "decimal":
                    return "SqlDbType.Decimal";

                case "float":
                    return "SqlDbType.Float";

                case "image":
                    return "SqlDbType.Image";

                case "int":
                    return "SqlDbType.Int";

                case "money":
                    return "SqlDbType.Money";

                case "nchar":
                    return "SqlDbType.NChar";

                case "ntext":
                    return "SqlDbType.NText";

                case "numeric":
                    return "SqlDbType.Decimal";

                case "nvarchar":
                    return "SqlDbType.NVarChar";

                case "real":
                    return "SqlDbType.Real";

                case "smalldatetime":
                    return "SqlDbType.SmallDateTime";

                case "smallint":
                    return "SqlDbType.SmallInt";

                case "smallmoney":
                    return "SqlDbType.SmallMoney";

                case "sql_variant":
                    return "SqlDbType.Variant";

                case "text":
                    return "SqlDbType.Text";

                case "timestamp":
                    return "SqlDbType.Timestamp";

                case "tinyint":
                    return "SqlDbType.TinyInt";

                case "uniqueidentifier":
                    return "SqlDbType.UniqueIdentifier";

                case "varbinary":
                    return "SqlDbType.VarBinary";

                case "varchar":
                    return "SqlDbType.VarChar";

                case "xml":
                    return "SqlDbType.Xml";
            }
            return "";
        }

        private static string GetNetDataType(string sqlDataType)
        {
            switch (sqlDataType)
            {
                case "bigint":
                    return "decimal?";

                case "binary":
                    return "byte[]";

                case "bit":
                    return "bool?";

                case "char":
                    return "string";

                case "datetime":
                    return "DateTime?";

                case "decimal":
                    return "decimal?";

                case "float":
                    return "decimal?";

                case "image":
                    return "byte[]";

                case "int":
                    return "int?";

                case "money":
                    return "decimal?";

                case "nchar":
                    return "string";

                case "ntext":
                    return "string";

                case "numeric":
                    return "decimal?";

                case "nvarchar":
                    return "string";

                case "real":
                    return "string";

                case "smalldatetime":
                    return "DateTime?";

                case "smallint":
                    return "int?";

                case "smallmoney":
                    return "decimal?";

                case "sql_variant":
                    return "byte[]";

                case "text":
                    return "string";

                case "timestamp":
                    return "byte[]";

                case "tinyint":
                    return "int?";

                case "uniqueidentifier":
                    return "Guid?";

                case "varbinary":
                    return "byte[]";

                case "varchar":
                    return "string";

                case "xml":
                    return "string";
            }
            return "";
        }

        public List<SqlReference> GetReferencesForFk(SqlTable sqlTable)
        {
            List<SqlReference> list = new List<SqlReference>();
            if (Program.SqlTableList != null)
            {
                foreach (SqlTable table in Program.SqlTableList)
                {
                    foreach (SqlReference reference in table.References)
                    {
                        if (((reference.FkTable.ToLower() == sqlTable.Nome.ToLower()) && (sqlTable.Nome.ToLower() == table.Nome.ToLower())) && (reference.PkColumnName.ToLower() == this._name.ToLower()))
                        {
                            reference.ClassBusinessName = SqlTable.GetBusinessClassName(reference.PkTable);
                            list.Add(reference);
                        }
                    }
                }
            }
            return list;
        }

        public List<SqlReference> GetReferencesForPk(SqlTable sqlTable)
        {
            List<SqlReference> list = new List<SqlReference>();
            if (Program.SqlTableList != null)
            {
                foreach (SqlTable table in Program.SqlTableList)
                {
                    foreach (SqlReference reference in table.References)
                    {
                        if (((reference.PkTable.ToLower() == sqlTable.Nome.ToLower()) && (reference.PkTable.ToLower() == table.Nome.ToLower())) && (reference.FkColumnName.ToLower() == this._name.ToLower()))
                        {
                            reference.ClassBusinessName = SqlTable.GetBusinessClassName(reference.FkTable);
                            list.Add(reference);
                        }
                    }
                }
            }
            return list;
        }

        public string AdoDataType
        {
            get
            {
                return this._adoDataType;
            }
            set
            {
                this._adoDataType = value;
            }
        }

        public string Description
        {
            get
            {
                return this._description;
            }
            set
            {
                this._description = value;
            }
        }

        public bool IsFk
        {
            get
            {
                return this._isFk;
            }
            set
            {
                this._isFk = value;
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

        public bool IsPk
        {
            get
            {
                return this._isPk;
            }
            set
            {
                this._isPk = value;
            }
        }

        public bool IsUk
        {
            get
            {
                return this._isUk;
            }
            set
            {
                this._isUk = value;
            }
        }

        public int Length
        {
            get
            {
                return this._length;
            }
            set
            {
                this._length = value;
            }
        }

        public string Name
        {
            get
            {
                return this._name;
            }
            set
            {
                this._name = value;
            }
        }

        public string NetDataType
        {
            get
            {
                return this._netDataType;
            }
            set
            {
                this._netDataType = value;
            }
        }

        public bool Null
        {
            get
            {
                return this._null;
            }
            set
            {
                this._null = value;
            }
        }

        public int Precision
        {
            get
            {
                return this._precision;
            }
            set
            {
                this._precision = value;
            }
        }

        public int Scale
        {
            get
            {
                return this._scale;
            }
            set
            {
                this._scale = value;
            }
        }

        public string SqlDataType
        {
            get
            {
                return this._sqlDataType;
            }
            set
            {
                this._sqlDataType = value;
            }
        }
    }
}

