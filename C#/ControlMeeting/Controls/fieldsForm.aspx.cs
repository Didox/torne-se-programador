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
	public class fieldsForm : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button btnIncluir;
		protected System.Web.UI.WebControls.Label Label1;
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
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend2;
		protected System.Web.UI.WebControls.DataGrid dgGroups;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.DropDownList ddlTypeField;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.DropDownList ddlObject;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.DropDownList ddlMask;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.TextBox txtSize;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.DropDownList ddlPosicao;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.RadioButtonList rdlCompulsory;
		protected System.Web.UI.WebControls.RadioButtonList rdlPreview;
		protected System.Web.UI.WebControls.RadioButtonList rdlDetail;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbTamanho;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbMasck;
		private int idForm;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.RadioButtonList rdlExceptions;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.ListBox lstIGroups;
		protected System.Web.UI.WebControls.Label Label14;
		protected System.Web.UI.WebControls.Button btnSaveGroups;
		protected System.Web.UI.WebControls.Button btnCVoltarGroups;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbConfigGroup;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend4;
		protected System.Web.UI.HtmlControls.HtmlSelect lstIAddGroups;
		protected System.Web.UI.WebControls.Label Label15;
		protected System.Web.UI.WebControls.Button btnSalveOrder;
		protected System.Web.UI.WebControls.Button btnVolteOrder;
		protected System.Web.UI.HtmlControls.HtmlTableRow tbConfigOrdens;
		protected System.Web.UI.HtmlControls.HtmlGenericControl Legend3;
		protected System.Web.UI.WebControls.ListBox ltbOrdens;
		private Business.BsUser usr;
	
		private void Page_Load(object sender, System.EventArgs e)
		{			
			if( ! Business.BsUser.UserOn() )
			{
				Response.Write( "<script>alert( 'Sua sessão expirou!' );top.login();</script>" );
				Response.End();	
			}
			else usr = Business.BsUser.GetUserOn();

			if( Request["idForm"] != null ) idForm = Convert.ToInt32( Request["idForm"] );
			else idForm = Convert.ToInt32( Session["idForm"] );
			Session["idForm"] = idForm;

			btnSaveGroups.Attributes.Add( "onclick","checkedAll( 'lstIAddGroups' );" );
			btnSalveOrder.Attributes.Add( "onclick","checkedAll( 'ltbOrdens' );" );			

			if( !IsPostBack )
			{
				if( Request["CommandName"] == "Alter" ) getData( Convert.ToInt32( Request["id"] ) );
				else if( Request["CommandName"] == "Config" ) getConfig( Convert.ToInt32( Request["id"] ) );
				else if( Request["configOrdens"] == "true" ) getConfigOrdens();
				else if( Request["CommandName"] == "Exclude" ) delField( Convert.ToInt32( Request["id"] ) );
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
			this.btnIncluir.Click += new System.EventHandler(this.btnIncluir_Click);
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.btnSaveGroups.Click += new System.EventHandler(this.btnSaveGroups_Click);
			this.btnCVoltarGroups.Click += new System.EventHandler(this.btnCVoltarGroups_Click);
			this.btnSalveOrder.Click += new System.EventHandler(this.btnSalveOrder_Click);
			this.btnVolteOrder.Click += new System.EventHandler(this.btnVolteOrder_Click);
			this.btnInclu.Click += new System.EventHandler(this.btnInclu_Click);
			this.btniVoltar.Click += new System.EventHandler(this.btniVoltar_Click);
			this.dgGroups.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgGroups_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect( "createForm.aspx" );
		}
		private void enabledSearch()
		{
			tbPesq.Visible = true;
			tbInclu.Visible = false;
			tbConfigGroup.Visible = false;
			tbConfigOrdens.Visible = false;
		}

		private void getConfigOrdens()
		{
			tbPesq.Visible = false;
			tbInclu.Visible = false;
			tbConfigGroup.Visible = false;
			tbConfigOrdens.Visible = true;

			Business.BsFields fields = new Business.BsField(new Business.BsForm(idForm)).GetObjects();
			for( int i=0; i<fields.Count; i++ )
				ltbOrdens.Items.Add( new ListItem(fields[i].Name, fields[i].Id.ToString()) );
		}

		private void fields()
		{
			ddlTypeField.Enabled = true;
			tbConfigGroup.Visible = false;
			ddlObject.Enabled = true;
			txtSize.Enabled = true;
			tbInclu.Visible = true;
			tbPesq.Visible = false;	
			tbConfigOrdens.Visible = false;
			tbMasck.Attributes.Add( "style","display:block" );
			clearFields();
		}

		private void config( int id )
		{
			tbInclu.Visible = false;
			tbConfigOrdens.Visible = false;
			tbPesq.Visible = false;
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
			gp.Fields.Add( id, new Business.BsField(id) );
			Business.BsGroups gps = gp.GetObjectsByFields();

			lstIAddGroups.Items.Clear();
			for( int i=0; i<gps.Count; i++ )
			{
				ListItem l = new ListItem( gps[i].Description, gps[i].Id + "" );
				lstIAddGroups.Items.Add( l );
				lstIGroups.Items.Remove( l );
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

			Business.BsField fd = new Business.BsField();
			fd.Id = id;
			fd.Group.AddGroupsByField( gps, fd );
			search();
		}

		private void getData( int id )
		{
			fields();
			Business.BsField fd = new Business.BsField(id).GetObject();
			ddlTypeField.Enabled = false;
			ddlObject.Enabled = false;

			if( fd.Id > 0 )
			{
				txtIDescription.Text = fd.Name;
				txtId.Text = fd.Id.ToString();
				txtSize.Text = fd.Size.ToString();

				if( ddlTypeField.Items.Contains( ddlTypeField.Items.FindByValue( fd.Type.Id + "" ) ) )
					ddlTypeField.SelectedValue = fd.Type.Id.ToString();

				if( ddlTypeField.SelectedValue == "5" )
					tbTamanho.Attributes.Add( "style","display:block" );
				else
					tbTamanho.Attributes.Add( "style","display:none" );

				if( ddlObject.Items.Contains( ddlObject.Items.FindByValue( fd.TypeObject.Id + "" ) ) )
					ddlObject.SelectedValue = fd.TypeObject.Id.ToString();

				if( ddlObject.SelectedValue == "1" )
					tbMasck.Attributes.Add( "style","display:block" );
				else
					tbMasck.Attributes.Add( "style","display:none" );

				if( fd.TypeObject.Id == 3 || fd.TypeObject.Id == 6 )
					txtSize.Enabled = false;

				if( ddlMask.Items.Contains( ddlMask.Items.FindByValue( fd.Mask.Id + "" ) ) )
					ddlMask.SelectedValue = fd.Mask.Id.ToString();

				if( ddlPosicao.Items.Contains( ddlPosicao.Items.FindByValue( fd.Orders + "" ) ) )
					ddlPosicao.SelectedValue = fd.Orders.ToString();

				if( rdlCompulsory.Items.Contains( rdlCompulsory.Items.FindByValue( fd.Compulsory.ToString().ToLower() ) ) )
					rdlCompulsory.SelectedValue = fd.Compulsory.ToString().ToLower();

				if( rdlPreview.Items.Contains( rdlPreview.Items.FindByValue( fd.Preview.ToString().ToLower() ) ) )
					rdlPreview.SelectedValue = fd.Preview.ToString().ToLower();

				if( rdlDetail.Items.Contains( rdlDetail.Items.FindByValue( fd.Detail.ToString().ToLower() ) ) )
					rdlDetail.SelectedValue = fd.Detail.ToString().ToLower();

				if( rdlExceptions.Items.Contains( rdlExceptions.Items.FindByValue( fd.Exceptions.ToString().ToLower() ) ) )
					rdlExceptions.SelectedValue = fd.Exceptions.ToString().ToLower();
			}
		}

		private void delField( int id )
		{
			Business.BsField f = new Business.BsField();
			f.Id = id;
			f.ExcludeObject();
			search();
		}

		private void search()
		{
			enabledSearch();
			dgGroups.DataSource = new Business.BsField(new Business.BsForm(idForm)).GetObjects();
			dgGroups.DataBind();
		}

		private void clearFields()
		{		
			txtId.Text				= "";
			txtIDescription.Text	= "";
			txtSize.Text = "";
			bindCompos();
		}

		private void bindCompos()
		{
			Business.BsTypeField tf = new Business.BsTypeField();
			Business.BsTypeFields tfs = tf.GetObjects();
			ddlTypeField.Items.Clear();
			for( int i=0; i<tfs.Count; i++ )
				ddlTypeField.Items.Insert( i, new ListItem( tfs[i].Description, tfs[i].Id + "" ) );
			
			Business.BsTypeObject to = new Business.BsTypeObject();
			Business.BsTypeObjects tos = to.GetObjects();
			ddlObject.Items.Clear();
			for( int i=0; i<tos.Count; i++ )
				ddlObject.Items.Insert( i, new ListItem( tos[i].Description, tos[i].Id + "" ) );

			Business.BsMask m = new Business.BsMask();
			Business.BsMasks ms = m.GetObjects();
			ddlMask.Items.Clear();
			for( int i=0; i<ms.Count; i++ )
				ddlMask.Items.Insert( i, new ListItem( ms[i].Description, ms[i].Id + "" ) );
			ddlMask.Items.Insert( 0, new ListItem( "[Sem mascara]", "0" ) );

			int cont = Business.BsField.CountFieldsByForm(new Business.BsForm(idForm) );			
			ddlPosicao.Items.Clear();
			for( int i=0; i<=cont; i++ )
				ddlPosicao.Items.Insert( i, new ListItem( i + "", i + "" ) );

			rdlCompulsory.SelectedValue = "true";
			rdlPreview.SelectedValue = "true";
			rdlDetail.SelectedValue = "true";
			rdlExceptions.SelectedValue = "false";
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
			Business.BsField f = new Business.BsField();
			f.Id = Convert.ToInt32( "0" + txtId.Text );
			f.GetObject();
			int size = Convert.ToInt32( "0" + txtSize.Text );
			int type = Convert.ToInt32( "0" + ddlTypeField.SelectedValue );

			if( size < f.Size )
			{
				RegisterClientScriptBlock( "ok", "<script>alert( 'Tamanho do campo não é permitido diminuir.' )</script>" );
				return;
			}
			else if( size == 0 && type == 5 )
			{
				RegisterClientScriptBlock( "ok", "<script>alert( 'Tamanho não pode ser zero.' )</script>" );
				return;
			}
			else if( type == 3 && ddlMask.SelectedValue != "5" )
			{
				RegisterClientScriptBlock( "ok", "<script>alert( 'Para campo data é obrigatório selecionar máscara de data.' )</script>" );
				return;
			}

			f.Form.Id = idForm;
			f.Name = txtIDescription.Text;
			f.Size = size;
			f.Type.Id = type;
			f.TypeObject.Id = Convert.ToInt32( "0" + ddlObject.SelectedValue );
			f.Mask.Id = Convert.ToInt32( "0" + ddlMask.SelectedValue );
			f.Orders  = Convert.ToInt32( "0" + ddlPosicao.SelectedValue );
			f.Compulsory = Convert.ToBoolean( rdlCompulsory.SelectedValue );
			f.Preview = Convert.ToBoolean( rdlPreview.SelectedValue );
			f.Detail = Convert.ToBoolean( rdlDetail.SelectedValue );
			f.Exceptions = Convert.ToBoolean( rdlExceptions.SelectedValue );
			f.SaveObject();

			if( txtId.Text == "" )
			{
				RegisterClientScriptBlock( "ok", "<script>alert( 'Campo cadastrado.' )</script>" );
				clearFields();
			}
			else search();
		}

		private void dgGroups_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			Business.BsField f = new Business.BsField( Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "Key")) ).GetObject();
			if( f.TypeObject.Id != 2 && f.TypeObject.Id != 3 && f.TypeObject.Id != 4 && f.TypeObject.Id != 6 )
				e.Item.Cells[6].Text = "";
			if( ! f.Exceptions )
				e.Item.Cells[5].Text = "";
		}

		private void btnCVoltarGroups_Click(object sender, System.EventArgs e)
		{
			search();
		}

		private void btnSaveGroups_Click(object sender, System.EventArgs e)
		{
			saveConfigGroups( Convert.ToInt32( txtId.Text ) );
		}

		private void btnSalveOrder_Click(object sender, System.EventArgs e)
		{
			string retn = "";			
			if( Request[ "ltbOrdens" ] != null ) retn = Request[ "ltbOrdens" ].ToString();
			string [] list = retn.Split( new char[]{','} );
			
			for( int i=0; i<list.Length; i++ )
				if( list[i] != "" )
					Business.BsField.AlterPosition( new Business.BsField(int.Parse(list[i])), i );

			search();
		}

		private void btnVolteOrder_Click(object sender, System.EventArgs e)
		{
			search();
		}
	}
}
