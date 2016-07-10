using System;
using System.Collections;
using System.Web;
using System.Data;

namespace Business
{
	#region " Class BsTypeObjects "
	public class BsTypeObjects : BsObjectList
	{
		public BsTypeObject this[int i_]
		{
			get{ return ( BsTypeObject )(((DictionaryEntry)this.List[i_]).Value);}
		}	

		public BsTypeObject GetKey( int key_ )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key_ ) )
					return ( BsTypeObject )dE.Value;
			}
			return null;
		}
	}
	#endregion

	#region " Class BsTypeObject "
	public class BsTypeObject
	{
		#region " Constructor "
		public BsTypeObject(){}
		public BsTypeObject( int id_ ){_id = id_;}
		#endregion

		#region " Destructor "
		~BsTypeObject(){}
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
						_field.TypeObject.Id = _id;
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

		private BsTypeObject setObject( BsTypeObject m_, DataRow dr_ )
		{
			m_._id			= Convert.ToInt32( dr_["idObject"] );			
			m_._description	= dr_["description"].ToString();
			return m_;
		}

		public void ExcludeObject()
		{
			if( _id <= 0 ) throw new Exception( "id not found. " );
			Database.DaTypeObjects.ExcludeObject( _id );
		}

		public void SaveTypeObject(){Database.DaTypeObjects.SaveObject( ref _id,_description );}

		public BsTypeObject GetObject()
		{	
			if( _id <= 0 ) return this;
			DataTable dt = Database.DaTypeObjects.GetTypeObjects( _id, _description );	
			if( dt.Rows.Count > 0 )
				setObject( this, dt.Rows[0] );
			else _id = 0;
			return this;
		}

		public BsTypeObjects GetObjects()
		{				
			DataTable dt = Database.DaTypeObjects.GetTypeObjects( _id,_description	);				
			return addObjectsList( dt );	
		}

		private BsTypeObjects addObjectsList( DataTable dt_ )
		{
			BsTypeObjects objects = new BsTypeObjects();
			foreach( DataRow dr in dt_.Rows )
				objects.Add( Convert.ToInt32( dr["idObject"] ), setObject(new BsTypeObject(), dr) );
			return objects;
		}

		#endregion
	}

	#endregion
}
