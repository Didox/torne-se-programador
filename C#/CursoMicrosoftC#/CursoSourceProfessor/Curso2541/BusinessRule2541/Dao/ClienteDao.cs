using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using DataManager;

using BusinessRule2541.Business;

namespace BusinessRule2541.Dao
{
    public class ClienteDao
    {
        private IDbConnection ObjConnection;
        private CommandManager ObjCommand;

        public ClienteDao(string ConnectionString)
        {
            ObjConnection = ConnectionManager.GetConnection(DataBaseType.SqlServer,ConnectionString);
            ObjCommand = new CommandManager(ObjConnection);
        }

        public void IncluirCliente(Cliente Cliente)
        {
            ObjCommand.ExecuteCommand("Insert Tb_Clientes (Nome) Values('" + Cliente.Nome + "')");
        }

        public Clientes ListarClientes()
        {
            IDataReader ObjDataReader =  ObjCommand.ExecuteDataReader("Select * From Tb_Clientes");

            Clientes ObjClientes = new Clientes();

            while (ObjDataReader.Read())
            {
                Cliente ObjCliente = new Cliente();

                ObjCliente.Id = ObjDataReader.GetInt32(ObjDataReader.GetOrdinal("Id"));
                ObjCliente.Nome = ObjDataReader.GetString(ObjDataReader.GetOrdinal("Nome"));

                ObjClientes.Add(ObjCliente);
            }

            return ObjClientes;
        }
    }
}
