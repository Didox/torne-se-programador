using System;
using System.Collections.Generic;
using System.Text;
using System.Data.Common;

namespace Library2541
{
    public class CommandManager
    {
        private DbConnection _connection;

        public DbConnection Connection
        {
            get{return _connection;}
            set{_connection = value;}
        }

        public void ExecuteNonQuery(string sql_)
        {
            
        }

        public void ExecuteReader(string sql_)
        {
            
        }
    }
}
