using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Configuration;

namespace DataBase
{
	 #region Class GrupoCliente
	 public class GrupoCliente
	{
		#region Atributos
		private readonly string strConn = string.Empty;
		public DbTransaction sqlTrans;
		public bool isTransaction;
		private SqlConnection cn = null;
		private SqlCommand cmd = null;
		#endregion

		#region Construtor
		public GrupoCliente()
		{
			try{ strConn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString; }
			catch(Exception ex){ throw ex; }
		}
		#endregion
	
		#region Métodos

		public void OpenConnection()
		{
			cn = new SqlConnection(strConn);
			cn.Open();
			cmd.Connection = cn;
		}

		public void CloseConnection()
		{
			if (cn != null)
			{
				if (cn.State == ConnectionState.Open && sqlTrans == null)
				{
					cn.Close();
					cn.Dispose();
				}
			}
			if (cmd != null) cmd.Dispose();
		}

		public void OpenConnectionTrans()
		{
			if (isTransaction)
			{
				if (sqlTrans == null)
				{
					OpenConnection();
					cmd.Transaction = cmd.Connection.BeginTransaction();
					sqlTrans = cmd.Transaction;
				}
				else
				{
					cmd.Connection = (SqlConnection)sqlTrans.Connection;
					cmd.Transaction = (SqlTransaction)sqlTrans;
				}
			}
			else OpenConnection();
		}

		public DbTransaction Save(int? idGrupo_, int? idCliente_)
		{
			try
			{
				cmd = new SqlCommand();
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.CommandText = "usp_SaveGrupoCliente";

				if (idGrupo_ == null) cmd.Parameters.AddWithValue("@idGrupo", DBNull.Value);
				else cmd.Parameters.AddWithValue("@idGrupo", idGrupo_);

				if (idCliente_ == null) cmd.Parameters.AddWithValue("@idCliente", DBNull.Value);
				else cmd.Parameters.AddWithValue("@idCliente", idCliente_);

				OpenConnectionTrans();
				cmd.ExecuteNonQuery().ToString();
				return sqlTrans;
			}
			catch (SqlException sex){ throw sex; }
			catch (Exception ex){ throw ex; }
			finally { CloseConnection(); }
		}
		public DbTransaction Delete(int? idGrupo_, int? idCliente_)
		{
			try
			{
				cmd = new SqlCommand();
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.CommandText = "usp_DelGrupoCliente";

				if (idGrupo_ == null) cmd.Parameters.AddWithValue("@idGrupo", DBNull.Value);
				else cmd.Parameters.AddWithValue("@idGrupo", idGrupo_);

				if (idCliente_ == null) cmd.Parameters.AddWithValue("@idCliente", DBNull.Value);
				else cmd.Parameters.AddWithValue("@idCliente", idCliente_);

				OpenConnectionTrans();
				cmd.ExecuteNonQuery();
				return sqlTrans;
			}
			catch (SqlException sex){ throw sex; }
			catch (Exception ex){ throw ex; }
			finally { CloseConnection(); }
		}
		public DbDataReader Get_Cliente(int? idGrupo_)
		{
			try
			{
				cmd = new SqlCommand();
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.CommandText = "usp_GetGrupoClienteCliente";
				cmd.Parameters.AddWithValue("@idGrupo", idGrupo_);

				OpenConnection();
				return cmd.ExecuteReader();
			}
			catch (SqlException sex){ throw sex; }
			catch (Exception ex){ throw ex; }
		}


		public DbDataReader Get_Grupo(int? idCliente_)
		{
			try
			{
				cmd = new SqlCommand();
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.CommandText = "usp_GetGrupoClienteGrupo";
				cmd.Parameters.AddWithValue("@idCliente", idCliente_);

				OpenConnection();
				return cmd.ExecuteReader();
			}
			catch (SqlException sex){ throw sex; }
			catch (Exception ex){ throw ex; }
		}
		#endregion
	}
	 #endregion
}