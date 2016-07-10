using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ExameAbril.Business;

public partial class Controls_CloseCart : System.Web.UI.Page
{
    protected User u;
    private float? price = 0;
    protected void Page_PreInit(object sender, EventArgs e)
    {
        u = ExameAbril.Business.User.GetAutenticate();
        if (u != null) Page.Theme = u.Theme.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (u == null)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "expr", "<script>alert('Sessão expirou');top.window.location.reload();</script>");
            return;
        }

        if (!IsPostBack)
        {
            dtlProducts.DataSource = u.Carts;
            dtlProducts.DataBind();
        }

        if (dtlProducts.Items.Count < 1)
        {
            lblSItens.Visible = true;
            Response.Redirect("SearchProducts.aspx");
        }
        else lblSItens.Visible = false;
    }
    protected void dtlProducts_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lblDescription = (Label)e.Item.FindControl("lblDescription");
        Label lblCategory = (Label)e.Item.FindControl("lblCategory");
        Label lblPrice = (Label)e.Item.FindControl("lblPrice");

        Product p = ((Cart)(e.Item.DataItem)).Product;

        lblDescription.Text = p.Description;
        lblCategory.Text = "Categoria: "+ p.Category.ToString();
        lblPrice.Text = string.Format("{0:R$ #,###.00}", p.Price);

        price += p.Price;
        lblTotalValue.Text = string.Format("{0:R$ #,###.00}", price);
        lblTotalValue2.Text = lblTotalValue.Text;
    }
    protected void btnFechar_Click(object sender, EventArgs e)
    {
        //Rotina de fechamento
    }
    protected void btnFechar2_Click(object sender, EventArgs e)
    {
        //Rotina de fechamento
    }
}
