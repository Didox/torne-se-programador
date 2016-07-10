using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;

namespace Modulo04
{
    public partial class frmForm : Form
    {
        public frmForm()
        {
            InitializeComponent();
        }

        private DataSet ds = new DataSet();
        private bool active = false;

        private void frmForm_Load(object sender, EventArgs e)
        {
            //StringReader sr = new StringReader(new Cliente().ObterClientesXML());
            //ds.ReadXml(sr);
            new Cliente().ObterClientesBase(ref ds);
            dgvClientes.DataSource = ds.Tables[0];
        }

        private void cmdIncluir_Click(object sender, EventArgs e)
        {
            DataRow r = ds.Tables[0].NewRow();
            r["id"] = 0;
            r["nome"] = txtNome.Text;
            ds.Tables[0].Rows.Add(r);

            ds.WriteXml(AppDomain.CurrentDomain.BaseDirectory + "clientes.xml", XmlWriteMode.DiffGram);
            txtId.Text = "";
            txtNome.Text = "";
        }

        private void btnDeleteRow_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow dgvr in dgvClientes.SelectedRows)
            {
                if (dgvr.Selected)
                {
                    foreach( DataRow dr in ds.Tables[0].Rows )
                    {
                        if (dr["id"].ToString() == dgvr.Cells[0].Value.ToString())
                        {
                            ds.Tables[0].Rows.Remove(dr);
                            break;
                        }
                    }
                }
            }
            
            ds.WriteXml(AppDomain.CurrentDomain.BaseDirectory + "clientes.xml", XmlWriteMode.DiffGram);  
        }

        private void btnUpdateBase_Click(object sender, EventArgs e)
        {
            if( ! active) button1_Click(sender, e);
            new Cliente().UpdateXml();
            MessageBox.Show("Banco Atualizado");
            active = false;
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            DataView dv = new DataView(ds.Tables[0]);
            dv.RowFilter = "Nome like '%" + txtNome.Text + "%'";
            dgvClientes.DataSource = dv;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            active = true;
            ds.WriteXmlSchema(AppDomain.CurrentDomain.BaseDirectory + "clientes.xsd");
            ds.WriteXml(AppDomain.CurrentDomain.BaseDirectory + "clientes.xml", XmlWriteMode.DiffGram);
            MessageBox.Show("XML Atualizado");
        }
    }
}