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

public partial class Control : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [System.ComponentModel.Category("Minha categoria")] //  deixa a informação em uma categoria que eu defini
    [System.ComponentModel.Browsable(false)] // não aparece nas propriedades
    public string TLabel1
    {
        get { return Label1.Text; }
        set { Label1.Text = value; }
    }

    [System.ComponentModel.Category("Minha categoria")]
    public string TLabel2
    {
        get { return Label2.Text; }
        set { Label2.Text = value; }
    }
}
