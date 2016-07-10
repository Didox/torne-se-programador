unit frmHome;

interface

uses
  Transfer,System.IO,
  System.Drawing, System.Collections, System.ComponentModel,
  System.Windows.Forms, System.Data;

type
  frmUpServers = class(System.Windows.Forms.Form)
  {$REGION 'Designer Managed Code'}
  strict private
    /// <summary>
    /// Required designer variable.
    /// </summary>
    components: System.ComponentModel.IContainer;
    btnUpdatePass: System.Windows.Forms.Button;
    gbxListServer: System.Windows.Forms.GroupBox;
    lblDe: System.Windows.Forms.Label;
    lblPara: System.Windows.Forms.Label;
    txtServerRemote: System.Windows.Forms.TextBox;
    gbxCommands: System.Windows.Forms.GroupBox;
    btnClose: System.Windows.Forms.Button;
    gbxProgress: System.Windows.Forms.GroupBox;
    prbProcess: System.Windows.Forms.ProgressBar;
    txtUserRemote: System.Windows.Forms.TextBox;
    txtPassRemote: System.Windows.Forms.TextBox;
    txtDatabaseRemote: System.Windows.Forms.TextBox;
    lblDServer: System.Windows.Forms.Label;
    lblDDatabase: System.Windows.Forms.Label;
    lblDUser: System.Windows.Forms.Label;
    Label4: System.Windows.Forms.Label;
    txtServer: System.Windows.Forms.TextBox;
    txtDatabase: System.Windows.Forms.TextBox;
    txtUser: System.Windows.Forms.TextBox;
    txtPass: System.Windows.Forms.TextBox;
    lblSever: System.Windows.Forms.Label;
    lblDatabase: System.Windows.Forms.Label;
    lblUser: System.Windows.Forms.Label;
    lblPassword: System.Windows.Forms.Label;
                tmrClock: System.Windows.Forms.Timer;
                lblClock: System.Windows.Forms.Label;
                txtStartData: System.Windows.Forms.TextBox;
                GroupBox1: System.Windows.Forms.GroupBox;
                lstScheduling: System.Windows.Forms.ListBox;
                btnAdd: System.Windows.Forms.Button;
                btnRemove: System.Windows.Forms.Button;
    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    procedure InitializeComponent;
                procedure btnUpdatePass_Click(sender: System.Object; e: System.EventArgs);
                procedure btnClose_Click(sender: System.Object; e: System.EventArgs);
                procedure frmUpServers_Load(sender: System.Object; e: System.EventArgs);
                procedure tmrClock_Tick(sender: System.Object; e: System.EventArgs);
                procedure btnAdd_Click(sender: System.Object; e: System.EventArgs);
                procedure btnRemove_Click(sender: System.Object; e: System.EventArgs);
                procedure txtServerRemote_TextChanged(sender: System.Object; 
                        e: System.EventArgs);
                procedure txtDatabaseRemote_TextChanged(sender: System.Object; 
                        e: System.EventArgs);
                procedure txtUserRemote_TextChanged(sender: System.Object; e: System.EventArgs);
                procedure txtPassRemote_TextChanged(sender: System.Object; e: System.EventArgs);
                procedure txtPass_TextChanged(sender: System.Object; e: System.EventArgs);
                procedure txtUser_TextChanged(sender: System.Object; e: System.EventArgs);
                procedure txtDatabase_TextChanged(sender: System.Object; e: System.EventArgs);
                procedure txtServer_TextChanged(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict protected
    /// <summary>
    /// Clean up any resources being used.
    /// </summary>
    procedure Dispose(Disposing: Boolean); override;
  private
    { Private Declarations }
    strFile : string;
    strFileConf : string;
    procedure createFileConf();
    procedure updatePass( server : string; user : string; pass : string; database : string;
       serverRemote : string; userRemote : string; passRemote : string; databaseRemote : string );
 public
    constructor Create;
  end;

  [assembly: RuntimeRequiredAttribute(TypeOf(frmUpServers))]

implementation

{$AUTOBOX ON}

{$REGION 'Windows Form Designer generated code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure frmUpServers.InitializeComponent;
begin
        Self.components := System.ComponentModel.Container.Create;
        Self.gbxListServer := System.Windows.Forms.GroupBox.Create;
        Self.lblPassword := System.Windows.Forms.Label.Create;
        Self.lblUser := System.Windows.Forms.Label.Create;
        Self.lblDatabase := System.Windows.Forms.Label.Create;
        Self.lblSever := System.Windows.Forms.Label.Create;
        Self.lblPara := System.Windows.Forms.Label.Create;
        Self.txtPass := System.Windows.Forms.TextBox.Create;
        Self.txtUser := System.Windows.Forms.TextBox.Create;
        Self.txtDatabase := System.Windows.Forms.TextBox.Create;
        Self.txtServer := System.Windows.Forms.TextBox.Create;
        Self.Label4 := System.Windows.Forms.Label.Create;
        Self.lblDUser := System.Windows.Forms.Label.Create;
        Self.lblDDatabase := System.Windows.Forms.Label.Create;
        Self.lblDServer := System.Windows.Forms.Label.Create;
        Self.txtDatabaseRemote := System.Windows.Forms.TextBox.Create;
        Self.txtPassRemote := System.Windows.Forms.TextBox.Create;
        Self.txtUserRemote := System.Windows.Forms.TextBox.Create;
        Self.txtServerRemote := System.Windows.Forms.TextBox.Create;
        Self.lblDe := System.Windows.Forms.Label.Create;
        Self.gbxCommands := System.Windows.Forms.GroupBox.Create;
        Self.btnClose := System.Windows.Forms.Button.Create;
        Self.btnUpdatePass := System.Windows.Forms.Button.Create;
        Self.gbxProgress := System.Windows.Forms.GroupBox.Create;
        Self.prbProcess := System.Windows.Forms.ProgressBar.Create;
        Self.tmrClock := System.Windows.Forms.Timer.Create(Self.components);
        Self.GroupBox1 := System.Windows.Forms.GroupBox.Create;
        Self.txtStartData := System.Windows.Forms.TextBox.Create;
        Self.lblClock := System.Windows.Forms.Label.Create;
        Self.btnRemove := System.Windows.Forms.Button.Create;
        Self.btnAdd := System.Windows.Forms.Button.Create;
        Self.lstScheduling := System.Windows.Forms.ListBox.Create;
        Self.gbxListServer.SuspendLayout;
        Self.gbxCommands.SuspendLayout;
        Self.gbxProgress.SuspendLayout;
        Self.GroupBox1.SuspendLayout;
        Self.SuspendLayout;
        // 
        // gbxListServer
        // 
        Self.gbxListServer.Controls.Add(Self.lblPassword);
        Self.gbxListServer.Controls.Add(Self.lblUser);
        Self.gbxListServer.Controls.Add(Self.lblDatabase);
        Self.gbxListServer.Controls.Add(Self.lblSever);
        Self.gbxListServer.Controls.Add(Self.lblPara);
        Self.gbxListServer.Controls.Add(Self.txtPass);
        Self.gbxListServer.Controls.Add(Self.txtUser);
        Self.gbxListServer.Controls.Add(Self.txtDatabase);
        Self.gbxListServer.Controls.Add(Self.txtServer);
        Self.gbxListServer.Controls.Add(Self.Label4);
        Self.gbxListServer.Controls.Add(Self.lblDUser);
        Self.gbxListServer.Controls.Add(Self.lblDDatabase);
        Self.gbxListServer.Controls.Add(Self.lblDServer);
        Self.gbxListServer.Controls.Add(Self.txtDatabaseRemote);
        Self.gbxListServer.Controls.Add(Self.txtPassRemote);
        Self.gbxListServer.Controls.Add(Self.txtUserRemote);
        Self.gbxListServer.Controls.Add(Self.txtServerRemote);
        Self.gbxListServer.Controls.Add(Self.lblDe);
        Self.gbxListServer.Location := System.Drawing.Point.Create(16, 16);
        Self.gbxListServer.Name := 'gbxListServer';
        Self.gbxListServer.Size := System.Drawing.Size.Create(416, 176);
        Self.gbxListServer.TabIndex := 1;
        Self.gbxListServer.TabStop := False;
        Self.gbxListServer.Text := 'Lista Servidores';
        // 
        // lblPassword
        // 
        Self.lblPassword.Location := System.Drawing.Point.Create(312, 120);
        Self.lblPassword.Name := 'lblPassword';
        Self.lblPassword.Size := System.Drawing.Size.Create(80, 16);
        Self.lblPassword.TabIndex := 21;
        Self.lblPassword.Text := 'Password';
        // 
        // lblUser
        // 
        Self.lblUser.Location := System.Drawing.Point.Create(232, 120);
        Self.lblUser.Name := 'lblUser';
        Self.lblUser.Size := System.Drawing.Size.Create(64, 16);
        Self.lblUser.TabIndex := 20;
        Self.lblUser.Text := 'User';
        // 
        // lblDatabase
        // 
        Self.lblDatabase.Location := System.Drawing.Point.Create(120, 120);
        Self.lblDatabase.Name := 'lblDatabase';
        Self.lblDatabase.Size := System.Drawing.Size.Create(64, 16);
        Self.lblDatabase.TabIndex := 19;
        Self.lblDatabase.Text := 'Database';
        // 
        // lblSever
        // 
        Self.lblSever.Location := System.Drawing.Point.Create(8, 120);
        Self.lblSever.Name := 'lblSever';
        Self.lblSever.Size := System.Drawing.Size.Create(64, 16);
        Self.lblSever.TabIndex := 18;
        Self.lblSever.Text := 'Server';
        // 
        // lblPara
        // 
        Self.lblPara.Location := System.Drawing.Point.Create(8, 96);
        Self.lblPara.Name := 'lblPara';
        Self.lblPara.Size := System.Drawing.Size.Create(56, 16);
        Self.lblPara.TabIndex := 17;
        Self.lblPara.Text := 'Para:';
        // 
        // txtPass
        // 
        Self.txtPass.Location := System.Drawing.Point.Create(312, 136);
        Self.txtPass.Name := 'txtPass';
        Self.txtPass.PasswordChar := '*';
        Self.txtPass.Size := System.Drawing.Size.Create(80, 20);
        Self.txtPass.TabIndex := 16;
        Self.txtPass.Text := 'acav';
        Include(Self.txtPass.TextChanged, Self.txtPass_TextChanged);
        // 
        // txtUser
        // 
        Self.txtUser.Location := System.Drawing.Point.Create(232, 136);
        Self.txtUser.Name := 'txtUser';
        Self.txtUser.Size := System.Drawing.Size.Create(72, 20);
        Self.txtUser.TabIndex := 15;
        Self.txtUser.Text := 'sa';
        Include(Self.txtUser.TextChanged, Self.txtUser_TextChanged);
        // 
        // txtDatabase
        // 
        Self.txtDatabase.Location := System.Drawing.Point.Create(120, 136);
        Self.txtDatabase.Name := 'txtDatabase';
        Self.txtDatabase.TabIndex := 14;
        Self.txtDatabase.Text := 'bdCadRede';
        Include(Self.txtDatabase.TextChanged, Self.txtDatabase_TextChanged);
        // 
        // txtServer
        // 
        Self.txtServer.Location := System.Drawing.Point.Create(8, 136);
        Self.txtServer.Name := 'txtServer';
        Self.txtServer.Size := System.Drawing.Size.Create(94, 20);
        Self.txtServer.TabIndex := 13;
        Self.txtServer.Text := '211.3.68.8';
        Include(Self.txtServer.TextChanged, Self.txtServer_TextChanged);
        // 
        // Label4
        // 
        Self.Label4.Location := System.Drawing.Point.Create(312, 43);
        Self.Label4.Name := 'Label4';
        Self.Label4.Size := System.Drawing.Size.Create(64, 16);
        Self.Label4.TabIndex := 12;
        Self.Label4.Text := 'Password';
        // 
        // lblDUser
        // 
        Self.lblDUser.Location := System.Drawing.Point.Create(230, 43);
        Self.lblDUser.Name := 'lblDUser';
        Self.lblDUser.Size := System.Drawing.Size.Create(64, 16);
        Self.lblDUser.TabIndex := 11;
        Self.lblDUser.Text := 'User';
        // 
        // lblDDatabase
        // 
        Self.lblDDatabase.Location := System.Drawing.Point.Create(120, 44);
        Self.lblDDatabase.Name := 'lblDDatabase';
        Self.lblDDatabase.Size := System.Drawing.Size.Create(64, 16);
        Self.lblDDatabase.TabIndex := 10;
        Self.lblDDatabase.Text := 'Database';
        // 
        // lblDServer
        // 
        Self.lblDServer.Location := System.Drawing.Point.Create(8, 43);
        Self.lblDServer.Name := 'lblDServer';
        Self.lblDServer.Size := System.Drawing.Size.Create(40, 16);
        Self.lblDServer.TabIndex := 9;
        Self.lblDServer.Text := 'Server';
        // 
        // txtDatabaseRemote
        // 
        Self.txtDatabaseRemote.Location := System.Drawing.Point.Create(120, 64);
        Self.txtDatabaseRemote.Name := 'txtDatabaseRemote';
        Self.txtDatabaseRemote.TabIndex := 8;
        Self.txtDatabaseRemote.Text := 'ACAV_Portal';
        Include(Self.txtDatabaseRemote.TextChanged, Self.txtDatabaseRemote_TextChanged);
        // 
        // txtPassRemote
        // 
        Self.txtPassRemote.Location := System.Drawing.Point.Create(312, 64);
        Self.txtPassRemote.Name := 'txtPassRemote';
        Self.txtPassRemote.PasswordChar := '*';
        Self.txtPassRemote.Size := System.Drawing.Size.Create(80, 20);
        Self.txtPassRemote.TabIndex := 7;
        Self.txtPassRemote.Text := '#0a2c4a6v!';
        Include(Self.txtPassRemote.TextChanged, Self.txtPassRemote_TextChanged);
        // 
        // txtUserRemote
        // 
        Self.txtUserRemote.Location := System.Drawing.Point.Create(232, 64);
        Self.txtUserRemote.Name := 'txtUserRemote';
        Self.txtUserRemote.Size := System.Drawing.Size.Create(72, 20);
        Self.txtUserRemote.TabIndex := 6;
        Self.txtUserRemote.Text := 'sa';
        Include(Self.txtUserRemote.TextChanged, Self.txtUserRemote_TextChanged);
        // 
        // txtServerRemote
        // 
        Self.txtServerRemote.Location := System.Drawing.Point.Create(10, 64);
        Self.txtServerRemote.Name := 'txtServerRemote';
        Self.txtServerRemote.Size := System.Drawing.Size.Create(94, 20);
        Self.txtServerRemote.TabIndex := 5;
        Self.txtServerRemote.Text := '205.237.201.226';
        Include(Self.txtServerRemote.TextChanged, Self.txtServerRemote_TextChanged);
        // 
        // lblDe
        // 
        Self.lblDe.Location := System.Drawing.Point.Create(8, 19);
        Self.lblDe.Name := 'lblDe';
        Self.lblDe.Size := System.Drawing.Size.Create(32, 13);
        Self.lblDe.TabIndex := 2;
        Self.lblDe.Text := 'De:';
        // 
        // gbxCommands
        // 
        Self.gbxCommands.Controls.Add(Self.btnClose);
        Self.gbxCommands.Controls.Add(Self.btnUpdatePass);
        Self.gbxCommands.Location := System.Drawing.Point.Create(16, 360);
        Self.gbxCommands.Name := 'gbxCommands';
        Self.gbxCommands.Size := System.Drawing.Size.Create(416, 64);
        Self.gbxCommands.TabIndex := 4;
        Self.gbxCommands.TabStop := False;
        Self.gbxCommands.Text := 'Comandos';
        // 
        // btnClose
        // 
        Self.btnClose.Location := System.Drawing.Point.Create(208, 28);
        Self.btnClose.Name := 'btnClose';
        Self.btnClose.Size := System.Drawing.Size.Create(112, 23);
        Self.btnClose.TabIndex := 6;
        Self.btnClose.Text := 'Fechar';
        Include(Self.btnClose.Click, Self.btnClose_Click);
        // 
        // btnUpdatePass
        // 
        Self.btnUpdatePass.Location := System.Drawing.Point.Create(96, 27);
        Self.btnUpdatePass.Name := 'btnUpdatePass';
        Self.btnUpdatePass.Size := System.Drawing.Size.Create(104, 24);
        Self.btnUpdatePass.TabIndex := 4;
        Self.btnUpdatePass.Text := 'Update Password';
        Include(Self.btnUpdatePass.Click, Self.btnUpdatePass_Click);
        // 
        // gbxProgress
        // 
        Self.gbxProgress.Controls.Add(Self.prbProcess);
        Self.gbxProgress.Location := System.Drawing.Point.Create(16, 296);
        Self.gbxProgress.Name := 'gbxProgress';
        Self.gbxProgress.Size := System.Drawing.Size.Create(416, 64);
        Self.gbxProgress.TabIndex := 5;
        Self.gbxProgress.TabStop := False;
        Self.gbxProgress.Text := 'Processos';
        // 
        // prbProcess
        // 
        Self.prbProcess.Location := System.Drawing.Point.Create(8, 24);
        Self.prbProcess.Name := 'prbProcess';
        Self.prbProcess.Size := System.Drawing.Size.Create(384, 23);
        Self.prbProcess.TabIndex := 2;
        // 
        // tmrClock
        // 
        Self.tmrClock.Enabled := True;
        Include(Self.tmrClock.Tick, Self.tmrClock_Tick);
        // 
        // GroupBox1
        // 
        Self.GroupBox1.Controls.Add(Self.txtStartData);
        Self.GroupBox1.Controls.Add(Self.lblClock);
        Self.GroupBox1.Controls.Add(Self.btnRemove);
        Self.GroupBox1.Controls.Add(Self.btnAdd);
        Self.GroupBox1.Controls.Add(Self.lstScheduling);
        Self.GroupBox1.Location := System.Drawing.Point.Create(16, 200);
        Self.GroupBox1.Name := 'GroupBox1';
        Self.GroupBox1.Size := System.Drawing.Size.Create(416, 88);
        Self.GroupBox1.TabIndex := 6;
        Self.GroupBox1.TabStop := False;
        Self.GroupBox1.Text := 'Scheduling List';
        // 
        // txtStartData
        // 
        Self.txtStartData.Location := System.Drawing.Point.Create(216, 56);
        Self.txtStartData.Name := 'txtStartData';
        Self.txtStartData.Size := System.Drawing.Size.Create(64, 20);
        Self.txtStartData.TabIndex := 24;
        Self.txtStartData.Text := '00:00:00';
        // 
        // lblClock
        // 
        Self.lblClock.Font := System.Drawing.Font.Create('Microsoft Sans Ser' +
                'if', 10, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 
                        (Byte(0)));
        Self.lblClock.Location := System.Drawing.Point.Create(216, 27);
        Self.lblClock.Name := 'lblClock';
        Self.lblClock.Size := System.Drawing.Size.Create(64, 16);
        Self.lblClock.TabIndex := 23;
        Self.lblClock.Text := '00:00:00';
        // 
        // btnRemove
        // 
        Self.btnRemove.Location := System.Drawing.Point.Create(296, 56);
        Self.btnRemove.Name := 'btnRemove';
        Self.btnRemove.Size := System.Drawing.Size.Create(104, 24);
        Self.btnRemove.TabIndex := 6;
        Self.btnRemove.Text := 'Remover';
        Include(Self.btnRemove.Click, Self.btnRemove_Click);
        // 
        // btnAdd
        // 
        Self.btnAdd.Location := System.Drawing.Point.Create(296, 24);
        Self.btnAdd.Name := 'btnAdd';
        Self.btnAdd.Size := System.Drawing.Size.Create(104, 24);
        Self.btnAdd.TabIndex := 5;
        Self.btnAdd.Text := 'Adicionar';
        Include(Self.btnAdd.Click, Self.btnAdd_Click);
        // 
        // lstScheduling
        // 
        Self.lstScheduling.Location := System.Drawing.Point.Create(8, 24);
        Self.lstScheduling.Name := 'lstScheduling';
        Self.lstScheduling.Size := System.Drawing.Size.Create(192, 56);
        Self.lstScheduling.TabIndex := 0;
        // 
        // frmUpServers
        // 
        Self.AutoScaleBaseSize := System.Drawing.Size.Create(5, 13);
        Self.ClientSize := System.Drawing.Size.Create(448, 436);
        Self.Controls.Add(Self.GroupBox1);
        Self.Controls.Add(Self.gbxProgress);
        Self.Controls.Add(Self.gbxCommands);
        Self.Controls.Add(Self.gbxListServer);
        Self.MaximizeBox := False;
        Self.Name := 'frmUpServers';
        Self.StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen;
        Self.Text := 'Update Servers';
        Include(Self.Load, Self.frmUpServers_Load);
        Self.gbxListServer.ResumeLayout(False);
        Self.gbxCommands.ResumeLayout(False);
        Self.gbxProgress.ResumeLayout(False);
        Self.GroupBox1.ResumeLayout(False);
        Self.ResumeLayout(False);
end;
{$ENDREGION}

procedure frmUpServers.Dispose(Disposing: Boolean);
begin
  if Disposing then
  begin
    if Components <> nil then
      Components.Dispose();
  end;
  inherited Dispose(Disposing);
end;

constructor frmUpServers.Create;
begin
  inherited Create;
  //
  // Required for Windows Form Designer support
  //
  InitializeComponent;
  //
  // TODO: Add any constructor code after InitializeComponent call
  //
end;

procedure frmUpServers.txtServer_TextChanged(sender: System.Object; e: System.EventArgs);
begin
  createFileConf();      
end;

procedure frmUpServers.txtDatabase_TextChanged(sender: System.Object; e: System.EventArgs);
begin
  createFileConf();
end;

procedure frmUpServers.txtUser_TextChanged(sender: System.Object; e: System.EventArgs);
begin
  createFileConf();
end;

procedure frmUpServers.txtPass_TextChanged(sender: System.Object; e: System.EventArgs);
begin
  createFileConf();
end;

procedure frmUpServers.txtPassRemote_TextChanged(sender: System.Object; e: System.EventArgs);
begin
  createFileConf();
end;

procedure frmUpServers.txtUserRemote_TextChanged(sender: System.Object; e: System.EventArgs);
begin
  createFileConf();
end;

procedure frmUpServers.txtDatabaseRemote_TextChanged(sender: System.Object; e: System.EventArgs);
begin
  createFileConf();
end;

procedure frmUpServers.txtServerRemote_TextChanged(sender: System.Object; e: System.EventArgs);
begin
  createFileConf();
end;

procedure frmUpServers.btnRemove_Click(sender: System.Object; e: System.EventArgs);
var
   strm : StreamWriter;
   i : Integer;
begin
  lstScheduling.Items.Remove(lstScheduling.SelectedItem);
  strm := StreamWriter.Create(strFile);
  for i:=0 to lstScheduling.Items.Count-1 do
     strm.WriteLine(lstScheduling.Items[i].ToString);
  strm.Close();
end;

procedure frmUpServers.btnAdd_Click(sender: System.Object; e: System.EventArgs);
var
   strm : StreamWriter;
   i : Integer;
begin
  lstScheduling.Items.Add(txtStartData.Text);
  strm := StreamWriter.Create(strFile);
  for i:=0 to lstScheduling.Items.Count-1 do
     strm.WriteLine(lstScheduling.Items[i].ToString);
  strm.Close();
end;

procedure frmUpServers.tmrClock_Tick(sender: System.Object; e: System.EventArgs);
var
   i : Integer;
begin
     lblClock.Text := DateTime.Now.ToString( 'HH:mm:ss' );
     for i := 0 to lstScheduling.Items.Count-1 do
     begin
        if DateTime.Now.ToString( 'HH:mm:ss' ) = lstScheduling.Items[i].ToString then
        begin
           updatePass(
             txtServer.Text,
             txtUser.Text,
             txtPass.Text,
             txtDatabase.Text,
             txtServerRemote.Text,
             txtUserRemote.Text,
             txtPassRemote.Text,
             txtDatabaseRemote.Text
             );
        end;
     end;
end;

procedure frmUpServers.frmUpServers_Load(sender: System.Object; e: System.EventArgs);
var
   strm : StreamWriter;
   strOpen : StreamReader;
   add : string;
   strOpenConf : StreamReader;
begin
        lblClock.Text := DateTime.Now.ToString( 'HH:mm:ss' );
        strFile := Directory.GetCurrentDirectory() + '/config.txt';
        if not &File.Exists(strFile) then
        begin
            strm := StreamWriter.Create(strFile);
            strm.WriteLine(txtStartData.Text);
            strm.Close();
        end;

        strOpen := StreamReader.Create(strFile);
        add := strOpen.ReadLine;
        while( add <> '' )do
        begin
             lstScheduling.Items.Add(add);
             add := strOpen.ReadLine
        end;
        strOpen.Close;

        strFileConf := Directory.GetCurrentDirectory() + '/configServers.txt';
        if not &File.Exists(strFileConf) then
        begin
            createFileConf();
        end;

        strOpenConf := StreamReader.Create(strFileConf);
        txtServer.Text := strOpenConf.ReadLine;
        txtUser.Text := strOpenConf.ReadLine;
        txtPass.Text := strOpenConf.ReadLine;
        txtDatabase.Text := strOpenConf.ReadLine;
        txtServerRemote.Text := strOpenConf.ReadLine;
        txtUserRemote.Text := strOpenConf.ReadLine;
        txtPassRemote.Text := strOpenConf.ReadLine;
        txtDatabaseRemote.Text := strOpenConf.ReadLine;
        strOpenConf.Close;
end;

procedure frmUpServers.createFileConf();
var
   strmConf : StreamWriter;
begin
   try
        strmConf := StreamWriter.Create(strFileConf);
        strmConf.WriteLine(txtServer.Text);
        strmConf.WriteLine(txtUser.Text);
        strmConf.WriteLine(txtPass.Text);
        strmConf.WriteLine(txtDatabase.Text);
        strmConf.WriteLine(txtServerRemote.Text);
        strmConf.WriteLine(txtUserRemote.Text);
        strmConf.WriteLine(txtPassRemote.Text);
        strmConf.WriteLine(txtDatabaseRemote.Text);
        strmConf.Close();
   except
   end;
end;

procedure frmUpServers.btnClose_Click(sender: System.Object; e: System.EventArgs);
begin
  Application.Exit;
end;

procedure frmUpServers.btnUpdatePass_Click(sender: System.Object; e: System.EventArgs);
begin
        updatePass(
                txtServer.Text,
                txtUser.Text,
                txtPass.Text,
                txtDatabase.Text,
                txtServerRemote.Text,
                txtUserRemote.Text,
                txtPassRemote.Text,
                txtDatabaseRemote.Text
                );
end;


procedure frmUpServers.updatePass( server : string; user : string; pass : string; database : string;
serverRemote : string; userRemote : string; passRemote : string; databaseRemote : string );
var
  t : Transfers;
  err : string;
begin
   t := Transfers.Create( server, user, pass, database );
   t.SetConnectionRemote( serverRemote, userRemote, passRemote, databaseRemote );
   err := t.UpdatePassword( prbProcess );
end;


end.
