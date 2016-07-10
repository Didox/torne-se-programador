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
using System.Configuration;
namespace EnviaAnexo
{
	public class WebForm1 : System.Web.UI.Page
	{
		#region " Controles "
		protected System.Web.UI.WebControls.TextBox txtNome;
		protected System.Web.UI.WebControls.TextBox txtEmail;
		protected System.Web.UI.WebControls.TextBox txtMensagem;
		protected System.Web.UI.WebControls.Button btnEnviar;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvNome;
		protected System.Web.UI.WebControls.RequiredFieldValidator rvfEmail;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvMensagem;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvAnexo;
		protected System.Web.UI.WebControls.ValidationSummary vsMensagem;
		protected System.Web.UI.WebControls.RegularExpressionValidator rrvEmail;
		protected System.Web.UI.HtmlControls.HtmlInputFile txtAnexo;
		#endregion
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			
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
			EnviaAnexo objEnviar = new EnviaAnexo();
			string[] retorno = new string[2];
			retorno = objEnviar.EnviarEmailAnexo( txtNome.Text, txtEmail.Text, txtMensagem.Text, txtAnexo );
			if( retorno[0] != "0" )
				RegisterStartupScript("ok","<script>alert('"+retorno[1]+"');window.location='"+ConfigurationSettings.AppSettings["redirect"].ToString()+"';</script>");
			else
				RegisterStartupScript("ok","<script>alert('"+retorno[1]+"');</script>");
		}
	}
}
