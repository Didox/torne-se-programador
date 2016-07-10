namespace Modulo04
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
            this.label2 = new System.Windows.Forms.Label();
            this.Txt_Id = new System.Windows.Forms.TextBox();
            this.Txt_Nome = new System.Windows.Forms.TextBox();
            this.Cmd_Incluir = new System.Windows.Forms.Button();
            this.Dtg_Clientes = new System.Windows.Forms.DataGridView();
            this.Cmd_GerarXml = new System.Windows.Forms.Button();
            this.Cmd_LerXml = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.Dtg_Clientes)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(19, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Id:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 37);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(38, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Nome:";
            // 
            // Txt_Id
            // 
            this.Txt_Id.Location = new System.Drawing.Point(55, 6);
            this.Txt_Id.Name = "Txt_Id";
            this.Txt_Id.Size = new System.Drawing.Size(100, 20);
            this.Txt_Id.TabIndex = 2;
            // 
            // Txt_Nome
            // 
            this.Txt_Nome.Location = new System.Drawing.Point(55, 37);
            this.Txt_Nome.Name = "Txt_Nome";
            this.Txt_Nome.Size = new System.Drawing.Size(100, 20);
            this.Txt_Nome.TabIndex = 3;
            // 
            // Cmd_Incluir
            // 
            this.Cmd_Incluir.Location = new System.Drawing.Point(15, 83);
            this.Cmd_Incluir.Name = "Cmd_Incluir";
            this.Cmd_Incluir.Size = new System.Drawing.Size(75, 23);
            this.Cmd_Incluir.TabIndex = 4;
            this.Cmd_Incluir.Text = "Incluir";
            this.Cmd_Incluir.UseVisualStyleBackColor = true;
            this.Cmd_Incluir.Click += new System.EventHandler(this.Cmd_Incluir_Click);
            // 
            // Dtg_Clientes
            // 
            this.Dtg_Clientes.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.Dtg_Clientes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Dtg_Clientes.Location = new System.Drawing.Point(12, 135);
            this.Dtg_Clientes.Name = "Dtg_Clientes";
            this.Dtg_Clientes.Size = new System.Drawing.Size(268, 150);
            this.Dtg_Clientes.TabIndex = 5;
            // 
            // Cmd_GerarXml
            // 
            this.Cmd_GerarXml.Location = new System.Drawing.Point(96, 83);
            this.Cmd_GerarXml.Name = "Cmd_GerarXml";
            this.Cmd_GerarXml.Size = new System.Drawing.Size(75, 23);
            this.Cmd_GerarXml.TabIndex = 6;
            this.Cmd_GerarXml.Text = "Gerar XML";
            this.Cmd_GerarXml.UseVisualStyleBackColor = true;
            this.Cmd_GerarXml.Click += new System.EventHandler(this.Cmd_GerarXml_Click);
            // 
            // Cmd_LerXml
            // 
            this.Cmd_LerXml.Location = new System.Drawing.Point(177, 83);
            this.Cmd_LerXml.Name = "Cmd_LerXml";
            this.Cmd_LerXml.Size = new System.Drawing.Size(75, 23);
            this.Cmd_LerXml.TabIndex = 7;
            this.Cmd_LerXml.Text = "Ler XML";
            this.Cmd_LerXml.UseVisualStyleBackColor = true;
            this.Cmd_LerXml.Click += new System.EventHandler(this.Cmd_LerXml_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 297);
            this.Controls.Add(this.Cmd_LerXml);
            this.Controls.Add(this.Cmd_GerarXml);
            this.Controls.Add(this.Dtg_Clientes);
            this.Controls.Add(this.Cmd_Incluir);
            this.Controls.Add(this.Txt_Nome);
            this.Controls.Add(this.Txt_Id);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Dtg_Clientes)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox Txt_Id;
        private System.Windows.Forms.TextBox Txt_Nome;
        private System.Windows.Forms.Button Cmd_Incluir;
        private System.Windows.Forms.DataGridView Dtg_Clientes;
        private System.Windows.Forms.Button Cmd_GerarXml;
        private System.Windows.Forms.Button Cmd_LerXml;
    }
}

