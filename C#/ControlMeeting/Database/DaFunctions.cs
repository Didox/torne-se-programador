using System;

namespace Database
{
	#region " class DaFunctions "
	public class DaFunctions
	{
		#region " Constructor "
		public DaFunctions()
		{
		}
		#endregion

		#region " Events "
		public static string ConvertArrayToString( int [] arrey )
		{
			string values = "";
			for( int i=0; i < arrey.Length; i++ )
			{
				values += arrey[ i ];
				if( i+1 < arrey.Length ) values += ",";
			}
			return values;
		}
		#endregion
	}
	#endregion
}
