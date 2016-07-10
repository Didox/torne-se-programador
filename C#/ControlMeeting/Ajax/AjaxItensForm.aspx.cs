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
	public class AjaxItensForm : System.Web.UI.Page
	{
		private Business.BsUser usr;

		private void Page_Load(object sender, System.EventArgs e)
		{		
			if( ! Business.BsUser.UserOn() ) return;
			else usr = Business.BsUser.GetUserOn();

			int idForm = Convert.ToInt32( "0" + Request["idForm"] );
			if( Request["idFolderDrag"] != null )
				alterItemFormFolder();
			else if( Request["idItemForm"] != null && Request["idForm"] != null  && Request["getFiles"] != null )
				getFiles( new BsItemForm( Convert.ToInt32(Request["idItemForm"]), new BsForm(idForm) ) );
			else if( Request["idItemForm"] != null && Request["idForm"] != null  && Request["file"] != null )
				removeFile( new BsItemForm( Convert.ToInt32(Request["idItemForm"]), new BsForm(idForm) ) );
			else if( Request["idFolder"] != null && Request["idForm"] != null )
				getItensForm( new BsForm( idForm, "", new BsFolder( Convert.ToInt32(Request["idFolder"]) ), null, null, false ) );
			else if( Request["idRemoveItem"] != null && Request["idForm"] != null )
				removeItemForm( new BsItemForm(Convert.ToInt32(Request["idRemoveItem"]),null,new BsForm(idForm),null,null,null) );
			else if( Request["idItemGet"] != null )
				getItemForm( new BsItemForm(Convert.ToInt32(Request["idItemGet"]),null,new BsForm(idForm),null,null,null) );
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

		private void alterItemFormFolder()
		{
			BsFolder fDrag = new BsFolder(Convert.ToInt32( Request["idFolderDrag"] ) );
			BsItemForm item = new BsItemForm(Convert.ToInt32(Request["itemDrag"]),new BsFolder(Convert.ToInt32( Request["idFolder"] )),new BsForm(Convert.ToInt32( Request["idForm"] )),null,null,null );
			item.AlterItemFolder( fDrag );

			createPageXML();
			Response.Write( "<return>" );
			Response.Write( "1" );
			Response.Write( "</return>" );
			closePageXML();
		}

		private void removeFile( BsItemForm item )
		{
			item.DeleteFile( Request["file"] );
			createPageXML();
			Response.Write( "<return>" );
			Response.Write( Server.HtmlEncode( item.ListDirectoryAnexos(true) ) );
			Response.Write( "</return>" );
			closePageXML();
		}

		private void getFiles( BsItemForm item )
		{
			createPageXML();
			Response.Write( "<return>" );
			Response.Write( Server.HtmlEncode( item.ListDirectoryAnexos(false) ) );
			Response.Write( "</return>" );
			closePageXML();
		}

		private void getItemForm( BsItemForm item )
		{
			item.GetObject();
			Business.BsFields fds = new Business.BsField(item.Form).GetObjects();
			
			if( item.Id > 0 )
			{
				string htm = "";
				if( item.Form.GetObject().Anexo ) htm = item.ListDirectoryAnexos(false);
				createPageXML();
				Response.Write( "<return>" );
				for( int i=0; i< fds.Count; i++ )
				{
					if( fds[i].Detail )
					{
						if( fds[i].Type.Id == 4 || fds[i].TypeObject.Id == 5 )
						{
							htm += "<br>";
							htm += item.GFields.GetKey(fds[i]).Value;
						}
						else
						{
							string values = item.GFields.GetKey(fds[i]).Value;
							int size = fds[i].Size;
							if( fds[i].Type.Id == 3 )
								values = Convert.ToDateTime( values ).ToString( "dd/MM/yyyy" );
							
							htm += "<table border=0 cellpadding=0 cellspacing=0 width=\"100%\" ><tr>";
							htm += "<td width=\"50\" nowRap=\"true\"><b><nobr>" + fds[i].Name + "&nbsp;</nobr></b></td>";
							htm += "<td >" + values + "</td>";
							htm += "</tr></table>";
						}
					}
				}

				htm = htm.Replace( "\n", "<br>" );				
				Response.Write( Server.HtmlEncode( htm ) );
				Response.Write( "</return>" );

				Response.Write( "<idItem>" );
				Response.Write( item.Id.ToString() );
				Response.Write( "</idItem>" );
								
				Response.Write( "<idForm>" );
				Response.Write( item.Form.Id.ToString() );
				Response.Write( "</idForm>" );
				closePageXML();
			}
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

		private void removeItemForm( BsItemForm item )
		{
			item.ExcludeObject();

			createPageXML();
			Response.Write( "<return>" );
			Response.Write( "1" );
			Response.Write( "</return>" );
            closePageXML();			
		}

		private void getItensForm( BsForm f )
		{
			string ordem = Convert.ToString( Session["ordem"] );
			if( ordem == null ) ordem = "desc";
			else
			{
				if( ordem == "asc" ) ordem = "desc";
				else ordem = "asc";
			}

			Session["ordem"] = ordem;
			
			Business.BsFields fds = new Business.BsField(f).GetObjects();
			createPageXML();
			string htm =	"<TABLE  BORDER=\"1\" bordercolor=\"#ffffff\" width=\"100%\" CELLSPACING=\"2\" CELLPADDING=\"3\">"+
							"<TR  height=\"20\">"+
							"<TD background=\"imagens/bordaForm.gif\" width=\"1\" ></TD>"+
							"<TD background=\"imagens/bordaForm.gif\" width=\"1\" ></TD>";
			
			BsFields filds = new BsFields();;
			bool exceptions = false;
			for( int i=0; i<fds.Count; i++ )
			{
				if( fds[i].Preview )
				{
					htm +=	"<TD onmousedown=\"createMenu(4);\" background=\"imagens/bordaForm.gif\" title=\"Clique no campo para organizar em ordem " + ( ordem != "asc" ? "ascendente" : "decrescente" )  + " \" width=\"" + ( fds[i].Size * 7 ) + "\" ><a href=\"javascript:openItemForm( 'tbChild" + f.Id + "', 'block','campo" + fds[i].Id + "' )\"><b>" + fds[i].Name.Replace( ":","" ) +  "</b></a></TD>";
					filds.Add(fds[i].Id, fds[i] );	
					if( fds[i].ExceptionsUser ) exceptions = true;
				}
			}	
			
			f.GetObject();

			if( f.EnabledUser )
				htm +=	"<TD onmousedown=\"createMenu(4);\" background=\"imagens/bordaForm.gif\" title=\"Clique no campo para organizar em ordem " + ( ordem != "asc" ? "ascendente" : "decrescente" )  + " \" width=\"20\" ><a href=\"javascript:openItemForm( 'tbChild" + f.Id + "', 'block','idUser' )\"><b>Usuário</b></a></TD>";
			if( f.EnabledDate )
				htm +=	"<TD onmousedown=\"createMenu(4);\" background=\"imagens/bordaForm.gif\" title=\"Clique no campo para organizar em ordem " + ( ordem != "asc" ? "ascendente" : "decrescente" )  + " \" width=\"15\" ><a href=\"javascript:openItemForm( 'tbChild" + f.Id + "', 'block','data' )\"><b>Data</b></a></TD>";
			if( f.Anexo )
				htm +=	"<TD onmousedown=\"createMenu(4);\" background=\"imagens/bordaForm.gif\" width=\"20\" ><b>Anexo</b></TD>";
			
			htm += "</TR>";

			string field = Convert.ToString( Request["field"] );
			string where  = Request["where"];

			BsItensForm itens;
			if( field.Length > 2 ) ordem = field + " " + ordem;
			else ordem = "";

			if( usr.Admin ) itens = new BsItemForm(0,f.Folder,f,null,null,null).GetObjects( ordem, where );
			else itens = new BsItemForm(0,f.Folder,f,null,null,usr.Groups).GetObjectsByGroups( ordem, where );

			for( int j=0; j<itens.Count; j++ )
			{
				htm += "<TR style=\"cursor:hand\" bgcolor=\"#ffffff\" id=\"tbItem" + itens[j].Id + "-" + f.Id + "\" idItem=" + itens[j].Id + " idUser=" + itens[j].User.Id + " exceptions=\""+exceptions.ToString().ToLower()+"\"  ondblClick=\"EditService( " + itens[j].Id + "," + itens[j].User.Id + "," + f.Id + " )\"  >";
				htm +=	"<TD width=\"1\" onmousedown=\"createMenuItem();openItem(" + itens[j].Id + ", " + f.Id + ")\" ><img alt=\"Clique e arraste para mover\" width=10 height=10 src=\"imagens/move.gif\" style=\"cursor:move\" onmousedown=\"startDrag('"+ itens[j].Id +"','" + itens[j].User.Id + "','Item')\" ></TD>";
				htm +=	"<TD width=\"1\" onmousedown=\"createMenuItem();openItem(" + itens[j].Id + ", " + f.Id + ")\" ><img alt=\"Clique para abrir os Comentários\" id=\"imgReviews"+itens[j].Id+"-"+itens[j].Form.Id+"\" width=10 height=10 src=\"imagens/setMCima.gif\" style=\"cursor:hand\" onclick=\"openReviewsForm("+ itens[j].Id +", "+ itens[j].Form.Id +", '', '')\" ></TD>";
				
				for( int i=0; i<filds.Count; i++ )
					htm +=	"<TD onmousedown=\"createMenuItem();openItem(" + itens[j].Id + ", " + f.Id + ")\" >" + itens[j].GFields.GetKey(filds[i]).Value + "</TD>";
				
				if( f.EnabledDate ) htm +=	"<TD width=\"20\" onmousedown=\"createMenuItem();openItem(" + itens[j].Id + ", " + f.Id + ")\" >" + itens[j].User.Name + "</TD>";
				if( f.EnabledUser ) htm +=	"<TD width=\"15\" onmousedown=\"createMenuItem();openItem(" + itens[j].Id + ", " + f.Id + ")\" >" + itens[j].Date.ToString("dd/MM/yyyy") + "</TD>";
				if( f.Anexo )		htm +=	"<TD width=\"5\" onmousedown=\"createMenu(5);\" >" + ( itens[j].ContaisFiles()? "<img src=\"imagens/anexo.gif\">" : "" ) + "</TD>";
				htm += "</TR>";

				htm += "<TR style=\"display:none\" id=\"itemFormReview"+itens[j].Id + "-" + itens[j].Form.Id +"\" ><TD width=\"10\" bgcolor=\"#F8F5F0\" >&nbsp;</TD><TD width=\"10\" bgcolor=\"#F8F5F0\" >&nbsp;</TD><TD colspan=\"100%\"><nobr><img width=\"10\" height=\"10\" src=\"imagens/26-1.gif\"> Carregando...</nobr></TD></TR>";
			}

			htm += "</TABLE>";
	
			Response.Write( "<return>" );
			Response.Write( Server.HtmlEncode( htm ) );
			Response.Write( "</return>" );

			Response.Write( "<countItem>" );
			Response.Write( itens.Count + "" );
			Response.Write( "</countItem>" );

			closePageXML();
		}
	}
}
