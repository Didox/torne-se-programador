namespace CSGen.Code
{
    using System;
    using System.Data;

    public class SqlReference
    {
        private string _classBusinessName;
        private string _constraintName;
        private bool _deleteCascade;
        private string _fkColumnName;
        private string _fkTable;
        private bool _ignore;
        private bool _isCollection;
        private string _pkColumnName;
        private string _pkTable;
        private TpRelacao _tipoRelacao;
        private bool _updateCascade;

        public SqlReference()
        {
        }

        public SqlReference(string pkTable_, string fkTable_, string constraintName_, string pkColumnName_, string fkColumnName_, bool deleteCascade_, bool updateCascade_, TpRelacao tipoRelacao_, bool isCollection_, bool ignore_)
        {
            this._pkTable = pkTable_;
            this._fkTable = fkTable_;
            this._constraintName = constraintName_;
            this._pkColumnName = pkColumnName_;
            this._fkColumnName = fkColumnName_;
            this._deleteCascade = deleteCascade_;
            this._updateCascade = updateCascade_;
            this._tipoRelacao = tipoRelacao_;
            this._isCollection = isCollection_;
            this._ignore = ignore_;
        }

        public static SqlReference ConvertToObject(DataRow dr)
        {
            SqlReference reference = new SqlReference(dr["PK_Table"].ToString(), dr["FK_Table"].ToString(), dr["Constraint"].ToString(), dr["cKeyCol1"].ToString(), dr["cRefCol1"].ToString(), dr["DeleteCascade"].ToString() == "1", dr["UpdateCascade"].ToString() == "1", TpRelacao.Um_Para_Um, false, false);
            reference.TipoRelacao = TpRelacao.Um_Para_Um;
            return reference;
        }

        public string ClassBusinessName
        {
            get
            {
                return this._classBusinessName;
            }
            set
            {
                this._classBusinessName = value;
            }
        }

        public string ConstraintName
        {
            get
            {
                return this._constraintName;
            }
            set
            {
                this._constraintName = value;
            }
        }

        public bool DeleteCascade
        {
            get
            {
                return this._deleteCascade;
            }
            set
            {
                this._deleteCascade = value;
            }
        }

        public string FkColumnName
        {
            get
            {
                return this._fkColumnName;
            }
            set
            {
                this._fkColumnName = value;
            }
        }

        public string FkTable
        {
            get
            {
                return this._fkTable;
            }
            set
            {
                this._fkTable = value;
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

        public string PkColumnName
        {
            get
            {
                return this._pkColumnName.ToLower();
            }
            set
            {
                this._pkColumnName = value;
            }
        }

        public string PkTable
        {
            get
            {
                return this._pkTable;
            }
            set
            {
                this._pkTable = value;
            }
        }

        public TpRelacao TipoRelacao
        {
            get
            {
                return this._tipoRelacao;
            }
            set
            {
                this._tipoRelacao = value;
            }
        }

        public bool UpdateCascade
        {
            get
            {
                return this._updateCascade;
            }
            set
            {
                this._updateCascade = value;
            }
        }

        public enum TpRelacao
        {
            Um_Para_Um,
            Um_Para_Muitos,
            Muitos_Para_Muitos
        }
    }
}

