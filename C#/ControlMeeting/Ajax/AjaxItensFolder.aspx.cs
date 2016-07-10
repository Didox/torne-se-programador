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
using Business;

namespace ControlMeeting.Ajax
{
	public class AjaxItensFolder : System.Web.UI.Page
	{
		private Business.BsUser usr;

		#region " Page Load "
		private void Page_Load(object sender, System.EventArgs e)
		{
			if( ! Business.BsUser.UserOn() ) return;
			else usr = Business.BsUser.GetUserOn();

			int idFolder = Convert.ToInt32( "0" + Request["idFolder"] );
			if( Request["removeFormId"] != null )
				removeFormFolder( 
					new BsFolder(idFolder,"",0,null,null,
					new BsForm(Convert.ToInt32( "0" + Request["removeFormId"] )), null, null )
					);
			else if( Request["idFormDrag"] != null )
				alterFormLocation( new BsForm(Convert.ToInt32("0"+Request["idFormDrag"]), "" , new BsFolder(Convert.ToInt32("0"+Request["idFolderAnt"])), null, null, false )
					, new BsFolder(idFolder)  );
			else
				getItensFolder( new BsFolder( idFolder ) );
		}

		#endregion

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

		#region " Events "

		private void alterFormLocation( BsForm f, BsFolder fNew )
		{
			f.AlterFormLocation( fNew );
			createPageXML();

			Response.Write( "<return>" );
			Response.Write( "1" );
			Response.Write( "</return>" );

			closePageXML();
		}
		
		private void removeFormFolder( BsFolder f )
		{
			f.RemoveFormFolder();
			createPageXML();

			Response.Write( "<return>" );
			Response.Write( "1" );
			Response.Write( "</return>" );

			closePageXML();
		}

		private void getItensFolder( BsFolder f ) 
		{	
			Business.BsForms fs = new BsForm( f ).GetObjects();
			createPageXML();

			for( int i=0; i<fs.Count; i++ )
			{
				Response.Write( "<idItem>" );
				Response.Write( fs[i].Id + "" );
				Response.Write( "</idItem>" );

				Response.Write( "<idUser>" );
				Response.Write( fs[i].User.Id + "" );
				Response.Write( "</idUser>" );

				Response.Write( "<description>" );
				Response.Write( Server.HtmlEncode( fs[i].Name ) );
				Response.Write( "</description>" );
				
				Response.Write( "<idFolder>" );
				Response.Write( f.Id );
				Response.Write( "</idFolder>" );
			}
			
			closePageXML();
		}
		
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

		#endregion
	}
}
