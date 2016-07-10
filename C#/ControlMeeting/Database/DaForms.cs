using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database
{
	#region " Class DaForms "

	public class DaForms
	{
		#region " Constructor "
		public DaForms()
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

		public static void AlterFormLocation(
			int idForm,
			int idFolderAnt,
			int idFolder
			)
		{
			createConnection();

			cmd.CommandText = "Sp_alterFormFolder";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idForm", idForm );
			cmd.Parameters.Add( "@idFolderAnt", idFolderAnt );
			cmd.Parameters.Add( "@idFolder", idFolder );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void SaveForm(
			ref int idForm, string name, int idUser, bool anexo, bool enabledDate, bool enabledUser )
		{
			createConnection();

			cmd.CommandText = "Sp_SaveForm";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idForm", idForm );
			cmd.Parameters.Add( "@name", name );
			cmd.Parameters.Add( "@idUser", idUser );
			cmd.Parameters.Add( "@anexo", Convert.ToInt16( anexo ) );
			cmd.Parameters.Add( "@enabledDate", Convert.ToInt16( enabledDate ) );
			cmd.Parameters.Add( "@enabledUser", Convert.ToInt16( enabledUser ) );
							
			try								
			{
				cn.Open();				
				idForm = Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void DelForm(
			int idForm )
		{
			createConnection();

			cmd.CommandText = "Sp_delForm";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idForm", idForm );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}		
				
		public static DataTable GetForms(
			int idForm,
			int idFolder,
			string name )
		{
			createConnection();

			cmd.CommandText = "Sp_getForms";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idFolder", idFolder );
			cmd.Parameters.Add( "@idForm", idForm );
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
		
		public static DataTable GetFormsNotIdFolder(
			int idFolder )
		{
			createConnection();

			cmd.CommandText = "Sp_getFormsNotIdFolder";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idFolder", idFolder );
							
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