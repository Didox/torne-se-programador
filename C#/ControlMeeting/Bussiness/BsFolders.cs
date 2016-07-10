using System;
using System.Collections;
using System.Data;

namespace Business
{
	#region " Class BsFolders "
	public class BsFolders : BsObjectList
	{
		public BsFolder this[int i_]
		{
			get{ return ( BsFolder )(((DictionaryEntry)this.List[i_]).Value);}
		}	

		public BsFolder GetKey( int key_ )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key_ ) )
					return ( BsFolder )dE.Value;
			}
			return null;
		}
	}
	#endregion

	#region " Class BsFolder "
	public class BsFolder
	{
		#region " Constructor "
		public BsFolder(){}
		public BsFolder(int id_){_id = id_;}
		public BsFolder(int id_, string name_, int idParent_,
			BsGroup		group_,
			BsGroups	groups_,
			BsForm		form_,
			BsForms		forms_,
			BsUser		user_)
		{
			this._id = id_;
			this._name = name_; 
			this._idParent = idParent_;
			this._group = group_;
			this._groups = groups_;
			this._form = form_;
			this._forms = forms_;
			this._user = user_;
		}
		#endregion

		#region " Destructor "
		~BsFolder(){}
		#endregion

		#region " Attributes "
		private int			_id = 0;
		private string		_name = "";
		private int			_idParent = -1;
		private BsGroup		_group;
		private BsGroups	_groups;
		private BsForm		_form;
		private BsForms		_forms;
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
						_group.Folder._id = _id;
						_groups = _group.GetObjects(); 
					}					
					else _groups = new BsGroups();
				}
				return _groups;
			}			
			set{ _groups = value; }
		}

		public BsForm Form		
		{
			get
			{
				if( _form == null ) _form = new BsForm();
				return _form;
			}
		}

		public BsForms Forms
		{
			get
			{
				if( _forms == null )
				{
					if( _id != 0 )
					{
						_form = new BsForm();
						_form.Folder._id = _id;
						_forms = _form.GetObjects(); 
					}
					else _forms = new BsForms();
				}
				return _forms;
			}			
			set{ _forms = value; }
		}

		public int IdParent			
		{
			get{ return _idParent; }
			set{ _idParent = value; }
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

		#endregion
 
		#region " Events "

		public static int[] ConvertToArrayFolders( BsFolders f_ )
		{
			int []foldersId = new int[ f_.Count ];
			for( int i=0; i < f_.Count; i++ ) foldersId[ i ] = f_[i]._id;
			return foldersId;
		}

		public void AddFoldersByGroup( BsFolders f_, BsGroup group_ )
		{
			if( group_.Id <= 0 ) throw new Exception( "id group not found" );
			Database.DaFolders.DelFoldersByGroupId( group_.Id );
			for( int i=0; i<f_.Count; i++ ) Database.DaGroups.AddGroupFolder( group_.Id, f_[i].Id );
		}
		
		public void RemoveFormFolder(){ Database.DaFolders.RemoveForm( Form.Id, _id ); }

		public static void AddForm( int idForm, int idFolder ){ Database.DaFolders.AddForm( idForm, idFolder ); }

		public static int CountChild( BsFolder f, BsGroups g ){ return Database.DaFolders.CountChild( f.Id, BsGroup.ConvertToArrayGroups( g ) ); }

		public static void AlterLocationFolder( BsFolder fNew, BsFolder fChild ){ Database.DaFolders.AlterLocationFolder( fNew.Id, fChild.Id ); }

		private BsFolder setObject( BsFolder f_, DataRow dr_ )
		{
			f_._id			= Convert.ToInt32( dr_["idFolder"] );
			f_._name		= dr_["name"].ToString();		
			f_._idParent	= Convert.ToInt32( dr_["idParent"] );
			f_.User.Id		= Convert.ToInt32( dr_["idUser"] );
			return f_;
		}
		
		public void ExcludeObject()
		{
			if( _id <= 0 ) throw new Exception( "id not found. " );
			Database.DaFolders.ExcludeObject( _id );
		}

		public void SaveObject(){Database.DaFolders.SaveObject( ref _id, _idParent,_name, User.Id );}

		public BsFolders GetObjectsByGroups()
		{
			DataTable dt = Database.DaFolders.GetFoldersByGroups( 
				_id,
				_idParent,
				_name,
				BsGroup.ConvertToArrayGroups( Groups )
				);	

			return addObjectsList( dt );	
		}

		public BsFolder GetObject()
		{	
			if( _id <= 0 ) return this;
			DataTable dt = Database.DaFolders.GetFolders( _id, _idParent, _name	);				
			if( dt.Rows.Count > 0 )
				setObject( this, dt.Rows[0] );	
			else _id = 0;
			return this;
		}

		public BsFolders GetObjects()
		{
			DataTable dt = Database.DaFolders.GetFolders( 
				_id,
				_idParent,
				_name
				);	

			return addObjectsList( dt );	
		}

		private BsFolders addObjectsList( DataTable dt_ )
		{
			BsFolders objects = new BsFolders();
			foreach (DataRow dr in dt_.Rows)
				objects.Add(Convert.ToInt32( dr["idFolder"] ), setObject(new BsFolder(), dr));
			return objects;
		}

		public void Clear()
		{
			_id = 0;
			_name = "";
			_idParent = -1;
			_group = null;
			_groups = null;
			_form = null;
			_forms = null;
			_user = null;
		}

		#endregion		
	}

	#endregion

}
