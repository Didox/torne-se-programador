Public Class frmexemplo02
    Inherits System.Windows.Forms.Form
    Dim ds As New DataSet
    Dim strvendas As String = "C:\sheila\farmacia"
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
    Friend WithEvents btnler As System.Windows.Forms.Button
    Friend WithEvents btngravar As System.Windows.Forms.Button
    Friend WithEvents btnprimeiro As System.Windows.Forms.Button
    Friend WithEvents btnanterior As System.Windows.Forms.Button
    Friend WithEvents btnproximo As System.Windows.Forms.Button
    Friend WithEvents btnultimo As System.Windows.Forms.Button
    Friend WithEvents dgdados As System.Windows.Forms.DataGrid
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.btnler = New System.Windows.Forms.Button
        Me.btngravar = New System.Windows.Forms.Button
        Me.btnprimeiro = New System.Windows.Forms.Button
        Me.btnanterior = New System.Windows.Forms.Button
        Me.btnproximo = New System.Windows.Forms.Button
        Me.btnultimo = New System.Windows.Forms.Button
        Me.dgdados = New System.Windows.Forms.DataGrid
        CType(Me.dgdados, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'btnler
        '
        Me.btnler.Location = New System.Drawing.Point(16, 8)
        Me.btnler.Name = "btnler"
        Me.btnler.Size = New System.Drawing.Size(80, 24)
        Me.btnler.TabIndex = 0
        Me.btnler.Text = "ler "
        '
        'btngravar
        '
        Me.btngravar.Location = New System.Drawing.Point(112, 8)
        Me.btngravar.Name = "btngravar"
        Me.btngravar.Size = New System.Drawing.Size(64, 24)
        Me.btngravar.TabIndex = 1
        Me.btngravar.Text = "gravar"
        '
        'btnprimeiro
        '
        Me.btnprimeiro.Location = New System.Drawing.Point(8, 296)
        Me.btnprimeiro.Name = "btnprimeiro"
        Me.btnprimeiro.Size = New System.Drawing.Size(64, 32)
        Me.btnprimeiro.TabIndex = 2
        Me.btnprimeiro.Text = "<<"
        '
        'btnanterior
        '
        Me.btnanterior.Location = New System.Drawing.Point(72, 296)
        Me.btnanterior.Name = "btnanterior"
        Me.btnanterior.Size = New System.Drawing.Size(64, 32)
        Me.btnanterior.TabIndex = 3
        Me.btnanterior.Text = "<"
        '
        'btnproximo
        '
        Me.btnproximo.Location = New System.Drawing.Point(344, 296)
        Me.btnproximo.Name = "btnproximo"
        Me.btnproximo.Size = New System.Drawing.Size(64, 32)
        Me.btnproximo.TabIndex = 4
        Me.btnproximo.Text = ">>"
        '
        'btnultimo
        '
        Me.btnultimo.Location = New System.Drawing.Point(280, 296)
        Me.btnultimo.Name = "btnultimo"
        Me.btnultimo.Size = New System.Drawing.Size(64, 32)
        Me.btnultimo.TabIndex = 5
        Me.btnultimo.Text = ">"
        '
        'dgdados
        '
        Me.dgdados.DataMember = ""
        Me.dgdados.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.dgdados.Location = New System.Drawing.Point(8, 40)
        Me.dgdados.Name = "dgdados"
        Me.dgdados.Size = New System.Drawing.Size(416, 248)
        Me.dgdados.TabIndex = 6
        Me.dgdados.Tag = ""
        '
        'frmexemplo02
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(480, 334)
        Me.Controls.Add(Me.dgdados)
        Me.Controls.Add(Me.btnultimo)
        Me.Controls.Add(Me.btnproximo)
        Me.Controls.Add(Me.btnanterior)
        Me.Controls.Add(Me.btnprimeiro)
        Me.Controls.Add(Me.btngravar)
        Me.Controls.Add(Me.btnler)
        Me.Name = "frmexemplo02"
        Me.Text = "exemplo02"
        CType(Me.dgdados, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub exemplo02_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub btnler_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnler.Click
       

    End Sub

    Private Sub btngravar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btngravar.Click
        Try
            ds.WriteXml(strvendas)
            MessageBox.Show("arquivo xml gravado com sucesso", "atenção", MessageBoxButtons.OK, MessageBoxIcon.Information)


        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Private Sub btnprimeiro_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnprimeiro.Click

    End Sub
End Class
