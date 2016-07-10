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

public partial class WebControls_menu : System.Web.UI.UserControl
{
    private float? price = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        User u = User.GetAutenticate();
        if (u != null)
        {
            pUserLogado.Visible = true;
            lblUser.Text = u.Name;
            repCart.DataSource = u.Carts;
            repCart.DataBind();
        }

        if (repCart.Items.Count < 1)
        {
            btnFechar.Style.Add("display", "none");
            dvItens.Style.Add("display", "block");
        }
        else
        {
            dvItens.Style.Add("display", "none");
            btnFechar.Style.Add("display", "block");
        }

        pLogin.Visible = !pUserLogado.Visible;
    }

    protected void btnLogoff_Click(object sender, EventArgs e)
    {
        User.Logoff();
        Response.Redirect("~/");
    }
    protected void btnLog_Click(object sender, EventArgs e)
    {
        User u = new User(null, txtUser.Text, null,null, true);
        u.Autenticate();
        if (u != null && u.UserId != null) Response.Redirect("~/");
        else Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "err", "<script>alert(\"Usuário não cadastrado\")</script>");
    }
    protected void repCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label lblDescription = (Label)e.Item.FindControl("lblDescription");
        Label lblPrice = (Label)e.Item.FindControl("lblPrice");
        HtmlAnchor likDel = (HtmlAnchor)e.Item.FindControl("likDel");
        Product p = ((Cart)(e.Item.DataItem)).Product;

        likDel.Attributes.Add("onclick", "DelCard(" + ((Cart)(e.Item.DataItem)).CartId + ")");
        lblDescription.Text = p.Description;
        lblPrice.Text = string.Format("{0:R$ #,###.00}", p.Price);
        price += p.Price;
        lblPriceTotal.Text = string.Format("{0:R$ #,###.00}", price);
        lblValueT.Visible = true;
        lblPriceTotal.Visible = true;
    }
}
