using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Configuration;

namespace Modulo06
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Cmd_AtualizarDados_Click(object sender, EventArgs e)
        {
            DataSet ObjDataSet = new DataSet();
            ObjDataSet.ReadXmlSchema(@"C:\Clientes.xsd");
            ObjDataSet.ReadXml(@"C:\Clientes.xml", XmlReadMode.DiffGram);

            ConnectionStringSettings ObjConnectionStringSettings = ConfigurationManager.ConnectionStrings["Curso2541"];
            SqlConnection ObjSqlConnection = new SqlConnection(ObjConnectionStringSettings.ConnectionString);

            SqlCommand ObjSqlCommand = new SqlCommand();
            ObjSqlCommand.Connection = ObjSqlConnection;
            ObjSqlCommand.CommandText = "Insert Tb_Clientes ";
            ObjSqlCommand.CommandText += "(Nome) Values(@Nome)";

            ObjSqlCommand.Parameters.Add(new SqlParameter("@Nome",SqlDbType.VarChar,
                50,"Nome"));

            SqlDataAdapter ObjSqlDataAdapter = new SqlDataAdapter();
            ObjSqlDataAdapter.InsertCommand = ObjSqlCommand;

            ObjSqlDataAdapter.Update(ObjDataSet.Tables[0]);
        }
    }
}