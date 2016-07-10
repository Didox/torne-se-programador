using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database
{
	#region " Class DaTypeObjects "
	public class DaTypeObjects
	{
		#region " Constructor "
		public DaTypeObjects(){}
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
			ref int idTypeObject, string description )
		{
			createConnection();

			cmd.CommandText = "Sp_SaveTypeObject";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idTypeObject", idTypeObject );
			cmd.Parameters.Add( "@description", description );
							
			try								
			{
				cn.Open();				
				idTypeObject = Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void ExcludeObject(
			int idTypeObject )
		{
			createConnection();

			cmd.CommandText = "Sp_delTypeObject";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idTypeObject", idTypeObject );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static DataTable GetTypeObjects(
			int idTypeObject,
			string description )
		{
			createConnection();

			cmd.CommandText = "Sp_getTypeObjects";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idTypeObject", idTypeObject );
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