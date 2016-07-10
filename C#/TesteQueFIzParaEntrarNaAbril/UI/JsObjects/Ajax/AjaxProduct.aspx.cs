using System;
using ExameAbril.Business;

public partial class Ajax_AjaxProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Product product = new Product();
        if (Request["ProductId"] != null) product.ProductId = Convert.ToInt32(Request["ProductId"]);
        if (Request["Description"] != null) product.Description = Request["ProductId"].ToString();
        if (Request["Category"] != null) product.Category = (Category)Enum.Parse(typeof(Category), Request["ProductId"].ToString());
        if (Request["Price"] != null) product.Price = float.Parse(Request["Price"].ToString());

        if( Request["Get"] != null )
            GetProducts(product);
        else if (Request["Save"] != null)
            SaveProducts(product);
		else if( Request["Del"] != null  )
            DelProduct(product);
    }

    private void DelProduct(Product product_)
    {
        createPageXML();
        Response.Write("<return>");

        try
        {
            product_.Delete();
            Response.Write("1");
        }
        catch { Response.Write("0"); }
        
        Response.Write("</return>");
        closePageXML();
    }

    private void SaveProducts(Product product_)
    {
        createPageXML();
        Response.Write("<return>");

        try
        {
            product_.Save();
            Response.Write(product_.ProductId.ToString());
        }
        catch { Response.Write("0"); }

        Response.Write("</return>");
        closePageXML();
    }

    private void GetProducts(Product product_)
    {        
        createPageXML();
        foreach (Product p in Product.GetByParameters(product_))
        {
            Response.Write("<ProductId>");
            Response.Write(p.ProductId.ToString());
            Response.Write("</ProductId>");

            Response.Write("<Description>");
            Response.Write(p.Description);
            Response.Write("</Description>");

            Response.Write("<Category>");
            Response.Write(p.Category.ToString());
            Response.Write("</Category>");

            Response.Write("<Price>");
            Response.Write(p.Price.ToString());
            Response.Write("<Price>");
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
