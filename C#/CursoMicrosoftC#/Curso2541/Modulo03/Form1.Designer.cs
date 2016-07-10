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
            this.btnTransaction = new System.Windows.Forms.Button();
            this.lblMensagem = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.btnDistribuida = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnTransaction
            // 
            this.btnTransaction.Location = new System.Drawing.Point(60, 12);
            this.btnTransaction.Name = "btnTransaction";
            this.btnTransaction.Size = new System.Drawing.Size(170, 23);
            this.btnTransaction.TabIndex = 0;
            this.btnTransaction.Text = "Debita Credita";
            this.btnTransaction.UseVisualStyleBackColor = true;
            this.btnTransaction.Click += new System.EventHandler(this.btnTransaction_Click);
            // 
            // lblMensagem
            // 
            this.lblMensagem.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblMensagem.Location = new System.Drawing.Point(12, 156);
            this.lblMensagem.Name = "lblMensagem";
            this.lblMensagem.Size = new System.Drawing.Size(268, 108);
            this.lblMensagem.TabIndex = 1;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(60, 41);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(170, 23);
            this.button1.TabIndex = 2;
            this.button1.Text = "Credita Debita";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnDistribuida
            // 
            this.btnDistribuida.Location = new System.Drawing.Point(60, 70);
            this.btnDistribuida.Name = "btnDistribuida";
            this.btnDistribuida.Size = new System.Drawing.Size(170, 23);
            this.btnDistribuida.TabIndex = 3;
            this.btnDistribuida.Text = "Tansaçao Distribuida";
            this.btnDistribuida.UseVisualStyleBackColor = true;
            this.btnDistribuida.Click += new System.EventHandler(this.btnDistribuida_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.btnDistribuida);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.lblMensagem);
            this.Controls.Add(this.btnTransaction);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnTransaction;
        private System.Windows.Forms.Label lblMensagem;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btnDistribuida;
    }
}

