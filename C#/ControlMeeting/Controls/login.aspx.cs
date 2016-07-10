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
	public class login : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.TextBox txtSenha;
		protected System.Web.UI.WebControls.TextBox txtUsuario;
		protected System.Web.UI.WebControls.Button btnLogar;
	
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
			this.btnLogar.Click += new System.EventHandler(this.btnLogar_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnLogar_Click(object sender, System.EventArgs e)
		{
			Business.BsUser u = new Business.BsUser();
			u.Login = txtUsuario.Text;
			u.Password = txtSenha.Text;
			
			if(u.LoginOn())
			{
				RegisterClientScriptBlock( "ok3", "<script>top.activeAdmin( " + u.Admin.ToString().ToLower() + " );</script>" );
				RegisterClientScriptBlock( "ok1", "<script>top.logIn = 1</script>" );
				RegisterClientScriptBlock( "ok4", "<script>top.document.getElementById('nameUser').innerHTML = \"" + u.Name + "\";</script>" );
				RegisterClientScriptBlock( "ok2", "<script>top.loginUser(" + u.Id + ")</script>" );				
			}
			else
                RegisterClientScriptBlock( "err", "<script>alert('Usuário não cadastrado ou login e senha inválido')</script>" );
		}
	}
}
