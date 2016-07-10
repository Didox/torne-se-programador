using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.OracleClient;
using System.Data.Common;

namespace Library2541.DataManager
{
    public class ConnectionManager
    {
        private ConnectionManager() { }

        public static IDbConnection GetConnnection(DataBaseType DataBaseType, string str)
        {
            IDbConnection connection = null;
            if (DataBaseType == DataBaseType.SqlServer)
                return SqlConnection;
            else if (DataBaseType == DataBaseType.Oracle)
                return OracleConnection;
        }
    }
}
