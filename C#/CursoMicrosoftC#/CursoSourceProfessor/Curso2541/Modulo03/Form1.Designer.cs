namespace Modulo03
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
            this.Cmd_TransacaoLocal = new System.Windows.Forms.Button();
            this.Cmd_TransacaoDistribuida = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // Cmd_TransacaoLocal
            // 
            this.Cmd_TransacaoLocal.Location = new System.Drawing.Point(12, 23);
            this.Cmd_TransacaoLocal.Name = "Cmd_TransacaoLocal";
            this.Cmd_TransacaoLocal.Size = new System.Drawing.Size(127, 23);
            this.Cmd_TransacaoLocal.TabIndex = 0;
            this.Cmd_TransacaoLocal.Text = "Transacao Local";
            this.Cmd_TransacaoLocal.UseVisualStyleBackColor = true;
            this.Cmd_TransacaoLocal.Click += new System.EventHandler(this.Cmd_TransacaoLocal_Click);
            // 
            // Cmd_TransacaoDistribuida
            // 
            this.Cmd_TransacaoDistribuida.Location = new System.Drawing.Point(12, 52);
            this.Cmd_TransacaoDistribuida.Name = "Cmd_TransacaoDistribuida";
            this.Cmd_TransacaoDistribuida.Size = new System.Drawing.Size(127, 23);
            this.Cmd_TransacaoDistribuida.TabIndex = 1;
            this.Cmd_TransacaoDistribuida.Text = "Transacao Distribuída";
            this.Cmd_TransacaoDistribuida.UseVisualStyleBackColor = true;
            this.Cmd_TransacaoDistribuida.Click += new System.EventHandler(this.Cmd_TransacaoDistribuida_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.Cmd_TransacaoDistribuida);
            this.Controls.Add(this.Cmd_TransacaoLocal);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button Cmd_TransacaoLocal;
        private System.Windows.Forms.Button Cmd_TransacaoDistribuida;
    }
}

