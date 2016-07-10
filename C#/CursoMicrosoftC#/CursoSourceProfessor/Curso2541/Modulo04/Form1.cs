using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace Modulo04
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private DataSet Ds;

        private void Form1_Load(object sender, EventArgs e)
        {
            DataTable DtClientes = new DataTable("Cliente");

            DataColumn DcId = new DataColumn("Id", typeof(int));
            DataColumn DcNome = new DataColumn("Nome", typeof(String));

            DtClientes.Columns.Add(DcId);
            DtClientes.Columns.Add(DcNome);

            Ds = new DataSet("Clientes");
            Ds.Tables.Add(DtClientes);

            Dtg_Clientes.DataSource = Ds.Tables[0];
        }

        private void Cmd_Incluir_Click(object sender, EventArgs e)
        {
            DataRow Row = Ds.Tables[0].NewRow();
            Row["Id"] = Txt_Id.Text;
            Row["Nome"] = Txt_Nome.Text;
            Ds.Tables[0].Rows.Add(Row);
        }

        private void Cmd_GerarXml_Click(object sender, EventArgs e)
        {
            Ds.WriteXml(@"C:\Clientes.xml");
            MessageBox.Show("Xml gerado com sucesso");
        }

        private void Cmd_LerXml_Click(object sender, EventArgs e)
        {
            Cliente ObjCliente = new Cliente();
            string Xml = ObjCliente.ObterClientesXml();

            StringReader ObjStringReader = new StringReader(Xml);
            Ds.ReadXml(ObjStringReader);

            //Criação de um formulário dinâmico
            Form ObjForm = new Form();
            DataGridView ObjDataGridView = new DataGridView();
            ObjDataGridView.DataSource = Ds.Tables[0];
            ObjForm.Controls.Add(ObjDataGridView);
            ObjDataGridView.Dock = DockStyle.Fill;
            ObjForm.Show();
        }
    }
}