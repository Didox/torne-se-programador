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

namespace ControlMeeting.Controls
{	
	public class searchServices : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblTitle;
		protected System.Web.UI.WebControls.Button btnProcurar;
		protected System.Web.UI.HtmlControls.HtmlTable tbFormMount;
		Business.BsForm form;
		Business.BsFolder folder;
		private Business.BsUser usr;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			if( ! Business.BsUser.UserOn() )
			{
				Response.Write( "<script>alert( 'Sua sessão expirou!' );top.login();</script>" );
				Response.End();	
			}
			else usr = Business.BsUser.GetUserOn();

			if( Request["idForm"] != null ) Session[ "idForm" ] = Request["idForm"];
			form = new Business.BsForm( Convert.ToInt32( "0" + Session["idForm"] ) );

			if( Request["idFolder"] != null ) Session[ "idFolder" ] = Request["idFolder"];
			folder = new Business.BsFolder( Convert.ToInt32( "0" + Session["idFolder"] ) );

			if( ! Page.IsPostBack )			
				createForm( form );
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
			this.btnProcurar.Click += new System.EventHandler(this.btnProcurar_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion	

		private void createForm( BsForm f )
		{
			RegisterStartupScript( "date", "<script>" + f.MountForm( tbFormMount, true ) + "</script>" );
		}

		private void btnProcurar_Click(object sender, System.EventArgs e)
		{
			Business.BsFields fds = new Business.BsField(form).GetObjects();
			string values = "";

			for( int i=0; i< fds.Count; i++ )
			{
				
				string fields = "campo" + fds[i].Id + "";
				string returns = "";
				string returnsAnd = "";

				if( fds[i].TypeObject.Id != 3 )
				{
					returns = Request["txtCampo" + fds[i].Id ];
					if( fds[i].Type.Id == 3 || fds[i].Type.Id == 7 || fds[i].Type.Id == 9 )
						returnsAnd = Request["txtCampo" + fds[i].Id + "-End" ];
				}
				else
				{					
					BsItensField itsf = new BsItemField(fds[i]).GetObjects();
					for( int x=0; x<itsf.Count; x++ )
					{
						string ret = Request["txtCampo" + fds[i].Id + "-" + x ];
						if( ret != "" && ret != null ) returns += ret + ",&nbsp;";
					}
					
					if( returns != "" ) returns = returns.Substring(0, returns.Length - 7 );
				}

				if( returns == "0" ) returns = "";
				if( returnsAnd == "0" ) returnsAnd = "";
				
				if( fds[i].Type.Id == 3  )
				{
					if( returns != "" )
						values += " and " + fields + " >= '" + Convert.ToDateTime( returns ).ToString( "yyyy/MM/dd" ) + "' ";
					if( returnsAnd != "" )
						values += " and " + fields + " <= '" + Convert.ToDateTime( returnsAnd ).ToString( "yyyy/MM/dd" ) + "' ";
				}
				else if( fds[i].Type.Id == 7 )
				{
					if( returns != "" )
						values += " and " + fields + " >= " + returns.Replace(".","").Replace(",",".") + " ";
					if( returnsAnd != "" )
						values += " and " + fields + " <= " + returnsAnd.Replace(".","").Replace(",",".") + " ";
				}
				else if( fds[i].Type.Id == 9 )
				{
					if( returns != "" )
						values += " and " + fields + " >= " + returns + " ";
					if( returnsAnd != "" )
						values += " and " + fields + " <= " + returnsAnd + " ";
				}
				else if( fds[i].Type.Id == 5 || fds[i].TypeObject.Id != 3 || fds[i].TypeObject.Id != 6 )
					values += " and " + fields + " like '%" + returns + "%' ";
				else values += " and " + fields + " = '" + returns + "' ";
			}
			
			RegisterClientScriptBlock( "ok", "<script>top.openItemForm( 'tbChild" + form.Id + "', 'block', '', \"" + values + "\" );top.closeLayerAlpha();</script>" );
		}
	}
}
