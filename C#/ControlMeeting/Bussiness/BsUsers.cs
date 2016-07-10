using System;
using System.Collections;
using System.Web;
using System.Data;

namespace Business
{
	#region " Class BsUsers "
	public class BsUsers : BsObjectList
	{
		public BsUser this[int i_]
		{
			get{ return ( BsUser )(((DictionaryEntry)this.List[i_]).Value);}
		}	

		public BsUser GetKey( int key_ )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key_ ) )
					return ( BsUser )dE.Value;
			}
			return null;
		}
	}
	#endregion

	#region " Class BsUser "
	public class BsUser
	{
		#region " Constructor "
		public BsUser(){}
		public BsUser( int id_ ){_id = id_;}
		#endregion

		#region " Destructor "
		~BsUser(){}
		#endregion

		#region " Attributes "
		private int			_id = 0;
		private BsGroup		_group;
		private BsGroups	_groups;
		private string		_cpf = "";
		private string		_email = "";
		private string		_name = "";
		private string		_password = "";
		private string		_login = "";
		private bool		_admin = false;

		#endregion

		#region " Properties "
		public int Id			
		{
			get{ return _id; }
			set{ _id = value; }
		}

		public bool Admin			
		{
			get{ return _admin; }
			set{ _admin = value; }
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
						_group.User._id = _id;
						_groups = _group.GetObjects(); 
					}
					else _groups = new BsGroups();
				}				
				return _groups;
			}
			set{ _groups = value; }
		}

		public string CPF
		{
			get
			{
				return BsFunctions.FormatCpfCnpj( _cpf + "" );
			}
			set
			{
				 _cpf = BsFunctions.NotCpfCnpj( value );
			}
		}

		public string Login
		{
			get
			{
				return _login;
			}
			set
			{
				_login = value;
			}
		}

		public string Email
		{
			get
			{
				return _email;
			}
			set
			{
				_email = value.ToUpper().Replace("'", "");
			}
		}

		public string Name
		{
			get
			{
				return _name;
			}
			set
			{
				_name = value.ToUpper().Replace("'", "");
			}
		}

		public string Password
		{
			get
			{
				return _password;
			}
			set
			{
				_password = value.ToUpper().Replace("'", "");
			}
		}
		
		#endregion

		#region " Events "

		private BsUser setObject( BsUser u_, DataRow dr_ )
		{
			u_._id		= Convert.ToInt32( dr_["userId"] );			
			u_._cpf		= dr_["cpf"].ToString();
			u_._login	= dr_["login"].ToString();
			u_._password= dr_["pass"].ToString();
			u_._name	= dr_["nome"].ToString();
			u_._email	= dr_["email"].ToString();
			u_._admin	= Convert.ToBoolean( dr_["admin"] );			
			return u_;
		}

		public void SaveMemory()
		{
			HttpContext.Current.Session["UsersLogin"] = this;
		}

		public void AddUsersByGroup( BsUsers u_, BsGroup g_ )
		{			
			if( g_.Id <= 0 ) throw new Exception( "id group not found" );
			Database.DaUsers u = new Database.DaUsers();
			u.DelUsersByGroupId( g_.Id );
			for( int i=0; i<u_.Count; i++ ) Database.DaGroups.AddGroupUser( u_[i].Id, g_.Id );
		}
		
		public bool LoginOn()
		{				
			HttpContext.Current.Session.Clear();
			Database.DaUsers ass = new Database.DaUsers();
			DataTable dt = ass.LoginOn( _login, _password );
			if( dt.Rows.Count == 0 ) return false;
			setObject( this, dt.Rows[0] );
			HttpContext.Current.Session["UsersLogin"] = this;
			return true;
		}

		public static void Logof()
		{
			HttpContext.Current.Session.Clear();
		}

		public void AlterUserLog()
		{
			if( _id != 0 ) HttpContext.Current.Session["UsersLogin"] = this;
		}

		public static BsUser GetUserOn()
		{				
			return (BsUser)HttpContext.Current.Session[ "UsersLogin" ];
		}

		public static bool UserOn()
		{				
			return ( HttpContext.Current.Session["UsersLogin"] != null );
		}	

		public void ExcludeObject()
		{
			if( _id <= 0 ) throw new Exception( "id not found. " );

			Database.DaUsers ass = new Database.DaUsers();
			ass.ExcludeObject( _id );
		}

		public void SaveObject()
		{			
			Database.DaUsers ass = new Database.DaUsers();
			ass.SaveObject( 
				ref _id,
				_login,
				_password,
				_name,
				_email,
				_admin
				);
		}

		public static int[] ConvertToArrayUsers( BsUsers u_ )
		{
			int []usersId = new int[ u_.Count ];
			for( int i=0; i < u_.Count; i++ ) usersId[ i ] = u_[i]._id;
			return usersId;
		}

		public BsUser GetObject()
		{	
			if( _id <= 0 ) return this;
			Database.DaUsers ass = new Database.DaUsers();
			DataTable dt = ass.GetUsers( 
				_id,
				_login,
				_name
				);	

			if( dt.Rows.Count > 0 )
				setObject( this, dt.Rows[0] );  
			else _id = 0;
			return this;
		}

		public BsUsers GetObjectsByGroups()
		{				
			Database.DaUsers ass = new Database.DaUsers();
			DataTable dt = ass.GetUsersByGroups( 
				_id,
				BsGroup.ConvertToArrayGroups( Groups )
				);	
			
			return addObjectsList( dt );	
		}

		public BsUsers GetObjects()
		{				
			Database.DaUsers ass = new Database.DaUsers();
			DataTable dt = ass.GetUsers( 
				_id,
				_login,
				_name
				);	
			
			return addObjectsList( dt );	
		}

		private BsUsers addObjectsList( DataTable dt_ )
		{
			BsUsers objects = new BsUsers();
			foreach( DataRow dr in dt_.Rows )
				objects.Add( Convert.ToInt32( dr["userId"] ), setObject(new BsUser(), dr) );
			return objects;
		}

		#endregion
	}

	#endregion
}