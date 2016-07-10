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
	public class createForm : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label LblTitPesq;
		protected System.Web.UI.WebControls.Button btnIncluir;
		protected System.Web.UI.WebControls.Label lblNome;
		protected System.Web.UI.WebControls.TextBox txtDescription;
		protected System.Web.UI.WebControls.Button btnProcurar;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.DataGrid dgGroups;
		protected System.Web.UI.WebControls.Label lblTitIncluir;
		protected System.Web.UI.WebControls.Label lbliNome;
		protected System.Web.UI.WebControls.TextBox txtIDescription;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfiDesciption;
		protected System.Web.UI.WebControls.TextBox txtId;
		protected System.Web.UI.WebControls.Button btnInclu;
		protected System.Web.UI.WebControls.Button btniVoltar;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbPesq;
		protected System.Web.UI.HtmlControls.HtmlGenericControl legend;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend1;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbInclu;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend2;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.RadioButtonList rdlAnexo;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.RadioButtonList rdlDate;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.RadioButtonList rdlUser;		
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
			{
				if( Request["CommandName"] == "Alter" ) getData( Convert.ToInt32( Request["id"] ) );
				else if( Request["CommandName"] == "Exclude" ) delForm( Convert.ToInt32( Request["id"] ) );
				else search();
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
			this.btnProcurar.Click += new System.EventHandler(this.btnProcurar_Click);
			this.btnIncluir.Click += new System.EventHandler(this.btnIncluir_Click);
			this.btnInclu.Click += new System.EventHandler(this.btnInclu_Click);
			this.btniVoltar.Click += new System.EventHandler(this.btniVoltar_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void enabledSearch()
		{
			tbPesq.Visible = true;
			tbInclu.Visible = false;
		}

		private void fields()
		{
			tbInclu.Visible = true;
			tbPesq.Visible = false;
			clearFields();
		}

		private void getData( int id )
		{
			fields();
			Business.BsForm f = new Business.BsForm( id ).GetObject();
			if( f.Id > 0 )
			{
				txtIDescription.Text = f.Name;
				rdlAnexo.SelectedValue = f.Anexo.ToString().ToLower();
				rdlDate.SelectedValue = f.EnabledDate.ToString().ToLower();
				rdlUser.SelectedValue = f.EnabledUser.ToString().ToLower();
				txtId.Text = f.Id + "";
			}
		}

		private void delForm( int id )
		{
			Business.BsForm.DelForm( id );
			search();
		}

		private void search()
		{
			enabledSearch();
			Business.BsForm f = new Business.BsForm();
			f.Name = txtDescription.Text;

			dgGroups.DataSource = f.GetObjects();
			dgGroups.DataBind();
		}

		private void clearFields()
		{		
			txtId.Text				= "";
			txtIDescription.Text	= "";
			rdlAnexo.SelectedValue  = "false";
			rdlDate.SelectedValue  = "true";
			rdlUser.SelectedValue  = "true";
		}

		private void btnIncluir_Click(object sender, System.EventArgs e)
		{
			fields();
		}

		private void btniVoltar_Click(object sender, System.EventArgs e)
		{
			search();
		}

		private void btnProcurar_Click(object sender, System.EventArgs e)
		{
			search();
		}

		private void btnInclu_Click(object sender, System.EventArgs e)
		{
			Business.BsForm.SaveForm( Convert.ToInt32( "0" + txtId.Text ), txtIDescription.Text, usr, Convert.ToBoolean( rdlAnexo.SelectedValue ), Convert.ToBoolean( rdlDate.SelectedValue ) , Convert.ToBoolean( rdlUser.SelectedValue )  );

			if( txtId.Text == "" )
			{
				RegisterClientScriptBlock( "ok", "<script>alert( 'Formulário cadastrado.' )</script>" );
				clearFields();
			}
			else{search();}
		}
	}
}
