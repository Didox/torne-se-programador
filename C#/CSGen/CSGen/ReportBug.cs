namespace CSGen
{
    using CSGen.wsLuisSanches;
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    public class ReportBug : Form
    {
        private Button button1;
        private IContainer components;
        private GroupBox groupBox1;
        private Label label1;
        private Label label2;
        private Label label3;
        private Label label4;
        private TextBox txtEmail;
        private TextBox txtNome;
        private TextBox txtTexto;
        private TextBox txtTitulo;

        public ReportBug()
        {
            this.InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (this.ValidarForm())
            {
                this.button1.Enabled = false;
                this.Cursor = Cursors.WaitCursor;
                this.Text = "Aguarde, transmitindo report....";
                this.Refresh();
                new LuisSanchesServices().ReportBug(4, this.txtNome.Text, this.txtEmail.Text, this.txtTitulo.Text, this.txtTexto.Text, "parabensvcdescobriu");
                this.button1.Enabled = true;
                this.Cursor = Cursors.Default;
                this.Text = "";
                this.Refresh();
                MessageBox.Show("Obrigado, seu report foi transmitido com sucesso!", "BUG", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                base.Close();
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.button1 = new Button();
            this.groupBox1 = new GroupBox();
            this.txtTexto = new TextBox();
            this.label4 = new Label();
            this.txtTitulo = new TextBox();
            this.label3 = new Label();
            this.txtEmail = new TextBox();
            this.label2 = new Label();
            this.txtNome = new TextBox();
            this.label1 = new Label();
            this.groupBox1.SuspendLayout();
            base.SuspendLayout();
            this.button1.Location = new Point(0x6d, 0x101);
            this.button1.Name = "button1";
            this.button1.Size = new Size(290, 0x17);
            this.button1.TabIndex = 5;
            this.button1.Text = "Gravar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new EventHandler(this.button1_Click);
            this.groupBox1.Controls.Add(this.txtTexto);
            this.groupBox1.Controls.Add(this.button1);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.txtTitulo);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.txtEmail);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.txtNome);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new Point(12, 7);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new Size(0x1a6, 0x129);
            this.groupBox1.TabIndex = 6;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Dados";
            this.txtTexto.Location = new Point(0x6d, 0x95);
            this.txtTexto.MaxLength = 0x3e8;
            this.txtTexto.Multiline = true;
            this.txtTexto.Name = "txtTexto";
            this.txtTexto.ScrollBars = ScrollBars.Vertical;
            this.txtTexto.Size = new Size(290, 0x58);
            this.txtTexto.TabIndex = 12;
            this.label4.AutoSize = true;
            this.label4.Location = new Point(0x13, 0x98);
            this.label4.Name = "label4";
            this.label4.Size = new Size(0x37, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "Descri\x00e7\x00e3o";
            this.txtTitulo.Location = new Point(0x6d, 0x6c);
            this.txtTitulo.Name = "txtTitulo";
            this.txtTitulo.Size = new Size(290, 20);
            this.txtTitulo.TabIndex = 11;
            this.label3.AutoSize = true;
            this.label3.Location = new Point(0x13, 0x6f);
            this.label3.Name = "label3";
            this.label3.Size = new Size(0x21, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Titulo";
            this.txtEmail.Location = new Point(0x6d, 0x43);
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new Size(290, 20);
            this.txtEmail.TabIndex = 10;
            this.label2.AutoSize = true;
            this.label2.Location = new Point(0x11, 70);
            this.label2.Name = "label2";
            this.label2.Size = new Size(0x20, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Email";
            this.txtNome.Location = new Point(0x6d, 0x1a);
            this.txtNome.Name = "txtNome";
            this.txtNome.Size = new Size(290, 20);
            this.txtNome.TabIndex = 9;
            this.label1.AutoSize = true;
            this.label1.Location = new Point(0x11, 0x1d);
            this.label1.Name = "label1";
            this.label1.Size = new Size(0x23, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "Nome";
            base.AutoScaleDimensions = new SizeF(6f, 13f);
            base.AutoScaleMode = AutoScaleMode.Font;
            base.ClientSize = new Size(0x1bf, 0x13c);
            base.Controls.Add(this.groupBox1);
            base.FormBorderStyle = FormBorderStyle.FixedSingle;
            base.MaximizeBox = false;
            base.MinimizeBox = false;
            base.Name = "ReportBug";
            base.StartPosition = FormStartPosition.CenterScreen;
            this.Text = ":: Report Bug ::";
            base.Activated += new EventHandler(this.ReportBug_Activated);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            base.ResumeLayout(false);
        }

        private void ReportBug_Activated(object sender, EventArgs e)
        {
            this.txtNome.Focus();
        }

        private bool ValidarForm()
        {
            if (this.txtNome.Text == "")
            {
                MessageBox.Show("Campo Nome Obrigat\x00f3rio", "BUG", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                this.txtNome.Focus();
                return false;
            }
            if (this.txtEmail.Text == "")
            {
                MessageBox.Show("Campo Email Obrigat\x00f3rio", "BUG", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                this.txtEmail.Focus();
                return false;
            }
            if (this.txtTitulo.Text == "")
            {
                MessageBox.Show("Campo T\x00edtulo Obrigat\x00f3rio", "BUG", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                this.txtTitulo.Focus();
                return false;
            }
            if (this.txtTexto.Text == "")
            {
                MessageBox.Show("Campo Descri\x00e7\x00e3o Obrigat\x00f3rio", "BUG", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                this.txtTexto.Focus();
                return false;
            }
            return true;
        }
    }
}

