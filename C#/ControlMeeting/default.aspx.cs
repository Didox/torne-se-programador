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

namespace ControlMeeting
{
	public class WebForm1 : System.Web.UI.Page
	{
		protected System.Web.UI.HtmlControls.HtmlTable tbFolders;
		private Business.BsUser usr;

		private void Page_Load(object sender, System.EventArgs e)
		{
			usr = Business.BsUser.GetUserOn();
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

		private void GetFolders()
		{

			Business.BsFolder f = new Business.BsFolder();
			f.IdParent = 0;
			Business.BsFolders fs = f.GetObjects();

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

				HtmlTableRow r = new HtmlTableRow();
				HtmlTableCell c = new HtmlTableCell();
			
				c.InnerHtml = "<TABLE WIDTH=\"100%\" BORDER=\"0\" CELLSPACING=\"0\" CELLPADDING=\"0\">";
				c.InnerHtml += "	<TR id=" + fs[i].Id + " >";	
				c.InnerHtml += "		<Td NoWrap >";
				c.InnerHtml += "			<TABLE BORDER=\"0\" CELLSPACING=\"2\" CELLPADDING=\"0\">";
				c.InnerHtml += "				<TR >";
				c.InnerHtml += "					<TD width=10 " + hand + events + " ><img border=0 onmousedown=\"startDrag('"+ fs[i].Id +"', 'Pasta')\" src=\"imagens/" + dir + "\"></TD>";
				c.InnerHtml += "					<TD onmouseout=\"outCassFolder()\" onmouseover=\"overClassFolder()\" isFolder=\"true\" idParent=" + fs[i].IdParent + " idFolder=" + fs[i].Id + " style=\"cursor:hand\" onmousedown=\"FolderSelect()\" ondblclick=\"FolderAlter()\" >" + fs[i].Name + "</TD>";
				c.InnerHtml += "				</TR>";
				c.InnerHtml += "			</TABLE>";
				c.InnerHtml += "		</Td >";
				c.InnerHtml += "	</TR>";
				c.InnerHtml += "</TABLE>";				

				r.Controls.Add( c );

				tbFolders.Controls.Add( r );
			}
		}
	}
}
