using System;
using System.Collections;
using System.Web;
using System.Data;

namespace Business
{
	#region " Class BsFields "
	public class BsFields : BsObjectList
	{
		public BsField this[int i_]
		{
			get{ return ( BsField )(((DictionaryEntry)this.List[i_]).Value);}
		}	

		public BsField GetKey( int key_ )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key_ ) )
					return ( BsField )dE.Value;
			}
			return null;
		}
	}
	#endregion

	#region " Class BsField "
	public class BsField
	{
		#region " Constructor "
		public BsField(){}
		public BsField( int id_ ){_id = id_;}
		public BsField( BsForm form_ ){_form = form_;}		
		public BsField( int id_, BsForm form_ )
		{
			_id = id_;
			_form = form_;
		}
		#endregion

		#region " Destructor "
		~BsField(){}
		#endregion

		#region " Attributes "
		private int				_id = 0;
		private BsForm			_form;
		private string			_name = "";
		private BsTypeField		_typeField;
		private BsTypeObject	_typeObject;
		private BsMask			_mask;
		private BsItensField	_itemFields;
		private BsGroup			_group;
		private BsGroups		_groups;
		private int				_sizeField = 0;
		private bool			_compulsory = false;
		private bool			_preview = false;
		private bool			_detail = false;
		private bool			_exceptions = false;
		private int				_orders = 0;

		#endregion

		#region " Properties "
		public int Id			
		{
			get{ return _id; }
			set{ _id = value; }
		}

		public BsForm Form		
		{
			get
			{
				if( _form == null ) _form = new BsForm();
				return _form;
			}
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
						_group.Field._id = _id;
						_groups = _group.GetObjects(); 
					}
					else _groups = new BsGroups();
				}				
				return _groups;
			}
			set{ _groups = value; }
		}

		public string Name
		{
			get{return _name;}
			set{_name = value.Replace("'", "");}
		}

		public BsTypeField Type		
		{
			get
			{
				if( _typeField == null ) _typeField = new BsTypeField();
				return _typeField;
			}
		}

		public BsTypeObject TypeObject	
		{
			get
			{
				if( _typeObject == null ) _typeObject = new BsTypeObject();
				return _typeObject;
			}
		}

		public BsMask Mask	
		{
			get
			{
				if( _mask == null ) _mask = new BsMask();
				return _mask;
			}
		}

		public BsItensField Items			
		{
			get
			{
				if( _itemFields == null )
				{
					if( _id != 0 )
					{
						BsItemField itemField = new BsItemField();
						itemField.Field.Id = _id;
						_itemFields = itemField.GetObjects();
					}
					else _itemFields = new BsItensField();
				}
				return _itemFields; 
			}			
			set{ _itemFields = value; }
		}

		public int Size
		{
			get{return _sizeField;}
			set{_sizeField = value;}
		}

		public bool Compulsory
		{
			get{return _compulsory;}
			set{_compulsory = value;}
		}

		public bool Exceptions
		{
			get{return _exceptions;}
			set{_exceptions = value;}
		}

		public bool ExceptionsUser
		{
			get
			{
				if( _exceptions )
				{
					BsUser usr = BsUser.GetUserOn();
					for( int i=0; i<usr.Groups.Count; i++ )
					{
						if( Groups.ContainsKey( usr.Groups[i].Id ) )
							return true;
					}
					return false;
				}
				else return false;
			}
		}

		public bool Preview
		{
			get{return _preview;}
			set{_preview = value;}
		}

		public bool Detail
		{
			get{return _detail;}
			set{_detail = value;}
		}

		public int Orders
		{
			get{return _orders;}
			set{_orders = value;}
		}

		#endregion

		#region " Events "

		public static void AlterPosition( BsField f, int position ){Database.DaFields.AlterPosition( f.Id, position );}
		public static int CountFieldsByForm( BsForm f ){return Database.DaFields.CountFieldsByForm( f.Id );}

		private BsField setObject( BsField f_, DataRow dr_ )
		{
			f_._id				= Convert.ToInt32( dr_["idField"] );
			f_._name			= dr_["name"].ToString();
			f_._sizeField		= Convert.ToInt32( dr_["sizeField"] );
			f_._compulsory		= Convert.ToBoolean( dr_["compulsory"] );
			f_._preview			= Convert.ToBoolean( dr_["preview"] );
			f_._detail			= Convert.ToBoolean( dr_["detail"] );
			f_._exceptions		= Convert.ToBoolean( dr_["exceptions"] );
			f_._orders			= Convert.ToInt32( dr_["orders"] );
		  		
			f_.Form.Id			= Convert.ToInt32( dr_["idForm"] );
			f_.Form.Name		= dr_["nameForm"].ToString();

			f_.Type.Id			= Convert.ToInt32( dr_["idType"] );

			f_.TypeObject.Id			= Convert.ToInt32( dr_["idObject"] );
			f_.TypeObject.Description	= dr_["descriptionObject"].ToString();

			f_.Mask.Id				= Convert.ToInt32( dr_["idMask"] );
			f_.Mask.Description		= dr_["descriptionMask"].ToString();
			f_.Mask.DesMask			= dr_["descMask"].ToString();

			return f_;
		}

		public void AddFieldsByGroup( BsFields fds_, BsGroup g_ )
		{			
			if( g_.Id <= 0 ) throw new Exception( "id group not found" );
			Database.DaFields.DelFieldsByGroupId( g_.Id );
			for( int i=0; i<fds_.Count; i++ ) Database.DaGroups.AddGroupField( fds_[i].Id, g_.Id );
		}

		public static int[] ConvertToArrayFields( BsFields fds_ )
		{
			int []fieldsId = new int[ fds_.Count ];
			for( int i=0; i < fds_.Count; i++ ) fieldsId[ i ] = fds_[i]._id;
			return fieldsId;
		}

		public BsFields GetObjectsByGroups()
		{				
			DataTable dt = Database.DaFields.GetFieldsByGroups( 
				_id,
				BsGroup.ConvertToArrayGroups( Groups )
				);	
			
			return addObjectsList( dt );	
		}

		public void ExcludeObject()
		{
			if( _id <= 0 ) throw new Exception( "id not found. " );
			Database.DaFields.ExcludeObject( _id );
		}

		public void SaveObject() 
		{
			if( Type.Id == 9 )
				_sizeField = 5;
			else if( Type.Id == 7 )
				_sizeField = 15;
			else if( Type.Id == 3 )
				_sizeField = 10;

			Database.DaFields.SaveObject( ref _id, 
											Form.Id,
											_name,
											Type.Id,
											TypeObject.Id,
											Mask.Id,
											_sizeField,
											_compulsory,
											_preview,
											_detail,
											_orders,
											_exceptions); 
		}

		public BsField GetObject()
		{	
			if( _id <= 0 ) return this;
			DataTable dt = Database.DaFields.GetFields( _id, Form.Id, Type.Id, TypeObject.Id, Mask.Id );	
			if( dt.Rows.Count > 0 )
				setObject( this, dt.Rows[0] ); 
			else _id = 0;
			return this;
		}

		public BsFields GetObjects()
		{				
			DataTable dt = Database.DaFields.GetFields( _id, Form.Id, Type.Id, TypeObject.Id, Mask.Id );				
			return addObjectsList( dt );	
		}

		private BsFields addObjectsList( DataTable dt_ )
		{
			BsFields objects = new BsFields();
			foreach( DataRow dr in dt_.Rows )
				objects.Add( Convert.ToInt32( dr["idField"] ), setObject(new BsField(), dr) );
			return objects;
		}

		#endregion
	}

	#endregion
}
