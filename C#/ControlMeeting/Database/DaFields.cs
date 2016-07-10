using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database
{
	#region " Class DaFields "
	public class DaFields
	{
		#region " Constructor "
		public DaFields(){}
		#endregion

		#region " Attributs " 
		private static string conexao;		
		private static SqlConnection cn;
		private static SqlCommand cmd;
		#endregion

		#region " Events "
		private static void createConnection()
		{
			conexao = ConfigurationSettings.AppSettings[ "database" ];		
			cn = new SqlConnection( conexao );
			cmd = new SqlCommand();
		}

		private static void closeConnection()
		{
			cn.Close();
			cmd.Connection.Close();
			cn.Dispose();
			cmd.Dispose();
		}

		public static DataTable GetFieldsByGroups(
			int fieldId,
			int []groups
			)
		{
			createConnection();

			cmd.CommandText = "Sp_GetFieldsByGroups";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groups", DaFunctions.ConvertArrayToString( groups ) );
			cmd.Parameters.Add( "@fieldId", fieldId );
						
			try								
			{
				cn.Open();				
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill( dt );
				return dt;
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void AlterPosition( int idField, int position )
		{
			createConnection();

			cmd.CommandText = "Sp_AlterPositionFields";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add("@idField",idField);
			cmd.Parameters.Add("@position",position);
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static int CountFieldsByForm( int idForm )
		{
			createConnection();

			cmd.CommandText = "Sp_countFields";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add("@idForm",idForm);
							
			try								
			{
				cn.Open();				
				return Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void SaveObject(
			ref int idField, 
			int idForm,
			string name,
			int idType,
			int idObject,
			int idMask,
			int sizeField,
			bool compulsory,
			bool preview,
			bool detail,
			int orders,
			bool exceptions)
		{
			createConnection();

			cmd.CommandText = "Sp_SaveField";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idField", idField );
			cmd.Parameters.Add( "@idForm", idForm );
			cmd.Parameters.Add( "@name", name );
			cmd.Parameters.Add( "@idType", idType );
			cmd.Parameters.Add( "@idObject", idObject );
			cmd.Parameters.Add( "@idMask", idMask );
			cmd.Parameters.Add( "@sizeField", sizeField );
			cmd.Parameters.Add( "@compulsory", compulsory );
			cmd.Parameters.Add( "@preview", preview );
			cmd.Parameters.Add( "@detail", detail );
			cmd.Parameters.Add( "@orders", orders );
			cmd.Parameters.Add( "@exceptions", exceptions );
							
			try								
			{
				cn.Open();				
				idField = Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void ExcludeObject(
			int idField )
		{
			createConnection();

			cmd.CommandText = "Sp_delField";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idField", idField );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static DataTable GetFields(
			int idField,
			int idForm,
			int idType,
			int idObject,
			int idMask )
		{
			createConnection();

			cmd.CommandText = "Sp_getFields";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idField", idField );
			cmd.Parameters.Add( "@idForm", idForm );
			cmd.Parameters.Add( "@idType", idType );
			cmd.Parameters.Add( "@idObject", idObject );
			cmd.Parameters.Add( "@idMask", idMask );
							
			try								
			{
				cn.Open();				
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill( dt );
				return dt;
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void DelFieldsByGroupId( int groupId )
		{
			createConnection();

			cmd.CommandText = "Sp_DelGroupsFields";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );

			try
			{
				cn.Open();
				cmd.ExecuteNonQuery();
			}
			catch( Exception e )
			{ 
				throw e;
			}
			finally{ closeConnection(); }
		}

		#endregion
	}
	#endregion
}