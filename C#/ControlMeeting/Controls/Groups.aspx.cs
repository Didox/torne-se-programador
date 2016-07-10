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

namespace Manager
{
	public class Groups1 : System.Web.UI.Page
	{
		#region " Controls "
		protected System.Web.UI.WebControls.Button btnIncluir;
		protected System.Web.UI.WebControls.Label LblTitPesq;
		protected System.Web.UI.WebControls.Label lblNome;
		protected System.Web.UI.WebControls.Button btnProcurar;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbPesq;
		protected System.Web.UI.WebControls.LinkButton btnAlt;
		protected System.Web.UI.WebControls.LinkButton btnExc;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend1;
		protected System.Web.UI.HtmlControls.HtmlGenericControl legend;
		protected System.Web.UI.WebControls.Label lblTitIncluir;
		protected System.Web.UI.WebControls.Label lbliNome;
		protected System.Web.UI.WebControls.TextBox txtId;
		protected System.Web.UI.WebControls.Button btnInclu;
		protected System.Web.UI.WebControls.Button btniVoltar;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbInclu;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend2;
		protected System.Web.UI.WebControls.TextBox txtDescription;
		protected System.Web.UI.WebControls.TextBox txtIDescription;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfiDesciption;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Button btnSave;
		protected System.Web.UI.WebControls.Button btnCVoltar;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbConfig;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend3;
		protected System.Web.UI.WebControls.DataGrid dgGroups;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.ListBox lstIFolders;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.ListBox lstIUsers;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Button btnSaveUsers;
		protected System.Web.UI.WebControls.Button btnCVoltarUsers;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbConfigUser;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend4;
		protected System.Web.UI.HtmlControls.HtmlSelect lstIAddUsers;
		protected System.Web.UI.HtmlControls.HtmlSelect lstIAdd;
		private Business.BsUser usr;

		#endregion
	
		#region " Page Load "
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
				if( Request["CommandName"] != null && Request["CommandName"] == "Alter" )
					getData(Convert.ToInt32(Request["id"]));
				else if( Request["CommandName"] == "Config" )
					getConfig( Convert.ToInt32( Request["id"] ), Convert.ToInt32( "0" + Request["paran"] ) );
				else if( Request["CommandName"] != null && Request["CommandName"] == "Exclude" )
				{
					Business.BsGroup g = new Business.BsGroup();
					g.Id = Convert.ToInt32( Request["id"] );
					g.GetObject();
					g.ExcludeObject();
					searchMemory();
				}
				else searchMemory();
			}
		}

		#endregion

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
			this.dgGroups.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgGroups_ItemDataBound);
			this.btnInclu.Click += new System.EventHandler(this.btnInclu_Click);
			this.btniVoltar.Click += new System.EventHandler(this.btniVoltar_Click);
			this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
			this.btnCVoltar.Click += new System.EventHandler(this.btnCVoltar_Click);
			this.btnSaveUsers.Click += new System.EventHandler(this.btnSaveUsers_Click);
			this.btnCVoltarUsers.Click += new System.EventHandler(this.btnCVoltarUsers_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		#region " Events "
		private void enabledSearch()
		{
			tbPesq.Visible = true;
			tbInclu.Visible = false;
			tbConfig.Visible = false;
			tbConfigUser.Visible = false;
		}

		private void fields()
		{
			tbInclu.Visible = true;
			tbPesq.Visible = false;
			tbConfig.Visible = false;
			tbConfigUser.Visible = false;
			clearFields();
		}

		private void config( int id, int paran )
		{
			tbInclu.Visible = false;
			tbPesq.Visible = false;
			if( paran == 0 )
			{
				setComboFolders();
				tbConfig.Visible = true;
				tbConfigUser.Visible = false;
			}
			else
			{
				setComboUsers();
				tbConfig.Visible = false;
				tbConfigUser.Visible = true;
			}
			txtId.Text = id + "";
		}

		private void setComboFolders()
		{
			Business.BsFolder f = new Business.BsFolder();
			Business.BsFolders fs = f.GetObjects();			
			for( int i=0; i<fs.Count; i++ )
				lstIFolders.Items.Add( new ListItem( fs[i].Name, fs[i].Id + "" ) );	
		}

		private void setComboUsers()
		{
			Business.BsUser u = new Business.BsUser();
			Business.BsUsers us = u.GetObjects();			
			for( int i=0; i<us.Count; i++ )
				lstIUsers.Items.Add( new ListItem( us[i].Name, us[i].Id + "" ) );	
		}
		
		private void saveConfig( int id )
		{
			Business.BsFolders fs = new Business.BsFolders();
			int x = lstIFolders.Items.Count;
			string retn = "";
			if( Request[ "lstIAdd" ] != null ) retn = Request[ "lstIAdd" ].ToString();
			string [] list = retn.Split( new char[]{','} );
			lstIAdd.Items.Clear();

			for( int i=0; i<list.Length; i++ )
			{
				if( list[i] != "" )
				{
					Business.BsFolder ps = new Business.BsFolder();
					ps.Id = Convert.ToInt32( list[i] );
					ps.GetObject();				
					fs.Add( ps.Id, ps );
					lstIAdd.Items.Add( new ListItem( ps.Name, ps.Id + "" ) );
				}
			}

			Business.BsGroup g = new Business.BsGroup();
			g.Id = id;
			g.Folder.AddFoldersByGroup( fs, g );
			searchMemory();
		}
		
		private void saveConfigUsers( int id )
		{
			Business.BsUsers us = new Business.BsUsers();
			int x = lstIUsers.Items.Count;
			string retn = "";
			if( Request[ "lstIAddUsers" ] != null ) retn = Request[ "lstIAddUsers" ].ToString();
			string [] list = retn.Split( new char[]{','} );
			lstIAddUsers.Items.Clear();

			for( int i=0; i<list.Length; i++ )
			{
				if( list[i] != "" )
				{
					Business.BsUser ps = new Business.BsUser();
					ps.Id = Convert.ToInt32( list[i] );
					ps.GetObject();				
					us.Add( ps.Id, ps );
					lstIAddUsers.Items.Add( new ListItem( ps.Name, ps.Id + "" ) );
				}
			}

			Business.BsGroup g = new Business.BsGroup();
			g.Id = id;
			g.User.AddUsersByGroup( us, g );
			searchMemory();
		}	

		private void searchMemory()
		{
			enabledSearch();
			Business.BsGroup g = new Business.BsGroup();
			
			dgGroups.DataSource = g.GetObjects();
			dgGroups.DataBind();
		}

		private void search()
		{
			enabledSearch();
			Business.BsGroup g = new Business.BsGroup();
			g.Description = txtDescription.Text;
			
			dgGroups.DataSource = g.GetObjects();
			dgGroups.DataBind();
		}

		private void searchObject(Object obj)
		{
			enabledSearch();
			dgGroups.DataSource = obj;
			dgGroups.DataBind();
		}

		private void getConfig( int id, int paran )
		{			
			config( id, paran );
			if( paran == 0 )
			{
				Business.BsFolder f = new Business.BsFolder();			
				f.Groups.Add( id, new Business.BsGroup(id) );
				Business.BsFolders fs = f.GetObjectsByGroups();

				lstIAdd.Items.Clear();
				for( int i=0; i<fs.Count; i++ )
				{
					ListItem l = new ListItem( fs[i].Name, fs[i].Id + "" );
					lstIAdd.Items.Add( l );
					lstIFolders.Items.Remove( l );
				}
			}
			else
			{
				Business.BsUser u = new Business.BsUser();
				u.Groups.Add( id, new Business.BsGroup(id) );
				Business.BsUsers us = u.GetObjectsByGroups();

				lstIAddUsers.Items.Clear();
				for( int i=0; i<us.Count; i++ )
				{
					ListItem l = new ListItem( us[i].Name, us[i].Id + "" );
					lstIAddUsers.Items.Add( l );
					lstIUsers.Items.Remove( l );
				}
			}
		}

		private void getData( int id )
		{
			fields();
			Business.BsGroup p = new Business.BsGroup();
			p.Id = id;
			txtId.Text = id + "";
			p.GetObject();

			txtIDescription.Text = p.Description;
		}

		private void clearFields()
		{		
			txtId.Text				= "";
			txtIDescription.Text	= "";
		}

		#endregion

		#region " Metods "
		private void btnIncluir_Click(object sender, System.EventArgs e)
		{
			fields();
		}

		private void btnProcurar_Click(object sender, System.EventArgs e)
		{
			search();
		}	

		private void btnSave_Click(object sender, System.EventArgs e)
		{
			saveConfig( Convert.ToInt32( txtId.Text ) );
		}

		private void btnInclu_Click(object sender, System.EventArgs e)
		{
			if( txtIDescription.Text == "" )
			{
				RegisterClientScriptBlock( "err", "<script>alert( 'Descrição Obrigatória' )</script>" );
				return;
			}

			Business.BsGroup g = new Business.BsGroup();
			g.Description	= txtIDescription.Text;

			g.Id = Convert.ToInt32( "0" + txtId.Text );
			g.SaveObject();
			
			if( txtId.Text != "" )
			{
				RegisterStartupScript("inclu","<script>alert('Registro Salvo.')</script>");
				clearFields();
			}
			else search();
		}

		private void btniVoltar_Click(object sender, System.EventArgs e)
		{
			searchMemory();
		}

		private void btnavoltar_Click(object sender, System.EventArgs e)
		{
			searchMemory();
		}

		private void btnCVoltar_Click(object sender, System.EventArgs e)
		{
			searchMemory();
		}

		private void btnSaveUsers_Click(object sender, System.EventArgs e)
		{
			saveConfigUsers( Convert.ToInt32( txtId.Text ) );
		}
	
		private void btnCVoltarUsers_Click(object sender, System.EventArgs e)
		{
			searchMemory();
		}	

		private void dgGroups_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{		
			if( e.Item.ItemType != ListItemType.Footer && e.Item.ItemType != ListItemType.Header )
			{
				Business.BsGroup g = ((Business.BsGroup)DataBinder.Eval(e.Item.DataItem, "Value"));				
				e.Item.Cells[0].Text = g.Description;
			}
		}

		#endregion
	}
}
