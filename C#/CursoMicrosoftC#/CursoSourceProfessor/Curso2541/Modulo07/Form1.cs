using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Data.SqlClient;

using BusinessRule2541.Business;

namespace Modulo07
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Cmd_LerXml_Click(object sender, EventArgs e)
        {
            //XmlReaderSettings ObjXmlReaderSettings = new XmlReaderSettings();
            XmlReader ObjXmlReader = XmlReader.Create(@"C:\Curso2541\Modulo07\Clientes.xml");

            XmlDocument ObjXmlDocument = new XmlDocument();
            ObjXmlDocument.Load(ObjXmlReader);

            XmlNodeList ObjXmlNodeList = ObjXmlDocument.GetElementsByTagName("Cliente");

            Clientes ObjClientes = new Clientes();
            

            foreach (XmlNode No in ObjXmlNodeList)
            {
                Cliente ObjCliente = new Cliente();

                ObjCliente.Id = Convert.ToInt32(No["ID"].InnerText);
                ObjCliente.Nome = No["Nome"].InnerText;

                ObjClientes.Add(ObjCliente);
            }

            Dtg_Clientes.DataSource = ObjClientes;
        }
    }
}