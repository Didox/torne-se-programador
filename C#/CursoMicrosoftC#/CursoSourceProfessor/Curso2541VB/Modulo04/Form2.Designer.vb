<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form2
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Cmd_AtualizarBase = New System.Windows.Forms.Button
        Me.Dtg_Clientes = New System.Windows.Forms.DataGridView
        Me.Cmd_Incluir = New System.Windows.Forms.Button
        Me.Txt_Nome = New System.Windows.Forms.TextBox
        Me.Txt_Id = New System.Windows.Forms.TextBox
        Me.label2 = New System.Windows.Forms.Label
        Me.label1 = New System.Windows.Forms.Label
        CType(Me.Dtg_Clientes, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Cmd_AtualizarBase
        '
        Me.Cmd_AtualizarBase.Location = New System.Drawing.Point(180, 275)
        Me.Cmd_AtualizarBase.Name = "Cmd_AtualizarBase"
        Me.Cmd_AtualizarBase.Size = New System.Drawing.Size(101, 23)
        Me.Cmd_AtualizarBase.TabIndex = 19
        Me.Cmd_AtualizarBase.Text = "AtualizarBase"
        Me.Cmd_AtualizarBase.UseVisualStyleBackColor = True
        '
        'Dtg_Clientes
        '
        Me.Dtg_Clientes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Dtg_Clientes.Location = New System.Drawing.Point(13, 93)
        Me.Dtg_Clientes.Name = "Dtg_Clientes"
        Me.Dtg_Clientes.Size = New System.Drawing.Size(268, 176)
        Me.Dtg_Clientes.TabIndex = 18
        '
        'Cmd_Incluir
        '
        Me.Cmd_Incluir.Location = New System.Drawing.Point(205, 64)
        Me.Cmd_Incluir.Name = "Cmd_Incluir"
        Me.Cmd_Incluir.Size = New System.Drawing.Size(75, 23)
        Me.Cmd_Incluir.TabIndex = 17
        Me.Cmd_Incluir.Text = "Incluir"
        Me.Cmd_Incluir.UseVisualStyleBackColor = True
        '
        'Txt_Nome
        '
        Me.Txt_Nome.Location = New System.Drawing.Point(54, 38)
        Me.Txt_Nome.Name = "Txt_Nome"
        Me.Txt_Nome.Size = New System.Drawing.Size(226, 20)
        Me.Txt_Nome.TabIndex = 16
        '
        'Txt_Id
        '
        Me.Txt_Id.Location = New System.Drawing.Point(53, 7)
        Me.Txt_Id.Name = "Txt_Id"
        Me.Txt_Id.Size = New System.Drawing.Size(100, 20)
        Me.Txt_Id.TabIndex = 15
        '
        'label2
        '
        Me.label2.AutoSize = True
        Me.label2.Location = New System.Drawing.Point(10, 38)
        Me.label2.Name = "label2"
        Me.label2.Size = New System.Drawing.Size(38, 13)
        Me.label2.TabIndex = 14
        Me.label2.Text = "Nome:"
        '
        'label1
        '
        Me.label1.AutoSize = True
        Me.label1.Location = New System.Drawing.Point(10, 10)
        Me.label1.Name = "label1"
        Me.label1.Size = New System.Drawing.Size(19, 13)
        Me.label1.TabIndex = 13
        Me.label1.Text = "Id:"
        '
        'Form2
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(292, 306)
        Me.Controls.Add(Me.Cmd_AtualizarBase)
        Me.Controls.Add(Me.Dtg_Clientes)
        Me.Controls.Add(Me.Cmd_Incluir)
        Me.Controls.Add(Me.Txt_Nome)
        Me.Controls.Add(Me.Txt_Id)
        Me.Controls.Add(Me.label2)
        Me.Controls.Add(Me.label1)
        Me.Name = "Form2"
        Me.Text = "Form2"
        CType(Me.Dtg_Clientes, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Private WithEvents Cmd_AtualizarBase As System.Windows.Forms.Button
    Private WithEvents Dtg_Clientes As System.Windows.Forms.DataGridView
    Private WithEvents Cmd_Incluir As System.Windows.Forms.Button
    Private WithEvents Txt_Nome As System.Windows.Forms.TextBox
    Private WithEvents Txt_Id As System.Windows.Forms.TextBox
    Private WithEvents label2 As System.Windows.Forms.Label
    Private WithEvents label1 As System.Windows.Forms.Label
End Class
