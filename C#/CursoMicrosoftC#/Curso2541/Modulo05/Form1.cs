using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Modulo05
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void tb_ClientesBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.tb_ClientesBindingSource.EndEdit();
            this.tb_ClientesTableAdapter.Update(this.curso2541DataSet.tb_Clientes);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
        }
    }
}