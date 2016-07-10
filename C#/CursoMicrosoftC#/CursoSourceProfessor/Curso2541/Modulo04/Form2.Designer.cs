namespace Modulo04
{
    partial class Form2
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
            this.Dtg_Clientes = new System.Windows.Forms.DataGridView();
            this.Cmd_Incluir = new System.Windows.Forms.Button();
            this.Txt_Nome = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.Cmd_AtualizarBase = new System.Windows.Forms.Button();
            this.Cmd_Consultar = new System.Windows.Forms.Button();
            this.Cmd_SalvarXml = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.Dtg_Clientes)).BeginInit();
            this.SuspendLayout();
            // 
            // Dtg_Clientes
            // 
            this.Dtg_Clientes.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.Dtg_Clientes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Dtg_Clientes.Location = new System.Drawing.Point(11, 143);
            this.Dtg_Clientes.Name = "Dtg_Clientes";
            this.Dtg_Clientes.Size = new System.Drawing.Size(268, 157);
            this.Dtg_Clientes.TabIndex = 11;
            // 
            // Cmd_Incluir
            // 
            this.Cmd_Incluir.Location = new System.Drawing.Point(204, 40);
            this.Cmd_Incluir.Name = "Cmd_Incluir";
            this.Cmd_Incluir.Size = new System.Drawing.Size(75, 23);
            this.Cmd_Incluir.TabIndex = 10;
            this.Cmd_Incluir.Text = "Incluir";
            this.Cmd_Incluir.UseVisualStyleBackColor = true;
            this.Cmd_Incluir.Click += new System.EventHandler(this.Cmd_Incluir_Click);
            // 
            // Txt_Nome
            // 
            this.Txt_Nome.Location = new System.Drawing.Point(53, 14);
            this.Txt_Nome.Name = "Txt_Nome";
            this.Txt_Nome.Size = new System.Drawing.Size(226, 20);
            this.Txt_Nome.TabIndex = 9;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(9, 14);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(38, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "Nome:";
            // 
            // Cmd_AtualizarBase
            // 
            this.Cmd_AtualizarBase.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.Cmd_AtualizarBase.Location = new System.Drawing.Point(179, 325);
            this.Cmd_AtualizarBase.Name = "Cmd_AtualizarBase";
            this.Cmd_AtualizarBase.Size = new System.Drawing.Size(101, 23);
            this.Cmd_AtualizarBase.TabIndex = 12;
            this.Cmd_AtualizarBase.Text = "AtualizarBase";
            this.Cmd_AtualizarBase.UseVisualStyleBackColor = true;
            this.Cmd_AtualizarBase.Click += new System.EventHandler(this.Cmd_AtualizarBase_Click);
            // 
            // Cmd_Consultar
            // 
            this.Cmd_Consultar.Location = new System.Drawing.Point(204, 69);
            this.Cmd_Consultar.Name = "Cmd_Consultar";
            this.Cmd_Consultar.Size = new System.Drawing.Size(75, 23);
            this.Cmd_Consultar.TabIndex = 13;
            this.Cmd_Consultar.Text = "Consultar";
            this.Cmd_Consultar.UseVisualStyleBackColor = true;
            this.Cmd_Consultar.Click += new System.EventHandler(this.Cmd_Consultar_Click);
            // 
            // Cmd_SalvarXml
            // 
            this.Cmd_SalvarXml.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.Cmd_SalvarXml.Location = new System.Drawing.Point(72, 325);
            this.Cmd_SalvarXml.Name = "Cmd_SalvarXml";
            this.Cmd_SalvarXml.Size = new System.Drawing.Size(101, 23);
            this.Cmd_SalvarXml.TabIndex = 14;
            this.Cmd_SalvarXml.Text = "Salvar XML";
            this.Cmd_SalvarXml.UseVisualStyleBackColor = true;
            this.Cmd_SalvarXml.Click += new System.EventHandler(this.Cmd_SalvarXml_Click);
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 360);
            this.Controls.Add(this.Cmd_SalvarXml);
            this.Controls.Add(this.Cmd_Consultar);
            this.Controls.Add(this.Cmd_AtualizarBase);
            this.Controls.Add(this.Dtg_Clientes);
            this.Controls.Add(this.Cmd_Incluir);
            this.Controls.Add(this.Txt_Nome);
            this.Controls.Add(this.label2);
            this.Name = "Form2";
            this.Text = "Form2";
            this.Load += new System.EventHandler(this.Form2_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Dtg_Clientes)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView Dtg_Clientes;
        private System.Windows.Forms.Button Cmd_Incluir;
        private System.Windows.Forms.TextBox Txt_Nome;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button Cmd_AtualizarBase;
        private System.Windows.Forms.Button Cmd_Consultar;
        private System.Windows.Forms.Button Cmd_SalvarXml;
    }
}