Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO

Public Class Form1
    Private ObjSqlConnection As SqlConnection
    Private ObjConnectionStringSettings As ConnectionStringSettings

    Private Sub Cmd_Conectar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cmd_Conectar.Click
        ObjConnectionStringSettings = ConfigurationManager.ConnectionStrings("Aw")
        ObjSqlConnection = New _
        SqlConnection(ObjConnectionStringSettings.ConnectionString)

        AddHandler ObjSqlConnection.StateChange, _
        New StateChangeEventHandler(AddressOf Log)

        Try
            ObjSqlConnection.Open()
            Lbl_Mensagem.Text = "Connection String:" + ObjSqlConnection.ConnectionString
            Lbl_Mensagem.Text += vbNewLine + "DataBase:" + ObjSqlConnection.Database
            Lbl_Mensagem.Text += vbNewLine + "Tamanho do pacote:" + ObjSqlConnection.PacketSize.ToString()
            Lbl_Mensagem.Text += vbNewLine + "Versão do servidor:" + ObjSqlConnection.ServerVersion
            Lbl_Mensagem.Text += vbNewLine + "Estado da conexão:" + ObjSqlConnection.State.ToString()
        Catch ex As SqlException
            For Each Erro As SqlError In ex.Errors
                Lbl_Mensagem.Text += vbNewLine + "Nº: " + Erro.Number.ToString()
                Lbl_Mensagem.Text += vbNewLine + "Mensagem: " + Erro.Message
                Lbl_Mensagem.Text += vbNewLine + "Categoria: " + Erro.Class.ToString()
            Next
        End Try
    End Sub

    Private Sub Cmd_Desconectar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cmd_Desconectar.Click
        Try
            ObjSqlConnection.Close()

            Lbl_Mensagem.Text = "Estado da conexão:" + ObjSqlConnection.State.ToString()

        Catch ex As SqlException
            For Each Erro As SqlError In ex.Errors
                Lbl_Mensagem.Text += vbNewLine + "Nº: " + Erro.Number.ToString()
                Lbl_Mensagem.Text += vbNewLine + "Mensagem: " + Erro.Message
                Lbl_Mensagem.Text += vbNewLine + "Categoria: " + Erro.Class.ToString()
            Next
        End Try
    End Sub

    Private Sub Log(ByVal sender As Object, ByVal e As StateChangeEventArgs)
        Dim ObjStreamWriter As New StreamWriter( _
                Application.StartupPath + "\log.txt", True)

        ObjStreamWriter.WriteLine(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + _
                " - " + e.CurrentState.ToString())

        ObjStreamWriter.Close()
    End Sub
End Class
