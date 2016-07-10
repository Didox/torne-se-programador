using System;
using System.Collections;

namespace Business
{
	#region " Class BsObjectList "
	public class BsObjectList : CollectionBase
	{
		#region " Constructors "
		/*public Object this[int key]
		{
			get
			{
				for( int x=0; x < this.Count; x++ )
				{
					DictionaryEntry dE = ( DictionaryEntry )this.List[x];
					if( dE.Key.Equals( key ) )
						return dE.Value;
				}
				return null;
			}
		}	
		*/

		#endregion

		#region " Events "

		//public virtual Object index( int i ){ return ( ( DictionaryEntry )this.List[i] ).Value; }
		
		public void Add( int key, Object value )
		{
			this.List.Add( new DictionaryEntry( key , value ) );
		}

		public bool ContainsKey( int key )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key ) )
					return true;
			}
			return false;
		}
		
		public void Remove( int key )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key ) )
				{
					this.List.Remove( dE );
					break;
				}
			}
		}

		#endregion
	}

	#endregion
}
