using System;
using System.Collections;
using System.Web;
using System.Data;

namespace Business
{
	#region " Class BsMasks "
	public class BsMasks : BsObjectList
	{
		public BsMask this[int i_]
		{
			get{ return ( BsMask )(((DictionaryEntry)this.List[i_]).Value);}
		}	

		public BsMask GetKey( int key_ )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key_ ) )
					return ( BsMask )dE.Value;
			}
			return null;
		}
	}
	#endregion

	#region " Class BsMask "
	public class BsMask
	{
		#region " Constructor "
		public BsMask(){}
		public BsMask( int id_ ){_id = id_;}
		#endregion

		#region " Destructor "
		~BsMask(){}
		#endregion

		#region " Attributes "
		private int			_id = 0;
		private string		_description = "";
		private string		_desMask = "";
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

		public string DesMask
		{
			get{return _desMask;}
			set{_desMask = value.Replace("'", "");}
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
						_field.Mask.Id = _id;
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

		private BsMask setObject( BsMask m_, DataRow dr_ )
		{
			m_._id			= Convert.ToInt32( dr_["idMask"] );			
			m_._description	= dr_["description"].ToString();
			m_._desMask		= dr_["mask"].ToString();		
			return m_;
		}

		public void ExcludeObject()
		{
			if( _id <= 0 ) throw new Exception( "id not found. " );
			Database.DaMasks.ExcludeObject( _id );
		}

		public void SaveObject() { Database.DaMasks.SaveObject( ref _id, _description, _desMask ); }

		public BsMask GetObject()
		{	
			if( _id <= 0 ) return this;
			DataTable dt = Database.DaMasks.GetMasks( _id, _description );	
			if( dt.Rows.Count > 0 )
				setObject( this, dt.Rows[0] );
			else _id = 0;
			return this;
		}

		public BsMasks GetObjects()
		{				
			DataTable dt = Database.DaMasks.GetMasks( _id,_description	);				
			return addObjectsList( dt );	
		}

		private BsMasks addObjectsList( DataTable dt_ )
		{
			BsMasks objects = new BsMasks();
			foreach( DataRow dr in dt_.Rows )
				objects.Add( Convert.ToInt32( dr["idMask"] ), setObject(new BsMask(), dr) );
			return objects;
		}

		#endregion
	}

	#endregion
}
