using System;

namespace ExameAbril.DataBase.Generics
{
    [AttributeUsage(AttributeTargets.Property)]
    public class OperationsAttribute : Attribute
    {
        #region Attributes

        private bool _useSave;
        private bool _useDelete;
        private bool _useGet;

        #endregion

        #region Properties

        public bool UseSave { get { return _useSave; } }
        public bool UseDelete { get { return _useDelete; } }
        public bool UseGet { get { return _useGet; } }

        #endregion

        #region Constructor

        public OperationsAttribute(bool useSave, bool useDelete, bool useGet)
        {
            _useSave = useSave;
            _useDelete = useDelete;
            _useGet = useGet;
        }

        #endregion
    }
}
