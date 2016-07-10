using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public class DaClientes
{
    public DaClientes(){ }

    private static SqlConnection _cn;
    private static SqlCommand _cm;

    private static void createConnection()
    {
        _cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
    }

    private static void createFile(string message)
    {
        StreamWriter sr = new StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "file.txt",true);        
        sr.WriteLine(message);
        sr.Dispose();
    }

    private static void closeConnection()
    {
        _cn.Close();
        _cn = null;
    }

    public static int Gravar(BsCliente c)
    {
        createConnection();
        try
        {
            _cm = new SqlCommand("P_GravaCliente", _cn);
            _cm.CommandType = CommandType.StoredProcedure;
            _cm.Parameters.AddWithValue("@nome", c.Nome);
            SqlParameter pr = new SqlParameter("@id", SqlDbType.Int);
            pr.Direction = ParameterDirection.Output;
            _cm.Parameters.Add(pr);
            _cn.Open();
            _cm.ExecuteNonQuery();
            return Convert.ToInt32(_cm.Parameters["@id"].Value);
        }
        catch (SqlException sqlE)
        {
            createFile("SQL Error: " + sqlE.Message);
            return 0;
        }
        catch (Exception e)
        {
            createFile("Error: " + e.Message);
            return 0;
        }
        finally{closeConnection();}
    }

    public static BsClientes GetClientes(BsCliente c)
    {
        createConnection();
        try
        {
            BsClientes cs = new BsClientes();
            _cm = new SqlCommand("P_GetClientes", _cn);
            _cm.CommandType = CommandType.StoredProcedure;
            _cm.Parameters.AddWithValue("@id", c.Id);
            _cm.Parameters.AddWithValue("@nome", c.Nome);
            _cn.Open();
            SqlDataReader dr = _cm.ExecuteReader();
            while (dr.Read())
                cs.Add( new BsCliente(Convert.ToInt32(dr["id"]), dr["nome"].ToString()) );
            return cs;
        }
        catch (SqlException sqlE)
        {
            createFile("SQL Error: " + sqlE.Message);
            return null;
        }
        catch (Exception e)
        {
            createFile("Error: " + e.Message);
            return null;
        }
        finally { closeConnection(); }
    }

    public static DataSet GetClientesOffLine(BsCliente c)
    {
        createConnection();
        try
        {
            BsClientes cs = new BsClientes();
            _cm = new SqlCommand("P_GetClientes", _cn);
            _cm.CommandType = CommandType.StoredProcedure;
            _cm.Parameters.AddWithValue("@id", c.Id);
            _cm.Parameters.AddWithValue("@nome", c.Nome);
            SqlDataAdapter da = new SqlDataAdapter(_cm);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        catch (SqlException sqlE)
        {
            createFile("SQL Error: " + sqlE.Message);
            return null;
        }
        catch (Exception e)
        {
            createFile("Error: " + e.Message);
            return null;
        }
        finally { closeConnection(); }
    }
}
