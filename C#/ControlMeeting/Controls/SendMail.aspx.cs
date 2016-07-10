using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace ControlMeeting.Controls
{
	public class SendMail : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox txtEmail;
		protected System.Web.UI.WebControls.RequiredFieldValidator rvfEmail;
		protected System.Web.UI.WebControls.RegularExpressionValidator rrvEmail;
		protected System.Web.UI.WebControls.TextBox txtMensagem;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvMensagem;
		protected System.Web.UI.WebControls.Button btnEnviar;
		protected System.Web.UI.WebControls.ValidationSummary vsMensagem;
		private Business.BsUser usr;
		private Business.BsForm form;
		protected System.Web.UI.WebControls.TextBox txtSubject;
		protected System.Web.UI.WebControls.RequiredFieldValidator rrfSubject;
		private Business.BsItemForm item;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			if( ! Business.BsUser.UserOn() )
			{
				Response.Write( "<script>alert( 'Sua sessão expirou!' );top.login();</script>" );
				Response.End();	
			}
			else usr = Business.BsUser.GetUserOn();
			form = new Business.BsForm( Convert.ToInt32( "0" + Request["idForm"] ) );
			item = new Business.BsItemForm( Convert.ToInt32("0"+Request["idItem"]),form );
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
			this.btnEnviar.Click += new System.EventHandler(this.btnEnviar_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnEnviar_Click(object sender, System.EventArgs e)
		{
			if( item.SendMail( txtEmail.Text,txtMensagem.Text, txtSubject.Text, usr ) )
				RegisterClientScriptBlock( "ok", "<script>top.closeLayerAlpha();</script>" );
			else
				RegisterClientScriptBlock( "ok", "<script>alert('Erro ao enviar email');top.closeLayerAlpha();</script>" );
		}
	}
}
