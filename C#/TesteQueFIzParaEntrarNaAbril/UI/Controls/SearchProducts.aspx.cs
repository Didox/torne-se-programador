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

public partial class Controls_SearchProducts : System.Web.UI.Page
{
    protected User u;
    protected void Page_PreInit(object sender, EventArgs e)
    {
        u = ExameAbril.Business.User.GetAutenticate();
        if (u != null) Page.Theme = u.Theme.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pBusca.Visible = (Request["productDetId"] == null);
            pDetalhe.Visible = !pBusca.Visible;

            if (Request["productDetId"] != null)
            {
                pBusca.Visible = false;
                pDetalhe.Visible = true;
                getDetalhe(new Product(Convert.ToInt32(Request["productDetId"]), true));
            }
        }

        lblSitens.Visible = (dtlProducts.Items.Count < 1);
    }

    private void getDetalhe(Product p)
    {
        p.Get();
        lblDescription.Text = p.Description;
        lblCategory.Text = "Categoria: " + p.Category.ToString();
        lblTextPrice.Text = "Valor Promoção:";
        lblPrice.Text = string.Format("{0:R$ #,###.00}", p.Price);
        if (u == null)
        {
            btnComprar.Value = "Compras somente para usuários cadastrados";
            btnComprar.Attributes.Add("onclick", "top.Valida()");
        }
        else
        {
            bool itemExists = false;
            foreach (Cart c in u.Carts)
            {
                if (c.Product.ProductId == p.ProductId)
                {
                    itemExists = true;
                    break;
                }
            }
            if (!itemExists)
                btnComprar.Attributes.Add("onclick", "top.AddCart(" + u.UserId + "," + p.ProductId + ")");
            else
            {
                btnComprar.Value = "Produto já foi adicionado";
                btnComprar.Disabled = true;
            }
        }
    }
}
