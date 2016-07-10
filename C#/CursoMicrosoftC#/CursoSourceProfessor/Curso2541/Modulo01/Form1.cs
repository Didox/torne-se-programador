using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.IO;

namespace Modulo01
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private SqlConnection ObjSqlConnection;
        private ConnectionStringSettings ObjConnectionStringSettings;

        private void Cmd_Conectar_Click(object sender, EventArgs e)
        {
            ObjConnectionStringSettings = ConfigurationManager.ConnectionStrings["Aw"];
            ObjSqlConnection = new SqlConnection(ObjConnectionStringSettings.ConnectionString);
            ObjSqlConnection.StateChange += new StateChangeEventHandler(Log);

            try
            {
                ObjSqlConnection.Open();

                Lbl_Mensagem.Text = "Connection String:" + ObjSqlConnection.ConnectionString;
                Lbl_Mensagem.Text += "\r\nDataBase:" + ObjSqlConnection.Database;
                Lbl_Mensagem.Text += "\r\nTamanho do pacote:" + ObjSqlConnection.PacketSize;
                Lbl_Mensagem.Text += "\r\nVersão do servidor:" + ObjSqlConnection.ServerVersion;
                Lbl_Mensagem.Text += "\r\nEstado da conexão:" + ObjSqlConnection.State;
            }
            catch (SqlException ex)
            {
                foreach (SqlError Erro in ex.Errors)
                {
                    Lbl_Mensagem.Text += "\r\nNº: " + Erro.Number;
                    Lbl_Mensagem.Text += "\r\nMensagem: " + Erro.Message;
                    Lbl_Mensagem.Text += "\r\nCategoria: " + Erro.Class;
                }
            }
        }

        private void Cmd_Desconectar_Click(object sender, EventArgs e)
        {
            try
            {
                ObjSqlConnection.Close();

                Lbl_Mensagem.Text = "Estado da conexão:" + ObjSqlConnection.State;

            }
            catch (SqlException ex)
            {
                foreach (SqlError Erro in ex.Errors)
                {
                    Lbl_Mensagem.Text += "\r\nNº: " + Erro.Number;
                    Lbl_Mensagem.Text += "\r\nMensagem: " + Erro.Message;
                    Lbl_Mensagem.Text += "\r\nCategoria: " + Erro.Class;
                }
            }
        }

        private void Log(object sender, StateChangeEventArgs e)
        {
            StreamWriter ObjStreamWriter = new StreamWriter(
                Application.StartupPath + @"\log.txt", true);

            ObjStreamWriter.WriteLine(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") +
                " - " + e.CurrentState);

            ObjStreamWriter.Close();
        }
    }
}