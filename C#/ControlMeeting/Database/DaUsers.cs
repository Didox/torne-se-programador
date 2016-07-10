using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Database
{
	#region " Class DaUsers "
	public class DaUsers
	{
		#region " Constructor "
		public DaUsers()
		{
			
		}

		#endregion

		#region " Attributs " 
		private string conexao;		
		private SqlConnection cn;
		private SqlCommand cmd;

		#endregion

		#region " Events "

		private void createConnection()
		{
			conexao = ConfigurationSettings.AppSettings[ "database" ];		
			cn = new SqlConnection( conexao );
			cmd = new SqlCommand();
		}

		private void closeConnection()
		{
			cn.Close();
			cmd.Connection.Close();
			cn.Dispose();
			cmd.Dispose();
		}

		public DataTable GetUsersByGroups(
			int userId,
			int []groups
			)
		{
			createConnection();

			cmd.CommandText = "Sp_GetUsersByGroups";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@groups", DaFunctions.ConvertArrayToString( groups ) );
			cmd.Parameters.Add( "@userId", userId );
						
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

		public DataTable GetUsers(
			int userId,
			string login,
			string nome
			)
		{
			createConnection();

			cmd.CommandText = "Sp_GetUsers";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@userId", userId );
			cmd.Parameters.Add( "@login", login );
			cmd.Parameters.Add( "@nome", nome );
							
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

		public void ExcludeObject( int userId )
		{
			createConnection();

			cmd.CommandText = "Sp_DelUsers";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@userId", userId );

			try
			{
				cn.Open();
				cmd.ExecuteNonQuery();
			}
			catch( Exception e ){ throw e; }
			finally{ closeConnection(); }
		}

		public DataTable LoginOn( string login, string senha )
		{
			createConnection();
			cmd.CommandText = "sp_loginOn";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@login", login );
			cmd.Parameters.Add( "@senha", senha );
							
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

		public void SaveObject(
			ref int userId,
			string login,
			string senha,
			string nome,
			string email,
			bool admin
			)
		{
			createConnection();
			cmd.CommandText = "Sp_UsersGravar";
			cmd.Connection = cn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@userId", userId );		
			cmd.Parameters.Add( "@login", login );		
			cmd.Parameters.Add( "@senha", senha );		
			cmd.Parameters.Add( "@nome", nome );
			cmd.Parameters.Add( "@email", email );
			cmd.Parameters.Add( "@admin", admin );

			try
			{
				cn.Open();
				userId = Convert.ToInt32( "0" + cmd.ExecuteScalar() );
			}
			catch( Exception e )
			{ 
				throw e;
			}
			finally{ closeConnection(); }
		}

		public void DelUsersByGroupId( int groupId )
		{
			createConnection();

			cmd.CommandText = "Sp_DelGroupsUsers";
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
