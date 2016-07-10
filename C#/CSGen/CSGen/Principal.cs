namespace CSGen
{
    using CSGen.Code;
    using CSGen.CreateSolution;
    using CSGen.GeraBusinessClass;
    using CSGen.GeraDataBaseClass;
    using CSGen.GeraProcedures;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.IO;
    using System.Text;
    using System.Windows.Forms;

    public class Principal : Form
    {
        private Button btnConfigBusiness;
        private Button btnGerar;
        private Button btnPath;
        private Button btnReportError;
        private Button btnSair;
        private CheckBox chkCreSolution;
        private CheckBox chkExecProc;
        private ComboBox cmbDataBase;
        private IContainer components;
        private FolderBrowserDialog folderBrowserDialog1;
        private GroupBox groupBox1;
        private GroupBox groupBox2;
        private GroupBox groupBox3;
        private Label label1;
        private Label label10;
        private Label label11;
        private Label label12;
        private Label label13;
        private Label label14;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private Label label6;
        private Label label7;
        private Label label8;
        private Label label9;
        private RadioButton rdoSqlServer;
        private RadioButton rdoWindows;
        public StringBuilder sbFileLog = new StringBuilder();
        private ToolTip toolTip1;
        private TextBox txtDelete;
        private TextBox txtInsert;
        private TextBox txtLogin;
        private TextBox txtNamespace;
        private TextBox txtPassword;
        private TextBox txtPath;
        private TextBox txtRemoveClass;
        private TextBox txtRemoveProc;
        private TextBox txtSelect;
        private TextBox txtServidor;
        private TextBox txtSkip;
        private TextBox txtWebConfigConn;

        public Principal()
        {
            this.InitializeComponent();
            this.toolTip1.SetToolTip(this.txtServidor, "Nome ou ip do servidor sql2005.");
            this.toolTip1.SetToolTip(this.txtLogin, "Login v\x00e1lido para o sql.");
            this.toolTip1.SetToolTip(this.txtPassword, "Senha do sql.");
            this.toolTip1.SetToolTip(this.cmbDataBase, "Banco de dados que ser\x00e1 mapeado.");
            this.toolTip1.SetToolTip(this.txtNamespace, "Prefixo para namespace das classes geradas.");
            this.toolTip1.SetToolTip(this.txtInsert, "Sulfixo para procedures de insert.");
            this.toolTip1.SetToolTip(this.txtDelete, "Sulfixo para procedures de delete.");
            this.toolTip1.SetToolTip(this.txtSelect, "Sulfixo para procedures de select.");
            this.toolTip1.SetToolTip(this.txtWebConfigConn, "Nome da connection string no arquivo de configura\x00e7\x00e3o.");
            this.toolTip1.SetToolTip(this.txtRemoveClass, "Algumas tabelas do banco de dados possuem prefixo ex.: (tb), neste caso \x00e9 interessante remover esse prefixo para as Classes.");
            this.toolTip1.SetToolTip(this.txtRemoveProc, "Algumas tabelas do banco de dados possuem prefixo ex.: (tb), neste caso \x00e9 interessante remover esse prefixo para as Classes.");
            this.toolTip1.SetToolTip(this.txtSkip, "As vezes nao precisamos mapear todo o banco, neste caso indique o prefixo das tabelas que vc deseja mapear.");
            this.toolTip1.SetToolTip(this.chkCreSolution, "Op\x00e7\x00e3o para criar automaticamente a solu\x00e7\x00e3o e os projetos.");
            this.toolTip1.SetToolTip(this.chkExecProc, "Op\x00e7\x00e3o para criar automaticamente as procedures no banco de dados.");
            this.toolTip1.SetToolTip(this.txtPath, "Caminho onde os arquivos ser\x00e3o gerados. obs (ser\x00e1 criado o diret\x00f3rio (CSGen)");
            this.toolTip1.SetToolTip(this.btnPath, "Localizar o diret\x00f3rio de cria\x00e7\x00e3o dos arquivos.");
            this.toolTip1.SetToolTip(this.btnConfigBusiness, "Op\x00e7\x00f5es de configura\x00e7\x00e3o de mapeamento e referencias.");
            this.toolTip1.SetToolTip(this.btnGerar, "Gerar Mapeamento.");
            this.toolTip1.SetToolTip(this.btnSair, "Sem Coment\x00e1rios....");
        }

        private void BiderConnection()
        {
            if (this.rdoSqlServer.Checked)
            {
                Program.stringConexao = string.Format("Data Source={0};Initial Catalog={1};Integrated Security=false;user id={2};password={3}", new object[] { this.txtServidor.Text, this.cmbDataBase.Text, this.txtLogin.Text, this.txtPassword.Text });
            }
            else
            {
                Program.stringConexao = string.Format("Data Source={0};Initial Catalog={1};Integrated Security=true", this.txtServidor.Text, this.cmbDataBase.Text);
            }
        }

        private void BinderProgram()
        {
            if (!Directory.Exists(this.txtPath.Text + @"\CSGen"))
            {
                Directory.CreateDirectory(this.txtPath.Text + @"\CSGen");
            }
            Program.outputPath = this.txtPath.Text + @"\CSGen";
            Program.prefixNamespace = (this.txtNamespace.Text != "") ? (this.txtNamespace.Text + ".") : "";
            Program.sulfixInsert = this.txtInsert.Text;
            Program.sulfixDelete = this.txtDelete.Text;
            Program.sulfixSelect = this.txtSelect.Text;
            Program.webConfigConnection = this.txtWebConfigConn.Text;
            Program.stringRemoveClass = this.txtRemoveClass.Text;
            Program.stringRemoveProc = this.txtRemoveProc.Text;
            Program.tableStartWith = this.txtSkip.Text.ToLower();
        }

        private void btnConfigBusiness_Click(object sender, EventArgs e)
        {
            try
            {
                this.BiderConnection();
                this.BinderProgram();
                if ((Program.SqlTableList == null) || (Program.SqlTableList.Count == 0))
                {
                    Program.SqlTableList = LoadDataBaseSchema.GetTables();
                }
                new Configuracoes().Show();
                Program.configProgram = true;
            }
            catch (Exception exception)
            {
                throw exception;
                MessageBox.Show(exception.Message, "CSGen", MessageBoxButtons.AbortRetryIgnore, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }

        private void btnGerar_Click(object sender, EventArgs e)
        {
            if (!Program.configProgram)
            {
                this.sbFileLog.AppendLine("Start Process - " + DateTime.Now.ToString());
                this.sbFileLog.AppendLine();
                this.BiderConnection();
                this.BinderProgram();
                Program.SqlTableList = LoadDataBaseSchema.GetTables();
                this.GerarQueryConfig();
                this.GerarDBClassConfig();
                this.GerarBusinessClassConfig();
                this.sbFileLog.AppendLine("Finish Process - " + DateTime.Now.ToString());
                this.persisteLog();
            }
            else
            {
                this.sbFileLog.AppendLine("Start Process - " + DateTime.Now.ToString());
                this.sbFileLog.AppendLine();
                if (!Directory.Exists(this.txtPath.Text + @"\CSGen"))
                {
                    Directory.CreateDirectory(this.txtPath.Text + @"\CSGen");
                }
                Program.outputPath = this.txtPath.Text + @"\CSGen";
                this.BinderProgram();
                this.GerarQueryConfig();
                this.GerarDBClassConfig();
                this.GerarBusinessClassConfig();
                this.sbFileLog.AppendLine("Finish Process - " + DateTime.Now.ToString());
                this.persisteLog();
            }
            if (Program.createSolution)
            {
                CreateProject project = new CreateProject(TipoProjeto.DataBase);
                project.Build();
                CreateProject project2 = new CreateProject(TipoProjeto.Business);
                project2.stringDataBaseGuide = project.stringGuid;
                project2.Build();
                new CSGen.CreateSolution.CreateSolution(project.stringGuid, project2.stringGuid).Build();
            }
            MessageBox.Show("Processo Executado com Sucesso!", "CSGen", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
        }

        private void btnPath_Click(object sender, EventArgs e)
        {
            this.folderBrowserDialog1.ShowDialog(this);
            if (this.folderBrowserDialog1.SelectedPath != "")
            {
                this.txtPath.Text = this.folderBrowserDialog1.SelectedPath;
            }
        }

        private void btnReportError_Click(object sender, EventArgs e)
        {
            new ReportBug().Show();
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void chkCreSolution_CheckedChanged(object sender, EventArgs e)
        {
            Program.createSolution = this.chkCreSolution.Checked;
        }

        private void chkExecProc_CheckedChanged(object sender, EventArgs e)
        {
            Program.execProc = this.chkExecProc.Checked;
        }

        private void cmbDataBase_Enter(object sender, EventArgs e)
        {
            try
            {
                this.BiderConnection();
                this.cmbDataBase.Items.Clear();
                SqlDataAdapter adapter = new SqlDataAdapter("exec sp_databases", Program.stringConexao);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                if (dataTable.Rows.Count > 0)
                {
                    for (int i = 0; i < dataTable.Rows.Count; i++)
                    {
                        this.cmbDataBase.Items.Add(dataTable.Rows[i][0].ToString());
                    }
                }
            }
            catch
            {
                MessageBox.Show("Conex\x00e3o Inv\x00e1lida", "CSGen", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void ExecProc(string strProc)
        {
            try
            {
                string[] strArray = strProc.Replace("#go#", "|").Split(new char[] { '|' });
                SqlConnection connection = new SqlConnection(Program.stringConexao);
                connection.Open();
                SqlCommand command = new SqlCommand(strArray[0], connection);
                command.ExecuteNonQuery();
                if (strArray.Length == 5)
                {
                    command.CommandText = strArray[1];
                    command.ExecuteNonQuery();
                    command.CommandText = strArray[2];
                    command.ExecuteNonQuery();
                    command.CommandText = strArray[3];
                    command.ExecuteNonQuery();
                }
                else
                {
                    command.CommandText = strArray[1];
                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        private void formPrincipal_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void formPrincipal_Load(object sender, EventArgs e)
        {
            this.txtPath.Text = Path.GetDirectoryName(Application.ExecutablePath);
        }

        private void GerarBusinessClassConfig()
        {
            List<SqlTable> sqlTableList = Program.SqlTableList;
            string path = Program.outputPath + @"\Business";
            if (Directory.Exists(path))
            {
                Directory.Delete(path, true);
            }
            Directory.CreateDirectory(path);
            string str2 = "";
            this.sbFileLog.AppendLine();
            this.sbFileLog.AppendLine("#### GENARATE CLASSES FOR Business");
            foreach (SqlTable table in sqlTableList)
            {
                try
                {
                    if (!(table.Ignore || !table.Nome.ToLower().StartsWith(Program.tableStartWith)))
                    {
                        if (!Directory.Exists(path)) Directory.CreateDirectory(path);
                        str2 = "";
                        str2 = GerarBusinessClass.GerarClasse(table);
                        StreamWriter writer = new StreamWriter(path + @"\" + table.ClassBusinessNome + ".cs");
                        writer.Write(str2);
                        writer.Flush();
                        writer.Close();
                        writer.Dispose();
                        this.sbFileLog.AppendLine(table.ClassBusinessNome + " Business class created sussefull ");
                    }
                    else
                    {
                        this.sbFileLog.AppendLine(table.ClassDataBaseNome + " db class ignored for user ");
                    }
                    continue;
                }
                catch (Exception exception)
                {
                    throw exception;
                    this.sbFileLog.AppendLine(table.ClassDataBaseNome + " db class ERROR: " + exception.Message);
                    continue;
                }
            }
        }

        private void GerarDBClassConfig()
        {
            List<SqlTable> sqlTableList = Program.SqlTableList;
            string path = Program.outputPath + @"\DataBase";
            if (Directory.Exists(path))
            {
                Directory.Delete(path, true);
            }
            Directory.CreateDirectory(path);
            string str2 = "";
            this.sbFileLog.AppendLine();
            this.sbFileLog.AppendLine("#### GENARATE CLASSES FOR DB");
            foreach (SqlTable table in sqlTableList)
            {
                try
                {
                    if (!(table.Ignore || !table.Nome.ToLower().StartsWith(Program.tableStartWith)))
                    {
                        if (!Directory.Exists(path)) Directory.CreateDirectory(path);
            
                        str2 = "";
                        str2 = GerarDataBaseClass.GerarClasses(table);
                        StreamWriter writer = new StreamWriter(path + @"\" + table.ClassDataBaseNome + ".cs");
                        writer.Write(str2);
                        writer.Flush();
                        writer.Close();
                        writer.Dispose();
                        this.sbFileLog.AppendLine(table.ClassDataBaseNome + " db class created sussefull ");
                    }
                    else
                    {
                        this.sbFileLog.AppendLine(table.ClassDataBaseNome + " db class ignored for user ");
                    }
                    continue;
                }
                catch (Exception exception)
                {
                    throw exception;
                    this.sbFileLog.AppendLine(table.ClassDataBaseNome + " db class ERROR: " + exception.Message);
                    continue;
                }
            }
        }

        private void GerarQueryConfig()
        {
            string str = "";
            string path = Program.outputPath + @"\ScriptsProcedures";
            List<SqlTable> sqlTableList = Program.SqlTableList;
            if (Directory.Exists(path))
            {
                Directory.Delete(path, true);
            }
            Directory.CreateDirectory(path);
            str = "-- ########################### GENARATE QUERIES TO SELECT ##################### \n\n";
            this.sbFileLog.AppendLine("#### GENERATE QUERIES TO SELECT");
            foreach (SqlTable table in sqlTableList)
            {
                try
                {
                    if (!table.Ignore && table.Nome.ToLower().StartsWith(Program.tableStartWith))
                    {
                        string strProc = GerarProcedure.GerarSelect(table);
                        str = str + strProc.Replace("#go#", "go");
                        if (Program.execProc)
                        {
                            this.ExecProc(strProc);
                            this.sbFileLog.AppendLine(table.ProcNome + " - procedure created and executed with sucess");
                        }
                        else
                        {
                            this.sbFileLog.AppendLine(table.ProcNome + " - procedure created with sucess");
                        }
                    }
                    else
                    {
                        this.sbFileLog.AppendLine(table.ProcNome + " - procedure ignored by user");
                    }
                    continue;
                }
                catch (Exception exception)
                {
                    throw exception;
                    this.sbFileLog.AppendLine(table.ProcNome + " - procedure ERROR: " + exception.Message);
                    continue;
                }
            }
            StreamWriter writer = new StreamWriter(path + @"\SELECT_QUERIES.SQL");
            writer.Write(str);
            writer.Flush();
            writer.Close();
            writer.Dispose();
            str = "-- ########################### GENERATE QUERIES TO INSERT OR UPDATE ##################### \n\n";
            this.sbFileLog.AppendLine();
            this.sbFileLog.AppendLine("#### GENERATE QUERIES TO INSERT OR UPDATE");
            foreach (SqlTable table2 in sqlTableList)
            {
                try
                {
                    if (!table2.Ignore && table2.Nome.ToLower().StartsWith(Program.tableStartWith))
                    {
                        string str4 = GerarProcedure.GerarInsertUpdate(table2);
                        str = str + str4.Replace("#go#", "go");
                        if (Program.execProc)
                        {
                            this.ExecProc(str4);
                            this.sbFileLog.AppendLine(table2.ProcNome + " - procedure created and executed with sucess");
                        }
                        else
                        {
                            this.sbFileLog.AppendLine(table2.ProcNome + " - procedure created with sucess");
                        }
                    }
                    else
                    {
                        this.sbFileLog.AppendLine(table2.ProcNome + " - procedure ignored by user");
                    }
                    continue;
                }
                catch (Exception exception2)
                {
                    //throw exception2;
                    this.sbFileLog.AppendLine(table2.ProcNome + " - procedure ERROR: " + exception2.Message);
                    continue;
                }
            }
            StreamWriter writer2 = new StreamWriter(path + @"\INSERT_UPDATE_QUERIES.SQL");
            writer2.Write(str);
            writer2.Flush();
            writer2.Close();
            writer2.Dispose();
            str = "-- ########################### GENARATE QUERIES TO DELETE ##################### \n\n";
            this.sbFileLog.AppendLine();
            this.sbFileLog.AppendLine("#### GENERATE QUERIES TO DELETE");
            foreach (SqlTable table3 in sqlTableList)
            {
                try
                {
                    if (!table3.Ignore && table3.Nome.ToLower().StartsWith(Program.tableStartWith))
                    {
                        string str5 = GerarProcedure.GerarDelete(table3);
                        str = str + str5.Replace("#go#", "go");
                        if (Program.execProc)
                        {
                            this.ExecProc(str5);
                            this.sbFileLog.AppendLine(table3.ProcNome + " - procedure created and executed with sucess");
                        }
                        else
                        {
                            this.sbFileLog.AppendLine(table3.ProcNome + " - procedure created with sucess");
                        }
                    }
                    else
                    {
                        this.sbFileLog.AppendLine(table3.ProcNome + " - procedure ignore for user");
                    }
                    continue;
                }
                catch (Exception exception3)
                {
                    throw exception3;
                    this.sbFileLog.AppendLine(table3.ProcNome + " - procedure ERROR: " + exception3.Message);
                    continue;
                }
            }
            StreamWriter writer3 = new StreamWriter(path + @"\DELETE_QUERIES.SQL");
            writer3.Write(str);
            writer3.Flush();
            writer3.Close();
            writer3.Dispose();
        }

        private void InitializeComponent()
        {
            this.components = new Container();
            this.folderBrowserDialog1 = new FolderBrowserDialog();
            this.label10 = new Label();
            this.txtPath = new TextBox();
            this.btnPath = new Button();
            this.btnGerar = new Button();
            this.btnSair = new Button();
            this.groupBox1 = new GroupBox();
            this.cmbDataBase = new ComboBox();
            this.rdoWindows = new RadioButton();
            this.rdoSqlServer = new RadioButton();
            this.txtPassword = new TextBox();
            this.txtLogin = new TextBox();
            this.txtServidor = new TextBox();
            this.label5 = new Label();
            this.label4 = new Label();
            this.label3 = new Label();
            this.label2 = new Label();
            this.label1 = new Label();
            this.groupBox2 = new GroupBox();
            this.chkCreSolution = new CheckBox();
            this.chkExecProc = new CheckBox();
            this.label14 = new Label();
            this.txtSkip = new TextBox();
            this.label13 = new Label();
            this.label12 = new Label();
            this.label11 = new Label();
            this.label9 = new Label();
            this.label8 = new Label();
            this.label7 = new Label();
            this.txtRemoveProc = new TextBox();
            this.txtRemoveClass = new TextBox();
            this.txtWebConfigConn = new TextBox();
            this.txtSelect = new TextBox();
            this.txtDelete = new TextBox();
            this.txtInsert = new TextBox();
            this.txtNamespace = new TextBox();
            this.label6 = new Label();
            this.groupBox3 = new GroupBox();
            this.btnConfigBusiness = new Button();
            this.toolTip1 = new ToolTip(this.components);
            this.btnReportError = new Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            base.SuspendLayout();
            this.label10.AutoSize = true;
            this.label10.Location = new Point(0x16, 0x1a);
            this.label10.Name = "label10";
            this.label10.Size = new Size(0x35, 13);
            this.label10.TabIndex = 5;
            this.label10.Text = "Gerar em:";
            this.txtPath.Location = new Point(0x8d, 0x13);
            this.txtPath.Name = "txtPath";
            this.txtPath.Size = new Size(0xc9, 20);
            this.txtPath.TabIndex = 0x11;
            this.btnPath.Location = new Point(0x15c, 0x12);
            this.btnPath.Name = "btnPath";
            this.btnPath.Size = new Size(0x1b, 0x17);
            this.btnPath.TabIndex = 0x12;
            this.btnPath.Text = "...";
            this.btnPath.UseVisualStyleBackColor = true;
            this.btnPath.Click += new EventHandler(this.btnPath_Click);
            this.btnGerar.Location = new Point(0x16, 0x231);
            this.btnGerar.Name = "btnGerar";
            this.btnGerar.Size = new Size(0xe0, 0x17);
            this.btnGerar.TabIndex = 20;
            this.btnGerar.Text = "Gerar Todos";
            this.btnGerar.UseVisualStyleBackColor = true;
            this.btnGerar.Click += new EventHandler(this.btnGerar_Click);
            this.btnSair.Location = new Point(0xfc, 0x231);
            this.btnSair.Name = "btnSair";
            this.btnSair.Size = new Size(0x80, 0x17);
            this.btnSair.TabIndex = 0x15;
            this.btnSair.Text = "Sair";
            this.btnSair.UseVisualStyleBackColor = true;
            this.btnSair.Click += new EventHandler(this.btnSair_Click);
            this.groupBox1.Controls.Add(this.cmbDataBase);
            this.groupBox1.Controls.Add(this.rdoWindows);
            this.groupBox1.Controls.Add(this.rdoSqlServer);
            this.groupBox1.Controls.Add(this.txtPassword);
            this.groupBox1.Controls.Add(this.txtLogin);
            this.groupBox1.Controls.Add(this.txtServidor);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new Point(0x16, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new Size(0x195, 0x9d);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Data Base";
            this.cmbDataBase.FormattingEnabled = true;
            this.cmbDataBase.Location = new Point(0x8d, 120);
            this.cmbDataBase.Name = "cmbDataBase";
            this.cmbDataBase.Size = new Size(0xeb, 0x15);
            this.cmbDataBase.TabIndex = 6;
            this.cmbDataBase.Enter += new EventHandler(this.cmbDataBase_Enter);
            this.rdoWindows.AutoSize = true;
            this.rdoWindows.Checked = true;
            this.rdoWindows.Location = new Point(0x10f, 0x2d);
            this.rdoWindows.Name = "rdoWindows";
            this.rdoWindows.Size = new Size(0x45, 0x11);
            this.rdoWindows.TabIndex = 3;
            this.rdoWindows.TabStop = true;
            this.rdoWindows.Text = "Windows";
            this.rdoWindows.UseVisualStyleBackColor = true;
            this.rdoWindows.CheckedChanged += new EventHandler(this.rdoWindows_CheckedChanged);
            this.rdoSqlServer.AutoSize = true;
            this.rdoSqlServer.Location = new Point(0x8d, 0x2d);
            this.rdoSqlServer.Name = "rdoSqlServer";
            this.rdoSqlServer.Size = new Size(0x4a, 0x11);
            this.rdoSqlServer.TabIndex = 2;
            this.rdoSqlServer.Text = "Sql Server";
            this.rdoSqlServer.UseVisualStyleBackColor = true;
            this.rdoSqlServer.CheckedChanged += new EventHandler(this.rdoSqlServer_CheckedChanged);
            this.txtPassword.Enabled = false;
            this.txtPassword.Location = new Point(0x8d, 0x5e);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PasswordChar = '*';
            this.txtPassword.Size = new Size(0xeb, 20);
            this.txtPassword.TabIndex = 5;
            this.txtLogin.Enabled = false;
            this.txtLogin.Location = new Point(0x8d, 0x44);
            this.txtLogin.Name = "txtLogin";
            this.txtLogin.Size = new Size(0xeb, 20);
            this.txtLogin.TabIndex = 4;
            this.txtServidor.Location = new Point(0x8d, 0x13);
            this.txtServidor.Name = "txtServidor";
            this.txtServidor.Size = new Size(0xeb, 20);
            this.txtServidor.TabIndex = 1;
            this.txtServidor.Text = @".\sqlExpress";
            this.label5.AutoSize = true;
            this.label5.Location = new Point(0x15, 0x80);
            this.label5.Name = "label5";
            this.label5.Size = new Size(60, 13);
            this.label5.TabIndex = 6;
            this.label5.Text = "Data Base:";
            this.label4.AutoSize = true;
            this.label4.Location = new Point(0x15, 100);
            this.label4.Name = "label4";
            this.label4.Size = new Size(0x38, 13);
            this.label4.TabIndex = 5;
            this.label4.Text = "Password:";
            this.label3.AutoSize = true;
            this.label3.Location = new Point(0x15, 0x4a);
            this.label3.Name = "label3";
            this.label3.Size = new Size(0x24, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Login:";
            this.label2.AutoSize = true;
            this.label2.Location = new Point(0x15, 0x30);
            this.label2.Name = "label2";
            this.label2.Size = new Size(0x49, 13);
            this.label2.TabIndex = 9;
            this.label2.Text = "Autentica\x00e7\x00e3o:";
            this.label1.AutoSize = true;
            this.label1.Location = new Point(0x15, 0x19);
            this.label1.Name = "label1";
            this.label1.Size = new Size(0x31, 13);
            this.label1.TabIndex = 8;
            this.label1.Text = "Servidor:";
            this.groupBox2.Controls.Add(this.chkCreSolution);
            this.groupBox2.Controls.Add(this.chkExecProc);
            this.groupBox2.Controls.Add(this.label14);
            this.groupBox2.Controls.Add(this.txtSkip);
            this.groupBox2.Controls.Add(this.label13);
            this.groupBox2.Controls.Add(this.label12);
            this.groupBox2.Controls.Add(this.label11);
            this.groupBox2.Controls.Add(this.label9);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Controls.Add(this.label7);
            this.groupBox2.Controls.Add(this.txtRemoveProc);
            this.groupBox2.Controls.Add(this.txtRemoveClass);
            this.groupBox2.Controls.Add(this.txtWebConfigConn);
            this.groupBox2.Controls.Add(this.txtSelect);
            this.groupBox2.Controls.Add(this.txtDelete);
            this.groupBox2.Controls.Add(this.txtInsert);
            this.groupBox2.Controls.Add(this.txtNamespace);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Location = new Point(0x16, 0xaf);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new Size(0x195, 0x120);
            this.groupBox2.TabIndex = 2;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Nomes";
            this.chkCreSolution.AutoSize = true;
            this.chkCreSolution.Location = new Point(140, 260);
            this.chkCreSolution.Name = "chkCreSolution";
            this.chkCreSolution.Size = new Size(0x62, 0x11);
            this.chkCreSolution.TabIndex = 0x10;
            this.chkCreSolution.Text = "Create Solution";
            this.chkCreSolution.UseVisualStyleBackColor = true;
            this.chkCreSolution.CheckedChanged += new EventHandler(this.chkCreSolution_CheckedChanged);
            this.chkExecProc.AutoSize = true;
            this.chkExecProc.Location = new Point(140, 0xed);
            this.chkExecProc.Name = "chkExecProc";
            this.chkExecProc.Size = new Size(0x7a, 0x11);
            this.chkExecProc.TabIndex = 15;
            this.chkExecProc.Text = "Execute Procedures";
            this.chkExecProc.UseVisualStyleBackColor = true;
            this.chkExecProc.CheckedChanged += new EventHandler(this.chkExecProc_CheckedChanged);
            this.label14.AutoSize = true;
            this.label14.Location = new Point(20, 0xd0);
            this.label14.Name = "label14";
            this.label14.Size = new Size(0x52, 13);
            this.label14.TabIndex = 14;
            this.label14.Text = "Table start with:";
            this.txtSkip.Location = new Point(140, 0xc9);
            this.txtSkip.Name = "txtSkip";
            this.txtSkip.Size = new Size(0xeb, 20);
            this.txtSkip.TabIndex = 14;
            this.txtSkip.Text = "tb";
            this.label13.AutoSize = true;
            this.label13.Location = new Point(0x15, 0xb6);
            this.label13.Name = "label13";
            this.label13.Size = new Size(0x66, 13);
            this.label13.TabIndex = 11;
            this.label13.Text = "Remover para Proc:";
            this.label12.AutoSize = true;
            this.label12.Location = new Point(20, 0x9c);
            this.label12.Name = "label12";
            this.label12.Size = new Size(0x6f, 13);
            this.label12.TabIndex = 11;
            this.label12.Text = "Remover para Classe:";
            this.label11.AutoSize = true;
            this.label11.Location = new Point(20, 130);
            this.label11.Name = "label11";
            this.label11.Size = new Size(0x5e, 13);
            this.label11.TabIndex = 11;
            this.label11.Text = "Connection String:";
            this.label9.AutoSize = true;
            this.label9.Location = new Point(0x15, 0x68);
            this.label9.Name = "label9";
            this.label9.Size = new Size(0x48, 13);
            this.label9.TabIndex = 11;
            this.label9.Text = "Sufixo Select:";
            this.label8.AutoSize = true;
            this.label8.Location = new Point(0x15, 0x4e);
            this.label8.Name = "label8";
            this.label8.Size = new Size(0x49, 13);
            this.label8.TabIndex = 12;
            this.label8.Text = "Sufixo Delete:";
            this.label7.AutoSize = true;
            this.label7.Location = new Point(0x15, 0x34);
            this.label7.Name = "label7";
            this.label7.Size = new Size(0x44, 13);
            this.label7.TabIndex = 13;
            this.label7.Text = "Sufixo Insert:";
            this.txtRemoveProc.Location = new Point(0x8d, 0xaf);
            this.txtRemoveProc.Name = "txtRemoveProc";
            this.txtRemoveProc.Size = new Size(0xeb, 20);
            this.txtRemoveProc.TabIndex = 13;
            this.txtRemoveProc.Text = "tb";
            this.txtRemoveClass.Location = new Point(140, 0x95);
            this.txtRemoveClass.Name = "txtRemoveClass";
            this.txtRemoveClass.Size = new Size(0xeb, 20);
            this.txtRemoveClass.TabIndex = 12;
            this.txtRemoveClass.Text = "tb";
            this.txtWebConfigConn.Location = new Point(140, 0x7b);
            this.txtWebConfigConn.Name = "txtWebConfigConn";
            this.txtWebConfigConn.Size = new Size(0xeb, 20);
            this.txtWebConfigConn.TabIndex = 11;
            this.txtWebConfigConn.Text = "conn";
            this.txtSelect.Location = new Point(0x8d, 0x61);
            this.txtSelect.Name = "txtSelect";
            this.txtSelect.Size = new Size(0xeb, 20);
            this.txtSelect.TabIndex = 10;
            this.txtSelect.Text = "Get";
            this.txtDelete.Location = new Point(0x8d, 0x47);
            this.txtDelete.Name = "txtDelete";
            this.txtDelete.Size = new Size(0xeb, 20);
            this.txtDelete.TabIndex = 9;
            this.txtDelete.Text = "Del";
            this.txtInsert.Location = new Point(0x8d, 0x2d);
            this.txtInsert.Name = "txtInsert";
            this.txtInsert.Size = new Size(0xeb, 20);
            this.txtInsert.TabIndex = 8;
            this.txtInsert.Text = "Save";
            this.txtNamespace.AccessibleDescription = "";
            this.txtNamespace.AutoCompleteCustomSource.AddRange(new string[] { "LuisSanches" });
            this.txtNamespace.AutoCompleteMode = AutoCompleteMode.Append;
            this.txtNamespace.AutoCompleteSource = AutoCompleteSource.CustomSource;
            this.txtNamespace.Location = new Point(0x8d, 0x13);
            this.txtNamespace.Name = "txtNamespace";
            this.txtNamespace.Size = new Size(0xeb, 20);
            this.txtNamespace.TabIndex = 7;
            this.txtNamespace.Tag = "";
            this.label6.AutoSize = true;
            this.label6.Location = new Point(0x15, 0x1a);
            this.label6.Name = "label6";
            this.label6.Size = new Size(0x66, 13);
            this.label6.TabIndex = 6;
            this.label6.Text = "Prefixo Namespace:";
            this.groupBox3.Controls.Add(this.btnConfigBusiness);
            this.groupBox3.Controls.Add(this.txtPath);
            this.groupBox3.Controls.Add(this.label10);
            this.groupBox3.Controls.Add(this.btnPath);
            this.groupBox3.Location = new Point(0x16, 0x1d2);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new Size(0x195, 0x59);
            this.groupBox3.TabIndex = 3;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Caminho";
            this.btnConfigBusiness.Location = new Point(140, 0x36);
            this.btnConfigBusiness.Name = "btnConfigBusiness";
            this.btnConfigBusiness.Size = new Size(0xec, 0x17);
            this.btnConfigBusiness.TabIndex = 0x13;
            this.btnConfigBusiness.Text = "Configura\x00e7\x00f5es";
            this.btnConfigBusiness.UseVisualStyleBackColor = true;
            this.btnConfigBusiness.Click += new EventHandler(this.btnConfigBusiness_Click);
            this.toolTip1.AutoPopDelay = 0x2710;
            this.toolTip1.InitialDelay = 500;
            this.toolTip1.ReshowDelay = 100;
            this.btnReportError.Location = new Point(0x182, 0x231);
            this.btnReportError.Name = "btnReportError";
            this.btnReportError.Size = new Size(0x29, 0x17);
            this.btnReportError.TabIndex = 0x16;
            this.btnReportError.Text = "Bug?";
            this.btnReportError.UseVisualStyleBackColor = true;
            this.btnReportError.Click += new EventHandler(this.btnReportError_Click);
            base.AutoScaleDimensions = new SizeF(6f, 13f);
            base.AutoScaleMode = AutoScaleMode.Font;
            base.ClientSize = new Size(0x1c4, 0x252);
            base.Controls.Add(this.groupBox3);
            base.Controls.Add(this.groupBox2);
            base.Controls.Add(this.groupBox1);
            base.Controls.Add(this.btnReportError);
            base.Controls.Add(this.btnSair);
            base.Controls.Add(this.btnGerar);
            base.FormBorderStyle = FormBorderStyle.FixedSingle;
            base.MaximizeBox = false;
            base.MinimizeBox = false;
            base.Name = "Principal";
            base.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Principal";
            base.Load += new EventHandler(this.formPrincipal_Load);
            base.FormClosed += new FormClosedEventHandler(this.formPrincipal_FormClosed);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            base.ResumeLayout(false);
        }

        private void persisteLog()
        {
            string path = Program.outputPath + @"\Log";
            if (Directory.Exists(path))
            {
                Directory.Delete(path, true);
            }
            Directory.CreateDirectory(path);
            StreamWriter writer = new StreamWriter(path + @"\log.txt");
            writer.Write(this.sbFileLog.ToString());
            writer.Flush();
            writer.Close();
            writer.Dispose();
        }

        private void rdoSqlServer_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rdoWindows.Checked)
            {
                this.txtLogin.Enabled = false;
                this.txtPassword.Enabled = false;
            }
            else
            {
                this.txtLogin.Enabled = true;
                this.txtPassword.Enabled = true;
                this.txtLogin.Focus();
            }
        }

        private void rdoWindows_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rdoWindows.Checked)
            {
                this.txtLogin.Enabled = false;
                this.txtPassword.Enabled = false;
            }
            else
            {
                this.txtLogin.Enabled = true;
                this.txtPassword.Enabled = true;
            }
        }

        private bool ValidarForm()
        {
            return true;
        }
    }
}

