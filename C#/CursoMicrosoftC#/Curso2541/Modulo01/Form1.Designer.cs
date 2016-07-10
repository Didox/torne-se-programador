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
            this.cmdConectar = new System.Windows.Forms.Button();
            this.cmdDesconectar = new System.Windows.Forms.Button();
            this.lblMensagem = new System.Windows.Forms.Label();
            this.cmdSair = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // cmdConectar
            // 
            this.cmdConectar.Location = new System.Drawing.Point(12, 12);
            this.cmdConectar.Name = "cmdConectar";
            this.cmdConectar.Size = new System.Drawing.Size(82, 23);
            this.cmdConectar.TabIndex = 0;
            this.cmdConectar.Text = "Conectar";
            this.cmdConectar.UseVisualStyleBackColor = true;
            this.cmdConectar.Click += new System.EventHandler(this.cmdConectar_Click);
            // 
            // cmdDesconectar
            // 
            this.cmdDesconectar.Location = new System.Drawing.Point(12, 41);
            this.cmdDesconectar.Name = "cmdDesconectar";
            this.cmdDesconectar.Size = new System.Drawing.Size(82, 23);
            this.cmdDesconectar.TabIndex = 1;
            this.cmdDesconectar.Text = "Desconectar";
            this.cmdDesconectar.UseVisualStyleBackColor = true;
            this.cmdDesconectar.Click += new System.EventHandler(this.cmdDesconectar_Click);
            // 
            // lblMensagem
            // 
            this.lblMensagem.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblMensagem.Location = new System.Drawing.Point(12, 109);
            this.lblMensagem.Name = "lblMensagem";
            this.lblMensagem.Size = new System.Drawing.Size(268, 155);
            this.lblMensagem.TabIndex = 2;
            // 
            // cmdSair
            // 
            this.cmdSair.Location = new System.Drawing.Point(12, 70);
            this.cmdSair.Name = "cmdSair";
            this.cmdSair.Size = new System.Drawing.Size(82, 23);
            this.cmdSair.TabIndex = 3;
            this.cmdSair.Text = "Sair";
            this.cmdSair.UseVisualStyleBackColor = true;
            this.cmdSair.Click += new System.EventHandler(this.cmdSair_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.cmdSair);
            this.Controls.Add(this.lblMensagem);
            this.Controls.Add(this.cmdDesconectar);
            this.Controls.Add(this.cmdConectar);
            this.Name = "Form1";
            this.Text = "Form1";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button cmdConectar;
        private System.Windows.Forms.Button cmdDesconectar;
        private System.Windows.Forms.Label lblMensagem;
        private System.Windows.Forms.Button cmdSair;
    }
}

