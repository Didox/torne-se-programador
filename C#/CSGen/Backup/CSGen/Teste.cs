namespace CSGen
{
    using CSGen.Code;
    using CSGen.GeraDataBaseClass;
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Text;
    using System.Windows.Forms;

    public class Teste : Form
    {
        private IContainer components;
        private RichTextBox richTextBox1;

        public Teste()
        {
            this.InitializeComponent();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            StringBuilder builder = new StringBuilder();
            foreach (SqlTable table in Program.SqlTableList)
            {
                if (table.ClassDataBaseNome == "Pedido_itens")
                {
                    builder.AppendLine(GerarDataBaseClass.GerarClasses(table));
                    builder.AppendLine();
                    builder.AppendLine();
                    break;
                }
            }
            this.richTextBox1.Text = builder.ToString();
        }

        private void InitializeComponent()
        {
            this.richTextBox1 = new RichTextBox();
            base.SuspendLayout();
            this.richTextBox1.Dock = DockStyle.Fill;
            this.richTextBox1.Location = new Point(0, 0);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new Size(0x323, 0x20f);
            this.richTextBox1.TabIndex = 0;
            this.richTextBox1.Text = "";
            base.AutoScaleDimensions = new SizeF(6f, 13f);
            base.AutoScaleMode = AutoScaleMode.Font;
            base.ClientSize = new Size(0x323, 0x20f);
            base.Controls.Add(this.richTextBox1);
            base.Name = "Form4";
            this.Text = "Form4";
            base.Load += new EventHandler(this.Form4_Load);
            base.ResumeLayout(false);
        }
    }
}

