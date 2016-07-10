using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database
{
	#region " Class DaMasks "
	public class DaMasks
	{
		#region " Constructor "
		public DaMasks(){}
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
			ref int idMask, string description, string descMask )
		{
			createConnection();

			cmd.CommandText = "Sp_SaveMask";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idMask", idMask );
			cmd.Parameters.Add( "@description", description );
			cmd.Parameters.Add( "@descMask", descMask );
							
			try								
			{
				cn.Open();				
				idMask = Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void ExcludeObject(
			int idMask )
		{
			createConnection();

			cmd.CommandText = "Sp_delMask";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idMask", idMask );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static DataTable GetMasks(
			int idMask,
			string description )
		{
			createConnection();

			cmd.CommandText = "Sp_getMasks";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idMask", idMask );
			cmd.Parameters.Add( "@description", description );
							
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