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
        Me.Cmd_TransacaoDistribuida = New System.Windows.Forms.Button
        Me.Cmd_TransacaoLocal = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'Cmd_TransacaoDistribuida
        '
        Me.Cmd_TransacaoDistribuida.Location = New System.Drawing.Point(21, 50)
        Me.Cmd_TransacaoDistribuida.Name = "Cmd_TransacaoDistribuida"
        Me.Cmd_TransacaoDistribuida.Size = New System.Drawing.Size(127, 23)
        Me.Cmd_TransacaoDistribuida.TabIndex = 3
        Me.Cmd_TransacaoDistribuida.Text = "Transacao Distribuída"
        Me.Cmd_TransacaoDistribuida.UseVisualStyleBackColor = True
        '
        'Cmd_TransacaoLocal
        '
        Me.Cmd_TransacaoLocal.Location = New System.Drawing.Point(21, 21)
        Me.Cmd_TransacaoLocal.Name = "Cmd_TransacaoLocal"
        Me.Cmd_TransacaoLocal.Size = New System.Drawing.Size(127, 23)
        Me.Cmd_TransacaoLocal.TabIndex = 2
        Me.Cmd_TransacaoLocal.Text = "Transacao Local"
        Me.Cmd_TransacaoLocal.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(292, 273)
        Me.Controls.Add(Me.Cmd_TransacaoDistribuida)
        Me.Controls.Add(Me.Cmd_TransacaoLocal)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub
    Private WithEvents Cmd_TransacaoDistribuida As System.Windows.Forms.Button
    Private WithEvents Cmd_TransacaoLocal As System.Windows.Forms.Button

End Class
