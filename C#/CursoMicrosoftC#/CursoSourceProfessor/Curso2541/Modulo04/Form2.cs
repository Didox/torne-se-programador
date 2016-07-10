using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Configuration;

namespace Modulo04
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private SqlConnection ObjSqlConnection;
        private ConnectionStringSettings ObjConnectionStringSettings;
        private SqlCommand ObjSqlCommand;
        private SqlDataAdapter ObjSqlDataAdapter;
        private DataSet ObjDataSet;

        private void Form2_Load(object sender, EventArgs e)
        {
            ObjConnectionStringSettings = ConfigurationManager.ConnectionStrings["Curso2541"];
            ObjSqlConnection = new SqlConnection(ObjConnectionStringSettings.ConnectionString);

            ObjSqlCommand = new SqlCommand();
            ObjSqlCommand.Connection = ObjSqlConnection;
            ObjSqlCommand.CommandText = "Select Nome From Tb_Clientes";

            ObjSqlDataAdapter = new SqlDataAdapter();
            ObjSqlDataAdapter.SelectCommand = ObjSqlCommand;

            ObjDataSet = new DataSet();
            ObjSqlDataAdapter.Fill(ObjDataSet);

            Dtg_Clientes.DataSource = ObjDataSet.Tables[0];
        }

        private void Cmd_Incluir_Click(object sender, EventArgs e)
        {
            DataRow ObjDataRow = ObjDataSet.Tables[0].NewRow();
            ObjDataRow["Nome"] = Txt_Nome.Text;
            ObjDataSet.Tables[0].Rows.Add(ObjDataRow);

            LimparCampos();
        }

        private void LimparCampos()
        {
            foreach (Control Controle in this.Controls)
            {
                if (Controle.GetType() == typeof(TextBox))
                {
                    Controle.Text = "";
                }
            }

            Txt_Nome.Focus();
        }

        private void Cmd_AtualizarBase_Click(object sender, EventArgs e)
        {
            SqlCommandBuilder ObjSqlCommandBuilder = new SqlCommandBuilder();
            ObjSqlCommandBuilder.DataAdapter = ObjSqlDataAdapter;

            ObjSqlDataAdapter.Update(ObjDataSet.Tables[0]);
        }

        private void Cmd_Consultar_Click(object sender, EventArgs e)
        {
            DataView ObjDataView = new DataView(ObjDataSet.Tables[0]);
            ObjDataView.RowFilter = "Nome Like '" + Txt_Nome.Text + "%'";

            Form ObjForm = new Form();

            DataGridView ObjDataGridView = new DataGridView();
            ObjDataGridView.DataSource = ObjDataView;
            ObjDataGridView.Dock = DockStyle.Fill;

            ObjForm.Controls.Add(ObjDataGridView);
            ObjForm.Show();
        }

        private void Cmd_SalvarXml_Click(object sender, EventArgs e)
        {
            ObjDataSet.WriteXml(@"C:\Clientes.xml", XmlWriteMode.DiffGram);
            ObjDataSet.WriteXmlSchema(@"C:\Clientes.xsd");
            MessageBox.Show("Xml gerado com sucesso");
        }
    }
}