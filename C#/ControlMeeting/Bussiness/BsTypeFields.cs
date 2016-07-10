using System;
using System.Collections;
using System.Web;
using System.Data;

namespace Business
{
	#region " Class BsTypeFields "
	public class BsTypeFields : BsObjectList
	{
		public BsTypeField this[int i_]
		{
			get{ return ( BsTypeField )(((DictionaryEntry)this.List[i_]).Value);}
		}	

		public BsTypeField GetKey( int key_ )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key_ ) )
					return ( BsTypeField )dE.Value;
			}
			return null;
		}
	}
	#endregion

	#region " Class BsTypeField "
	public class BsTypeField
	{
		#region " Constructor "
		public BsTypeField(){}
		public BsTypeField( int id_ ){_id = id_;}
		#endregion

		#region " Destructor "
		~BsTypeField(){}
		#endregion

		#region " Attributes "
		private int			_id = 0;
		private string		_description = "";
		private BsFields	_fields;

		#endregion

		#region " Properties "
		public int Id			
		{
			get{ return _id; }
			set{ _id = value; }
		}

		public string Description
		{
			get{return _description;}
			set{_description = value.Replace("'", "");}
		}

		public BsFields Fields			
		{
			get
			{
				if( _fields == null )
				{
					if( _id != 0 )
					{
						BsField _field = new BsField();
						_field.Type.Id = _id;
						_fields = _field.GetObjects();
					}
					else _fields = new BsFields();
				}
				return _fields; 
			}			
			set{ _fields = value; }
		}

		#endregion

		#region " Events "

		private BsTypeField setObject( BsTypeField m_, DataRow dr_ )
		{
			m_._id			= Convert.ToInt32( dr_["idType"] );			
			m_._description	= dr_["description"].ToString();
			return m_;
		}

		public void ExcludeObject()
		{
			if( _id <= 0 ) throw new Exception( "id not found. " );
			Database.DaTypeFields.ExcludeObject( _id );
		}

		public void SaveObject(){ Database.DaTypeFields.SaveObject( ref _id, _description ); }

		public BsTypeField GetObject()
		{	
			if( _id <= 0 ) return this;
			DataTable dt = Database.DaTypeFields.GetTypeFields( _id, _description );	
			if( dt.Rows.Count > 0 )
				setObject( this, dt.Rows[0] );
			else _id = 0;
			return this;
		}

		public BsTypeFields GetObjects()
		{				
			DataTable dt = Database.DaTypeFields.GetTypeFields( _id,_description	);				
			return addTypeFieldsList( dt );	
		}

		private BsTypeFields addTypeFieldsList( DataTable dt_ )
		{
			BsTypeFields TypeFields = new BsTypeFields();
			foreach( DataRow dr in dt_.Rows )
				TypeFields.Add( Convert.ToInt32( dr["idType"] ), setObject(new BsTypeField(), dr) );
			return TypeFields;
		}

		#endregion
	}

	#endregion
}
