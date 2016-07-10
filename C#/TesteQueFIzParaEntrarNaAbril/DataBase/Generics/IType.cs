using System;
using System.Data.Common;

namespace ExameAbril.DataBase.Generics
{
    public interface IType : IDisposable
    {
        DbTransaction Transaction { get;set;}
        bool IsTransaction { get;set;}
        bool IsFull { get;set;}
    }
}
