using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database
{
	#region " Class DaGroups "
	public class DaGroups
	{
		#region " Constructor "
		public DaGroups(){}
		#endregion

		#region " Attributs " 
		private static string conexao;		
		private static SqlConnection cn;
		private static SqlCommand cmd;

		#endregion

		#region " Events "
		public static void AddGroupUser( int userId, int groupId )
		{
			createConnection();
			cmd.CommandText = "Sp_AddGroupByUser";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );
			cmd.Parameters.Add( "@userId", userId );
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

		public static void AddGroupField( int fieldId, int groupId )
		{
			createConnection();
			cmd.CommandText = "Sp_AddGroupByField";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );
			cmd.Parameters.Add( "@fieldId", fieldId );
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

		public static void AddGroupByUser( int assId, int []groupIds )
		{
			if( groupIds.Length > 0 ) deleteGroupsByUserId( assId );
			for( int i=0; i < groupIds.Length; i++ )
				if( groupIds[i] != 0 ) AddGroupUser( assId, groupIds[i] );
		}

		private static void deleteGroupsByUserId( int Id )
		{
			createConnection();
			cmd.CommandText = "Sp_DeleteGroupsByUserId";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@userId", Id );
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

		public static DataTable GetGroupsByUsers(
			int groupId,
			string description,
			int[] users
			)
		{
			createConnection();
			cmd.CommandText = "Sp_GetGroupsByUsers";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );
			cmd.Parameters.Add( "@description", description );
			cmd.Parameters.Add( "@users", DaFunctions.ConvertArrayToString( users ) );
							
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

		public static DataTable GetGroupsByFields(
			int groupId,
			string description,
			int[] fields
			)
		{
			createConnection();
			cmd.CommandText = "Sp_GetGroupsByFields";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );
			cmd.Parameters.Add( "@description", description );
			cmd.Parameters.Add( "@fields", DaFunctions.ConvertArrayToString( fields ) );
							
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

		public static DataTable GetGroupsByFolders(
			int groupId,
			string description,
			int[] folders
			)
		{
			createConnection();
			cmd.CommandText = "Sp_GetGroupsByFolders";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );
			cmd.Parameters.Add( "@description", description );
			cmd.Parameters.Add( "@folders", DaFunctions.ConvertArrayToString( folders ) );
							
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

		public static DataTable GetGroupsByItensForm(
			int groupId,
			int formId,
			int[] itens
			)
		{
			createConnection();
			cmd.CommandText = "Sp_GetGroupsByItensForm";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );
			cmd.Parameters.Add( "@formId", formId );
			cmd.Parameters.Add( "@itens", DaFunctions.ConvertArrayToString( itens ) );
							
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

		public static DataTable GetGroups(
			int groupId,
			string description,
			int idFolder,
			int idField,
			int userId,
			int itemFormId,
			int formId
			)
		{
			createConnection();

			if( idFolder != 0 )
			{
				cmd.CommandText = "Sp_GetGroupsByFoldersId";
				cmd.Connection = cn;
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add( "@idFolder", idFolder );
			}
			else if( idField != 0 )
			{
				cmd.CommandText = "Sp_GetGroupsByFieldId";
				cmd.Connection = cn;
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add( "@idField", idField );
			}
			else if( userId != 0 )
			{
				cmd.CommandText = "Sp_GetGroupsByUserId";
				cmd.Connection = cn;
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add( "@userId", userId );
			}
			else if( itemFormId != 0 )
			{
				cmd.CommandText = "Sp_GetGroupsByItemFormId";
				cmd.Connection = cn;
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add( "@itemFormId", itemFormId );
				cmd.Parameters.Add( "@formId", formId );
			}
			else
			{
				cmd.CommandText = "Sp_GetGroups";
				cmd.Connection = cn;
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add( "@groupId", groupId );
				cmd.Parameters.Add( "@description", description );
			}
							
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

		public static int AddGroupFolder( int groupId, int idFolder )
		{
			createConnection();

			cmd.CommandText = "Sp_AddGroupFolder";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );
			cmd.Parameters.Add( "@idFolder", idFolder );

			try
			{
				cn.Open();
				return Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e )
			{ 
				throw e;
			}
			finally{ closeConnection(); }
		}

		public static int AddGroupItemForm( int groupId, int idItemForm, int idForm )
		{
			createConnection();

			cmd.CommandText = "Sp_AddGroupItemForm";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );
			cmd.Parameters.Add( "@idItemForm", idItemForm );
			cmd.Parameters.Add( "@idForm", idForm );

			try
			{
				cn.Open();
				return Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e )
			{ 
				throw e;
			}
			finally{ closeConnection(); }
		}

		public static void DelGroupsByFolderId( int idFolder )
		{
			createConnection();

			cmd.CommandText = "Sp_DelFolderGroups";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idFolder", idFolder );

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
	
		public static void DelGroupsByFieldId( int idField )
		{
			createConnection();

			cmd.CommandText = "Sp_DelFieldGroups";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idField", idField );

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

		public static void DelGroupsByItemFormId( int idItemForm, int idForm )
		{
			createConnection();

			cmd.CommandText = "Sp_DeleteGroupsByItemFormId";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idItemForm", idItemForm );
			cmd.Parameters.Add( "@idForm", idForm );

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

		public static void DelGroupsByUserId( int idUser )
		{
			createConnection();

			cmd.CommandText = "Sp_DelGroupsByUserId";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idUser", idUser );

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

		public static void ExcludeObject( int groupId )
		{
			createConnection();

			cmd.CommandText = "Sp_DelGroups";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );

			try
			{
				cn.Open();
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void SaveObject(
			ref int groupId,
			string description
			)
		{
			createConnection();
			cmd.CommandText = "Sp_SaveGroups";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );
			cmd.Parameters.Add( "@description", description );

			try
			{
				cn.Open();
				groupId = Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e;}
			finally{ closeConnection(); }
		}	

		#endregion
	}

	#endregion
}
