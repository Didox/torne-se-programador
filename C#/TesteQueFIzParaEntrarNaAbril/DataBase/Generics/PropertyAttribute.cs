using System;

namespace ExameAbril.DataBase.Generics
{
    [AttributeUsage(AttributeTargets.Property)]
    public class PropertyAttribute : Attribute
    {
        #region Attributes

        private bool _isPk;
        private bool _isField;
        private bool _isReference;
        private bool _isCollection;

        #endregion

        #region Properties

        public bool IsPk { get { return _isPk; } }
        public bool IsField { get { return _isField; } }
        public bool IsReference { get { return _isReference; } }
        public bool IsCollection { get { return _isCollection; } }

        #endregion

        #region Constructor

        public PropertyAttribute(bool isPk, bool isField, bool isReference, bool isCollection)
        {
            _isPk = isPk;
            _isField = isField;
            _isReference = isReference;
            _isCollection = isCollection;
        }

        #endregion
    }
}
