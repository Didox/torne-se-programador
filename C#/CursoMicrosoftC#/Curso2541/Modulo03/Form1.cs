using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;
using System.Transactions;
using System.IO;

namespace Modulo03
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private SqlConnection _cn;
        private SqlCommand _cm;
        private SqlTransaction _tr;

        private void btnTransaction_Click(object sender, EventArgs e)
        {
            try
            {
                _cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
                _cn.Open();
                _tr = _cn.BeginTransaction();               

                _cm = new SqlCommand("P_DebitaCorrente", _cn, _tr);
                _cm.CommandType = CommandType.StoredProcedure;
                _cm.Parameters.AddWithValue("@conta",1 );
                _cm.Parameters.AddWithValue("@valor", 10M );                
                _cm.ExecuteNonQuery();

                _cm.CommandText = "P_CreditaPoupanca";
                _cm.Parameters["@conta"].Value = 1;

                _cm.ExecuteNonQuery();

                _tr.Commit();

                lblMensagem.Text = "Debito realizado com sucesso, data: " + DateTime.Now.ToString( "dd/MM/yyyy HH:mm:ss" );
            }
            catch (SqlException sqlErr)
            {
                lblMensagem.Text = "SQL Error: \n";
                foreach (SqlError err in sqlErr.Errors)
                    lblMensagem.Text += err.Message + "\n";

                _tr.Rollback();
            }
            catch (Exception err)
            {
                lblMensagem.Text = "Error Application: " + err.Message;
                _tr.Rollback();
            }
            finally
            {
                _cn.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                _cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
                _cn.Open();
                _tr = _cn.BeginTransaction();
                
                _cm = new SqlCommand("P_CreditaCorrente", _cn, _tr);
                _cm.CommandType = CommandType.StoredProcedure;
                _cm.Parameters.AddWithValue("@conta", 1);
                _cm.Parameters.AddWithValue("@valor", 10M);
                _cm.ExecuteNonQuery();

                _cm.CommandText = "P_DebitaPoupanca";
                _cm.Parameters["@conta"].Value = 1;

                _cm.ExecuteNonQuery();

                _tr.Commit();

                lblMensagem.Text = "Credito realizado com sucesso, data: " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
            }
            catch (SqlException sqlErr)
            {
                lblMensagem.Text = "SQL Error: \n";
                foreach (SqlError err in sqlErr.Errors)
                    lblMensagem.Text += err.Message + "\n";

                _tr.Rollback();
            }
            catch (Exception err)
            {
                lblMensagem.Text = "Error Application: " + err.Message;
                _tr.Rollback();
            }
            finally
            {
                _cn.Close();
            }
        }

        private void createFile(string message)
        {
            StreamWriter sr = new StreamWriter(Application.StartupPath + @"\log.txt", true);
            sr.WriteLine(message);
            sr.Dispose();
        }

        private void btnDistribuida_Click(object sender, EventArgs e)
        {
            using (TransactionScope trScope = new TransactionScope()) // dando rolback no log
            //using (TransactionScope trScope = new TransactionScope(TransactionScopeOption.Suppress))// sem dar rolback no log, executa a rotina que grava um txt e da rolback no banco
            {
                SqlConnection cn = null;
                SqlConnection cn2 = null;           
                try
                {
                    cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
                    cn.Open();
                    SqlCommand cm = new SqlCommand("P_DebitaCorrente", cn);
                    cm.CommandType = CommandType.StoredProcedure;
                    cm.Parameters.AddWithValue("@conta", 1);
                    cm.Parameters.AddWithValue("@valor", 10M);
                    cm.ExecuteNonQuery();

                    cn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn2"].ConnectionString);
                    cn2.Open();
                    SqlCommand cm2 = new SqlCommand("P_DebitaCorrente", cn2);
                    cm2.CommandType = CommandType.StoredProcedure;
                    cm2.Parameters.AddWithValue("@conta", 1);
                    cm2.Parameters.AddWithValue("@valor", 10M);
                    cm2.ExecuteNonQuery();

                    lblMensagem.Text = "Debito realizado com sucesso, data: " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");

                    trScope.Complete();
                }
                catch (SqlException sqlErr)
                {
                    lblMensagem.Text = "SQL Error: \n";
                    foreach (SqlError err in sqlErr.Errors)
                        lblMensagem.Text += err.Message + "\n";
                    createFile(lblMensagem.Text);
                }
                catch (Exception err)
                {
                    lblMensagem.Text = "Error Application: " + err.Message;
                    createFile(lblMensagem.Text);
                }
                finally
                {
                    if (cn.State == ConnectionState.Open) cn.Close();
                    if (cn.State == ConnectionState.Open) cn2.Close();
                }
            }
        }
    }
}