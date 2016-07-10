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

public partial class Controls_User : System.Web.UI.Page
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
            getUser(); 
    }

    private void getUser()
    {
        if (u != null)
        {
            txtDescription.Text = u.Description;
            txtName.Text = u.Name;
            ddlTheme.SelectedValue = u.Theme.ToString();
            lblTitle.Text = "Alteração de usuário";
        }
    }

    protected void btnGravar_Click(object sender, EventArgs e)
    {
        bool userLogin = true;
        if (u == null)
        {
            userLogin = false;
            u = new ExameAbril.Business.User();
        }

        using (ExameAbril.Business.User ux = new ExameAbril.Business.User(null, txtName.Text, null, null, true))
        {
            ux.Get();
            if (ux.UserId != null && ux.UserId != u.UserId)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "err", "<script>alert(\"Nome de usuário existente digite outro\")</script>");
                return;
            }
        }

        u.Description = txtDescription.Text;
        Themes t = (Themes)Enum.Parse(typeof(Themes), ddlTheme.SelectedValue);
        bool refresh = (u.Theme != t && userLogin);
        u.Theme = t;
        u.Name = txtName.Text;
        if (userLogin) u.Save(true);
        else u.Save();

        ClientScript.RegisterClientScriptBlock(this.GetType(), "ok", "<script>alert(\"Operação efetuada com sucesso\");</script>");
        if (refresh) ClientScript.RegisterClientScriptBlock(this.GetType(), "ok2", "<script>top.window.location.reload();</script>");
        else ClientScript.RegisterClientScriptBlock(this.GetType(), "ok2", "<script>new top.Document().CloseLayerAlpha();</script>");        
    }
}
