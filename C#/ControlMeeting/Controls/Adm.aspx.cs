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
	public class adm : System.Web.UI.Page
	{
		#region " Controls "
		protected System.Web.UI.WebControls.Label LblTitPesq;
		protected System.Web.UI.WebControls.Button btnIncluir;
		protected System.Web.UI.WebControls.Label lblName;
		protected System.Web.UI.WebControls.TextBox txtPName;
		protected System.Web.UI.WebControls.Label lblLogin;
		protected System.Web.UI.WebControls.TextBox txtPLogin;
		protected System.Web.UI.WebControls.Button btnProcurar;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.DataGrid dgUsers;
		protected System.Web.UI.WebControls.Label lblIncluirUser;
		protected System.Web.UI.WebControls.Label lblIName;
		protected System.Web.UI.WebControls.TextBox txtIName;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfiName;
		protected System.Web.UI.WebControls.Label lblEmail;
		protected System.Web.UI.WebControls.TextBox txtIEmail;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.RadioButtonList rdlAdm;
		protected System.Web.UI.WebControls.Label lblIlogin;
		protected System.Web.UI.WebControls.TextBox txtILogin;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfIlogin;
		protected System.Web.UI.WebControls.Label lblIsenha;
		protected System.Web.UI.WebControls.TextBox txtISenha;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfisenha;
		protected System.Web.UI.WebControls.Label lblIcSenha;
		protected System.Web.UI.WebControls.TextBox txtICSenha;
		protected System.Web.UI.WebControls.CompareValidator cvConfere;
		protected System.Web.UI.WebControls.Button btnInclu;
		protected System.Web.UI.WebControls.Button btnIVoltar;
		protected System.Web.UI.WebControls.Label lblAlterUser;
		protected System.Web.UI.WebControls.Label lblaName;
		protected System.Web.UI.WebControls.TextBox txtAName;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfaName;
		protected System.Web.UI.WebControls.TextBox txtId;
		protected System.Web.UI.WebControls.Label lblaEmail;
		protected System.Web.UI.WebControls.TextBox txtAEmail;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.RadioButtonList rdlAdmin2;
		protected System.Web.UI.WebControls.Label lblalogin;
		protected System.Web.UI.WebControls.TextBox txtALogin;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfalogin;
		protected System.Web.UI.WebControls.Label lblasenha;
		protected System.Web.UI.WebControls.TextBox txtASenha;
		protected System.Web.UI.WebControls.Label lblacSenha;
		protected System.Web.UI.WebControls.TextBox txtACSenha;
		protected System.Web.UI.WebControls.CompareValidator cvaConfere;
		protected System.Web.UI.WebControls.Button btnAlterar;
		protected System.Web.UI.WebControls.Button btnAVoltar;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.ListBox lstIGroups;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Button btnSaveGroups;
		protected System.Web.UI.WebControls.Button btnCVoltarGroups;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbPesq;
		protected System.Web.UI.HtmlControls.HtmlGenericControl legendSection1;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend1;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbInclu;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend2;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbAlter;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend3;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbConfigGroup;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend4;
		protected System.Web.UI.HtmlControls.HtmlSelect lstIAddGroups;
		private Business.BsUser usr;
		#endregion
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			if( ! Business.BsUser.UserOn() )
			{
				Response.Write( "<script>alert( 'Sua sessão expirou!' );top.login();</script>" );
				Response.End();	
			}
			else usr = Business.BsUser.GetUserOn();

			if( !Page.IsPostBack )
			{
				if( Request["CommandName"] != null )
				{
					if( Request["CommandName"] == "Alter" )						
						getData(Convert.ToInt32(Request["id"]));
					else if( Request["CommandName"] == "Config" )
						getConfig( Convert.ToInt32( Request["id"] ) );
					else if( Request["CommandName"] == "Exclude" )
					{
						Business.BsUser u = new Business.BsUser();
						u.Id = Convert.ToInt32( Request["id"] );
						u.GetObject();
						u.ExcludeObject();
						searchMemory();
					}
				}
				else searchMemory();
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
			this.btnIncluir.Click += new System.EventHandler(this.btnIncluir_Click);
			this.btnProcurar.Click += new System.EventHandler(this.btnProcurar_Click);
			this.dgUsers.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgUsers_ItemDataBound);
			this.btnInclu.Click += new System.EventHandler(this.btnInclu_Click);
			this.btnIVoltar.Click += new System.EventHandler(this.btnIVoltar_Click);
			this.btnAlterar.Click += new System.EventHandler(this.btnAlterar_Click);
			this.btnAVoltar.Click += new System.EventHandler(this.btnAVoltar_Click);
			this.btnSaveGroups.Click += new System.EventHandler(this.btnSaveGroups_Click);
			this.btnCVoltarGroups.Click += new System.EventHandler(this.btnCVoltarGroups_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		#region " Metods "
		private void enabledSearch()
		{
			tbPesq.Visible = true;
			tbAlter.Visible = false;
			tbInclu.Visible = false;
			tbConfigGroup.Visible = false;
		}
		private void enabledAlter()
		{
			tbAlter.Visible = true;
			tbPesq.Visible = false;
			tbInclu.Visible = false;
			tbConfigGroup.Visible = false;
		}

		private void enabledInserted()
		{
			tbInclu.Visible = true;
			tbAlter.Visible = false;
			tbPesq.Visible = false;
			tbConfigGroup.Visible = false;
			clearFields();
		}

		private void config( int id )
		{
			tbInclu.Visible = false;
			tbPesq.Visible = false;
			tbAlter.Visible = false;
			setComboGroups();
			tbConfigGroup.Visible = true;
			txtId.Text = id + "";
		}

		private void setComboGroups()
		{
			Business.BsGroup g = new Business.BsGroup();
			Business.BsGroups gps = g.GetObjects();			
			for( int i=0; i<gps.Count; i++ )
				lstIGroups.Items.Add( new ListItem( gps[i].Description, gps[i].Id + "" ) );	
		}

		private void getConfig( int id )
		{			
			config( id );
			Business.BsGroup gp = new Business.BsGroup();
			gp.Users.Add( id, new Business.BsUser(id) );
			Business.BsGroups gps = gp.GetObjectsByUsers();

			lstIAddGroups.Items.Clear();
			for( int i=0; i<gps.Count; i++ )
			{
				ListItem l = new ListItem( gps[i].Description, gps[i].Id + "" );
				lstIAddGroups.Items.Add( l );
				lstIGroups.Items.Remove( l );
			}
		}
	
		public void getData(int id)
		{
			enabledAlter();
			Business.BsUser objUser = new Business.BsUser();
			objUser.Id		= id;
			txtId.Text		= id+"";
			objUser.Name	= "";
			objUser.Login	= "";
			objUser.GetObject();

			txtAName.Text	= objUser.Name;
			txtALogin.Text	= objUser.Login;
			txtASenha.Text	= objUser.Password;
			txtACSenha.Text = objUser.Password;
			txtAEmail.Text	= objUser.Email;
			rdlAdmin2.SelectedValue	= objUser.Admin.ToString().ToLower();
		}

		private void clearFields()
		{
			txtIName.Text	= "";
			txtILogin.Text	= "";
			txtIEmail.Text	= "";
			txtICSenha.Text = "";
			txtId.Text		= "";
		}

		private void searchMemory()
		{
			enabledSearch();
			Business.BsUser objUser = new Business.BsUser();
			objUser.Login	= txtPLogin.Text;
			objUser.Name	= txtPName.Text;

			dgUsers.DataSource = objUser.GetObjects();			
			try
			{
				dgUsers.DataBind();
			}
			catch
			{
				dgUsers.CurrentPageIndex = 0;
				dgUsers.DataBind();
			}
		}

		private void Search()
		{
			enabledSearch();
			Business.BsUser objUser = new Business.BsUser();
			objUser.Login	= txtPLogin.Text;
			objUser.Name	= txtPName.Text;

			dgUsers.DataSource = objUser.GetObjects();			
			try
			{
				dgUsers.DataBind();
			}
			catch
			{
				dgUsers.CurrentPageIndex = 0;
				dgUsers.DataBind();
			}
		}

		private void searchObject(Object obj)
		{
			enabledSearch();
			dgUsers.DataSource = obj;			
			try
			{
				dgUsers.DataBind();
			}
			catch
			{
				dgUsers.CurrentPageIndex = 0;
				dgUsers.DataBind();
			}
		}

		private void saveConfigGroups( int id )
		{
			Business.BsGroups gps = new Business.BsGroups();
			int x = lstIGroups.Items.Count;
			string retn = "";
			if( Request[ "lstIAddGroups" ] != null ) retn = Request[ "lstIAddGroups" ].ToString();
			string [] list = retn.Split( new char[]{','} );
			lstIAddGroups.Items.Clear();

			for( int i=0; i<list.Length; i++ )
			{
				if( list[i] != "" )
				{
					Business.BsGroup ps = new Business.BsGroup();
					ps.Id = Convert.ToInt32( list[i] );
					ps.GetObject();				
					gps.Add( ps.Id, ps );
					lstIAddGroups.Items.Add( new ListItem( ps.Description, ps.Id + "" ) );
				}
			}

			Business.BsUser u = new Business.BsUser();
			u.Id = id;
			u.Group.AddGroupsByUser( gps, u );
			searchMemory();
		}

		#endregion

		#region " Events "
		private void btnCVoltarGroups_Click(object sender, System.EventArgs e)
		{
			searchMemory();
		}

		private void btnIncluir_Click(object sender, System.EventArgs e)
		{
			enabledInserted();
		}

		private void btnProcurar_Click(object sender, System.EventArgs e)
		{
			Search();
		}
		
		private void btnSaveGroups_Click(object sender, System.EventArgs e)
		{
			saveConfigGroups( Convert.ToInt32( txtId.Text ) );
		}

		private void btnInclu_Click(object sender, System.EventArgs e)
		{
			Business.BsUser objUser = new Business.BsUser();

			if( txtIName.Text == "" )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'Nome Obrigatório' )</script>" );
				return;
			}

			if( txtILogin.Text == "" )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'login Obrigatório' )</script>" );
				return;
			}

			if( txtISenha.Text == "" )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'Senha Obrigatório' )</script>" );
				return;
			}

			if( txtICSenha.Text == "" )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'Confirmação de senha Obrigatório' )</script>" );
				return;
			}

			if( txtIEmail.Text == "" )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'Email Obrigatório' )</script>" );
				return;
			}

			if( txtICSenha.Text != txtISenha.Text )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'Confirmação não cefere com a senha' )</script>" );
				return;
			}

			objUser.Name	= txtIName.Text;
			objUser.Login	= txtILogin.Text;
			objUser.Password	= txtICSenha.Text;
			objUser.Email	= txtIEmail.Text;
			objUser.Admin	= Convert.ToBoolean( rdlAdm.SelectedValue );

			objUser.SaveObject();

			RegisterStartupScript("inclu","<script>alert('Incluido com sucesso.')</script>");
			clearFields();
		}

		private void btnAlterar_Click(object sender, System.EventArgs e)
		{
			Business.BsUser objUser = new Business.BsUser();

			if( txtId.Text == "" )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'Id não encontrado' )</script>" );
				return;
			}			

			if( txtAName.Text == "" )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'Nome Obrigatório' )</script>" );
				return;
			}

			if( txtALogin.Text == "" )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'login Obrigatório' )</script>" );
				return;
			}

			if( txtAEmail.Text == "" )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'Email Obrigatório' )</script>" );
				return;
			}

			if( txtACSenha.Text != txtASenha.Text )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'Confirmação não cefere com a senha' )</script>" );
				return;
			}

			objUser.Id	= Convert.ToInt32(txtId.Text);
			objUser.Name	= txtAName.Text;
			objUser.Login	= txtALogin.Text;
			objUser.Password	= txtACSenha.Text;
			objUser.Email	= txtAEmail.Text;
			objUser.Admin	= Convert.ToBoolean( rdlAdmin2.SelectedValue );

			objUser.SaveObject();
			searchMemory();
		}

		private void dgUsers_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			dgUsers.CurrentPageIndex = e.NewPageIndex;
			searchMemory();
		}

		private void btnIVoltar_Click(object sender, System.EventArgs e)
		{
			searchMemory();
		}

		private void btnAVoltar_Click(object sender, System.EventArgs e)
		{
			searchMemory();
		}
		
		private void dgUsers_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if( e.Item.ItemType != ListItemType.Footer && e.Item.ItemType != ListItemType.Header )
			{
				Business.BsUser u = ((Business.BsUser)DataBinder.Eval(e.Item.DataItem, "Value"));				
				e.Item.Cells[0].Text = u.Name;
				e.Item.Cells[1].Text = u.Login;
			}
		}

		#endregion
	}
}
