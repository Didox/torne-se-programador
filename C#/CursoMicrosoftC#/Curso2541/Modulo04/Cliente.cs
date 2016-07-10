using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Modulo04
{
    class Cliente
    {
        public string ObterClientesXML()
        {
            DataSet ds = new DataSet();
            ds.ReadXml(AppDomain.CurrentDomain.BaseDirectory + "clientes.xml");
            return ds.GetXml();
        }

        public void ObterClientesBase(ref DataSet ds)
        {
            SqlDataAdapter da = new SqlDataAdapter();
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
            cn.Open();
            SqlCommand cm = new SqlCommand();
            cm.Connection = cn;
            cm.CommandText = "select * from tb_clientes";
            da = new SqlDataAdapter(cm);
            da.Fill(ds);
        }

        public void UpdateXml()
        {
            DataSet ds = new DataSet();
            /*SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
            cn.Open();
            SqlCommand cm = new SqlCommand();
            cm.Connection = cn;
            cm.CommandText = "select top 1 id, nome from tb_clientes where 1=2";
            SqlDataAdapter da = new SqlDataAdapter(cm);
            da.Fill(ds);*/



            ds.ReadXmlSchema(AppDomain.CurrentDomain.BaseDirectory + "clientes.xsd");
            // esquema para não precisar usar o método fill
            SqlDataAdapter da = new SqlDataAdapter();
            ds.ReadXml(AppDomain.CurrentDomain.BaseDirectory + "clientes.xml", XmlReadMode.DiffGram);            
            SqlCommandBuilder cb = new SqlCommandBuilder(da);
            da.Update(ds.Tables[0]);

            /* outro modo de inserção

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
            cn.Open();
            SqlCommand cm = new SqlCommand();
            cm.Connection = cn;
            cm.CommandText = "insert tb_Clientes(Nome)Values(@Nome)";
            cm.Parameters.Add( new SqlParameter("@Nome", SqlDbType.VarChar, 50, "Nome");
            SqlDataAdapter da = new SqlDataAdapter(cm);
            da.Update(ds);
            */

        }
    }
}
