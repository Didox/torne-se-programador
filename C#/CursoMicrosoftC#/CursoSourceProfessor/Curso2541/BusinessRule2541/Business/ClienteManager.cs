using System;
using System.Collections.Generic;
using System.Text;

using BusinessRule2541.Dao;


namespace BusinessRule2541.Business
{
    public class ClienteManager
    {
        private ClienteDao ObjClienteDao;

        public ClienteManager(string ConnectionString)
        {
            ObjClienteDao = new ClienteDao(ConnectionString);
        }

        public void IncluirCliente(Cliente Cliente)
        {
            ObjClienteDao.IncluirCliente(Cliente);
        }

        public Clientes ListarClientes()
        {
            return ObjClienteDao.ListarClientes();
        }
    }
}
