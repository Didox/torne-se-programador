namespace CSGen
{
    using CSGen.Code;
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    public class Configuracoes : Form
    {
        private Button btnSalvar;
        private Button btnSalvarReferencia;
        private CheckBox chkIgnore;
        private CheckBox chkIgnoreTable;
        private CheckBox chkIsCollection;
        private CheckBox chkTabelaNo;
        private ComboBox cmbFKColumn;
        private ComboBox cmbFkT;
        private ComboBox cmbPKColumn;
        private ComboBox cmbPkt;
        private ComboBox cmbTipo;
        private IContainer components;
        private GroupBox groupBox1;
        private GroupBox grpColuna;
        private GroupBox grpReferencia;
        private GroupBox grpTabela;
        private Label label1;
        private Label label10;
        private Label label12;
        private Label label14;
        private Label label16;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private Label label6;
        private Label label7;
        private Label label8;
        private Label lblBusinessClassName;
        private Label lblConstraintName;
        private Label lblDelete;
        private Label lblFkColumn;
        private Label lblFkTable;
        private Label lblPkColumn;
        private Label lblPkTable;
        private Label lblUpdate;
        private SplitContainer splitContainer1;
        private SqlTable sqlTableTemp;
        private TreeView treeView1;
        private TextBox txtNomeBusiness;
        private TextBox txtNomeDataBase;
        private TextBox txtNomeProcedure;

        public Configuracoes()
        {
            this.InitializeComponent();
        }

        private void btnFechar_Click(object sender, EventArgs e)
        {
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            string[] strArray = this.treeView1.SelectedNode.FullPath.Split(new char[] { '\\' });
            Color green = Color.Green;
            if (strArray.Length == 1)
            {
                foreach (SqlTable table in Program.SqlTableList)
                {
                    if (!(table.Nome == this.sqlTableTemp.Nome))
                    {
                        continue;
                    }
                    if (!this.ExisteProc(this.txtNomeProcedure.Text))
                    {
                        table.ProcNome = this.txtNomeProcedure.Text;
                    }
                    else
                    {
                        MessageBox.Show("J\x00e1 existe uma procedure com este nome!", "CSGen", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        this.txtNomeProcedure.Text = this.sqlTableTemp.ProcNome;
                        green = Color.Yellow;
                    }
                    if (!this.ExisteClassDb(this.txtNomeDataBase.Text))
                    {
                        char ch = this.txtNomeDataBase.Text[0];
                        table.ClassDataBaseNome = ch.ToString().ToUpper() + this.txtNomeDataBase.Text.Substring(1);
                    }
                    else
                    {
                        MessageBox.Show("J\x00e1 existe uma classe database com este nome!", "CSGen", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        this.txtNomeDataBase.Text = this.sqlTableTemp.ClassDataBaseNome;
                        green = Color.Yellow;
                    }
                    if (!this.ExisteClassMd(this.txtNomeBusiness.Text))
                    {
                        char ch3 = this.txtNomeBusiness.Text[0];
                        table.ClassBusinessNome = ch3.ToString().ToUpper() + this.txtNomeBusiness.Text.Substring(1);
                    }
                    else
                    {
                        MessageBox.Show("J\x00e1 existe uma classe Business com este nome!", "CSGen", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        char ch4 = this.sqlTableTemp.ClassBusinessNome[0];
                        this.txtNomeBusiness.Text = ch4.ToString().ToUpper() + this.sqlTableTemp.ClassBusinessNome.Substring(1);
                        green = Color.Yellow;
                    }
                    table.Ignore = this.chkIgnoreTable.Checked;
                    this.sqlTableTemp = table;
                }
                this.treeView1.SelectedNode.BackColor = green;
            }
        }

        private void btnSalvarReferencia_Click(object sender, EventArgs e)
        {
            string[] strArray = this.treeView1.SelectedNode.FullPath.Split(new char[] { '\\' });
            Color green = Color.Green;
            if (strArray.Length == 3)
            {
                TreeNode selectedNode = this.treeView1.SelectedNode;
                TreeNode parent = selectedNode.Parent.Parent;
                foreach (SqlTable table in Program.SqlTableList)
                {
                    if (!(table.Nome == parent.Text))
                    {
                        continue;
                    }
                    char[] separator = new char[] { '<', '=', '>' };
                    string[] strArray2 = selectedNode.Text.Split(separator);
                    foreach (SqlReference reference in table.References)
                    {
                        if ((reference.PkTable == strArray2[0].Trim()) && (reference.FkTable == strArray2[3].Trim()))
                        {
                            reference.PkTable = this.cmbPkt.SelectedItem.ToString();
                            reference.FkTable = this.cmbFkT.SelectedItem.ToString();
                            reference.PkColumnName = this.cmbPKColumn.SelectedItem.ToString();
                            reference.FkColumnName = this.cmbFKColumn.SelectedItem.ToString();
                            reference.IsCollection = this.chkIsCollection.Checked;
                            reference.Ignore = this.chkIgnore.Checked;
                            System.Type enumType = typeof(SqlReference.TpRelacao);
                            reference.TipoRelacao = (SqlReference.TpRelacao) Enum.Parse(enumType, this.cmbTipo.SelectedItem.ToString());
                        }
                    }
                    selectedNode.BackColor = green;
                }
            }
        }

        private void CarregarCombosColumns()
        {
            SqlTable table = null;
            SqlTable table2 = null;
            if (this.cmbPkt.SelectedItem != null)
            {
                table = SqlTable.GetTable(this.cmbPkt.SelectedItem.ToString());
                this.cmbPKColumn.DisplayMember = "Name";
                this.cmbPKColumn.DataSource = table.Colunas;
            }
            if (this.cmbFkT.SelectedItem != null)
            {
                table2 = SqlTable.GetTable(this.cmbFkT.SelectedItem.ToString());
                this.cmbFKColumn.DisplayMember = "Name";
                this.cmbFKColumn.DataSource = table2.Colunas;
            }
        }

        private void CarregarCombosTables()
        {
            this.cmbPkt.Items.Clear();
            this.cmbFkT.Items.Clear();
            foreach (SqlTable table in Program.SqlTableList)
            {
                this.cmbPkt.Items.Add(table.Nome);
                this.cmbFkT.Items.Add(table.Nome);
            }
        }

        private void carregarTreeview()
        {
            foreach (SqlTable table in Program.SqlTableList)
            {
                TreeNode node = new TreeNode(table.Nome);
                if (table.Colunas.Count > 0)
                {
                    TreeNode node2 = new TreeNode("Colunas");
                    foreach (SqlColumn column in table.Colunas)
                    {
                        TreeNode node3 = new TreeNode(column.Name);
                        node2.Nodes.Add(node3);
                    }
                    node.Nodes.Add(node2);
                }
                if (table.References.Count > 0)
                {
                    TreeNode node4 = new TreeNode("Rerer\x00eancias");
                    foreach (SqlReference reference in table.References)
                    {
                        TreeNode node5 = new TreeNode(reference.PkTable + " <=> " + reference.FkTable);
                        node4.Nodes.Add(node5);
                    }
                    node.Nodes.Add(node4);
                }
                this.treeView1.Nodes.Add(node);
            }
        }

        private void cmbFkT_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.CarregarCombosColumns();
        }

        private void cmbPkt_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.CarregarCombosColumns();
        }

        private void ConfigurarBusiness_Load(object sender, EventArgs e)
        {
            this.carregarTreeview();
            System.Type enumType = typeof(SqlReference.TpRelacao);
            this.cmbTipo.Items.AddRange(Enum.GetNames(enumType));
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ExisteClassDb(string name)
        {
            bool flag = false;
            foreach (SqlTable table in Program.SqlTableList)
            {
                if ((table.ClassDataBaseNome.ToLower() == name.ToLower()) && (name.ToLower() != this.sqlTableTemp.ClassDataBaseNome.ToLower()))
                {
                    flag = true;
                }
            }
            return flag;
        }

        private bool ExisteClassMd(string name)
        {
            bool flag = false;
            foreach (SqlTable table in Program.SqlTableList)
            {
                if ((table.ClassBusinessNome.ToLower() == name.ToLower()) && (name.ToLower() != this.sqlTableTemp.ClassBusinessNome.ToLower()))
                {
                    flag = true;
                }
            }
            return flag;
        }

        private bool ExisteProc(string name)
        {
            bool flag = false;
            foreach (SqlTable table in Program.SqlTableList)
            {
                if ((table.ProcNome == name) && (name != this.sqlTableTemp.ProcNome))
                {
                    flag = true;
                }
            }
            return flag;
        }

        private void InitializeComponent()
        {
            this.splitContainer1 = new SplitContainer();
            this.groupBox1 = new GroupBox();
            this.treeView1 = new TreeView();
            this.grpTabela = new GroupBox();
            this.grpReferencia = new GroupBox();
            this.cmbFkT = new ComboBox();
            this.cmbPkt = new ComboBox();
            this.chkIsCollection = new CheckBox();
            this.cmbFKColumn = new ComboBox();
            this.cmbPKColumn = new ComboBox();
            this.label7 = new Label();
            this.lblPkTable = new Label();
            this.btnSalvarReferencia = new Button();
            this.chkIgnore = new CheckBox();
            this.cmbTipo = new ComboBox();
            this.label16 = new Label();
            this.label10 = new Label();
            this.lblUpdate = new Label();
            this.label12 = new Label();
            this.lblDelete = new Label();
            this.label14 = new Label();
            this.lblPkColumn = new Label();
            this.label8 = new Label();
            this.lblFkColumn = new Label();
            this.label6 = new Label();
            this.lblConstraintName = new Label();
            this.label4 = new Label();
            this.lblFkTable = new Label();
            this.lblBusinessClassName = new Label();
            this.label5 = new Label();
            this.chkTabelaNo = new CheckBox();
            this.btnSalvar = new Button();
            this.txtNomeBusiness = new TextBox();
            this.label3 = new Label();
            this.chkIgnoreTable = new CheckBox();
            this.txtNomeDataBase = new TextBox();
            this.label2 = new Label();
            this.txtNomeProcedure = new TextBox();
            this.label1 = new Label();
            this.grpColuna = new GroupBox();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.grpTabela.SuspendLayout();
            this.grpReferencia.SuspendLayout();
            base.SuspendLayout();
            this.splitContainer1.BorderStyle = BorderStyle.Fixed3D;
            this.splitContainer1.Dock = DockStyle.Fill;
            this.splitContainer1.Location = new Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Panel1.Controls.Add(this.groupBox1);
            this.splitContainer1.Panel2.Controls.Add(this.grpReferencia);
            this.splitContainer1.Panel2.Controls.Add(this.grpTabela);
            this.splitContainer1.Size = new Size(0x335, 0x206);
            this.splitContainer1.SplitterDistance = 0xd6;
            this.splitContainer1.TabIndex = 1;
            this.groupBox1.Anchor = AnchorStyles.Right | AnchorStyles.Left | AnchorStyles.Bottom | AnchorStyles.Top;
            this.groupBox1.Controls.Add(this.treeView1);
            this.groupBox1.Location = new Point(3, 3);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new Size(0xcc, 0x1f5);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Classes";
            this.treeView1.Dock = DockStyle.Fill;
            this.treeView1.Location = new Point(3, 0x10);
            this.treeView1.Name = "treeView1";
            this.treeView1.Size = new Size(0xc6, 0x1e2);
            this.treeView1.TabIndex = 0;
            this.treeView1.AfterSelect += new TreeViewEventHandler(this.treeView1_AfterSelect);
            this.grpTabela.Anchor = AnchorStyles.Right | AnchorStyles.Left | AnchorStyles.Bottom | AnchorStyles.Top;
            this.grpTabela.Controls.Add(this.chkTabelaNo);
            this.grpTabela.Controls.Add(this.btnSalvar);
            this.grpTabela.Controls.Add(this.txtNomeBusiness);
            this.grpTabela.Controls.Add(this.label3);
            this.grpTabela.Controls.Add(this.chkIgnoreTable);
            this.grpTabela.Controls.Add(this.txtNomeDataBase);
            this.grpTabela.Controls.Add(this.label2);
            this.grpTabela.Controls.Add(this.txtNomeProcedure);
            this.grpTabela.Controls.Add(this.label1);
            this.grpTabela.Controls.Add(this.grpColuna);
            this.grpTabela.Location = new Point(4, 5);
            this.grpTabela.Name = "grpTabela";
            this.grpTabela.Size = new Size(0x251, 0x1f5);
            this.grpTabela.TabIndex = 0;
            this.grpTabela.TabStop = false;
            this.grpTabela.Text = "Configura\x00e7\x00e3o Tabela";
            this.grpReferencia.Anchor = AnchorStyles.Right | AnchorStyles.Left | AnchorStyles.Bottom | AnchorStyles.Top;
            this.grpReferencia.Controls.Add(this.cmbFkT);
            this.grpReferencia.Controls.Add(this.cmbPkt);
            this.grpReferencia.Controls.Add(this.chkIsCollection);
            this.grpReferencia.Controls.Add(this.cmbFKColumn);
            this.grpReferencia.Controls.Add(this.cmbPKColumn);
            this.grpReferencia.Controls.Add(this.label7);
            this.grpReferencia.Controls.Add(this.lblPkTable);
            this.grpReferencia.Controls.Add(this.btnSalvarReferencia);
            this.grpReferencia.Controls.Add(this.chkIgnore);
            this.grpReferencia.Controls.Add(this.cmbTipo);
            this.grpReferencia.Controls.Add(this.label16);
            this.grpReferencia.Controls.Add(this.label10);
            this.grpReferencia.Controls.Add(this.lblUpdate);
            this.grpReferencia.Controls.Add(this.label12);
            this.grpReferencia.Controls.Add(this.lblDelete);
            this.grpReferencia.Controls.Add(this.label14);
            this.grpReferencia.Controls.Add(this.lblPkColumn);
            this.grpReferencia.Controls.Add(this.label8);
            this.grpReferencia.Controls.Add(this.lblFkColumn);
            this.grpReferencia.Controls.Add(this.label6);
            this.grpReferencia.Controls.Add(this.lblConstraintName);
            this.grpReferencia.Controls.Add(this.label4);
            this.grpReferencia.Controls.Add(this.lblFkTable);
            this.grpReferencia.Controls.Add(this.lblBusinessClassName);
            this.grpReferencia.Controls.Add(this.label5);
            this.grpReferencia.Location = new Point(4, 5);
            this.grpReferencia.Name = "grpReferencia";
            this.grpReferencia.Size = new Size(0x250, 0x1f5);
            this.grpReferencia.TabIndex = 8;
            this.grpReferencia.TabStop = false;
            this.grpReferencia.Text = "Configura\x00e7\x00e3o Refer\x00eancia";
            this.cmbFkT.DropDownStyle = ComboBoxStyle.DropDownList;
            this.cmbFkT.FormattingEnabled = true;
            this.cmbFkT.Location = new Point(0x15f, 0x68);
            this.cmbFkT.Name = "cmbFkT";
            this.cmbFkT.Size = new Size(0xdf, 0x15);
            this.cmbFkT.TabIndex = 0x19;
            this.cmbPkt.DropDownStyle = ComboBoxStyle.DropDownList;
            this.cmbPkt.FormattingEnabled = true;
            this.cmbPkt.Location = new Point(0x15f, 0x42);
            this.cmbPkt.Name = "cmbPkt";
            this.cmbPkt.Size = new Size(0xdf, 0x15);
            this.cmbPkt.TabIndex = 0x18;
            this.chkIsCollection.AutoSize = true;
            this.chkIsCollection.Location = new Point(0xbb, 0x1a3);
            this.chkIsCollection.Name = "chkIsCollection";
            this.chkIsCollection.Size = new Size(0x53, 0x11);
            this.chkIsCollection.TabIndex = 0x17;
            this.chkIsCollection.Text = "Is Collection";
            this.chkIsCollection.UseVisualStyleBackColor = true;
            this.cmbFKColumn.DropDownStyle = ComboBoxStyle.DropDownList;
            this.cmbFKColumn.FormattingEnabled = true;
            this.cmbFKColumn.Location = new Point(0x15f, 0xb6);
            this.cmbFKColumn.Name = "cmbFKColumn";
            this.cmbFKColumn.Size = new Size(0xdf, 0x15);
            this.cmbFKColumn.TabIndex = 0x16;
            this.cmbPKColumn.DropDownStyle = ComboBoxStyle.DropDownList;
            this.cmbPKColumn.FormattingEnabled = true;
            this.cmbPKColumn.Location = new Point(0x15f, 0x91);
            this.cmbPKColumn.Name = "cmbPKColumn";
            this.cmbPKColumn.Size = new Size(0xdf, 0x15);
            this.cmbPKColumn.TabIndex = 0x16;
            this.label7.AutoSize = true;
            this.label7.Location = new Point(0x24, 0x4b);
            this.label7.Name = "label7";
            this.label7.Size = new Size(0x36, 13);
            this.label7.TabIndex = 20;
            this.label7.Text = "PK Table:";
            this.lblPkTable.AutoSize = true;
            this.lblPkTable.Location = new Point(0xb8, 0x4b);
            this.lblPkTable.Name = "lblPkTable";
            this.lblPkTable.Size = new Size(0, 13);
            this.lblPkTable.TabIndex = 0x13;
            this.btnSalvarReferencia.Location = new Point(0xbb, 0x1d3);
            this.btnSalvarReferencia.Name = "btnSalvarReferencia";
            this.btnSalvarReferencia.Size = new Size(0x183, 0x17);
            this.btnSalvarReferencia.TabIndex = 0x11;
            this.btnSalvarReferencia.Text = "Salvar Altera\x00e7\x00f5es";
            this.btnSalvarReferencia.UseVisualStyleBackColor = true;
            this.chkIgnore.AutoSize = true;
            this.chkIgnore.Location = new Point(0xbb, 0x18b);
            this.chkIgnore.Name = "chkIgnore";
            this.chkIgnore.Size = new Size(0x6d, 0x11);
            this.chkIgnore.TabIndex = 0x10;
            this.chkIgnore.Text = "Ignore Reference";
            this.chkIgnore.UseVisualStyleBackColor = true;
            this.cmbTipo.DropDownStyle = ComboBoxStyle.DropDownList;
            this.cmbTipo.FormattingEnabled = true;
            this.cmbTipo.Location = new Point(0xbb, 220);
            this.cmbTipo.Name = "cmbTipo";
            this.cmbTipo.Size = new Size(0x183, 0x15);
            this.cmbTipo.TabIndex = 15;
            this.label16.AutoSize = true;
            this.label16.Location = new Point(0x24, 0xe4);
            this.label16.Name = "label16";
            this.label16.Size = new Size(0x57, 13);
            this.label16.TabIndex = 14;
            this.label16.Text = "Type Reference:";
            this.label10.AutoSize = true;
            this.label10.Location = new Point(0x24, 0x13e);
            this.label10.Name = "label10";
            this.label10.Size = new Size(90, 13);
            this.label10.TabIndex = 14;
            this.label10.Text = "Update Cascade:";
            this.lblUpdate.AutoSize = true;
            this.lblUpdate.Location = new Point(0xb8, 0x13e);
            this.lblUpdate.Name = "lblUpdate";
            this.lblUpdate.Size = new Size(0, 13);
            this.lblUpdate.TabIndex = 13;
            this.label12.AutoSize = true;
            this.label12.Location = new Point(0x24, 0x113);
            this.label12.Name = "label12";
            this.label12.Size = new Size(0x56, 13);
            this.label12.TabIndex = 12;
            this.label12.Text = "Delete Cascade:";
            this.lblDelete.AutoSize = true;
            this.lblDelete.Location = new Point(0xb8, 0x113);
            this.lblDelete.Name = "lblDelete";
            this.lblDelete.Size = new Size(0, 13);
            this.lblDelete.TabIndex = 11;
            this.label14.AutoSize = true;
            this.label14.Location = new Point(0x24, 0x94);
            this.label14.Name = "label14";
            this.label14.Size = new Size(0x5d, 13);
            this.label14.TabIndex = 10;
            this.label14.Text = "PK Column Name:";
            this.lblPkColumn.AutoSize = true;
            this.lblPkColumn.Location = new Point(0xb8, 0x94);
            this.lblPkColumn.Name = "lblPkColumn";
            this.lblPkColumn.Size = new Size(0, 13);
            this.lblPkColumn.TabIndex = 9;
            this.label8.AutoSize = true;
            this.label8.Location = new Point(0x24, 0xb9);
            this.label8.Name = "label8";
            this.label8.Size = new Size(0x5c, 13);
            this.label8.TabIndex = 8;
            this.label8.Text = "FK Column Name:";
            this.lblFkColumn.AutoSize = true;
            this.lblFkColumn.Location = new Point(0xb8, 0xb9);
            this.lblFkColumn.Name = "lblFkColumn";
            this.lblFkColumn.Size = new Size(0, 13);
            this.lblFkColumn.TabIndex = 7;
            this.label6.AutoSize = true;
            this.label6.Location = new Point(0x24, 0x165);
            this.label6.Name = "label6";
            this.label6.Size = new Size(0x58, 13);
            this.label6.TabIndex = 6;
            this.label6.Text = "Constraint Name:";
            this.lblConstraintName.AutoSize = true;
            this.lblConstraintName.Location = new Point(0xb8, 0x165);
            this.lblConstraintName.Name = "lblConstraintName";
            this.lblConstraintName.Size = new Size(0, 13);
            this.lblConstraintName.TabIndex = 5;
            this.label4.AutoSize = true;
            this.label4.Location = new Point(0x24, 0x71);
            this.label4.Name = "label4";
            this.label4.Size = new Size(0x35, 13);
            this.label4.TabIndex = 4;
            this.label4.Text = "FK Table:";
            this.lblFkTable.AutoSize = true;
            this.lblFkTable.Location = new Point(0xb8, 0x71);
            this.lblFkTable.Name = "lblFkTable";
            this.lblFkTable.Size = new Size(0, 13);
            this.lblFkTable.TabIndex = 3;
            this.lblBusinessClassName.AutoSize = true;
            this.lblBusinessClassName.Location = new Point(0xb8, 0x2a);
            this.lblBusinessClassName.Name = "lblBusinessClassName";
            this.lblBusinessClassName.Size = new Size(0, 13);
            this.lblBusinessClassName.TabIndex = 3;
            this.label5.AutoSize = true;
            this.label5.Location = new Point(0x24, 0x2a);
            this.label5.Name = "label5";
            this.label5.Size = new Size(0x62, 13);
            this.label5.TabIndex = 3;
            this.label5.Text = "Business Class Name:";
            this.chkTabelaNo.AutoSize = true;
            this.chkTabelaNo.Location = new Point(0xbb, 0x9c);
            this.chkTabelaNo.Name = "chkTabelaNo";
            this.chkTabelaNo.Size = new Size(0x4c, 0x11);
            this.chkTabelaNo.TabIndex = 9;
            this.chkTabelaNo.Text = "Tabela N\x00f3";
            this.chkTabelaNo.UseVisualStyleBackColor = true;
            this.btnSalvar.Location = new Point(410, 0xbc);
            this.btnSalvar.Name = "btnSalvar";
            this.btnSalvar.Size = new Size(0x7f, 0x17);
            this.btnSalvar.TabIndex = 7;
            this.btnSalvar.Text = "Salvar Altera\x00e7\x00f5es";
            this.btnSalvar.UseVisualStyleBackColor = true;
            this.btnSalvar.Click += new EventHandler(this.btnSalvar_Click);
            this.txtNomeBusiness.Location = new Point(0xbb, 0x77);
            this.txtNomeBusiness.Name = "txtNomeBusiness";
            this.txtNomeBusiness.Size = new Size(350, 20);
            this.txtNomeBusiness.TabIndex = 6;
            this.label3.AutoSize = true;
            this.label3.Location = new Point(0x24, 0x7e);
            this.label3.Name = "label3";
            this.label3.Size = new Size(0x77, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Nome da Classe Business:";
            this.chkIgnoreTable.AutoSize = true;
            this.chkIgnoreTable.Location = new Point(0xbb, 0xbc);
            this.chkIgnoreTable.Name = "chkIgnoreTable";
            this.chkIgnoreTable.Size = new Size(0x56, 0x11);
            this.chkIgnoreTable.TabIndex = 4;
            this.chkIgnoreTable.Text = "Ignore Table";
            this.chkIgnoreTable.UseVisualStyleBackColor = true;
            this.txtNomeDataBase.Location = new Point(0xbb, 0x54);
            this.txtNomeDataBase.Name = "txtNomeDataBase";
            this.txtNomeDataBase.Size = new Size(350, 20);
            this.txtNomeDataBase.TabIndex = 3;
            this.label2.AutoSize = true;
            this.label2.Location = new Point(0x24, 0x5b);
            this.label2.Name = "label2";
            this.label2.Size = new Size(140, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Nome da Classe Data Base:";
            this.txtNomeProcedure.Location = new Point(0xbb, 0x30);
            this.txtNomeProcedure.Name = "txtNomeProcedure";
            this.txtNomeProcedure.Size = new Size(350, 20);
            this.txtNomeProcedure.TabIndex = 3;
            this.label1.AutoSize = true;
            this.label1.Location = new Point(0x24, 0x37);
            this.label1.Name = "label1";
            this.label1.Size = new Size(0x69, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Nome da Procedure:";
            this.grpColuna.Anchor = AnchorStyles.Right | AnchorStyles.Left | AnchorStyles.Bottom | AnchorStyles.Top;
            this.grpColuna.Location = new Point(0x1ff, 0x240);
            this.grpColuna.Name = "grpColuna";
            this.grpColuna.Size = new Size(0x218, 0x1be);
            this.grpColuna.TabIndex = 1;
            this.grpColuna.TabStop = false;
            this.grpColuna.Text = "Configura\x00e7\x00e3o Coluna";
            base.AutoScaleDimensions = new SizeF(6f, 13f);
            base.AutoScaleMode = AutoScaleMode.Font;
            base.ClientSize = new Size(0x335, 0x206);
            base.Controls.Add(this.splitContainer1);
            base.FormBorderStyle = FormBorderStyle.FixedSingle;
            base.MaximizeBox = false;
            base.MinimizeBox = false;
            base.Name = "Configuracoes";
            base.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Configurar Camada Business";
            base.Load += new EventHandler(this.ConfigurarBusiness_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.grpTabela.ResumeLayout(false);
            this.grpTabela.PerformLayout();
            this.grpReferencia.ResumeLayout(false);
            this.grpReferencia.PerformLayout();
            base.ResumeLayout(false);
        }

        private void treeView1_AfterSelect(object sender, TreeViewEventArgs e)
        {
            this.viewConfig(e.Node);
        }

        private void viewConfig(TreeNode tn)
        {
            switch (tn.FullPath.Split(new char[] { '\\' }).Length)
            {
                case 1:
                    this.grpTabela.Visible = true;
                    this.grpColuna.Visible = false;
                    this.grpReferencia.Visible = false;
                    foreach (SqlTable table in Program.SqlTableList)
                    {
                        if (table.Nome == tn.Text)
                        {
                            this.txtNomeProcedure.Text = table.ProcNome;
                            this.txtNomeDataBase.Text = table.ClassDataBaseNome;
                            this.txtNomeBusiness.Text = table.ClassBusinessNome;
                            this.chkIgnoreTable.Checked = table.Ignore;
                            this.sqlTableTemp = table;
                            this.chkTabelaNo.Checked = table.IsTableNo;
                        }
                    }
                    break;

                case 3:
                    if (tn.Parent.Text == "Colunas")
                    {
                        this.grpTabela.Visible = false;
                        this.grpColuna.Visible = true;
                        this.grpReferencia.Visible = false;
                        break;
                    }
                    this.grpTabela.Visible = false;
                    this.grpColuna.Visible = false;
                    this.grpReferencia.Visible = true;
                    foreach (SqlTable table2 in Program.SqlTableList)
                    {
                        if (!(table2.Nome == tn.Parent.Parent.Text))
                        {
                            continue;
                        }
                        char[] separator = new char[] { '<', '=', '>' };
                        string[] strArray = tn.Text.Split(separator);
                        foreach (SqlReference reference in table2.References)
                        {
                            if ((reference.PkTable != strArray[0].Trim()) || (reference.FkTable != strArray[3].Trim()))
                            {
                                continue;
                            }
                            this.CarregarCombosTables();
                            this.lblPkTable.Text = reference.PkTable;
                            this.lblFkTable.Text = reference.FkTable;
                            for (int i = 0; i < this.cmbPkt.Items.Count; i++)
                            {
                                if (this.cmbPkt.Items[i].ToString() == reference.PkTable)
                                {
                                    this.cmbPkt.SelectedIndex = i;
                                }
                            }
                            for (int j = 0; j < this.cmbPkt.Items.Count; j++)
                            {
                                if (this.cmbFkT.Items[j].ToString() == reference.FkTable)
                                {
                                    this.cmbFkT.SelectedIndex = j;
                                }
                            }
                            this.CarregarCombosColumns();
                            this.lblPkColumn.Text = reference.FkColumnName;
                            this.lblFkColumn.Text = reference.PkColumnName;
                            for (int k = 0; k < this.cmbPKColumn.Items.Count; k++)
                            {
                                if ((this.cmbPKColumn.Items[k] as SqlColumn).Name == reference.FkColumnName)
                                {
                                    this.cmbPKColumn.SelectedIndex = k;
                                }
                            }
                            for (int m = 0; m < this.cmbFKColumn.Items.Count; m++)
                            {
                                if ((this.cmbFKColumn.Items[m] as SqlColumn).Name == reference.PkColumnName)
                                {
                                    this.cmbFKColumn.SelectedIndex = m;
                                }
                            }
                            this.lblBusinessClassName.Text = table2.ClassBusinessNome;
                            this.chkIgnore.Checked = reference.Ignore;
                            this.chkIsCollection.Checked = reference.IsCollection;
                            this.lblConstraintName.Text = reference.ConstraintName;
                            this.lblDelete.Text = reference.DeleteCascade ? "Sim" : "N\x00e3o";
                            this.lblUpdate.Text = reference.UpdateCascade ? "Sim" : "N\x00e3o";
                            this.cmbTipo.ValueMember = reference.TipoRelacao.ToString();
                            for (int n = 0; n < this.cmbTipo.Items.Count; n++)
                            {
                                if (this.cmbTipo.Items[n].ToString() == reference.TipoRelacao.ToString())
                                {
                                    this.cmbTipo.SelectedIndex = n;
                                }
                            }
                        }
                    }
                    break;
            }
        }
    }
}

