Public Class frmremedio
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents OleDbSelectCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbInsertCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbUpdateCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbDeleteCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbConnection1 As System.Data.OleDb.OleDbConnection
    Friend WithEvents OleDbDataAdapter1 As System.Data.OleDb.OleDbDataAdapter
    Friend WithEvents objdsremedio As prova2sheila.dsremedio
    Friend WithEvents btnLoad As System.Windows.Forms.Button
    Friend WithEvents btnUpdate As System.Windows.Forms.Button
    Friend WithEvents btnCancelAll As System.Windows.Forms.Button
    Friend WithEvents lblcodremedio As System.Windows.Forms.Label
    Friend WithEvents lblindicacao As System.Windows.Forms.Label
    Friend WithEvents lblpreco As System.Windows.Forms.Label
    Friend WithEvents editcodremedio As System.Windows.Forms.TextBox
    Friend WithEvents editindicacao As System.Windows.Forms.TextBox
    Friend WithEvents editpreco As System.Windows.Forms.TextBox
    Friend WithEvents lblremedio As System.Windows.Forms.Label
    Friend WithEvents lbltipo As System.Windows.Forms.Label
    Friend WithEvents editremedio As System.Windows.Forms.TextBox
    Friend WithEvents edittipo As System.Windows.Forms.TextBox
    Friend WithEvents btnNavFirst As System.Windows.Forms.Button
    Friend WithEvents btnNavPrev As System.Windows.Forms.Button
    Friend WithEvents lblNavLocation As System.Windows.Forms.Label
    Friend WithEvents btnNavNext As System.Windows.Forms.Button
    Friend WithEvents btnLast As System.Windows.Forms.Button
    Friend WithEvents btnAdd As System.Windows.Forms.Button
    Friend WithEvents btnDelete As System.Windows.Forms.Button
    Friend WithEvents btnCancel As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.OleDbSelectCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbConnection1 = New System.Data.OleDb.OleDbConnection
        Me.OleDbInsertCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDeleteCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter1 = New System.Data.OleDb.OleDbDataAdapter
        Me.objdsremedio = New prova2sheila.dsremedio
        Me.btnLoad = New System.Windows.Forms.Button
        Me.btnUpdate = New System.Windows.Forms.Button
        Me.btnCancelAll = New System.Windows.Forms.Button
        Me.lblcodremedio = New System.Windows.Forms.Label
        Me.lblindicacao = New System.Windows.Forms.Label
        Me.lblpreco = New System.Windows.Forms.Label
        Me.editcodremedio = New System.Windows.Forms.TextBox
        Me.editindicacao = New System.Windows.Forms.TextBox
        Me.editpreco = New System.Windows.Forms.TextBox
        Me.lblremedio = New System.Windows.Forms.Label
        Me.lbltipo = New System.Windows.Forms.Label
        Me.editremedio = New System.Windows.Forms.TextBox
        Me.edittipo = New System.Windows.Forms.TextBox
        Me.btnNavFirst = New System.Windows.Forms.Button
        Me.btnNavPrev = New System.Windows.Forms.Button
        Me.lblNavLocation = New System.Windows.Forms.Label
        Me.btnNavNext = New System.Windows.Forms.Button
        Me.btnLast = New System.Windows.Forms.Button
        Me.btnAdd = New System.Windows.Forms.Button
        Me.btnDelete = New System.Windows.Forms.Button
        Me.btnCancel = New System.Windows.Forms.Button
        CType(Me.objdsremedio, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'OleDbSelectCommand1
        '
        Me.OleDbSelectCommand1.CommandText = "SELECT codremedio, indicacao, preco, remedio, tipo FROM remedios"
        Me.OleDbSelectCommand1.Connection = Me.OleDbConnection1
        '
        'OleDbConnection1
        '
        Me.OleDbConnection1.ConnectionString = "Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Registry Path=;Jet OLEDB:Database L" & _
        "ocking Mode=1;Jet OLEDB:Database Password=;Data Source=""C:\Documents and Setting" & _
        "s\Windows xp\Desktop\sheila\farmacia.mdb"";Password=;Jet OLEDB:Engine Type=5;Jet " & _
        "OLEDB:Global Bulk Transactions=1;Provider=""Microsoft.Jet.OLEDB.4.0"";Jet OLEDB:Sy" & _
        "stem database=;Jet OLEDB:SFP=False;Extended Properties=;Mode=Share Deny None;Jet" & _
        " OLEDB:New Database Password=;Jet OLEDB:Create System Database=False;Jet OLEDB:D" & _
        "on't Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False" & _
        ";User ID=Admin;Jet OLEDB:Encrypt Database=False"
        '
        'OleDbInsertCommand1
        '
        Me.OleDbInsertCommand1.CommandText = "INSERT INTO remedios(indicacao, preco, remedio, tipo) VALUES (?, ?, ?, ?)"
        Me.OleDbInsertCommand1.Connection = Me.OleDbConnection1
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("indicacao", System.Data.OleDb.OleDbType.VarWChar, 50, "indicacao"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("preco", System.Data.OleDb.OleDbType.Currency, 0, "preco"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("remedio", System.Data.OleDb.OleDbType.VarWChar, 50, "remedio"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("tipo", System.Data.OleDb.OleDbType.VarWChar, 50, "tipo"))
        '
        'OleDbUpdateCommand1
        '
        Me.OleDbUpdateCommand1.CommandText = "UPDATE remedios SET indicacao = ?, preco = ?, remedio = ?, tipo = ? WHERE (codrem" & _
        "edio = ?) AND (indicacao = ? OR ? IS NULL AND indicacao IS NULL) AND (preco = ? " & _
        "OR ? IS NULL AND preco IS NULL) AND (remedio = ? OR ? IS NULL AND remedio IS NUL" & _
        "L) AND (tipo = ? OR ? IS NULL AND tipo IS NULL)"
        Me.OleDbUpdateCommand1.Connection = Me.OleDbConnection1
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("indicacao", System.Data.OleDb.OleDbType.VarWChar, 50, "indicacao"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("preco", System.Data.OleDb.OleDbType.Currency, 0, "preco"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("remedio", System.Data.OleDb.OleDbType.VarWChar, 50, "remedio"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("tipo", System.Data.OleDb.OleDbType.VarWChar, 50, "tipo"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_codremedio", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "codremedio", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_indicacao", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "indicacao", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_indicacao1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "indicacao", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_preco", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "preco", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_preco1", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "preco", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_remedio", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "remedio", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_remedio1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "remedio", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_tipo", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "tipo", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_tipo1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "tipo", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDeleteCommand1
        '
        Me.OleDbDeleteCommand1.CommandText = "DELETE FROM remedios WHERE (codremedio = ?) AND (indicacao = ? OR ? IS NULL AND i" & _
        "ndicacao IS NULL) AND (preco = ? OR ? IS NULL AND preco IS NULL) AND (remedio = " & _
        "? OR ? IS NULL AND remedio IS NULL) AND (tipo = ? OR ? IS NULL AND tipo IS NULL)" & _
        ""
        Me.OleDbDeleteCommand1.Connection = Me.OleDbConnection1
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_codremedio", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "codremedio", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_indicacao", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "indicacao", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_indicacao1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "indicacao", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_preco", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "preco", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_preco1", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "preco", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_remedio", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "remedio", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_remedio1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "remedio", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_tipo", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "tipo", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_tipo1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "tipo", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDataAdapter1
        '
        Me.OleDbDataAdapter1.DeleteCommand = Me.OleDbDeleteCommand1
        Me.OleDbDataAdapter1.InsertCommand = Me.OleDbInsertCommand1
        Me.OleDbDataAdapter1.SelectCommand = Me.OleDbSelectCommand1
        Me.OleDbDataAdapter1.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "remedios", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("codremedio", "codremedio"), New System.Data.Common.DataColumnMapping("indicacao", "indicacao"), New System.Data.Common.DataColumnMapping("preco", "preco"), New System.Data.Common.DataColumnMapping("remedio", "remedio"), New System.Data.Common.DataColumnMapping("tipo", "tipo")})})
        Me.OleDbDataAdapter1.UpdateCommand = Me.OleDbUpdateCommand1
        '
        'objdsremedio
        '
        Me.objdsremedio.DataSetName = "dsremedio"
        Me.objdsremedio.Locale = New System.Globalization.CultureInfo("pt-BR")
        '
        'btnLoad
        '
        Me.btnLoad.Location = New System.Drawing.Point(10, 10)
        Me.btnLoad.Name = "btnLoad"
        Me.btnLoad.TabIndex = 0
        Me.btnLoad.Text = "&Load"
        '
        'btnUpdate
        '
        Me.btnUpdate.Location = New System.Drawing.Point(365, 10)
        Me.btnUpdate.Name = "btnUpdate"
        Me.btnUpdate.TabIndex = 1
        Me.btnUpdate.Text = "&Update"
        '
        'btnCancelAll
        '
        Me.btnCancelAll.Location = New System.Drawing.Point(365, 43)
        Me.btnCancelAll.Name = "btnCancelAll"
        Me.btnCancelAll.TabIndex = 2
        Me.btnCancelAll.Text = "Ca&ncel All"
        '
        'lblcodremedio
        '
        Me.lblcodremedio.Location = New System.Drawing.Point(10, 76)
        Me.lblcodremedio.Name = "lblcodremedio"
        Me.lblcodremedio.TabIndex = 3
        Me.lblcodremedio.Text = "codremedio"
        '
        'lblindicacao
        '
        Me.lblindicacao.Location = New System.Drawing.Point(10, 109)
        Me.lblindicacao.Name = "lblindicacao"
        Me.lblindicacao.TabIndex = 4
        Me.lblindicacao.Text = "indicacao"
        '
        'lblpreco
        '
        Me.lblpreco.Location = New System.Drawing.Point(10, 142)
        Me.lblpreco.Name = "lblpreco"
        Me.lblpreco.TabIndex = 5
        Me.lblpreco.Text = "preco"
        '
        'editcodremedio
        '
        Me.editcodremedio.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.objdsremedio, "remedios.codremedio"))
        Me.editcodremedio.Location = New System.Drawing.Point(120, 76)
        Me.editcodremedio.Name = "editcodremedio"
        Me.editcodremedio.TabIndex = 6
        Me.editcodremedio.Text = ""
        '
        'editindicacao
        '
        Me.editindicacao.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.objdsremedio, "remedios.indicacao"))
        Me.editindicacao.Location = New System.Drawing.Point(120, 109)
        Me.editindicacao.Name = "editindicacao"
        Me.editindicacao.TabIndex = 7
        Me.editindicacao.Text = ""
        '
        'editpreco
        '
        Me.editpreco.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.objdsremedio, "remedios.preco"))
        Me.editpreco.Location = New System.Drawing.Point(120, 142)
        Me.editpreco.Name = "editpreco"
        Me.editpreco.TabIndex = 8
        Me.editpreco.Text = ""
        '
        'lblremedio
        '
        Me.lblremedio.Location = New System.Drawing.Point(230, 76)
        Me.lblremedio.Name = "lblremedio"
        Me.lblremedio.TabIndex = 9
        Me.lblremedio.Text = "remedio"
        '
        'lbltipo
        '
        Me.lbltipo.Location = New System.Drawing.Point(230, 109)
        Me.lbltipo.Name = "lbltipo"
        Me.lbltipo.TabIndex = 10
        Me.lbltipo.Text = "tipo"
        '
        'editremedio
        '
        Me.editremedio.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.objdsremedio, "remedios.remedio"))
        Me.editremedio.Location = New System.Drawing.Point(340, 76)
        Me.editremedio.Name = "editremedio"
        Me.editremedio.TabIndex = 11
        Me.editremedio.Text = ""
        '
        'edittipo
        '
        Me.edittipo.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.objdsremedio, "remedios.tipo"))
        Me.edittipo.Location = New System.Drawing.Point(340, 109)
        Me.edittipo.Name = "edittipo"
        Me.edittipo.TabIndex = 12
        Me.edittipo.Text = ""
        '
        'btnNavFirst
        '
        Me.btnNavFirst.Location = New System.Drawing.Point(195, 175)
        Me.btnNavFirst.Name = "btnNavFirst"
        Me.btnNavFirst.Size = New System.Drawing.Size(40, 23)
        Me.btnNavFirst.TabIndex = 13
        Me.btnNavFirst.Text = "<<"
        '
        'btnNavPrev
        '
        Me.btnNavPrev.Location = New System.Drawing.Point(235, 175)
        Me.btnNavPrev.Name = "btnNavPrev"
        Me.btnNavPrev.Size = New System.Drawing.Size(35, 23)
        Me.btnNavPrev.TabIndex = 14
        Me.btnNavPrev.Text = "<"
        '
        'lblNavLocation
        '
        Me.lblNavLocation.BackColor = System.Drawing.Color.White
        Me.lblNavLocation.Location = New System.Drawing.Point(270, 175)
        Me.lblNavLocation.Name = "lblNavLocation"
        Me.lblNavLocation.Size = New System.Drawing.Size(95, 23)
        Me.lblNavLocation.TabIndex = 15
        Me.lblNavLocation.Text = "No Records"
        Me.lblNavLocation.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'btnNavNext
        '
        Me.btnNavNext.Location = New System.Drawing.Point(365, 175)
        Me.btnNavNext.Name = "btnNavNext"
        Me.btnNavNext.Size = New System.Drawing.Size(35, 23)
        Me.btnNavNext.TabIndex = 16
        Me.btnNavNext.Text = ">"
        '
        'btnLast
        '
        Me.btnLast.Location = New System.Drawing.Point(400, 175)
        Me.btnLast.Name = "btnLast"
        Me.btnLast.Size = New System.Drawing.Size(40, 23)
        Me.btnLast.TabIndex = 17
        Me.btnLast.Text = ">>"
        '
        'btnAdd
        '
        Me.btnAdd.Location = New System.Drawing.Point(195, 208)
        Me.btnAdd.Name = "btnAdd"
        Me.btnAdd.TabIndex = 18
        Me.btnAdd.Text = "&Add"
        '
        'btnDelete
        '
        Me.btnDelete.Location = New System.Drawing.Point(280, 208)
        Me.btnDelete.Name = "btnDelete"
        Me.btnDelete.TabIndex = 19
        Me.btnDelete.Text = "&Delete"
        '
        'btnCancel
        '
        Me.btnCancel.Location = New System.Drawing.Point(365, 208)
        Me.btnCancel.Name = "btnCancel"
        Me.btnCancel.TabIndex = 20
        Me.btnCancel.Text = "&Cancel"
        '
        'frmremedio
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(442, 249)
        Me.Controls.Add(Me.btnLoad)
        Me.Controls.Add(Me.btnUpdate)
        Me.Controls.Add(Me.btnCancelAll)
        Me.Controls.Add(Me.lblcodremedio)
        Me.Controls.Add(Me.lblindicacao)
        Me.Controls.Add(Me.lblpreco)
        Me.Controls.Add(Me.editcodremedio)
        Me.Controls.Add(Me.editindicacao)
        Me.Controls.Add(Me.editpreco)
        Me.Controls.Add(Me.lblremedio)
        Me.Controls.Add(Me.lbltipo)
        Me.Controls.Add(Me.editremedio)
        Me.Controls.Add(Me.edittipo)
        Me.Controls.Add(Me.btnNavFirst)
        Me.Controls.Add(Me.btnNavPrev)
        Me.Controls.Add(Me.lblNavLocation)
        Me.Controls.Add(Me.btnNavNext)
        Me.Controls.Add(Me.btnLast)
        Me.Controls.Add(Me.btnAdd)
        Me.Controls.Add(Me.btnDelete)
        Me.Controls.Add(Me.btnCancel)
        Me.Name = "frmremedio"
        Me.Text = "remedio"
        CType(Me.objdsremedio, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Me.BindingContext(objdsremedio, "remedios").CancelCurrentEdit()
        Me.objdsremedio_PositionChanged()

    End Sub
    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        If (Me.BindingContext(objdsremedio, "remedios").Count > 0) Then
            Me.BindingContext(objdsremedio, "remedios").RemoveAt(Me.BindingContext(objdsremedio, "remedios").Position)
            Me.objdsremedio_PositionChanged()
        End If

    End Sub
    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Try
            'Clear out the current edits
            Me.BindingContext(objdsremedio, "remedios").EndCurrentEdit()
            Me.BindingContext(objdsremedio, "remedios").AddNew()
        Catch eEndEdit As System.Exception
            System.Windows.Forms.MessageBox.Show(eEndEdit.Message)
        End Try
        Me.objdsremedio_PositionChanged()

    End Sub
    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Try
            'Attempt to update the datasource.
            Me.UpdateDataSet()
        Catch eUpdate As System.Exception
            'Add your error handling code here.
            'Display error message, if any.
            System.Windows.Forms.MessageBox.Show(eUpdate.Message)
        End Try
        Me.objdsremedio_PositionChanged()

    End Sub
    Private Sub btnLoad_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLoad.Click
        Try
            'Attempt to load the dataset.
            Me.LoadDataSet()
        Catch eLoad As System.Exception
            'Add your error handling code here.
            'Display error message, if any.
            System.Windows.Forms.MessageBox.Show(eLoad.Message)
        End Try
        Me.objdsremedio_PositionChanged()

    End Sub
    Private Sub btnNavFirst_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNavFirst.Click
        Me.BindingContext(objdsremedio, "remedios").Position = 0
        Me.objdsremedio_PositionChanged()

    End Sub
    Private Sub btnLast_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLast.Click
        Me.BindingContext(objdsremedio, "remedios").Position = (Me.objdsremedio.Tables("remedios").Rows.Count - 1)
        Me.objdsremedio_PositionChanged()

    End Sub
    Private Sub btnNavPrev_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNavPrev.Click
        Me.BindingContext(objdsremedio, "remedios").Position = (Me.BindingContext(objdsremedio, "remedios").Position - 1)
        Me.objdsremedio_PositionChanged()

    End Sub
    Private Sub btnNavNext_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNavNext.Click
        Me.BindingContext(objdsremedio, "remedios").Position = (Me.BindingContext(objdsremedio, "remedios").Position + 1)
        Me.objdsremedio_PositionChanged()

    End Sub
    Private Sub objdsremedio_PositionChanged()
        Me.lblNavLocation.Text = (((Me.BindingContext(objdsremedio, "remedios").Position + 1).ToString + " of  ") _
                    + Me.BindingContext(objdsremedio, "remedios").Count.ToString)

    End Sub
    Private Sub btnCancelAll_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancelAll.Click
        Me.objdsremedio.RejectChanges()

    End Sub
    Public Sub UpdateDataSet()
        'Create a new dataset to hold the changes that have been made to the main dataset.
        Dim objDataSetChanges As prova2sheila.dsremedio = New prova2sheila.dsremedio
        'Stop any current edits.
        Me.BindingContext(objdsremedio, "remedios").EndCurrentEdit()
        'Get the changes that have been made to the main dataset.
        objDataSetChanges = CType(objdsremedio.GetChanges, prova2sheila.dsremedio)
        'Check to see if any changes have been made.
        If (Not (objDataSetChanges) Is Nothing) Then
            Try
                'There are changes that need to be made, so attempt to update the datasource by
                'calling the update method and passing the dataset and any parameters.
                Me.UpdateDataSource(objDataSetChanges)
                objdsremedio.Merge(objDataSetChanges)
                objdsremedio.AcceptChanges()
            Catch eUpdate As System.Exception
                'Add your error handling code here.
                Throw eUpdate
            End Try
            'Add your code to check the returned dataset for any errors that may have been
            'pushed into the row object's error.
        End If

    End Sub
    Public Sub LoadDataSet()
        'Create a new dataset to hold the records returned from the call to FillDataSet.
        'A temporary dataset is used because filling the existing dataset would
        'require the databindings to be rebound.
        Dim objDataSetTemp As prova2sheila.dsremedio
        objDataSetTemp = New prova2sheila.dsremedio
        Try
            'Attempt to fill the temporary dataset.
            Me.FillDataSet(objDataSetTemp)
        Catch eFillDataSet As System.Exception
            'Add your error handling code here.
            Throw eFillDataSet
        End Try
        Try
            'Empty the old records from the dataset.
            objdsremedio.Clear()
            'Merge the records into the main dataset.
            objdsremedio.Merge(objDataSetTemp)
        Catch eLoadMerge As System.Exception
            'Add your error handling code here.
            Throw eLoadMerge
        End Try

    End Sub
    Public Sub UpdateDataSource(ByVal ChangedRows As prova2sheila.dsremedio)
        Try
            'The data source only needs to be updated if there are changes pending.
            If (Not (ChangedRows) Is Nothing) Then
                'Open the connection.
                Me.OleDbConnection1.Open()
                'Attempt to update the data source.
                OleDbDataAdapter1.Update(ChangedRows)
            End If
        Catch updateException As System.Exception
            'Add your error handling code here.
            Throw updateException
        Finally
            'Close the connection whether or not the exception was thrown.
            Me.OleDbConnection1.Close()
        End Try

    End Sub
    Public Sub FillDataSet(ByVal dataSet As prova2sheila.dsremedio)
        'Turn off constraint checking before the dataset is filled.
        'This allows the adapters to fill the dataset without concern
        'for dependencies between the tables.
        dataSet.EnforceConstraints = False
        Try
            'Open the connection.
            Me.OleDbConnection1.Open()
            'Attempt to fill the dataset through the OleDbDataAdapter1.
            Me.OleDbDataAdapter1.Fill(dataSet)
        Catch fillException As System.Exception
            'Add your error handling code here.
            Throw fillException
        Finally
            'Turn constraint checking back on.
            dataSet.EnforceConstraints = True
            'Close the connection whether or not the exception was thrown.
            Me.OleDbConnection1.Close()
        End Try

    End Sub
End Class
