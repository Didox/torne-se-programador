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
	public class ItensFields : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.DataGrid dgGroups;
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
		protected System.Web.UI.WebControls.Button Button1;
		private int idForm;
		protected System.Web.UI.WebControls.Button btnIncluir;
		private int idField;
		private Business.BsUser usr;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			if( ! Business.BsUser.UserOn() )
			{
				Response.Write( "<script>alert( 'Sua sessão expirou!' );top.login();</script>" );
				Response.End();	
			}
			else usr = Business.BsUser.GetUserOn();

			if( Request["idField"] != null ) idField = Convert.ToInt32( Request["idField"] );
			else idField = Convert.ToInt32( Session["idField"] );
			Session["idField"] = idField;

			if( Request["idForm"] != null ) idForm = Convert.ToInt32( Request["idForm"] );
			else idForm = Convert.ToInt32( Session["idForm"] );
			Session["idForm"] = idForm;

			txtIDescription.MaxLength = new BsField(idField, new Business.BsForm(idForm) ).GetObject().Size;

			if( ! IsPostBack )
			{
				if( Request["CommandName"] == "Alter" ) getData( Convert.ToInt32( Request["id"] ) );
				else if( Request["CommandName"] == "Exclude" ) delItensField( Convert.ToInt32( Request["id"] ) );
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
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.btnInclu.Click += new System.EventHandler(this.btnInclu_Click);
			this.btniVoltar.Click += new System.EventHandler(this.btniVoltar_Click);
			this.btnIncluir.Click += new System.EventHandler(this.btnIncluir_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect( "fieldsForm.aspx?idForm=" + idForm );
		}

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
			Business.BsItemField iten = new Business.BsItemField();
			iten.Id  = id;
			iten.GetObject();;
			if( iten.Id > 0 )
			{
				txtIDescription.Text = iten.Value;
				txtId.Text = iten.Id + "";
			}
		}

		private void delItensField( int id )
		{
			Business.BsItemField f = new Business.BsItemField();
			f.Id = id;
			f.ExcludeObject();
			search();
		}

		private void search()
		{
			enabledSearch();
			Business.BsItemField iten = new Business.BsItemField(new Business.BsField(idField));
			dgGroups.DataSource = iten.GetObjects();
			dgGroups.DataBind();
		}

		private void clearFields()
		{					
			txtId.Text				= "";
			txtIDescription.Text	= "";
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
			Business.BsItemField iten = new Business.BsItemField();
			iten.Id = Convert.ToInt32( "0" + txtId.Text );
			iten.Value = txtIDescription.Text;
			iten.Field.Id = idField;
			iten.SaveObject();

			if( txtId.Text == "" )
			{
				RegisterClientScriptBlock( "ok", "<script>alert( 'Item cadastrado.' )</script>" );
				clearFields();
			}
			else search();
		}
	}
}
