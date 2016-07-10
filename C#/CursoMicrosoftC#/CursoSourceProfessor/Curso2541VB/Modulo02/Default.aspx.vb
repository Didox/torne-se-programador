Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Private ObjSqlConnection As SqlConnection
    Private ObjSqlCommand As SqlCommand
    Private ObjConnectionStringSettings As ConnectionStringSettings

    Protected Sub Cmd_Gravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Cmd_Gravar.Click
        ObjConnectionStringSettings = ConfigurationManager.ConnectionStrings("Curso2541")
        ObjSqlConnection = New SqlConnection(ObjConnectionStringSettings.ConnectionString)

        ObjSqlCommand = New SqlCommand()
        ObjSqlCommand.Connection = ObjSqlConnection
        ObjSqlCommand.CommandType = CommandType.StoredProcedure
        ObjSqlCommand.CommandText = "P_GravaCliente"

        ObjSqlCommand.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int))
        ObjSqlCommand.Parameters.Add(New SqlParameter("@Nome", SqlDbType.VarChar, 50))

        ObjSqlCommand.Parameters("@Id").Direction = ParameterDirection.Output
        ObjSqlCommand.Parameters("@Nome").Value = Txt_Nome.Text

        Try
            ObjSqlConnection.Open()
            ObjSqlCommand.ExecuteNonQuery()

            Lbl_Id.Text = ObjSqlCommand.Parameters("@Id").Value.ToString()

            Lbl_Mensagem.Text = "Cliente gravado com sucesso"
        Catch ex As Exception
            Lbl_Mensagem.Text = ex.ToString()
        Finally
            If (ObjSqlConnection.State = ConnectionState.Open) Then

                ObjSqlConnection.Close()
            End If
        End Try
    End Sub
End Class
