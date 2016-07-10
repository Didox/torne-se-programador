using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
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

        private SqlConnection cn;

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void cmdConectar_Click(object sender, EventArgs e)
        {
            try
            {
                cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
                cn.StateChange += new StateChangeEventHandler(cn_StateChange);
                cn.InfoMessage += new SqlInfoMessageEventHandler(cn_InfoMessage);                
                cn.Open();
                lblMensagem.Text = "Conectado \n";
                lblMensagem.Text += "Database: " + cn.Database + "\n";
                lblMensagem.Text += "Connection Timeout: " + cn.ConnectionTimeout + "\n";
                lblMensagem.Text += "Connection String: '" + cn.ConnectionString + "'\n";
                lblMensagem.Text += "State: " + cn.State + "\n";
                lblMensagem.Text += "WorkstationId: " + cn.WorkstationId + "\n";
                lblMensagem.Text += "Server Version: " + cn.ServerVersion + "\n";                
            }
            catch (SqlException sqlErr)
            {
                lblMensagem.Text = "SQL Error: \n";
                foreach(SqlError err in sqlErr.Errors)
                    lblMensagem.Text += err.Message + "\n";
            }
            catch (Exception err)
            {
                lblMensagem.Text = "Error Application: " + err.Message;
            }
        }

        private void cn_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            foreach (SqlError error in e.Errors)
            {
                createFile("Message: " + error.Message);
                createFile("Number: " + error.Number);
                createFile("Class: " + error.Class);
                createFile("Server: " + error.Server);
                createFile("Connection State: " + cn.State);
                createFile("Date: " + DateTime.Now);
            }
        }

        private void cn_StateChange(object sender, StateChangeEventArgs e)
        {
            createFile("Data: " + DateTime.Now.ToString( "dd/MM/yyyy HH:mm:ss" ));
            createFile("State: " + e.CurrentState.ToString());
        }

        private void createFile( string message )
        {
            //StreamWriter sr = new StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "file.txt",true);
            StreamWriter sr = new StreamWriter(Application.StartupPath + @"\file.txt", true);
            sr.WriteLine(message);
            sr.Dispose();
        }

        private void cmdDesconectar_Click(object sender, EventArgs e)
        {
            desconectar();
        }

        private void desconectar()
        {
            try
            {
                cn.Close();
                lblMensagem.Text = "Desconectado" + "\n";
                lblMensagem.Text += "State: " + cn.State + "\n";
            }
            catch (SqlException sqlErr)
            {
                lblMensagem.Text = "SQL Error: " + sqlErr.Message;
            }
            catch (Exception err)
            {
                lblMensagem.Text = "Error Application: " + err.Message;
            }
        }

        private void cmdSair_Click(object sender, EventArgs e)
        {
           Application.Exit();
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            desconectar();
        }
    }
}