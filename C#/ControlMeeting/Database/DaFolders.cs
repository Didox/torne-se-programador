using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database
{
	#region " Class DaFolder "

	public class DaFolders
	{
		#region " Constructor "
		public DaFolders()
		{
			
		}

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

		public static void DelFoldersByGroupId( int groupId )
		{
			createConnection();

			cmd.CommandText = "Sp_DelGroupsFolder";
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

		public static DataTable GetFoldersByGroups(
			int idFolder,
			int idParent,
			string name,
			int []groups
			)
		{
			createConnection();

			cmd.CommandText = "Sp_GetFoldersByGroups";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groups", DaFunctions.ConvertArrayToString( groups ) );
			cmd.Parameters.Add( "@idFolder", idFolder );
			cmd.Parameters.Add( "@idParent", idParent );
			cmd.Parameters.Add( "@name", name );
					
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

		public static DataTable GetFolders(
			int idFolder,
			int idParent,
			string name
			)
		{
			createConnection();
			
			cmd.CommandText = "Sp_getFolder";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idFolder", idFolder );
			cmd.Parameters.Add( "@idParent", idParent );
			cmd.Parameters.Add( "@name", name );
							
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
		
		public static void RemoveForm(
			int idForm,
			int idFolder
			)
		{
			createConnection();

			cmd.CommandText = "Sp_RemoveFormFolder";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idForm", idForm );
			cmd.Parameters.Add( "@idFolder", idFolder );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void AlterLocationFolder(
			int idFolderNew, int idFolderChild )
		{
			createConnection();

			cmd.CommandText = "Sp_AlterLocationFolder";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idFolderNew", idFolderNew );
			cmd.Parameters.Add( "@idFolderChild", idFolderChild );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void AddForm(
			int idForm,
			int idFolder
			)
		{
			createConnection();

			cmd.CommandText = "Sp_addFormFolder";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idForm", idForm );
			cmd.Parameters.Add( "@idFolder", idFolder );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static int CountChild(
			int idParent,
			int []groups
			)
		{				
			createConnection();

			if( groups.Length > 0 )
			{
				cmd.CommandText = "Sp_getContChildByGroups";
				cmd.Connection = cn;
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add( "@idParent", idParent );
				cmd.Parameters.Add( "@groups", DaFunctions.ConvertArrayToString( groups ) );
			}
			else
			{
				cmd.CommandText = "Sp_getContChild";
				cmd.Connection = cn;
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add( "@idParent", idParent );
			}
							
			try								
			{
				cn.Open();				
				return Convert.ToInt32( cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void SaveObject(
			ref int idFolder,
			int idParent,
			string name,
			int idUser
			)
		{
			createConnection();

			cmd.CommandText = "Sp_saveFolder";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idParent", idParent );			
			cmd.Parameters.Add( "@idFolder", idFolder );
			cmd.Parameters.Add( "@name", name );			
			cmd.Parameters.Add( "@idUser", idUser );
							
			try								
			{
				cn.Open();
				idFolder = Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void ExcludeObject(
			int idFolder
			)
		{
			createConnection();

			cmd.CommandText = "Sp_deleFolder";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idFolder", idFolder );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		#endregion
	}

	#endregion
}
