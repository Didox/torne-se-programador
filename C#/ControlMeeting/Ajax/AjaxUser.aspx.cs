using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace ControlMeeting.Ajax
{
	public class AjaxUser : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
            UserOn();
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void createPageXML()
		{
			Response.Cache.SetMaxAge( new TimeSpan(0) );
			Response.Buffer = false;
			Response.ContentType = "text/xml";
			Response.Write("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
			Response.Write( "<root>" );
		}

		private void closePageXML()
		{
			Response.Write( "</root>" );
			Response.End();
		}

		private void UserOn()
		{
			createPageXML();
			Response.Write( "<return>" );
			if( ! Business.BsUser.UserOn() ) Response.Write( "0" );
			else Response.Write( "1" );
			Response.Write( "</return>" );
			closePageXML();			
		}

		private void logoIn( string login, string senha )
		{
			//Business.BsUser.GetUserOn( idItemForm,idForm ); 

			createPageXML();
			Response.Write( "<return>" );
			Response.Write( "1" );
			Response.Write( "</return>" );
			closePageXML();			
		}
	}
}
