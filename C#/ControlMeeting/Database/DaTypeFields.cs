using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database
{
	#region " Class DaTypeFields "
	public class DaTypeFields
	{
		#region " Constructor "
		public DaTypeFields(){}
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
			ref int idTypeField, string description )
		{
			createConnection();

			cmd.CommandText = "Sp_saveTypeField";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idTypeField", idTypeField );
			cmd.Parameters.Add( "@description", description );
							
			try								
			{
				cn.Open();				
				idTypeField = Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void ExcludeObject(
			int idTypeField )
		{
			createConnection();

			cmd.CommandText = "Sp_delTypeField";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idTypeField", idTypeField );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static DataTable GetTypeFields(
			int idTypeField,
			string description )
		{
			createConnection();

			cmd.CommandText = "Sp_getTypeFields";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idTypeField", idTypeField );
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