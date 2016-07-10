using System;
using ExameAbril.Business;

public partial class Ajax_AjaxCart : System.Web.UI.Page
{
    protected ExameAbril.Business.User u;
    protected void Page_Load(object sender, EventArgs e)
    {
        u = ExameAbril.Business.User.GetAutenticate();

        Cart cart = new Cart();
        if (Request["CartId"] != null && Request["CartId"] != "null") 
            cart.CartId = Convert.ToInt64(Request["CartId"]);
        if (Request["ProductId"] != null && Request["ProductId"] != "null" && Request["ProductId"] != "undefined") 
            cart.Product.ProductId = Convert.ToInt32(Request["ProductId"]);
        if (Request["UserId"] != null && Request["UserId"] != "null" && Request["UserId"] != "undefined")
            cart.User.UserId = Convert.ToInt64(Request["UserId"]);
        else if (u != null)
            cart.User = u;

        if (Request["Get"] != null)
            GetCarts(cart);
        else if (Request["Save"] != null)
            SaveCarts(cart);
        else if (Request["Del"] != null)
            DelCart(cart);
    }

    private void DelCart(Cart cart)
    {
        createPageXML();
        Response.Write("<return>");

        float? price = 0;                          
        try
        {
            cart.Delete();
            if (u != null)
            {
                foreach (Cart c in u.Carts)
                {
                    if (c.CartId == cart.CartId)
                    {
                        u.Carts.Remove(c);
                        break;
                    }
                }

                foreach (Cart c in u.Carts) price += c.Product.Price;
            }
            u.SaveSession();
            Response.Write("1");
        }
        catch { Response.Write("0"); }

        Response.Write("</return>");

        Response.Write("<priceTotal>");
        Response.Write(string.Format("{0:R$ #,###.00}", price));
        Response.Write("</priceTotal>");

        closePageXML();
    }

    private void SaveCarts(Cart cart)
    {
        createPageXML();
        Response.Write("<return>");

        try
        {
            cart.Save();
            string ret = "";
            u.Carts = null;
            float? price = 0;
            foreach (Cart c in u.Carts)
            {
                ret += "<table width=\"100%\" height=\"50\" border=\"1\" class=\"carrinho\" bordercolor=\"#ffffff\">";
                ret += "    <tr>";
                ret += "        <td height=\"10\" width=\"10\">";
                ret += "            <img src=\"Images/product.jpg\" style=\"height:17px;width:30px;border-width:0px;\" />";
                ret += "        </td>";
                ret += "        <td>";
                ret += "            <span class=\"desProdM\">" + c.Product.Description + "</span><br />";
                ret += "            <span class=\"desProdM\">Preço: </span>";
                ret += "            <span class=\"desPriceM\">" + string.Format("{0:R$ #,###.00}", c.Product.Price) + "</span><br />";
                ret += "            <a href=\"javascript:void(0)\" onclick=\"DelCard(" + c.CartId + ")\">";
                ret += "                <img border=\"0\" id=\"imgD\" src=\"images/del.gif\" />";
                ret += "                Retirar</a>";
                ret += "        </td>";
                ret += "    </tr>";
                ret += "</table>";
                price += c.Product.Price;
            }

            ret += "<nobr><div id=\"dvPrice\" class=\"desProdM12\" align=\"center\" >Valor Total: <div class=\"desPriceM12\" id=\"ctl00_cphMenu_Menu1_lblPriceTotal\">" + 
                string.Format("{0:R$ #,###.00}", price) + "</div></div></nobr>";

            u.SaveSession();
            Response.Write(Server.HtmlEncode(ret));
        }
        catch { Response.Write("Erro ao salvar"); }

        Response.Write("</return>");
        closePageXML();
    }

    private void GetCarts(Cart cart)
    {
        createPageXML();
        foreach (Cart c in Cart.GetByParameters(cart))
        {
            Response.Write("<CartId>");
            Response.Write(c.CartId.ToString());
            Response.Write("</CartId>");

            Response.Write("<ProductId>");
            Response.Write(c.Product.ProductId.ToString());
            Response.Write("</ProductId>");

            Response.Write("<UserId>");
            Response.Write(c.User.UserId.ToString());
            Response.Write("<UserId>");
        }
        closePageXML();
    }

    private void createPageXML()
    {
        Response.Cache.SetMaxAge(new TimeSpan(0));
        Response.Buffer = false;
        Response.ContentType = "text/xml";
        Response.Write("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
        Response.Write("<root>");
    }

    private void closePageXML()
    {
        Response.Write("</root>");
        Response.End();
    }
}
