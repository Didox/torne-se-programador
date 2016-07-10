using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ExameAbril.Business;

public partial class _Default : System.Web.UI.Page 
{
    protected User u;
    protected void Page_PreInit(object sender, EventArgs e)
    {
        u = ExameAbril.Business.User.GetAutenticate();
        if (u != null) Page.Theme = u.Theme.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }
}
