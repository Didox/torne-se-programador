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
	public class AjaxFolder : System.Web.UI.Page
	{
		private Business.BsUser usr;

		#region " Page Load "
        private void Page_Load(object sender, System.EventArgs e)
		{
			if( ! Business.BsUser.UserOn() ) return;
			else usr = Business.BsUser.GetUserOn();

			int idFolder = Convert.ToInt32( "0" + Request["idFolder"] );
			int idParent = Convert.ToInt32( "0" + Request["idParent"] );
			string name  = ( Request["name"] == null ? "" : Request["name"] );

			if( Request["alter"] != null )
				alterFolder( new BsFolder(idFolder), name );
			else if( Request["count"] != null  )
				countChildFolder( new BsFolder(idFolder) );
			else if( Request["delete"] != null  )
				deleteFolder( new BsFolder( idFolder, name, idParent, null,null,null,null,usr ) );
			else if( Request["addNew"] != null  )
				addFolder( new BsFolder( idFolder, name, idParent, null,null,null,null,usr  ) );
			else if( Request["idFolderNew"] != null  )
				alterLocationFolder( new BsFolder( Convert.ToInt32( Request["idFolderNew"] ) ), 
					new Business.BsFolder( Convert.ToInt32( Request["idFolderChild"] ) ) );
			else if( Request["root"] != null )
                reloadRoot();
			else ajaxGetFolders( new BsFolder( idFolder, name, idParent, null,null,null,null,usr  ) );
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

		private void reloadRoot()
		{
			Business.BsFolder f = new Business.BsFolder();
			f.IdParent = 0;
			Business.BsFolders fs;
			if( usr.Admin ) fs = f.GetObjects();
			else
			{
				f.Groups = usr.Groups;
				fs = f.GetObjectsByGroups();
			}

			string htm = "<TABLE WIDTH=\"100%\" id=\"tbFolders\" runat=\"server\" BORDER=\"0\" CELLSPACING=\"0\" CELLPADDING=\"0\">";
			
			for( int i=0; i<fs.Count; i++ )
			{
				int count = Business.BsFolder.CountChild( fs[i], usr.Groups );
				string events = "";
				string hand = "";
				string dir = "dirFechadoSemMais.gif";
				if( count > 0 )
				{
					events = "onclick=\"OpenDir(1)\"";
					hand = "style=\"cursor:hand\"";
					dir = "dirFechado.gif";
				}

				htm += "<tr><td>";			
				htm += "<TABLE WIDTH=\"100%\" BORDER=\"0\" CELLSPACING=\"0\" CELLPADDING=\"0\">";
				htm += "	<TR id=" + fs[i].Id + " >";	
				htm += "		<Td NoWrap >";
				htm += "			<TABLE BORDER=\"0\" CELLSPACING=\"2\" CELLPADDING=\"0\">";
				htm += "				<TR >";
				htm += "					<TD width=10 " + hand + events + " ><img border=0 onmousedown=\"startDrag('"+ fs[i].Id +"', '" + fs[i].User.Id + "', 'Pasta')\" src=\"imagens/" + dir + "\"></TD>";
				htm += "					<TD onmouseout=\"outCassFolder()\" onmouseover=\"overClassFolder()\" isFolder=\"true\" idParent=" + fs[i].IdParent + " idFolder=" + fs[i].Id + " idUser=" + fs[i].User.Id + " style=\"cursor:hand\" onmousedown=\"FolderSelect()\" ondblclick=\"FolderAlter()\" >" + fs[i].Name + "</TD>";
				htm += "				</TR>";
				htm += "			</TABLE>";
				htm += "		</Td >";
				htm += "	</TR>";
				htm += "</TABLE>";
				htm += "<tr><td>";				
			}

			htm += "</TABLE>";

			createPageXML();
			Response.Write( "<return>" );
			Response.Write( Server.HtmlEncode( htm ) );
			Response.Write( "</return>" );
			closePageXML();
		}

		private void alterLocationFolder( BsFolder fNew, BsFolder fChild )
		{
			Business.BsFolder.AlterLocationFolder( fNew, fChild );

			createPageXML();
			Response.Write( "<return>" );
			Response.Write( "1" );
			Response.Write( "</return>" );
			closePageXML();
		}

		private void addFolder( BsFolder f )
		{
			f.Id = 0;
			f.User = usr;
			f.Name = "New Folder";
			f.SaveObject();
			f.Group.AddGroupsByFolder( usr.Groups, f );

			createPageXML();
			Response.Write( "<return>" );
			Response.Write( f.Id + "" );
			Response.Write( "</return>" );

			Response.Write( "<idParent>" );
			Response.Write( f.IdParent + "" );
			Response.Write( "</idParent>" );

			Response.Write( "<idUser>" );
			Response.Write( usr.Id + "" );
			Response.Write( "</idUser>" );

			Response.Write( "<countChild>" );
			Response.Write( Business.BsFolder.CountChild( f, usr.Groups ) );
			Response.Write( "</countChild>" );
			closePageXML();
		}

		private void countChildFolder( BsFolder f )
		{
			createPageXML();
			Response.Write( "<countChild>" );
			Response.Write( Business.BsFolder.CountChild( f, usr.Groups ) );
			Response.Write( "</countChild>" );
			closePageXML();
		}

		private void alterFolder( BsFolder f, string newName )
		{
			f.GetObject();

			f.Name = newName;
			f.SaveObject();
			
			createPageXML();
			Response.Write( "<return>" );
			Response.Write( "1" );
			Response.Write( "</return>" );
			closePageXML();
		}

		private void deleteFolder( BsFolder f )
		{
			f.ExcludeObject();
			createPageXML();
			Response.Write( "<return>" );
			Response.Write( "1" );
			Response.Write( "</return>" );
			closePageXML();
		}

		private void ajaxGetFolders( BsFolder f ) 
		{
			Business.BsFolders fs;
			if( usr.Admin ) fs = f.GetObjects();
			else
			{
				f.Groups = usr.Groups;
				fs = f.GetObjectsByGroups();
			}

			createPageXML();

			for( int i=0; i<fs.Count; i++ )
			{
				Response.Write( "<name>" );
				Response.Write( Server.HtmlEncode( fs[i].Name ) );
				Response.Write( "</name>" );
				
				Response.Write( "<idFolder>" );
				Response.Write( fs[i].Id );
				Response.Write( "</idFolder>" );

				Response.Write( "<idParent>" );
				Response.Write( f.IdParent );
				Response.Write( "</idParent>" );

				Response.Write( "<idUser>" );
				Response.Write( fs[i].User.Id );
				Response.Write( "</idUser>" );

				Response.Write( "<countChild>" );
				Response.Write( Business.BsFolder.CountChild( fs[i], usr.Groups ) );
				Response.Write( "</countChild>" );
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
