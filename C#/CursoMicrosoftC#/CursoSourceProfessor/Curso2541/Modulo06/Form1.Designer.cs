namespace Modulo06
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
            this.Cmd_AtualizarDados = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // Cmd_AtualizarDados
            // 
            this.Cmd_AtualizarDados.Location = new System.Drawing.Point(12, 12);
            this.Cmd_AtualizarDados.Name = "Cmd_AtualizarDados";
            this.Cmd_AtualizarDados.Size = new System.Drawing.Size(166, 23);
            this.Cmd_AtualizarDados.TabIndex = 0;
            this.Cmd_AtualizarDados.Text = "Atualizar Dados no Banco ";
            this.Cmd_AtualizarDados.UseVisualStyleBackColor = true;
            this.Cmd_AtualizarDados.Click += new System.EventHandler(this.Cmd_AtualizarDados_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.Cmd_AtualizarDados);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button Cmd_AtualizarDados;
    }
}

