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
            System.Windows.Forms.Button cmdIncluir;
            System.Windows.Forms.Button btnGeraXML;
            this.lblId = new System.Windows.Forms.Label();
            this.lblNome = new System.Windows.Forms.Label();
            this.txtId = new System.Windows.Forms.TextBox();
            this.txtNome = new System.Windows.Forms.TextBox();
            this.dgvClientes = new System.Windows.Forms.DataGridView();
            this.btnDeleteRow = new System.Windows.Forms.Button();
            this.btnLerXml = new System.Windows.Forms.Button();
            cmdIncluir = new System.Windows.Forms.Button();
            btnGeraXML = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvClientes)).BeginInit();
            this.SuspendLayout();
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Location = new System.Drawing.Point(10, 14);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(19, 13);
            this.lblId.TabIndex = 0;
            this.lblId.Text = "Id:";
            // 
            // lblNome
            // 
            this.lblNome.AutoSize = true;
            this.lblNome.Location = new System.Drawing.Point(10, 36);
            this.lblNome.Name = "lblNome";
            this.lblNome.Size = new System.Drawing.Size(38, 13);
            this.lblNome.TabIndex = 1;
            this.lblNome.Text = "Nome:";
            // 
            // txtId
            // 
            this.txtId.Location = new System.Drawing.Point(54, 14);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(100, 20);
            this.txtId.TabIndex = 2;
            // 
            // txtNome
            // 
            this.txtNome.Location = new System.Drawing.Point(54, 33);
            this.txtNome.Name = "txtNome";
            this.txtNome.Size = new System.Drawing.Size(100, 20);
            this.txtNome.TabIndex = 3;
            // 
            // cmdIncluir
            // 
            cmdIncluir.Location = new System.Drawing.Point(14, 59);
            cmdIncluir.Name = "cmdIncluir";
            cmdIncluir.Size = new System.Drawing.Size(75, 23);
            cmdIncluir.TabIndex = 4;
            cmdIncluir.Text = "Incluir";
            cmdIncluir.UseVisualStyleBackColor = true;
            cmdIncluir.Click += new System.EventHandler(this.cmdIncluir_Click);
            // 
            // dgvClientes
            // 
            this.dgvClientes.Location = new System.Drawing.Point(12, 84);
            this.dgvClientes.Name = "dgvClientes";
            this.dgvClientes.ReadOnly = true;
            this.dgvClientes.Size = new System.Drawing.Size(340, 152);
            this.dgvClientes.TabIndex = 5;
            // 
            // btnGeraXML
            // 
            btnGeraXML.Location = new System.Drawing.Point(95, 59);
            btnGeraXML.Name = "btnGeraXML";
            btnGeraXML.Size = new System.Drawing.Size(75, 23);
            btnGeraXML.TabIndex = 6;
            btnGeraXML.Text = "Gera XML";
            btnGeraXML.UseVisualStyleBackColor = true;
            btnGeraXML.Click += new System.EventHandler(this.btnGeraXML_Click);
            // 
            // btnDeleteRow
            // 
            this.btnDeleteRow.Location = new System.Drawing.Point(14, 242);
            this.btnDeleteRow.Name = "btnDeleteRow";
            this.btnDeleteRow.Size = new System.Drawing.Size(75, 23);
            this.btnDeleteRow.TabIndex = 7;
            this.btnDeleteRow.Text = "Delete";
            this.btnDeleteRow.UseVisualStyleBackColor = true;
            this.btnDeleteRow.Click += new System.EventHandler(this.btnDeleteRow_Click);
            // 
            // btnLerXml
            // 
            this.btnLerXml.Location = new System.Drawing.Point(176, 59);
            this.btnLerXml.Name = "btnLerXml";
            this.btnLerXml.Size = new System.Drawing.Size(75, 23);
            this.btnLerXml.TabIndex = 8;
            this.btnLerXml.Text = "Ler XML";
            this.btnLerXml.UseVisualStyleBackColor = true;
            this.btnLerXml.Click += new System.EventHandler(this.btnLerXml_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(366, 277);
            this.Controls.Add(this.btnLerXml);
            this.Controls.Add(this.btnDeleteRow);
            this.Controls.Add(btnGeraXML);
            this.Controls.Add(this.dgvClientes);
            this.Controls.Add(cmdIncluir);
            this.Controls.Add(this.txtNome);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.lblNome);
            this.Controls.Add(this.lblId);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvClientes)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.Label lblNome;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.TextBox txtNome;
        private System.Windows.Forms.DataGridView dgvClientes;
        private System.Windows.Forms.Button btnDeleteRow;
        private System.Windows.Forms.Button btnLerXml;

    }
}

