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
using System.Collections.Generic;
using ExameAbril.Business;

public partial class Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<User> l = new List<User>();
        l.Add(new User(1, "danilo", "teste", Themes.Azul, true));
        l.Add(new User(1, "danilo1", "teste", Themes.Azul, true));
        l.Add(new User(1, "danilo2", "teste", Themes.Azul, true));
        l.Add(new User(1, "danilo3", "teste", Themes.Azul, true));
        l.Add(new User(1, "danilo4", "teste", Themes.Azul, true));
        l.Add(new User(1, "danilo5", "teste", Themes.Azul, true));

    }
}
