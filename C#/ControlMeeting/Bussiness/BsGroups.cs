using System;
using System.Collections;
using System.Web;
using System.Data;

namespace Business
{
	#region " Class BsGroups "
	public class BsGroups : BsObjectList
	{
		public BsGroup this[int i_]
		{
			get{ return ( BsGroup )(((DictionaryEntry)this.List[i_]).Value);}
		}	

		public BsGroup GetKey( int key_ )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key_ ) )
					return ( BsGroup )dE.Value;
			}
			return null;
		}
	}
	
	#endregion

	#region " Class BsGroup "
	public class BsGroup
	{
		#region " Constructor "
		public BsGroup(){}
		public BsGroup( int id_){_id = id_;}
		#endregion

		#region " Destructor "
		~BsGroup(){}
		#endregion

		#region " Attributes "
		private int			_id = 0;
		private string		_description = "";

		private BsFolder	_folder;
		private BsFolders	_folders;

		private BsUser		_user;
		private BsUsers		_users;

		private BsField		_field;
		private BsFields	_fields;

		private BsItemForm  _itemForm;
		private BsItensForm _itensForm;

		#endregion

		#region " Properties "
		public int Id			
		{
			get{ return _id; }
			set{ _id = value; }
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
						_itemForm.Group.Id = _id;
						_itensForm = _itemForm.GetObjects();
					}
					else _itensForm = new BsItensForm();
				}
				return _itensForm; 
			}			
			set{ _itensForm = value; }
		}

		public BsUser User			
		{
			get
			{
				if( _user == null ) _user = new BsUser();
				return _user; 
			}
		}

		public BsUsers Users			
		{
			get
			{
				if( _users == null )
				{
					if( _id != 0 )
					{
						_user = new BsUser();
						_user.Group.Id = _id;
						_users = _user.GetObjects();
					}
					else _users = new BsUsers();
				}
				return _users; 
			}			
			set{ _users = value; }
		}

		public BsField Field			
		{
			get
			{
				if( _field == null ) _field = new BsField();
				return _field; 
			}
		}

		public BsFields Fields			
		{
			get
			{
				if( _fields == null )
				{
					if( _id != 0 )
					{
						_field = new BsField();
						_field.Group.Id = _id;
						_fields = _field.GetObjects();
					}
					else _fields = new BsFields();
				}
				return _fields; 
			}			
			set{ _fields = value; }
		}

		public BsFolder Folder
		{
			get
			{
				if( _folder == null ) _folder = new BsFolder();
				return _folder;
			}
		}

		public BsFolders Folders
		{
			get
			{
				if( _folders == null )
				{
					if( _id != 0 )
					{
						_folder = new BsFolder();
						_folder.Group._id = _id;
						_folders = _folder.GetObjects(); 
					}
					else _folders = new BsFolders();
				}
				return _folders;
			}
			set{ _folders = value; }
		}

		public string Description			
		{
			get{ return _description; }
			set{ _description = value; }
		}

		#endregion

		#region " Events "
		public static int[] ConvertToArrayGroups( BsGroups gs_ )
		{
			int []groupsId = new int[ gs_.Count ];
			for( int i=0; i < gs_.Count; i++ ) groupsId[ i ] = gs_[i]._id;
			return groupsId;
		}

		private BsGroup setObject( BsGroup g_, DataRow dr_ )
		{
			g_._id			= Convert.ToInt32( dr_["groupId"] );
			g_._description	= dr_["description"].ToString();
			return g_;
		}

		public void ExcludeObject()
		{
			if( _id <= 0 ) throw new Exception( "id not found. " );
			Database.DaGroups.ExcludeObject( _id );
		}

		public void SaveObject(){Database.DaGroups.SaveObject( ref _id, _description );}

		public void AddGroupsByFolder( BsGroups gs_, BsFolder folder_ )
		{			
			if( folder_.Id <= 0 ) throw new Exception( "id folder not found" );
			Database.DaGroups.DelGroupsByFolderId( folder_.Id );
			for( int i=0; i<gs_.Count; i++ ) Database.DaGroups.AddGroupFolder( gs_[i].Id, folder_.Id );
		}

		public void AddGroupsByField( BsGroups gs_, BsField field_ )
		{			
			if( field_.Id <= 0 ) throw new Exception( "id field not found" );
			Database.DaGroups.DelGroupsByFieldId( field_.Id );
			for( int i=0; i<gs_.Count; i++ ) Database.DaGroups.AddGroupField( field_.Id, gs_[i].Id );
		}

		public void AddGroupsByItemForm( BsGroups gs_, BsItemForm item_ )
		{			
			if( item_.Id == 0 || item_.Form.Id == 0 ) throw new Exception( "id item ou form not found" );
			Database.DaGroups.DelGroupsByItemFormId( item_.Id, item_.Form.Id );
			for( int i=0; i<gs_.Count; i++ ) Database.DaGroups.AddGroupItemForm( gs_[i].Id, item_.Id, item_.Form.Id );
		}

		public void AddGroupsByUser( BsGroups gs_, BsUser user_ )
		{			
			if( user_.Id <= 0 ) throw new Exception( "id user not found" );
			Database.DaGroups.DelGroupsByUserId( user_.Id );
			for( int i=0; i<gs_.Count; i++ ) Database.DaGroups.AddGroupUser( user_.Id, gs_[i].Id );
		}

		public BsGroups GetObjects()
		{				
			if( ItemForm.Id != 0 && ItemForm.Form.Id == 0 ) throw new Exception( "idform not found" );
			DataTable dt = Database.DaGroups.GetGroups( 
				_id,
				_description,
				Folder.Id,
				Field.Id,
				User.Id,
				ItemForm.Id,
				ItemForm.Form.Id
				);	
						
			return addObjectsList( dt );	
		}

		public BsGroups GetObjectsByUsers()
		{
			DataTable dt = Database.DaGroups.GetGroupsByUsers( 
				_id,
				_description,
				BsUser.ConvertToArrayUsers( Users )
				);	

			return addObjectsList( dt );	
		}

		public BsGroups GetObjectsByFolders()
		{
			DataTable dt = Database.DaGroups.GetGroupsByFolders( 
				_id,
				_description,
				BsFolder.ConvertToArrayFolders( Folders )
				);	

			return addObjectsList( dt );	
		}

		public BsGroups GetObjectsByFields()
		{
			DataTable dt = Database.DaGroups.GetGroupsByFields( 
				_id,
				_description,
				BsField.ConvertToArrayFields( Fields )
				);	

			return addObjectsList( dt );	
		}

		public BsGroups GetObjectsByItensForm()
		{
			if( ItensForm.Count == 0 || ItensForm[0].Id == 0 || ItensForm[0].Form.Id == 0 ) return null;
			DataTable dt = Database.DaGroups.GetGroupsByItensForm( 
				_id,
				ItensForm[0].Form.Id,
				BsItemForm.ConvertToArrayItensForm( ItensForm )
				);	

			return addObjectsList( dt );	
		}

		public BsGroup GetObject()
		{	
			if( _id <= 0 ) return this;
			if( ItemForm.Id != 0 && ItemForm.Form.Id == 0 ) throw new Exception( "idform not found" );
			
			DataTable dt = Database.DaGroups.GetGroups( 
				_id,
				_description,
				Field.Id, 
				Folder.Id,
				User.Id,
				ItemForm.Id,
				ItemForm.Form.Id
				);
		
			if( dt.Rows.Count > 0 )
				setObject( this, dt.Rows[0] );
			else _id = 0;
			return this;
		}

		private BsGroups addObjectsList( DataTable dt_ )
		{
			BsGroups objects = new BsGroups();
			foreach( DataRow dr in dt_.Rows )
				objects.Add( Convert.ToInt32( dr["groupId"] ), setObject(new BsGroup(), dr) );
			return objects;
		}

		#endregion
	}

	#endregion
}
