using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DidoxComponents
{
	[ToolboxData("<{0}:MyWebResource runat=server></{0}:MyWebResource>")]
	public class MyWebResource : System.Web.UI.WebControls.TextBox
	{
		protected override void RenderContents(HtmlTextWriter output)
		{
			output.Write(Text);
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			this.Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "Test", Page.ClientScript.GetWebResourceUrl(this.GetType(), "DidoxComponents.MyResources.Test.js"));
            string csslink = "<link rel='stylesheet' type='text/css' href='" + Page.ClientScript.GetWebResourceUrl(this.GetType(), "DidoxComponents.MyResources.Test.css") + "' />";
			LiteralControl include = new LiteralControl(csslink);
			this.Page.Header.Controls.Add(include);
		}
	}
}
