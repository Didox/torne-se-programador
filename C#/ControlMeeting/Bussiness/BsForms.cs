using System;
using System.Collections;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Business
{
	#region " Class BsForms "
	public class BsForms : BsObjectList
	{
		public BsForm this[int i_]
		{
			get{ return ( BsForm )(((DictionaryEntry)this.List[i_]).Value);}
		}	

		public BsForm GetKey( int key_ )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key_ ) )
					return ( BsForm )dE.Value;
			}
			return null;
		}
	}
	#endregion

	#region " Class BsForm "
	public class BsForm
	{
		#region " Constructor "
		public BsForm(){}
		public BsForm(int id_){_id = id_;}
		public BsForm(BsFolder folder_){_folder = folder_;}
		public BsForm(int id_, string name_, BsFolder folder_, BsItensForm itensForm_, BsUser user_, bool anexo_ )
		{
			_id = id_;
			_name = name_;
			_folder = folder_;
			_itensForm = itensForm_;
			_user = user_;
			_anexo = anexo_;
		}
		#endregion

		#region " Destructor "
		~BsForm(){}
		#endregion

		#region " Attributes "
		private int			_id = 0;
		private string		_name = "";
		private bool		_anexo = false;
		private bool		_enabledDate = true;
		private bool		_enabledUser = true;	
		private BsFolder	_folder;
		private BsItensForm	_itensForm;
		private BsUser		_user;

		#endregion
	
		#region " Properties "
		public int Id			
		{
			get{ return _id; }
			set{ _id = value; }
		}
		
		public string Name			
		{
			get{ return _name; }
			set{ _name = value; }
		}

		public bool Anexo			
		{
			get{ return _anexo; }
			set{ _anexo = value; }
		}

		public bool EnabledDate			
		{
			get{ return _enabledDate; }
			set{ _enabledDate = value; }
		}

		public bool EnabledUser			
		{
			get{ return _enabledUser; }
			set{ _enabledUser = value; }
		}

		public BsFolder Folder		
		{
			get
			{
				if( _folder == null ) _folder = new BsFolder();
				return _folder;
			}
		}

		public BsUser User
		{
			get
			{
				if( _user == null ) _user = new BsUser();
				return _user;
			}
		}

		public BsItensForm Itens			
		{
			get
			{
				if( _itensForm == null )
				{
					if( _id != 0 )
					{
						BsItemForm _itenForm = new BsItemForm();
						_itenForm.Form.Id = _id;
						_itensForm = _itenForm.GetObjects();
					}
					else _itensForm = new BsItensForm();
				}
				return _itensForm; 
			}			
			set{ _itensForm = value; }
		}

		#endregion

		#region " Medods statics "
		public static void SaveForm( int idForm, string name, BsUser u, bool anexo, bool enabledDate, bool enabledUser ){Database.DaForms.SaveForm( ref idForm ,name, u.Id, anexo, enabledDate, enabledUser );}

		public static void DelForm( int idForm ){Database.DaForms.DelForm( idForm );}

		#endregion
 
		#region " Events "

		public void AlterFormLocation( BsFolder fNew ){ Database.DaForms.AlterFormLocation( _id, Folder.Id, fNew.Id ); }

		#region " Create Controls "
		private void setTextBox( ref HtmlTableRow tbRow, ref BsField f, ref BsItemForm item, ref string calendar, string sId, bool and )
		{
			TextBox t = new TextBox();
			string nameCampo = "txtCampo" + f.Id.ToString() + sId;
			t.ID = nameCampo;
			t.Width = Unit.Pixel( f.Size * 7 );
			t.MaxLength = f.Size;				
			t.Attributes.Add( "validar", f.Compulsory.ToString().ToLower() );
			t.Attributes.Add( "msgName", f.Name );

			if( f.Mask.DesMask != "" && f.Mask.Id != 8 )
				t.Attributes.Add( "onkeypress","return formatValue( this , '" + f.Mask.DesMask + "' )" );
			else if( f.Mask.Id == 8 )
				t.Attributes.Add( "onkeypress","return Formata(this,20,event,2)" );
						
			if( item.Id > 0 )
			{
				t.Text = item.GFields.GetKey( f ).Value;
				BsUser usr = BsUser.GetUserOn();
				if( usr != null && ( item.User.Id != usr.Id && ! usr.Admin ) ) t.Enabled = f.ExceptionsUser;
			}

			if( and )
			{
				HtmlTableCell tbCelAnd = new HtmlTableCell();
				tbRow.Controls.Add( tbCelAnd );
				tbCelAnd.InnerHtml = "&nbsp;Até&nbsp;";
			}

			if( f.Mask.Id == 5 )
			{
				t.Attributes.Add( "isDate", "true" );
				calendar += "addCalendar(\"c" + nameCampo + "\", \"" + f.Name + "\", \"" + nameCampo + "\", \"Form1\");";
				
				t.Attributes.Add( "onblur", "dateValidate(this)" );
				
				HtmlTableCell tbCel = new HtmlTableCell();
				HtmlTableCell tbCel2 = new HtmlTableCell();
			
				tbRow.Controls.Add( tbCel );
				tbRow.Controls.Add( tbCel2 );

				tbCel.Width = "1";
				tbCel.Controls.Add( t );							
				tbCel2.Attributes.Add( "style", "cursor:hand" );
				tbCel2.Attributes.Add( "onclick", "showCal('c" + nameCampo + "','Form1')" );
							
				HtmlImage img = new HtmlImage();
				img.Src =  "../imagens/calendar.jpg";
				img.Border = 0;

				tbCel2.Controls.Add( img );
			}
			else
			{
				HtmlTableCell tbCel = new HtmlTableCell();
				tbRow.Controls.Add( tbCel );
				tbCel.Controls.Add( t );
			}
		}

		private string createTextBox( ref HtmlTableCell c2, int i, BsField f, BsItemForm item, bool activeSearch )
		{
			string calendar = "";
			HtmlTable tb = new HtmlTable();
			HtmlTableRow tbRow = new HtmlTableRow();

			setTextBox( ref tbRow, ref f, ref item, ref calendar, "", false );
			if( activeSearch && ( f.Type.Id == 3 || f.Type.Id == 7 || f.Type.Id == 9 ) )
				setTextBox( ref tbRow, ref f, ref item, ref calendar, "-End", true );
	
			tb.Border = 0;
			tb.CellPadding = 0;
			tb.CellSpacing = 0;
			tb.Controls.Add( tbRow );
			c2.Controls.Add( tb );
			
			return calendar;
		}

		private void createRadioButton( ref HtmlTableCell c2, int i, BsField f, BsItemForm item )
		{
			RadioButtonList rbu = new RadioButtonList();
			rbu.RepeatColumns = 5;
			rbu.RepeatDirection = RepeatDirection.Horizontal;
			rbu.ID = "txtCampo" + f.Id.ToString();
			rbu.Attributes.Add( "msgName", f.Name );
			rbu.Attributes.Add( "validar", f.Compulsory.ToString() );

			Business.BsItemField iten = new Business.BsItemField();
			iten.Field.Id = f.Id;
			Business.BsItensField itens = iten.GetObjects();
			for( int x=0; x<itens.Count; x++ )
				rbu.Items.Insert( x, new ListItem( itens[x].Value, itens[x].Value + "" ) );
			if( itens.Count > 0 ) rbu.Items[0].Selected = true;

			if( item.Id > 0 )
			{
				if( rbu.Items.Contains(  rbu.Items.FindByValue( item.GFields.GetKey( f ).Value ) ) )
					rbu.SelectedValue = item.GFields.GetKey( f ).Value;	

				BsUser usr = BsUser.GetUserOn();
				if( usr != null && ( item.User.Id != usr.Id && ! usr.Admin ) ) rbu.Enabled = f.ExceptionsUser;		
			}

			c2.Controls.Add( rbu );
		}

		private void createCheckBox( ref HtmlTableCell c2, int i, BsField f, BsItemForm item )
		{
			HtmlTable table = new HtmlTable();
			HtmlTableRow tr = new HtmlTableRow();

			Business.BsItemField iten1 = new Business.BsItemField();
			iten1.Field.Id = f.Id;
			Business.BsItensField itens1 = iten1.GetObjects();

			for( int x=0; x<itens1.Count; x++ )
			{				
				HtmlTableCell td = new HtmlTableCell();
				HtmlTableCell td2 = new HtmlTableCell();
				td2.InnerText = itens1[x].Value;

				HtmlInputCheckBox cb= new HtmlInputCheckBox();
				cb.ID = "txtCampo" + f.Id + "-" + x;
				cb.Name = "txtCampo" + f.Id;
				cb.Attributes.Add( "msgName", f.Name );
				cb.Attributes.Add( "validar", f.Compulsory.ToString().ToLower() );
				cb.Value = itens1[x].Value;

				td.Controls.Add(cb);
				tr.Controls.Add( td );
				tr.Controls.Add( td2 );

				if( item.Id > 0 )
				{
					string[] arrValues = item.GFields.GetKey( f ).Value.Split( new Char[]{','} );
					for( int j=0; j<arrValues.Length; j++ )
					{
						if( cb.Value == arrValues[j].Replace("&nbsp;","") )
							cb.Checked = true;
					}

					BsUser usr = BsUser.GetUserOn();
					if( usr != null && ( item.User.Id != usr.Id && ! usr.Admin ) ) cb.Disabled = !f.ExceptionsUser;
				}
			}
			
			table.Controls.Add( tr );
			c2.Controls.Add( table );
		}

		private void createDropDown( ref HtmlTableCell c2, int i, BsField f, BsItemForm item )
		{
			DropDownList dl = new DropDownList();
			dl.ID = "txtCampo" + f.Id.ToString();
			dl.Attributes.Add( "msgName", f.Name );
			dl.Attributes.Add( "validar", f.Compulsory.ToString().ToLower() );

			Business.BsItensField itens2 = new Business.BsItemField(f).GetObjects();
			for( int x=0; x<itens2.Count; x++ )
				dl.Items.Insert( x, new ListItem( itens2[x].Value, itens2[x].Value + "" ) );
			dl.Items.Insert( 0, new ListItem( "[Selecione]", "0" ) );

			if( item.Id > 0 )
			{
				if( dl.Items.Contains(  dl.Items.FindByValue( item.GFields.GetKey( f ).Value ) ) )
					dl.SelectedValue = item.GFields.GetKey( f ).Value.Trim();

				BsUser usr = BsUser.GetUserOn();
				if( usr != null && ( item.User.Id != usr.Id && ! usr.Admin ) ) dl.Enabled = f.ExceptionsUser;
			}

			c2.Controls.Add( dl );
		}

		private void createTextBoxMulti( ref HtmlTableCell c2, int i, BsField f, BsItemForm item )
		{
			TextBox textMult = new TextBox();
			textMult.Width = Unit.Pixel( 400 );
			textMult.Height = Unit.Pixel( 150 );
			textMult.TextMode = TextBoxMode.MultiLine;
			textMult.ID = "txtCampo" + f.Id.ToString();
			textMult.Attributes.Add( "msgName", f.Name );
			textMult.Attributes.Add( "validar", f.Compulsory.ToString().ToLower() );
						
			if( item.Id > 0 )
			{
				textMult.Text = item.GFields.GetKey( f ).Value;
				BsUser usr = BsUser.GetUserOn();
				if( usr != null && ( item.User.Id != usr.Id && ! usr.Admin ) ) textMult.Enabled = f.ExceptionsUser;
			}
						
			c2.Controls.Add( textMult );
		}

		private void createListBox( ref HtmlTableCell c2, int i, BsField f, BsItemForm item )
		{
			ListBox tl = new ListBox();
			tl.ID = "txtCampo" + f.Id.ToString();
			tl.SelectionMode = ListSelectionMode.Multiple;
			tl.Attributes.Add( "msgName", f.Name.ToString() );
			tl.Attributes.Add( "validar", f.Compulsory.ToString().ToLower() );

			Business.BsItensField itens3 = new Business.BsItemField(f).GetObjects();
			for( int x=0; x<itens3.Count; x++ )
				tl.Items.Insert( x, new ListItem( itens3[x].Value, itens3[x].Value + "" ) );

			if( item.Id > 0 )
			{
				for( int t=0; t<tl.Items.Count; t++ )
				{
					string[] arrValues = item.GFields.GetKey( f ).Value.Split( new Char[]{','} );
					for( int j=0; j<arrValues.Length; j++ )
					{
						if( tl.Items[t].Value == arrValues[j] )
							tl.Items[t].Selected = true;
					}
				}

				BsUser usr = BsUser.GetUserOn();
				if( usr != null && ( item.User.Id != usr.Id && ! usr.Admin ) ) tl.Enabled = f.ExceptionsUser;
			}
						
			c2.Controls.Add( tl );
		}

		#endregion

		public string MountForm( HtmlTable tbFormMount, bool activeSearch )
		{
			BsFields fds = new Business.BsField(this).GetObjects();
			if( Itens.Count > 0 )
			{
				Itens[0].Form = this;
				Itens[0].GetObject();
			}
			else _itensForm.Add(0, new BsItemForm());

			string calendar = "";

			for( int i=0; i< fds.Count; i++ )
			{
				HtmlTableRow r = new HtmlTableRow();
				HtmlTableCell c1 = new HtmlTableCell();
				HtmlTableCell c2 = new HtmlTableCell();
			
				r.Controls.Add( c1 );
				r.Controls.Add( c2 );
				tbFormMount.Controls.Add( r );

				c1.Width = "35%";
				c1.InnerHtml = "<nobr>" + fds[i].Name + "</nobr>";

				switch( fds[i].TypeObject.Id )
				{
					case 1:
						calendar += createTextBox( ref c2, i, fds[i], Itens[0], activeSearch );
						break;
					case 2:
						createRadioButton( ref c2, i, fds[i], Itens[0] );
						break;
					case 3:
						createCheckBox( ref c2, i, fds[i], Itens[0] );
						break;
					case 4:
						createDropDown( ref c2, i, fds[i], Itens[0] );
						break;
					case 5:
						createTextBoxMulti( ref c2, i, fds[i], Itens[0] );
						break;
					case 6:
						createListBox( ref c2, i, fds[i], Itens[0] );
						break;				
				}
				
				c2.Width = "65%";
			}

			return calendar;
		}

		private BsForm setObject( BsForm f_, DataRow dr_ )
		{
			f_._id		= Convert.ToInt32( dr_["idForm"] );
			f_._name	= dr_["name"].ToString();
			f_.User.Id	= Convert.ToInt32( dr_["idUser"] );
			f_._anexo	= Convert.ToBoolean( dr_["anexo"] );
			f_._enabledDate	= Convert.ToBoolean( dr_["enabledDate"] );
			f_._enabledUser	= Convert.ToBoolean( dr_["enabledUser"] );
			
			return f_;
		}
		
		public BsForms GetObjectsDifferentFolder()
		{
			DataTable dt = Database.DaForms.GetFormsNotIdFolder( Folder.Id );
			return addObjectsList( dt );
		}

		public BsForm GetObject()
		{	
			if( _id <= 0 ) return this;
			DataTable dt = Database.DaForms.GetForms( _id, Folder.Id, _name );	
			if( dt.Rows.Count > 0 )
				setObject( this, dt.Rows[0] );
			else _id = 0;
			return this;
		}

		public void ExcludeObject()
		{
			if( _id <= 0 ) throw new Exception( "id not found. " );
			Database.DaForms.DelForm( _id );
		}

		public void SaveObject(){Database.DaForms.SaveForm( ref _id, _name, User.Id, _anexo, _enabledDate, _enabledUser );}

		public BsForms GetObjects()
		{
			DataTable dt = Database.DaForms.GetForms(	
				_id,
				Folder.Id,
				_name
				);	

			return addObjectsList( dt );	
		}

		private BsForms addObjectsList( DataTable dt_ )
		{
			BsForms	objects = new BsForms();
			foreach (DataRow dr in dt_.Rows)
				objects.Add(Convert.ToInt32( dr["idForm"] ), setObject(new BsForm(), dr));
			return objects;
		}

		#endregion
	}
	
	#endregion
}
