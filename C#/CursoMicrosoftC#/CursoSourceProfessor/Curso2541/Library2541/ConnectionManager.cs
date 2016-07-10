using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.OracleClient;

namespace DataManager
{
    public class ConnectionManager
    {
        private ConnectionManager()
        {

        }

        public static IDbConnection GetConnection(DataBaseType DataBaseType, string ConnectionString)
        {
            IDbConnection ObjConnection = null;

            if (DataBaseType == DataBaseType.SqlServer)
            {
                ObjConnection = new SqlConnection();
            }
            else if (DataBaseType == DataBaseType.Oracle)
            {
                ObjConnection = new OracleConnection();
            }

            ObjConnection.ConnectionString = ConnectionString;

            return ObjConnection;
        }
    }
}
