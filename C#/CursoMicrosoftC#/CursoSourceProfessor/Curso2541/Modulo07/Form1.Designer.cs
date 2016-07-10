namespace Modulo07
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
            this.Cmd_LerXml = new System.Windows.Forms.Button();
            this.Dtg_Clientes = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.Dtg_Clientes)).BeginInit();
            this.SuspendLayout();
            // 
            // Cmd_LerXml
            // 
            this.Cmd_LerXml.Location = new System.Drawing.Point(26, 21);
            this.Cmd_LerXml.Name = "Cmd_LerXml";
            this.Cmd_LerXml.Size = new System.Drawing.Size(75, 23);
            this.Cmd_LerXml.TabIndex = 0;
            this.Cmd_LerXml.Text = "LerXml";
            this.Cmd_LerXml.UseVisualStyleBackColor = true;
            this.Cmd_LerXml.Click += new System.EventHandler(this.Cmd_LerXml_Click);
            // 
            // Dtg_Clientes
            // 
            this.Dtg_Clientes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Dtg_Clientes.Location = new System.Drawing.Point(12, 72);
            this.Dtg_Clientes.Name = "Dtg_Clientes";
            this.Dtg_Clientes.Size = new System.Drawing.Size(268, 189);
            this.Dtg_Clientes.TabIndex = 1;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.Dtg_Clientes);
            this.Controls.Add(this.Cmd_LerXml);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.Dtg_Clientes)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button Cmd_LerXml;
        private System.Windows.Forms.DataGridView Dtg_Clientes;
    }
}

