using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database
{
	#region " Class DaReviewsForm "
	public class DaReviewsForm
	{
		#region " Constructor "
		public DaReviewsForm(){}
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
			ref int idReview, int idUser, int idItemForm, int idForm, string review )
		{
			createConnection();

			cmd.CommandText = "Sp_SaveReviewForm";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idReview", idReview );
			cmd.Parameters.Add( "@idUser", idUser );
			cmd.Parameters.Add( "@idForm", idForm );
			cmd.Parameters.Add( "@idItemForm", idItemForm );
			cmd.Parameters.Add( "@review", review );
							
			try								
			{
				cn.Open();				
				idReview = Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static void ExcludeObject(
			int idReview, int idForm )
		{
			createConnection();

			cmd.CommandText = "Sp_DelReviewForm";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idReview", idReview );
			cmd.Parameters.Add( "@idForm", idForm );
							
			try								
			{
				cn.Open();				
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public static DataTable GetReviews(
			int idReview, int idItemForm, int idForm, string order )
		{
			createConnection();

			cmd.CommandText = "Sp_getReviewsForm";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@idReview", idReview );
			cmd.Parameters.Add( "@idItemForm", idItemForm );
			cmd.Parameters.Add( "@idForm", idForm );
			cmd.Parameters.Add( "@order", order );
							
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