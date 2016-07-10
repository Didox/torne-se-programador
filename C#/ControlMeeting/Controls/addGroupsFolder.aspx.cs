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

namespace ControlMeeting.Controls
{
	public class addGroupsFolder : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.ListBox lstIGroups;
		protected System.Web.UI.WebControls.Button btnSaveGroups;
		protected System.Web.UI.HtmlControls.HtmlSelect lstIAddGroups;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend4;
		private Business.BsUser usr;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			if( ! Business.BsUser.UserOn() )
			{
				Response.Write( "<script>alert( 'Sua sessão expirou!' );top.login();</script>" );
				Response.End();	
			}
			else usr = Business.BsUser.GetUserOn();

			if( ! IsPostBack )
				getConfig( Convert.ToInt32( Request["idFolder"] ) );
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
			this.btnSaveGroups.Click += new System.EventHandler(this.btnSaveGroups_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
		
		private void getConfig( int folderId )
		{						
			setComboGroups();
			Business.BsGroup gp = new Business.BsGroup();
			gp.Folders.Add( folderId, new Business.BsFolder(folderId) );
			Business.BsGroups gps = gp.GetObjectsByFolders();

			lstIAddGroups.Items.Clear();
			for( int i=0; i<gps.Count; i++ )
			{
				ListItem l = new ListItem( gps[i].Description, gps[i].Id + "" );
				lstIAddGroups.Items.Add( l );
				lstIGroups.Items.Remove( l );
			}
		}

		private void setComboGroups()
		{
			Business.BsGroup g = new Business.BsGroup();
			Business.BsGroups gps = g.GetObjects();			
			for( int i=0; i<gps.Count; i++ )
				lstIGroups.Items.Add( new ListItem( gps[i].Description, gps[i].Id + "" ) );	
		}

		private void saveGroups( int folderId )
		{
			Business.BsGroups gps = new Business.BsGroups();
			int x = lstIGroups.Items.Count;
			string retn = "";
			if( Request[ "lstIAddGroups" ] != null ) retn = Request[ "lstIAddGroups" ].ToString();
			string [] list = retn.Split( new char[]{','} );
			lstIAddGroups.Items.Clear();

			for( int i=0; i<list.Length; i++ )
			{
				if( list[i] != "" )
				{
					Business.BsGroup ps = new Business.BsGroup();
					ps.Id = Convert.ToInt32( list[i] );
					ps.GetObject();				
					gps.Add( ps.Id, ps );
					lstIAddGroups.Items.Add( new ListItem( ps.Description, ps.Id + "" ) );
				}
			}

			Business.BsFolder f = new Business.BsFolder();
			f.Id = folderId;
			f.Group.AddGroupsByFolder( gps, f );
			RegisterClientScriptBlock( "ok1", "<script>top.closeLayerAlpha()</script>" );
		}

		private void btnSaveGroups_Click(object sender, System.EventArgs e)
		{
			saveGroups( Convert.ToInt32( Request["idFolder"] ) );
		}
	}
}
