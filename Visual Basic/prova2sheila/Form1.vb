Public Class frmexemplo01
    Inherits System.Windows.Forms.Form
    Dim formexemplo02

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
    Friend WithEvents MainMenu1 As System.Windows.Forms.MainMenu
    Friend WithEvents MenuItem1 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem4 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem6 As System.Windows.Forms.MenuItem
    Friend WithEvents mnuvenda As System.Windows.Forms.MenuItem
    Friend WithEvents mnuremedio As System.Windows.Forms.MenuItem
    Friend WithEvents mnusair As System.Windows.Forms.MenuItem
    Friend WithEvents mnufulano As System.Windows.Forms.MenuItem
    Friend WithEvents mnubeltrano As System.Windows.Forms.MenuItem
    Friend WithEvents mnuciclano As System.Windows.Forms.MenuItem
    Friend WithEvents txtsenha As System.Windows.Forms.TextBox
    Friend WithEvents lblsenha As System.Windows.Forms.Label
    Friend WithEvents btnOK As System.Windows.Forms.Button
    Friend WithEvents Panelsenha As System.Windows.Forms.Panel
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.MainMenu1 = New System.Windows.Forms.MainMenu
        Me.MenuItem1 = New System.Windows.Forms.MenuItem
        Me.mnuvenda = New System.Windows.Forms.MenuItem
        Me.mnuremedio = New System.Windows.Forms.MenuItem
        Me.MenuItem4 = New System.Windows.Forms.MenuItem
        Me.mnusair = New System.Windows.Forms.MenuItem
        Me.MenuItem6 = New System.Windows.Forms.MenuItem
        Me.mnufulano = New System.Windows.Forms.MenuItem
        Me.mnubeltrano = New System.Windows.Forms.MenuItem
        Me.mnuciclano = New System.Windows.Forms.MenuItem
        Me.Panelsenha = New System.Windows.Forms.Panel
        Me.txtsenha = New System.Windows.Forms.TextBox
        Me.lblsenha = New System.Windows.Forms.Label
        Me.btnOK = New System.Windows.Forms.Button
        Me.Panelsenha.SuspendLayout()
        Me.SuspendLayout()
        '
        'MainMenu1
        '
        Me.MainMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem1, Me.MenuItem6})
        '
        'MenuItem1
        '
        Me.MenuItem1.Index = 0
        Me.MenuItem1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.mnuvenda, Me.mnuremedio, Me.MenuItem4, Me.mnusair})
        Me.MenuItem1.Text = "&Cadastro"
        '
        'mnuvenda
        '
        Me.mnuvenda.Index = 0
        Me.mnuvenda.Shortcut = System.Windows.Forms.Shortcut.CtrlV
        Me.mnuvenda.Text = "&Venda"
        '
        'mnuremedio
        '
        Me.mnuremedio.Index = 1
        Me.mnuremedio.Shortcut = System.Windows.Forms.Shortcut.CtrlR
        Me.mnuremedio.Text = "&Remedios"
        '
        'MenuItem4
        '
        Me.MenuItem4.Index = 2
        Me.MenuItem4.Text = "-"
        '
        'mnusair
        '
        Me.mnusair.Index = 3
        Me.mnusair.Shortcut = System.Windows.Forms.Shortcut.CtrlX
        Me.mnusair.Text = "&Sair"
        '
        'MenuItem6
        '
        Me.MenuItem6.Index = 1
        Me.MenuItem6.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.mnufulano, Me.mnubeltrano, Me.mnuciclano})
        Me.MenuItem6.Text = "&Usuario"
        '
        'mnufulano
        '
        Me.mnufulano.Index = 0
        Me.mnufulano.Text = "Fulano"
        '
        'mnubeltrano
        '
        Me.mnubeltrano.Index = 1
        Me.mnubeltrano.Text = "Beltrano"
        '
        'mnuciclano
        '
        Me.mnuciclano.Index = 2
        Me.mnuciclano.Text = "Ciclano"
        '
        'Panelsenha
        '
        Me.Panelsenha.Controls.Add(Me.btnOK)
        Me.Panelsenha.Controls.Add(Me.lblsenha)
        Me.Panelsenha.Controls.Add(Me.txtsenha)
        Me.Panelsenha.Location = New System.Drawing.Point(64, 40)
        Me.Panelsenha.Name = "Panelsenha"
        Me.Panelsenha.Size = New System.Drawing.Size(288, 136)
        Me.Panelsenha.TabIndex = 0
        Me.Panelsenha.Visible = False
        '
        'txtsenha
        '
        Me.txtsenha.Location = New System.Drawing.Point(112, 24)
        Me.txtsenha.Name = "txtsenha"
        Me.txtsenha.Size = New System.Drawing.Size(128, 20)
        Me.txtsenha.TabIndex = 0
        Me.txtsenha.Text = ""
        '
        'lblsenha
        '
        Me.lblsenha.Location = New System.Drawing.Point(48, 32)
        Me.lblsenha.Name = "lblsenha"
        Me.lblsenha.Size = New System.Drawing.Size(56, 16)
        Me.lblsenha.TabIndex = 1
        Me.lblsenha.Text = "Senha"
        '
        'btnOK
        '
        Me.btnOK.Location = New System.Drawing.Point(104, 96)
        Me.btnOK.Name = "btnOK"
        Me.btnOK.Size = New System.Drawing.Size(56, 24)
        Me.btnOK.TabIndex = 2
        Me.btnOK.Text = "OK"
        '
        'frmexemplo01
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(432, 321)
        Me.Controls.Add(Me.Panelsenha)
        Me.Menu = Me.MainMenu1
        Me.Name = "frmexemplo01"
        Me.Text = "menu"
        Me.Panelsenha.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub mnuvenda_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuvenda.Click
        Dim asform As frmexemplo02
        asform = New frmexemplo02
        asform.Show()

        


    End Sub

    Private Sub mnuremedio_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuremedio.Click
        Dim asform As frmremedio
        asform = New frmremedio
        asform.Show()

    End Sub

    Private Sub mnufulano_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnufulano.Click

        mnufulano.Checked = True
        mnuciclano.Checked = False
        mnubeltrano.Checked = False
        mnuvenda.Checked = True
        mnuremedio.Checked = True
        If mnufulano.Checked = True Then
            Panelsenha.Visible = True



        End If
    End Sub

    Private Sub mnubeltrano_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnubeltrano.Click
        
        mnubeltrano.Checked = True
        mnufulano.Checked = False
        mnuciclano.Checked = False
        mnuremedio.Checked = True
        mnuvenda.Enabled = False
        mnuvenda.Checked = False
        If mnubeltrano.Checked = True Then
            Panelsenha.Visible = True

        End If
    End Sub

    Private Sub mnuciclano_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuciclano.Click

        mnuciclano.Checked = True
        mnufulano.Checked = False
        mnubeltrano.Checked = False
        mnuvenda.Checked = True
        mnuremedio.Checked = True

        If mnuciclano.Checked = True Then
            Panelsenha.Visible = True


        End If


    End Sub
End Class
