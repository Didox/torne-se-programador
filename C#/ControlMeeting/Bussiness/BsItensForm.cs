using System;
using System.Collections;
using System.Data;
using System.IO;
using System.Configuration;
using System.Web;
using System.Web.Mail;

namespace Business
{
	#region " Class BsItensForm "
	public class BsItensForm : BsObjectList
	{
		public BsItemForm this[int i_]
		{
			get{ return ( BsItemForm )(((DictionaryEntry)this.List[i_]).Value);}
		}
	
		public BsItensForm(){}

		public BsItensForm( BsItemForm item )
		{
			this.Add( item.Id, item );
		}

		public BsItemForm GetKey( int key_ )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key_ ) )
					return ( BsItemForm )dE.Value;
			}
			return null;
		}
	}
	#endregion

	#region " Class BsItemForm "
	public class BsItemForm
	{
		#region " Constructor "
		public BsItemForm(){}
		public BsItemForm(int id_,BsForm form_)
		{
			_id = id_;			
			_form = form_;
		}
		public BsItemForm(int id_, BsFolder	folder_, BsForm form_, BsGenericItens gFields_, BsUser user_, BsGroups groups_)
		{
			_id = id_;
			_folder = folder_;
			_form = form_;
			_gFields = gFields_;		
			_user = user_;
			_groups = groups_;
		}
		#endregion

		#region " Destructor "
		~BsItemForm(){}
		#endregion

		#region " Attributes "
		private int			_id = 0;
		private DateTime	_date;
		private BsFolder	_folder;
		private BsForm		_form;
		private BsGenericItens _gFields;
		private BsUser		_user;
		private BsGroup		_group;
		private BsGroups	_groups;
		private BsItemForm	_itemForm;
		private BsItensForm	_itensForm;

		#endregion
	
		#region " Properties "
		public int Id			
		{
			get{ return _id; }
			set{ _id = value; }
		}

		public DateTime Date			
		{
			get{ return _date; }
		}

		public BsUser User
		{
			get
			{
				if( _user == null ) _user = new BsUser();
				return _user;
			}
			set{ _user = value; }
		}

		public BsGroup Group	
		{
			get
			{
				if( _group == null ) _group = new BsGroup();
				return _group;
			}
		}

		public BsGroups Groups		
		{
			get
			{
				if( _groups == null ) 
				{
					if( _id != 0 )
					{
						_group = new BsGroup();
						_group.ItemForm._id = _id;
						_groups = _group.GetObjects(); 
					}
					else _groups = new BsGroups();
				}				
				return _groups;
			}
			set{ _groups = value; }
		}

		public BsItemForm ItemForm	
		{
			get
			{
				if( _itemForm == null ) _itemForm = new BsItemForm();
				return _itemForm;
			}
		}

		public BsItensForm ItensForm
		{
			get
			{
				if( _itensForm == null ) 
				{
					if( _id != 0 )
					{
						_itemForm = new BsItemForm();
						_itemForm.ItemForm._id = _id;
						_itemForm.ItemForm.Form = Form;
						_itensForm = _itemForm.GetObjects(); 
					}
					else _itensForm = new BsItensForm();
				}				
				return _itensForm;
			}
			set{ _itensForm = value; }
		}

		public BsFolder Folder		
		{
			get
			{
				if( _folder == null ) _folder = new BsFolder();
				return _folder;
			}
			set{ _folder = value; }
		}

		public BsForm Form	
		{
			get
			{
				if( _form == null ) _form = new BsForm();
				return _form;
			}
			set{ _form = value; }
		}

		public BsGenericItens GFields
		{
			get
			{
				if( _gFields == null )
					_gFields = new BsGenericItens();
				return _gFields;
			}
			set{ _gFields = value; }
		}

		#endregion
 
		#region " Events "

		public bool ContaisFiles()
		{
			try
			{
				string folderFiles = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirUpload"];
				folderFiles += Form.Id + "/" + _id;

				DirectoryInfo diretorio = new DirectoryInfo(folderFiles);
				FileInfo[] arq = diretorio.GetFiles();
				if( arq.Length > 0 ) return true;
				else return false;
			}
			catch{return false;}
		}

		public bool SendMail( string email, string mensagem, string subject, BsUser u )
		{			
			string body = "";
			string folderPath = "";
			if( _id != 0 && Form.Id != 0 ) 
			{
				this.GetObject();
				BsFields fds = new BsField(this.Form).GetObjects();
				for( int i=0; i< fds.Count; i++ )
				{
					if( fds[i].Detail )
					{
						if( fds[i].Type.Id == 4 || fds[i].TypeObject.Id == 5 )
						{
							body += "<br>";
							body += this.GFields.GetKey(fds[i]).Value;
						}
						else
						{
							string values = this.GFields.GetKey(fds[i]).Value;
							int size = fds[i].Size;
							if( fds[i].Type.Id == 3 )
								values = Convert.ToDateTime( values ).ToString( "dd/MM/yyyy" );
							
							body += "<table border=0 cellpadding=0 cellspacing=0 width=\"100%\" ><tr>";
							body += "<td width=\"70\" ><b>" + fds[i].Name + "</b></td>";
							body += "<td >" + values + "</td>";
							body += "</tr></table>";
						}
					}
				}
				
				Form.GetObject();

				BsFolder f = this.Folder;
				f.GetObject();
				if( f.IdParent < 1 ) folderPath += f.Name + "\\";
				else
				{
					folderPath = f.Name + "\\" + folderPath;						
					while( f.IdParent > 0 )
					{
						int idParent = f.IdParent;
                        f.Clear();
						f.Id = idParent;
						f.GetObject();
						folderPath = f.Name + "\\" + folderPath;
					}
				}

				folderPath += "<u>" + this.Form.Name + "</u>";
			}

			MailMessage mail = new MailMessage();
			try
			{
				mensagem = mensagem.Replace("\r\n", "<br>");
				if( User.Email == "" )
					mail.From = ConfigurationSettings.AppSettings["mailDefault"];
				else mail.From = User.Email;
	
				mail.Body = "<br>"+ mensagem + "<br><hr><br>" + body + 
							"<br><hr><br><b>Data do item: </b>" + this.Date.ToString( "dd/MM/yyyy" ) + 
							"<br><b>Local: </b>" + folderPath;

				mail.To = email;
				mail.Subject = subject;
				mail.BodyFormat = MailFormat.Html;
				
				if( this.Form.Anexo ) attachmentFiles( ref mail );
				
				if( ConfigurationSettings.AppSettings["SMPTSERVER"] != "" )
					SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SMPTSERVER"];
				
				SmtpMail.Send( mail );
				return true; 
			}
			catch{return false;}
		}

		private void attachmentFiles( ref MailMessage mail )
		{
			try
			{
				string folderFiles = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirUpload"];
				folderFiles += Form.Id + "/" + _id;

				DirectoryInfo diretorio = new DirectoryInfo(folderFiles);
				FileInfo[] arq = diretorio.GetFiles();

				for (int i = 0; i < arq.Length; i++)
				{
					if (arq[i].Name != "Thumbs.db")
						mail.Attachments.Add( new MailAttachment( folderFiles + "/" + arq[i].Name ) );
				}
			}
			catch{return;}
		}

		public bool UploadFile( HttpPostedFile f )
		{		
			try
			{
				string folderFiles = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirUpload"];
				folderFiles += Form.Id + "/" + Id;
				string file  = folderFiles + "/" + BsFunctions.NotCarectersNotValid( BsFunctions.NotAcent( Path.GetFileName( f.FileName ) ) );

				if( ! Directory.Exists( folderFiles ) )
					Directory.CreateDirectory( folderFiles );
				if( File.Exists( file ) )
					File.Delete( file );
				f.SaveAs( file );

				return true;
			}
			catch{return false;}
		}

		public string GetPathFile( string file )
		{
			string folderFiles = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirUpload"];
			return folderFiles += Form.Id + "/" + _id + "/" + file;
		}

		public string ListDirectoryAnexos( bool delete )
		{
			try
			{
				string folderFiles = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirUpload"];
				folderFiles += Form.Id + "/" + _id;

				DirectoryInfo diretorio = new DirectoryInfo(folderFiles);
				FileInfo[] arq = diretorio.GetFiles();

				string filesHTML = "<TABLE " + ( ! delete ? "align=right" : "" ) + " cellSpacing=\"2\" cellPadding=\"2\" border=\"0\" borderColor=\"#e5e5e5\" ><tr>";

				for (int i = 0; i < arq.Length; i++)
				{
					if (arq[i].Name != "Thumbs.db")
					{
						FileInfo icone = new FileInfo(AppDomain.CurrentDomain.BaseDirectory + "imagens/icones/" + arq[i].Extension.Replace(".", "") + ".gif");
						string strIcone = icone.Name;
						if (!icone.Exists) strIcone = "semicone.gif";
						strIcone = ConfigurationSettings.AppSettings["urlSite"] + "/imagens/icones/" + strIcone;
						filesHTML += "<td>";
						filesHTML += "<nobr><a href=\"javascript:top.forceDownload('" + arq[i].Name + "',"+_id+","+Form.Id+",'"+ConfigurationSettings.AppSettings["urlSite"]+"' )\" >&nbsp;<img src=\""+strIcone+"\" alt=\"" + arq[i].Name + "\" border=0>&nbsp;</a>";
						if( delete ) filesHTML += "<a href=\"javascript:deleteFile('"+arq[i].Name+"',"+_id+","+Form.Id+");\" >&nbsp;<img src=\"../imagens/deleteAnexo.gif\" alt=\"Excluir Arquivo\" width=5 height=5 border=0></a>";
						filesHTML += "<nobr>";
						filesHTML += "</td>";
					}
				}
				
				filesHTML += "<tr></TABLE>";
				if( ! delete ) filesHTML += "<br><br>";
				if( arq.Length > 0 ) return filesHTML;
				else return "";
			}
			catch{return "";}
		}

		private bool deleteFiles()
		{
			try
			{
				string folderFiles = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirUpload"];
				folderFiles += Form.Id + "/" + _id;
				if( Directory.Exists( folderFiles ) )
					Directory.Delete(folderFiles,true);
				return true;
			}
			catch{return false;}
		}

		public void DeleteFile( string file  )
		{
			string folderFiles = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirUpload"];
			folderFiles += Form.Id + "/" + Id;
			file  = folderFiles + "/" + file;

			if( File.Exists( file ) )
				File.Delete( file );
		}

		public void AlterItemFolder( BsFolder fDrag ){Database.DaItensForms.AlterItemFolder( fDrag.Id, Folder.Id, _id, Form.Id );}		

		public void AddItenFormByGroup( BsItensForm f_, BsGroup g_ )
		{			
			if( g_.Id == 0 ) throw new Exception( "id group not found" );
			if( f_.Count > 0 ) Database.DaItensForms.DelItensFormByGroupId( g_.Id, f_[0].Form.Id );
			for( int i=0; i<f_.Count; i++ ) Database.DaGroups.AddGroupItemForm( g_.Id, f_[i].Id, f_[i].Form.Id );
		}

		public static int[] ConvertToArrayItensForm( BsItensForm itf_ )
		{
			int []itensFormId = new int[ itf_.Count ];
			for( int i=0; i < itf_.Count; i++ ) itensFormId[ i ] = itf_[i]._id;
			return itensFormId;
		}
		
		private BsItemForm setObject( BsItemForm item_, DataRow dr_ )
		{
			item_._id		= Convert.ToInt32( dr_["idItemForm"] );			
			
			item_.Form.Id    = Convert.ToInt32( dr_["idForm"] );
			item_.Form.Anexo = Convert.ToBoolean( dr_["anexo"] );

			item_.Folder.Id = Convert.ToInt32( dr_["idFolder"] );			
			item_._date		= Convert.ToDateTime( dr_["data"] );

			item_.User.Id	= Convert.ToInt32( dr_["idUser"] );
			item_.User.Name	= dr_["nameUser"].ToString();

			BsFields fds = new BsField(item_.Form).GetObjects();
			for( int i=0; i<fds.Count; i++ )
			{
				BsGenericItem gItem = new BsGenericItem();
				gItem.Value = dr_["campo" + fds[i].Id ].ToString();
				if( fds[i].Type.Id == 3 )
				{
					if( dr_["campo" + fds[i].Id ] != DBNull.Value )
						gItem.Value = Convert.ToDateTime( gItem.Value ).ToString( "dd/MM/yyyy" );
					else
						gItem.Value = Convert.ToDateTime( "01/01/1911" ).ToString( "dd/MM/yyyy" );
				}
				item_.GFields.Add( fds[i].Id, gItem );
			}
			return item_;
		}
		

		public BsItemForm GetObject()
		{	
			if( _id == 0 || Form.Id == 0 ) return this;
			DataTable dt = Database.DaItensForms.GetItens( _id, Form.Id, Folder.Id, "", "" );	
			if( dt.Rows.Count > 0 )
				setObject( this, dt.Rows[0] );
			else _id = 0;
			return this;
		}

		public void ExcludeObject()
		{
			if( _id == 0 || Form.Id == 0 ) throw new Exception( "id or idForm not found. " );
			if( deleteFiles() )
				Database.DaItensForms.RemoveItem( _id, Form.Id );
		}

		public void SaveObject()
		{
			BsFields fds = new BsField(Form).GetObjects();
			string query = "";

			if( _id == 0 )
			{
				query = "insert into tbFrm" + Form.Id + "";
				string fields = "(";
				string values = "values(";

				for( int i=0; i< fds.Count; i++ )
				{
					fields += "campo" + fds[i].Id + ",";
					string fieldValue = GFields.GetKey(fds[i]).Value;

					if( fds[i].Type.Id == 3 )
					{
						DateTime dtime = Convert.ToDateTime( fieldValue );
						values += "'" + dtime.ToString( "yyyy/MM/dd" ) + "',";
					}
					else if( fds[i].Type.Id == 7 )
						values += "" + fieldValue.Replace(".","").Replace(",",".") + ",";
					else
						values += "'" + fieldValue + "',";
				}
			
				query += fields + " idFolder, idForm, idUser )" + values + Folder.Id + ", " + Form.Id + ", " + User.Id + " )";
				query += "; select @@identity";
			}
			else
			{
				query = "update tbFrm" + Form.Id + " set ";

				for( int i=0; i< fds.Count; i++ )
				{
					string fieldValue = GFields.GetKey(fds[i]).Value;
					if( fieldValue != "***" )
					{
						if( fds[i].Type.Id == 3 )
						{
							DateTime dtime = Convert.ToDateTime( fieldValue );
							query += "campo" + fds[i].Id + " = '" + dtime.ToString( "yyyy/MM/dd" ) + "',";
						}
						else if( fds[i].Type.Id == 7 )
							query += "campo" + fds[i].Id + " = " + fieldValue.Replace(".","").Replace(",",".") + ",";
						else
							query += "campo" + fds[i].Id + " = '" + fieldValue + "',";
					}
				}
			
				query += " idFolder = " + Folder.Id + " where idItemForm= " + _id;
				query += "; select " + _id + "";
			}

			Database.DaItensForms.SaveItem( query, ref _id );
		}

		public BsItensForm GetObjects()
		{
			DataTable dt = Database.DaItensForms.GetItens( _id, Form.Id, Folder.Id, "", "" );
			return addObjectsList( dt );	
		}

		public BsItensForm GetObjects(string order, string where)
		{
			DataTable dt = Database.DaItensForms.GetItens( _id, Form.Id, Folder.Id, order, where );
			return addObjectsList( dt );	
		}

		public BsItensForm GetObjectsByGroups(string order, string where)
		{				
			DataTable dt = Database.DaItensForms.GetItensFormByGroups( 
				_id,
				Form.Id,
				Folder.Id, order, where,
				BsGroup.ConvertToArrayGroups( Groups )
				);	
			
			return addObjectsList( dt );	
		}

		private BsItensForm addObjectsList( DataTable dt_ )
		{
			BsItensForm	objects = new BsItensForm();
			foreach (DataRow dr in dt_.Rows)
				objects.Add(Convert.ToInt32( dr["idItemForm"] ), setObject(new BsItemForm(), dr));
			return objects;
		}

		#endregion
	}
	
	#endregion
}
