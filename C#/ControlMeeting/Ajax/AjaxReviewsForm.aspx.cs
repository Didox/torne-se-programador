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
	public class AjaxReviewsForm : System.Web.UI.Page
	{
		private Business.BsUser usr;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if( ! Business.BsUser.UserOn() ) return;
			else usr = Business.BsUser.GetUserOn();

			BsItemForm itemForm =  new BsItemForm( Convert.ToInt32("0"+Request["idItemForm"]), new BsForm( Convert.ToInt32("0"+Request["idForm"]) ) );

			if( Request["idReview"] != null && Request["idForm"] != null )
				removeReviewForm( new BsReviewForm(Convert.ToInt32(Request["idReview"]),itemForm) );
			else if( Request["idItemForm"] != null && Request["idForm"] != null )
				getReviewsForm( new BsReviewForm( 0, itemForm ) );
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

		private void removeReviewForm( BsReviewForm review )
		{
			review.ExcludeObject();

			createPageXML();
			Response.Write( "<return>" );
			Response.Write( "1" );
			Response.Write( "</return>" );
			closePageXML();			
		}

		private void getReviewsForm( BsReviewForm r )
		{
			string ordem = Convert.ToString( Session["ordem"] );
			if( ordem == null ) ordem = "desc";
			else
			{
				if( ordem == "asc" ) ordem = "desc";
				else ordem = "asc";
			}

			Session["ordem"] = ordem;
			string field = Request["field"];

			if( field == null || field == "" || field == "undefined" ) ordem = "";
			else ordem = field + " " + ordem;

			Business.BsReviewsForm rvs = r.GetObjects(ordem);
			createPageXML();
			string htm =	"<TABLE  BORDER=\"1\" bordercolor=\"#F8F5F0\" width=\"100%\" CELLSPACING=\"1\" CELLPADDING=\"1\">"+
				"<TR >";
			htm +=	"<TD onmousedown=\"createMenuReviewInsert(" + r.ItemForm.Id + ", " + r.ItemForm.Form.Id + ");\" title=\"Clique no campo para organizar em ordem " + ( ordem != "asc" ? "ascendente" : "decrescente" )  + " \" width=\"20\" ><a href=\"javascript:openReviewsForm( " + r.ItemForm.Id + ", " + r.ItemForm.Form.Id + ",'review', 'none')\"><b>Comentários</b></a></TD>";
			htm +=	"<TD onmousedown=\"createMenuReviewInsert(" + r.ItemForm.Id + ", " + r.ItemForm.Form.Id + ");\" title=\"Clique no campo para organizar em ordem " + ( ordem != "asc" ? "ascendente" : "decrescente" )  + " \" width=\"20\" ><a href=\"javascript:openReviewsForm( " + r.ItemForm.Id + ", " + r.ItemForm.Form.Id + ",'idUser', 'none')\"><b>Usuário</b></a></TD>";
			htm +=	"<TD onmousedown=\"createMenuReviewInsert(" + r.ItemForm.Id + ", " + r.ItemForm.Form.Id + ");\" title=\"Clique no campo para organizar em ordem " + ( ordem != "asc" ? "ascendente" : "decrescente" )  + " \" width=\"15\" ><a href=\"javascript:openReviewsForm( " + r.ItemForm.Id + ", " + r.ItemForm.Form.Id + ",'data','none' )\"><b>Data</b></a></TD>";
			htm += "</TR>";

			for( int j=0; j<rvs.Count; j++ )
			{
				htm += "<TR style=\"cursor:hand\" bgcolor=\"#ffffff\" id=\"tbReview" + rvs[j].Id + "-" + rvs[j].ItemForm.Id + "\" idReview=" + rvs[j].Id + " idUser=" + rvs[j].User.Id + " onmousedown=\"createMenuReview(" + rvs[j].Id + ", " + rvs[j].ItemForm.Id + ", " + r.ItemForm.Form.Id + "," + rvs[j].User.Id + ")\" ondblClick=\"EditReview( " + rvs[j].Id + "," + rvs[j].User.Id + "," + rvs[j].ItemForm.Id + ", " + r.ItemForm.Form.Id + " )\"  >";
				htm +=	"<TD width=\"520\" >" + rvs[j].ReviewSumary + "<input type=\"hidden\" id=\"hidReview"+rvs[j].Id+"-"+rvs[j].ItemForm.Id+"-"+r.ItemForm.Form.Id+"\" value='"+rvs[j].ReviewHTML+"'></TD>";
				htm +=	"<TD width=\"120\">" + rvs[j].User.Name + "</TD>";
				htm +=	"<TD width=\"80\" >" + rvs[j].Date.ToString("dd/MM/yyyy") + "</TD>";
				htm += "</TR>";
			}

			htm += "</TABLE>";
	
			Response.Write( "<htm>" );
			Response.Write( Server.HtmlEncode( htm ) );
			Response.Write( "</htm>" );

			for( int j=0; j<rvs.Count; j++ )
			{
				Response.Write( "<review>" );
				Response.Write( Server.HtmlEncode( rvs[j].Review ) );
				Response.Write( "</review>" );

				Response.Write( "<idReviewForm>" );
				Response.Write( Server.HtmlEncode( rvs[j].Id + "" ) );
				Response.Write( "</idReviewForm>" );

				Response.Write( "<itemForm>" );
				Response.Write( Server.HtmlEncode( rvs[j].ItemForm.Id + "" ) );
				Response.Write( "</itemForm>" );

				Response.Write( "<idUser>" );
				Response.Write( Server.HtmlEncode( rvs[j].User.Id + "" ) );
				Response.Write( "</idUser>" );
			}

			Response.Write( "<countReview>" );
			Response.Write( rvs.Count + "" );
			Response.Write( "</countReview>" );

			closePageXML();
		}
	}
}
