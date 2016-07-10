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

        private DataSet ds = new DataSet();

        private void Form1_Load(object sender, EventArgs e)
        {
            DataTable dtClientes = new DataTable("clientes");            
            DataColumn dcClientesId = new DataColumn("id");
            DataColumn dcClientesNome = new DataColumn("nome");
            dtClientes.Columns.Add(dcClientesId);
            dtClientes.Columns.Add(dcClientesNome);
            ds.Tables.Add(dtClientes);
            dgvClientes.DataSource = ds.Tables[0];
        }

        private void cmdIncluir_Click(object sender, EventArgs e)
        {
            DataRow r = ds.Tables[0].NewRow();
            r["id"] = txtId.Text;
            r["nome"] = txtNome.Text;
            ds.Tables[0].Rows.Add(r);
        }

        private void btnGeraXML_Click(object sender, EventArgs e)
        {
            ds.WriteXml(AppDomain.CurrentDomain.BaseDirectory + "clientes.xml");
            MessageBox.Show("gerado");
        }

        private void btnDeleteRow_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow dgvr in dgvClientes.SelectedRows)
            {
                if (dgvr.Selected)
                    dgvClientes.Rows.Remove(dgvr);
            }
        }

        private void btnLerXml_Click(object sender, EventArgs e)
        {
            StringReader sr = new StringReader(new Cliente().ObterClientesXML());
            DataSet ds = new DataSet();
            ds.ReadXml(sr);
            dgvClientes.DataSource = ds.Tables[0];
        }
    }
}