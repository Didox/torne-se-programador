using System;
using System.Data;
using System.Collections.Generic;
using System.Text;

namespace Modulo04
{
    public class Cliente
    {
        public string ObterClientesXml()
        {
            DataSet Ds = new DataSet();
            Ds.ReadXml(@"C:\Clientes.xml");
            return Ds.GetXml();
        }
    }
}
