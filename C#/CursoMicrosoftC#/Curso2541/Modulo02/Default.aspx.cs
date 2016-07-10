using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cmdGravar_Click(object sender, EventArgs e)
    {
        lblId.Text = "0";
        int x = new BsCliente(Convert.ToInt32("0"+lblId.Text), txtNome.Text).Gravar();
        if (x > 0)
        {
            lblMensagem.Text = "Gravado com sucesso !!";
            lblId.Text = x + "";
        }
        else lblMensagem.Text = "Erro ao gravar !!";

        gvClientesOffLine.DataSource = new BsCliente().GetClientesOffLine();
        gvClientesOffLine.DataBind();
   }
    protected void Button1_Click(object sender, EventArgs e)
    {
        /*gvClientesOffLine.DataSource = new BsCliente().GetClientes();
        gvClientesOffLine.DataBind();*/

        BsClientes cs = new BsCliente().GetClientes();
        foreach (BsCliente c in cs)
        {
            lblClientes.Text += "<BR>Id: " + c.Id;
            lblClientes.Text += "<BR>Nome: " + c.Nome;
        }
    }
    protected void btnRetClientes_Click(object sender, EventArgs e)
    {
        gvClientesOffLine.DataSource = new BsCliente().GetClientesOffLine();
        gvClientesOffLine.DataBind();
    }
}
