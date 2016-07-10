namespace Apendice
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.Txt_Nome = new System.Windows.Forms.TextBox();
            this.Cmd_Gravar = new System.Windows.Forms.Button();
            this.Dtg_Clientes = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.Dtg_Clientes)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(38, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Nome:";
            // 
            // Txt_Nome
            // 
            this.Txt_Nome.Location = new System.Drawing.Point(56, 18);
            this.Txt_Nome.Name = "Txt_Nome";
            this.Txt_Nome.Size = new System.Drawing.Size(100, 20);
            this.Txt_Nome.TabIndex = 1;
            // 
            // Cmd_Gravar
            // 
            this.Cmd_Gravar.Location = new System.Drawing.Point(15, 56);
            this.Cmd_Gravar.Name = "Cmd_Gravar";
            this.Cmd_Gravar.Size = new System.Drawing.Size(75, 23);
            this.Cmd_Gravar.TabIndex = 2;
            this.Cmd_Gravar.Text = "Gravar";
            this.Cmd_Gravar.UseVisualStyleBackColor = true;
            this.Cmd_Gravar.Click += new System.EventHandler(this.Cmd_Gravar_Click);
            // 
            // Dtg_Clientes
            // 
            this.Dtg_Clientes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Dtg_Clientes.Location = new System.Drawing.Point(12, 100);
            this.Dtg_Clientes.Name = "Dtg_Clientes";
            this.Dtg_Clientes.Size = new System.Drawing.Size(268, 161);
            this.Dtg_Clientes.TabIndex = 3;
            // 
            // Form1
            // 
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.Dtg_Clientes);
            this.Controls.Add(this.Cmd_Gravar);
            this.Controls.Add(this.Txt_Nome);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.Dtg_Clientes)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox Txt_Nome;
        private System.Windows.Forms.Button Cmd_Gravar;
        private System.Windows.Forms.DataGridView Dtg_Clientes;
    }
}

