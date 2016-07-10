namespace Modulo04
{
    partial class frmForm
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
            this.btnUpdateBase = new System.Windows.Forms.Button();
            this.dgvClientes = new System.Windows.Forms.DataGridView();
            this.txtNome = new System.Windows.Forms.TextBox();
            this.txtId = new System.Windows.Forms.TextBox();
            this.lblNome = new System.Windows.Forms.Label();
            this.lblId = new System.Windows.Forms.Label();
            this.btnDeleteRow = new System.Windows.Forms.Button();
            this.btnConsultar = new System.Windows.Forms.Button();
            this.btnUpdateXml = new System.Windows.Forms.Button();
            cmdIncluir = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvClientes)).BeginInit();
            this.SuspendLayout();
            // 
            // cmdIncluir
            // 
            cmdIncluir.Location = new System.Drawing.Point(12, 73);
            cmdIncluir.Name = "cmdIncluir";
            cmdIncluir.Size = new System.Drawing.Size(75, 23);
            cmdIncluir.TabIndex = 12;
            cmdIncluir.Text = "Incluir";
            cmdIncluir.UseVisualStyleBackColor = true;
            cmdIncluir.Click += new System.EventHandler(this.cmdIncluir_Click);
            // 
            // btnUpdateBase
            // 
            this.btnUpdateBase.Location = new System.Drawing.Point(251, 256);
            this.btnUpdateBase.Name = "btnUpdateBase";
            this.btnUpdateBase.Size = new System.Drawing.Size(99, 23);
            this.btnUpdateBase.TabIndex = 14;
            this.btnUpdateBase.Text = "Update Base";
            this.btnUpdateBase.UseVisualStyleBackColor = true;
            this.btnUpdateBase.Click += new System.EventHandler(this.btnUpdateBase_Click);
            // 
            // dgvClientes
            // 
            this.dgvClientes.Location = new System.Drawing.Point(10, 98);
            this.dgvClientes.Name = "dgvClientes";
            this.dgvClientes.Size = new System.Drawing.Size(340, 152);
            this.dgvClientes.TabIndex = 13;
            // 
            // txtNome
            // 
            this.txtNome.Location = new System.Drawing.Point(52, 47);
            this.txtNome.Name = "txtNome";
            this.txtNome.Size = new System.Drawing.Size(100, 20);
            this.txtNome.TabIndex = 11;
            // 
            // txtId
            // 
            this.txtId.Location = new System.Drawing.Point(52, 28);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(100, 20);
            this.txtId.TabIndex = 10;
            // 
            // lblNome
            // 
            this.lblNome.AutoSize = true;
            this.lblNome.Location = new System.Drawing.Point(8, 50);
            this.lblNome.Name = "lblNome";
            this.lblNome.Size = new System.Drawing.Size(38, 13);
            this.lblNome.TabIndex = 9;
            this.lblNome.Text = "Nome:";
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Location = new System.Drawing.Point(12, 28);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(19, 13);
            this.lblId.TabIndex = 8;
            this.lblId.Text = "Id:";
            // 
            // btnDeleteRow
            // 
            this.btnDeleteRow.Location = new System.Drawing.Point(170, 256);
            this.btnDeleteRow.Name = "btnDeleteRow";
            this.btnDeleteRow.Size = new System.Drawing.Size(75, 23);
            this.btnDeleteRow.TabIndex = 15;
            this.btnDeleteRow.Text = "Delete";
            this.btnDeleteRow.UseVisualStyleBackColor = true;
            this.btnDeleteRow.Click += new System.EventHandler(this.btnDeleteRow_Click);
            // 
            // btnConsultar
            // 
            this.btnConsultar.Location = new System.Drawing.Point(93, 73);
            this.btnConsultar.Name = "btnConsultar";
            this.btnConsultar.Size = new System.Drawing.Size(75, 23);
            this.btnConsultar.TabIndex = 16;
            this.btnConsultar.Text = "Consultar";
            this.btnConsultar.UseVisualStyleBackColor = true;
            this.btnConsultar.Click += new System.EventHandler(this.btnConsultar_Click);
            // 
            // btnUpdateXml
            // 
            this.btnUpdateXml.Location = new System.Drawing.Point(174, 73);
            this.btnUpdateXml.Name = "btnUpdateXml";
            this.btnUpdateXml.Size = new System.Drawing.Size(75, 23);
            this.btnUpdateXml.TabIndex = 17;
            this.btnUpdateXml.Text = "Update Xml";
            this.btnUpdateXml.UseVisualStyleBackColor = true;
            this.btnUpdateXml.Click += new System.EventHandler(this.button1_Click);
            // 
            // frmForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(362, 285);
            this.Controls.Add(this.btnUpdateXml);
            this.Controls.Add(this.btnConsultar);
            this.Controls.Add(this.btnDeleteRow);
            this.Controls.Add(this.btnUpdateBase);
            this.Controls.Add(this.dgvClientes);
            this.Controls.Add(cmdIncluir);
            this.Controls.Add(this.txtNome);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.lblNome);
            this.Controls.Add(this.lblId);
            this.Name = "frmForm";
            this.Text = "frmForm";
            this.Load += new System.EventHandler(this.frmForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvClientes)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnUpdateBase;
        private System.Windows.Forms.DataGridView dgvClientes;
        private System.Windows.Forms.TextBox txtNome;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.Label lblNome;
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.Button btnDeleteRow;
        private System.Windows.Forms.Button btnConsultar;
        private System.Windows.Forms.Button btnUpdateXml;
    }
}