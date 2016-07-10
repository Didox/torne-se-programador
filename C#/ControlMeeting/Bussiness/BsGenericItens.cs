using System;
using System.Collections;
using System.Web;
using System.Data;

namespace Business
{
	#region " Class BsGenericItens "
	public class BsGenericItens : BsObjectList
	{
		public BsGenericItem this[int i_]
		{
			get{ return ( BsGenericItem )(((DictionaryEntry)this.List[i_]).Value);}
		}	

		public BsGenericItem GetKey( BsField f )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( f.Id ) )
					return ( BsGenericItem )dE.Value;
			}
			return null;
		}
	}
	#endregion

	#region " Class BsGenericItem "
	public class BsGenericItem
	{
		#region " Constructor "
		public BsGenericItem(){}
		public BsGenericItem( string value_ )
		{
			_value = value_;
		}
		#endregion

		#region " Destructor "
		~BsGenericItem(){}
		#endregion

		#region " Attributes "
		private string	_value = "";

		#endregion

		#region " Properties "
		public string Value
		{
			get{return ( _value == null ? "***" : _value );}
			set{_value = value.Replace("'", "");}
		}

		#endregion
	}

	#endregion
}
