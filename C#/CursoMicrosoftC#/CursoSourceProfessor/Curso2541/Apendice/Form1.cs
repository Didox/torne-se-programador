using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

using BusinessRule2541.Business;

namespace Apendice
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Cmd_Gravar_Click(object sender, EventArgs e)
        {
            ClienteManager ObjClienteManager = new ClienteManager(@"Data Source=WD082BG2WM\Sql2000;Initial Catalog=Northwind;Integrated Security=true");

            Cliente ObjCliente = new Cliente();
            ObjCliente.Nome = Txt_Nome.Text;
            ObjClienteManager.IncluirCliente(ObjCliente);

            Clientes ObjClientes = ObjClienteManager.ListarClientes();
            Dtg_Clientes.DataSource = ObjClientes;
        }
    }
}