using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.OracleClient;

namespace DataManager
{
    public class CommandManager
    {
        private IDbConnection ObjConnection = null;
        private IDbCommand ObjCommand       = null;

        public CommandManager(IDbConnection Connection)
        {
            if(Connection.GetType() == typeof(SqlConnection))
            {
                ObjCommand = new SqlCommand();
            }
            else if (Connection.GetType() == typeof(OracleConnection))
            {
                ObjCommand = new OracleCommand();
            }

            ObjConnection = Connection;
            ObjCommand.Connection = ObjConnection;
        }

        public int ExecuteCommand(string Command)
        {
            int Retorno = 0;

            ObjCommand.CommandText = Command;
            ObjConnection.Open();
            Retorno = ObjCommand.ExecuteNonQuery();
            ObjConnection.Close();

            return Retorno;
        }

        public IDataReader ExecuteDataReader(string SelectCommand)
        {
            IDataReader ObjDataReader = null;

            ObjCommand.CommandText = SelectCommand;

            ObjConnection.Open();
            ObjDataReader = ObjCommand.ExecuteReader(CommandBehavior.CloseConnection);

            return ObjDataReader;
        }
    }
}
