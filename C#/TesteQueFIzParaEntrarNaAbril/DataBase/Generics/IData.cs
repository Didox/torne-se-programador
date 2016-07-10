using System;
using System.Data.Common;

namespace ExameAbril.DataBase.Generics
{
	public interface IData
	{
        IType SetObject(DbDataReader dr, IType iType);
        void Save(IType iType);
        void Delete(IType iType);
        LIType Get(IType iType);
	}
}
