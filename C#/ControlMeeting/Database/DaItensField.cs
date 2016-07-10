using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database
{
	#region " Class DaItensField "
	public class DaItensField
	{
		#region " Constructor "
		public DaItensField(){}
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

		public static void SaveObject(
			ref int idItemField, int idField, string valueField )
		{
			createConnection();

			cmd.CommandText = "Sp_SaveItemField";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idItemField", idItemField );
			cmd.Parameters.Add( "@idField", idField );
			cmd.Parameters.Add( "@valueField", valueField );
							
			try								
			{
				cn.Open();				
				idItemField = Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void ExcludeObject(
			int idItemField )
		{
			createConnection();

			cmd.CommandText = "Sp_delItemField";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idItemField", idItemField );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static DataTable GetItemFields(
			int idItemField,
			int idField )
		{
			createConnection();

			cmd.CommandText = "Sp_getItemFields";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idItemField", idItemField );
			cmd.Parameters.Add( "@idField", idField );
							
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
		#endregion
	}
	#endregion
}