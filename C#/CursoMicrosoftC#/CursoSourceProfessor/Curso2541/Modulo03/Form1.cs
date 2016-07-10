using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Configuration;
using System.Windows.Forms;
using System.Transactions;

namespace Modulo03
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private SqlConnection ObjSqlConnection;
        private ConnectionStringSettings ObjConnectionStringSettings;
        private SqlTransaction ObjSqlTransaction;

        private void Cmd_TransacaoLocal_Click(object sender, EventArgs e)
        {
            ObjConnectionStringSettings = ConfigurationManager.ConnectionStrings["Curso2541"];
            ObjSqlConnection = new SqlConnection(ObjConnectionStringSettings.ConnectionString);

            try
            {
                ObjSqlConnection.Open();
                ObjSqlTransaction = ObjSqlConnection.BeginTransaction();

                SqlCommand CmDebito = new SqlCommand();
                CmDebito.Connection = ObjSqlConnection;
                CmDebito.CommandType = CommandType.StoredProcedure;
                CmDebito.CommandText = "P_DebitaContaCorrente";
                CmDebito.Transaction = ObjSqlTransaction;

                CmDebito.Parameters.Add(new SqlParameter("@Conta",SqlDbType.Int));
                CmDebito.Parameters.Add(new SqlParameter("@Valor",SqlDbType.Money));

                CmDebito.Parameters["@Conta"].Value = 2;
                CmDebito.Parameters["@Valor"].Value = 10M;

                CmDebito.ExecuteNonQuery();

                SqlCommand CmCredito = new SqlCommand();
                CmCredito.Connection = ObjSqlConnection;
                CmCredito.CommandType = CommandType.StoredProcedure;
                CmCredito.CommandText = "P_CreditoPoupanca";
                CmCredito.Transaction = ObjSqlTransaction;

                CmCredito.Parameters.Add(new SqlParameter("@Conta", SqlDbType.Int));
                CmCredito.Parameters.Add(new SqlParameter("@Valor", SqlDbType.Money));

                CmCredito.Parameters["@Conta"].Value = 1;
                CmCredito.Parameters["@Valor"].Value = 10M;

                CmCredito.ExecuteNonQuery();

                ObjSqlTransaction.Commit();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());

                ObjSqlTransaction.Rollback();
            }
        }

        private void Cmd_TransacaoDistribuida_Click(object sender, EventArgs e)
        {
            ConnectionStringSettings ObjStringCnCurso2541 = ConfigurationManager.ConnectionStrings["Curso2541"];
            ConnectionStringSettings ObjStringCnCurso2541B = ConfigurationManager.ConnectionStrings["Curso2541B"];
            
            SqlConnection ObjCnCurso2541 = new SqlConnection(ObjStringCnCurso2541.ConnectionString);
            SqlConnection ObjCnCurso2541B = new SqlConnection(ObjStringCnCurso2541B.ConnectionString);

            using (TransactionScope ObjTransactionScope = new TransactionScope())
            {
                try
                {
                    ObjCnCurso2541.Open();

                    SqlCommand CmDebito = new SqlCommand();
                    CmDebito.Connection = ObjCnCurso2541;
                    CmDebito.CommandType = CommandType.StoredProcedure;
                    CmDebito.CommandText = "P_DebitaContaCorrente";

                    CmDebito.Parameters.Add(new SqlParameter("@Conta", SqlDbType.Int));
                    CmDebito.Parameters.Add(new SqlParameter("@Valor", SqlDbType.Money));

                    CmDebito.Parameters["@Conta"].Value = 2;
                    CmDebito.Parameters["@Valor"].Value = 10M;

                    CmDebito.ExecuteNonQuery();

                    ObjCnCurso2541B.Open();

                    SqlCommand CmCredito = new SqlCommand();
                    CmCredito.Connection = ObjCnCurso2541B;
                    CmCredito.CommandType = CommandType.StoredProcedure;
                    CmCredito.CommandText = "P_CreditoPoupanca";

                    CmCredito.Parameters.Add(new SqlParameter("@Conta", SqlDbType.Int));
                    CmCredito.Parameters.Add(new SqlParameter("@Valor", SqlDbType.Money));

                    CmCredito.Parameters["@Conta"].Value = 1;
                    CmCredito.Parameters["@Valor"].Value = 10M;

                    CmCredito.ExecuteNonQuery();

                    ObjTransactionScope.Complete();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
                finally
                {
                    if (ObjCnCurso2541.State == ConnectionState.Open)
                    {
                        ObjCnCurso2541.Close();
                    }
                    if (ObjCnCurso2541B.State == ConnectionState.Open)
                    {
                        ObjCnCurso2541B.Close();
                    }
                }
            }
        }
    }
}