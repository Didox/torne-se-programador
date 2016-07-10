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
	public class GetForms : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.RadioButtonList rdlForms;
		protected System.Web.UI.WebControls.Button btnAdicionar;
		int idFolder = 0;
		private Business.BsUser usr;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if( ! Business.BsUser.UserOn() )
			{
				Response.Write( "<script>alert( 'Sua sessão expirou!' );top.login();</script>" );
				Response.End();	
			}
			else usr = Business.BsUser.GetUserOn();

			if( Request["idFolder"] != null ) Session[ "idFolder" ] = Request["idFolder"];
			idFolder = Convert.ToInt32( "0" + Session["idFolder"] );

			if( ! Page.IsPostBack )
			{
				GetFormsAll();				
			}
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
			this.btnAdicionar.Click += new System.EventHandler(this.btnAdicionar_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void GetFormsAll()
		{
			Business.BsForms fs = new Business.BsForm(new Business.BsFolder(idFolder)).GetObjectsDifferentFolder();			
			if( fs.Count == 0 )
			{
				RegisterClientScriptBlock( "o2", "<script>top.hideLoading();</script>" );
				RegisterClientScriptBlock( "ok", "<script>alert( 'Não existem serviços a serem adicionados' );top.closeLayerAlpha();</script>" );
				return;
			}

			for( int i=0; i<fs.Count; i++ )
				rdlForms.Items.Insert( i, new ListItem( fs[i].Name, fs[i].Id.ToString() ) );			
		}

		private void btnAdicionar_Click(object sender, System.EventArgs e)
		{
			int idForm = Convert.ToInt32( "0" + rdlForms.SelectedValue );
			if( idForm != 0 )
			{
				Business.BsFolder.AddForm( idForm , idFolder );
				RegisterClientScriptBlock( "ok", "<script>top.getItens( " + idFolder + " );top.closeLayerAlpha();</script>" );			
			}
			else
			{
				RegisterClientScriptBlock( "ok", "<script>alert( \"Selecione um Serviço\" )</script>" );
			}
		}
	}
}
