<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
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
        Me.Lbl_Mensagem = New System.Windows.Forms.Label
        Me.Cmd_Desconectar = New System.Windows.Forms.Button
        Me.Cmd_Conectar = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'Lbl_Mensagem
        '
        Me.Lbl_Mensagem.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Lbl_Mensagem.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Lbl_Mensagem.Location = New System.Drawing.Point(12, 76)
        Me.Lbl_Mensagem.Name = "Lbl_Mensagem"
        Me.Lbl_Mensagem.Size = New System.Drawing.Size(268, 186)
        Me.Lbl_Mensagem.TabIndex = 5
        '
        'Cmd_Desconectar
        '
        Me.Cmd_Desconectar.Location = New System.Drawing.Point(12, 39)
        Me.Cmd_Desconectar.Name = "Cmd_Desconectar"
        Me.Cmd_Desconectar.Size = New System.Drawing.Size(96, 23)
        Me.Cmd_Desconectar.TabIndex = 4
        Me.Cmd_Desconectar.Text = "Desconectar"
        Me.Cmd_Desconectar.UseVisualStyleBackColor = True
        '
        'Cmd_Conectar
        '
        Me.Cmd_Conectar.Location = New System.Drawing.Point(12, 10)
        Me.Cmd_Conectar.Name = "Cmd_Conectar"
        Me.Cmd_Conectar.Size = New System.Drawing.Size(96, 23)
        Me.Cmd_Conectar.TabIndex = 3
        Me.Cmd_Conectar.Text = "Conectar"
        Me.Cmd_Conectar.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(292, 273)
        Me.Controls.Add(Me.Lbl_Mensagem)
        Me.Controls.Add(Me.Cmd_Desconectar)
        Me.Controls.Add(Me.Cmd_Conectar)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub
    Private WithEvents Lbl_Mensagem As System.Windows.Forms.Label
    Private WithEvents Cmd_Desconectar As System.Windows.Forms.Button
    Private WithEvents Cmd_Conectar As System.Windows.Forms.Button

End Class
