using System;
using System.Collections;
using System.Web;
using System.Data;

namespace Business
{
	#region " Class BsItensField "
	public class BsItensField : BsObjectList
	{
		public BsItemField this[int i_]
		{
			get{ return ( BsItemField )(((DictionaryEntry)this.List[i_]).Value);}
		}	

		public BsItemField GetKey( int key_ )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key_ ) )
					return ( BsItemField )dE.Value;
			}
			return null;
		}
	}
	#endregion

	#region " Class BsItemField "
	public class BsItemField
	{
		#region " Constructor "
		public BsItemField(){}
		public BsItemField( int id_ ){_id = id_;}
		public BsItemField( BsField field_ ){_field = field_;}
		#endregion

		#region " Destructor "
		~BsItemField(){}
		#endregion

		#region " Attributes "
		private int			_id = 0;
		private string		_value = "";
		private BsField		_field;

		#endregion

		#region " Properties "
		public int Id			
		{
			get{ return _id; }
			set{ _id = value; }
		}

		public string Value
		{
			get{return _value;}
			set{_value = value.Replace("'", "");}
		}

		public BsField Field		
		{
			get
			{
				if( _field == null ) _field = new BsField();
				return _field;
			}
		}

		#endregion

		#region " Events "

		private BsItemField setObject( BsItemField f_, DataRow dr_ )
		{
			f_._id				= Convert.ToInt32( dr_["idItemField"] );
			f_.Value			= dr_["valueField"].ToString();

			f_.Field.Id				= Convert.ToInt32( dr_["idField"] );
			f_.Field.Name			= dr_["name"].ToString();
			f_.Field.Size			= Convert.ToInt32( dr_["sizeField"] );
			f_.Field.Compulsory		= Convert.ToBoolean( dr_["compulsory"] );
			f_.Field.Preview		= Convert.ToBoolean( dr_["preview"] );
			f_.Field.Detail			= Convert.ToBoolean( dr_["detail"] );
			f_.Field.Orders			= Convert.ToInt32( dr_["orders"] );
			f_.Field.Form.Id		= Convert.ToInt32( dr_["idForm"] );
			f_.Field.Type.Id		= Convert.ToInt32( dr_["idType"] );
			f_.Field.TypeObject.Id	= Convert.ToInt32( dr_["idObject"] );
			f_.Field.Mask.Id		= Convert.ToInt32( dr_["idMask"] );

			return f_;
		}

		public void ExcludeObject()
		{
			if( _id <= 0 ) throw new Exception( "id not found. " );
			Database.DaItensField.ExcludeObject( _id );
		}

		public void SaveObject() { Database.DaItensField.SaveObject( ref _id, Field.Id, _value ); }

		public BsItemField GetObject()
		{	
			if( _id <= 0 ) return this;
			DataTable dt = Database.DaItensField.GetItemFields( _id, Field.Id );	
			if( dt.Rows.Count > 0 )
				setObject( this, dt.Rows[0] );
			else _id = 0;
			return this;
		}

		public BsItensField GetObjects()
		{				
			DataTable dt = Database.DaItensField.GetItemFields( _id, Field.Id);				
			return addObjectsList( dt );	
		}

		private BsItensField addObjectsList( DataTable dt_ )
		{
			BsItensField objects = new BsItensField();
			foreach( DataRow dr in dt_.Rows )
				objects.Add( Convert.ToInt32( dr["idItemField"] ), setObject(new BsItemField(), dr) );
			return objects;
		}

		#endregion
	}

	#endregion
}
