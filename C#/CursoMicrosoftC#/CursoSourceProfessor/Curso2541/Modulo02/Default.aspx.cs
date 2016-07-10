using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    private SqlConnection ObjSqlConnection;
    private SqlCommand ObjSqlCommand;
    private ConnectionStringSettings ObjConnectionStringSettings;

    protected void Cmd_Gravar_Click(object sender, EventArgs e)
    {
        ObjConnectionStringSettings = ConfigurationManager.ConnectionStrings["Curso2541"];
        ObjSqlConnection = new SqlConnection(ObjConnectionStringSettings.ConnectionString);

        ObjSqlCommand = new SqlCommand();
        ObjSqlCommand.Connection = ObjSqlConnection;
        ObjSqlCommand.CommandType = CommandType.StoredProcedure;
        ObjSqlCommand.CommandText = "P_GravaCliente";

        ObjSqlCommand.Parameters.Add(new SqlParameter("@Id",SqlDbType.Int));
        ObjSqlCommand.Parameters.Add(new SqlParameter("@Nome",SqlDbType.VarChar,50));

        ObjSqlCommand.Parameters["@Id"].Direction = ParameterDirection.Output;
        ObjSqlCommand.Parameters["@Nome"].Value = Txt_Nome.Text;

        try
        {
            ObjSqlConnection.Open();
            ObjSqlCommand.ExecuteNonQuery();

            Lbl_Id.Text = ObjSqlCommand.Parameters["@Id"].Value.ToString();

            ObjSqlCommand.Parameters.Clear();
            ObjSqlCommand.CommandType = CommandType.Text;
            ObjSqlCommand.CommandText = "Select * From Tb_Clientes";

            SqlDataAdapter ObjSqlDataAdapter = new SqlDataAdapter();
            ObjSqlDataAdapter.SelectCommand = ObjSqlCommand;

            DataSet ObjDataSet = new DataSet();
            ObjSqlDataAdapter.Fill(ObjDataSet);

            Dtg_Clientes.DataSource = ObjDataSet;
            Dtg_Clientes.DataBind();
            
            Lbl_Mensagem.Text = "Cliente gravado com sucesso";
        }
        catch (Exception ex)
        {
            Lbl_Mensagem.Text = ex.ToString();
        }
        finally
        {
            if(ObjSqlConnection.State == ConnectionState.Open)
            {
                ObjSqlConnection.Close();  
            }
        }
    }
}
