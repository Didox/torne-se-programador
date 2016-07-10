using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database
{
	#region " Class DaItensForms "

	public class DaItensForms
	{
		#region " Constructor "
		public DaItensForms()
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

		public static void DelItensFormByGroupId( int groupId, int formId )
		{
			createConnection();

			cmd.CommandText = "Sp_DelItensFormByGroupId";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groupId", groupId );
			cmd.Parameters.Add( "@idForm", formId );

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

		public static void AlterItemFolder(
			int idFolderDrag, int idFolder, 
			int itemDrag, int idForm  )
		{
			createConnection();

			cmd.CommandText = "Sp_AlterItemFolder";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idFolderDrag", idFolderDrag );
			cmd.Parameters.Add( "@idFolder", idFolder );
			cmd.Parameters.Add( "@itemDrag", itemDrag );
			cmd.Parameters.Add( "@idForm", idForm );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static DataTable GetItensFormByGroups(
			int itemFormId,
			int formId, 
			int idFolder, string order, string where,
			int []groups
			)
		{
			createConnection();

			cmd.CommandText = "Sp_GetItensFormByGroups";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@itemFormId", itemFormId );
			cmd.Parameters.Add( "@formId", formId );
			cmd.Parameters.Add( "@idFolder", idFolder );
			cmd.Parameters.Add( "@order", order );
			cmd.Parameters.Add( "@where", where );
			cmd.Parameters.Add( "@groups", DaFunctions.ConvertArrayToString( groups ) );
						
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

		public static DataTable GetItens(
			int idItemForm, int idForm, int idFolder, string order, string where )
		{
			createConnection();

			if( idItemForm != 0 )
			{
				cmd.CommandText = "Sp_getItensId";
				cmd.Connection = cn;
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add( "@idItemForm", idItemForm );
				cmd.Parameters.Add( "@idForm", idForm );
			}
			else
			{
				cmd.CommandText = "Sp_getItensByFormId";
				cmd.Connection = cn;
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add( "@idForm", idForm );
				cmd.Parameters.Add( "@idFolder", idFolder );
				cmd.Parameters.Add( "@order", order );
				cmd.Parameters.Add( "@where", where );
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

		public static void RemoveItem(
			int idItemForm, int idForm )
		{
			createConnection();

			cmd.CommandText = "Sp_removeItemForm";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idItemForm", idItemForm );
			cmd.Parameters.Add( "@idForm", idForm );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void AlterLocationFolder(
			int idFolderDrag, int idFolder, 
			int itemDrag, int idForm  )
		{
			createConnection();

			cmd.CommandText = "Sp_AlterItemFolder";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idFolderDrag", idFolderDrag );
			cmd.Parameters.Add( "@idFolder", idFolder );
			cmd.Parameters.Add( "@itemDrag", itemDrag );
			cmd.Parameters.Add( "@idForm", idForm );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		
		public static void SaveItem(
			string query, ref int id )
		{
			createConnection();

			cmd.CommandText = query;
			cmd.Connection = cn;
							
			try								
			{
				cn.Open();				
				id = Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}
				
		#endregion
	}
	
	#endregion
}