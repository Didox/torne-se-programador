namespace Modulo01
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
            this.Cmd_Conectar = new System.Windows.Forms.Button();
            this.Cmd_Desconectar = new System.Windows.Forms.Button();
            this.Lbl_Mensagem = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // Cmd_Conectar
            // 
            this.Cmd_Conectar.Location = new System.Drawing.Point(12, 12);
            this.Cmd_Conectar.Name = "Cmd_Conectar";
            this.Cmd_Conectar.Size = new System.Drawing.Size(96, 23);
            this.Cmd_Conectar.TabIndex = 0;
            this.Cmd_Conectar.Text = "Conectar";
            this.Cmd_Conectar.UseVisualStyleBackColor = true;
            this.Cmd_Conectar.Click += new System.EventHandler(this.Cmd_Conectar_Click);
            // 
            // Cmd_Desconectar
            // 
            this.Cmd_Desconectar.Location = new System.Drawing.Point(12, 41);
            this.Cmd_Desconectar.Name = "Cmd_Desconectar";
            this.Cmd_Desconectar.Size = new System.Drawing.Size(96, 23);
            this.Cmd_Desconectar.TabIndex = 1;
            this.Cmd_Desconectar.Text = "Desconectar";
            this.Cmd_Desconectar.UseVisualStyleBackColor = true;
            this.Cmd_Desconectar.Click += new System.EventHandler(this.Cmd_Desconectar_Click);
            // 
            // Lbl_Mensagem
            // 
            this.Lbl_Mensagem.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.Lbl_Mensagem.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.Lbl_Mensagem.Location = new System.Drawing.Point(12, 78);
            this.Lbl_Mensagem.Name = "Lbl_Mensagem";
            this.Lbl_Mensagem.Size = new System.Drawing.Size(268, 186);
            this.Lbl_Mensagem.TabIndex = 2;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.Lbl_Mensagem);
            this.Controls.Add(this.Cmd_Desconectar);
            this.Controls.Add(this.Cmd_Conectar);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button Cmd_Conectar;
        private System.Windows.Forms.Button Cmd_Desconectar;
        private System.Windows.Forms.Label Lbl_Mensagem;
    }
}

