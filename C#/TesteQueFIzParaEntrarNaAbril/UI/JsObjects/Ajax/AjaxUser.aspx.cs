using System;
using ExameAbril.Business;

public partial class Ajax_AjaxUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User user = new User();
        if (Request["UserId"] != null) user.UserId = Convert.ToInt64(Request["UserId"]);
        if (Request["Name"] != null) user.Name = Request["Name"].ToString();
        if (Request["Description"] != null) user.Description = Request["Description"].ToString();
        if (Request["Theme"] != null) user.Theme = (Themes)Enum.Parse(typeof(Themes), Request["Theme"].ToString());

        if (Request["Get"] != null)
            GetUsers(user);
        else if (Request["Save"] != null)
            SaveUsers(user);
        else if (Request["Del"] != null)
            DelUser(user);
    }

    private void DelUser(User user_)
    {
        createPageXML();
        Response.Write("<return>");

        try
        {
            user_.Delete();
            Response.Write("1");
        }
        catch { Response.Write("0"); }

        Response.Write("</return>");
        closePageXML();
    }

    private void SaveUsers(User user_)
    {
        createPageXML();
        Response.Write("<return>");

        try
        {
            user_.Save();
            Response.Write(user_.UserId.ToString());
        }
        catch { Response.Write("0"); }

        Response.Write("</return>");
        closePageXML();
    }

    private void GetUsers(User user_)
    {
        createPageXML();
        foreach (User u in ExameAbril.Business.User.GetByParameters(user_))
        {
            Response.Write("<UserId>");
            Response.Write(u.UserId.ToString());
            Response.Write("</UserId>");

            Response.Write("<Name>");
            Response.Write(u.Name);
            Response.Write("</Name>");

            Response.Write("<Description>");
            Response.Write(u.Description);
            Response.Write("</Description>");

            Response.Write("<Theme>");
            Response.Write(u.Theme.ToString());
            Response.Write("<Theme>");
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
