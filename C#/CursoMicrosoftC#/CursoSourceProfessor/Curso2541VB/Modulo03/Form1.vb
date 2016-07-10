Imports System.Data
Imports System.Data.SqlClient
Imports System.Transactions
Imports System.Configuration

Public Class Form1
    Private ObjSqlConnection As SqlConnection
    Private ObjConnectionStringSettings As ConnectionStringSettings
    Private ObjSqlTransaction As SqlTransaction

    Private Sub Cmd_TransacaoLocal_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cmd_TransacaoLocal.Click
        ObjConnectionStringSettings = ConfigurationManager.ConnectionStrings("Curso2541")
        ObjSqlConnection = New SqlConnection(ObjConnectionStringSettings.ConnectionString)

        Try
            ObjSqlConnection.Open()
            ObjSqlTransaction = ObjSqlConnection.BeginTransaction()

            Dim CmDebito As New SqlCommand()
            CmDebito.Connection = ObjSqlConnection
            CmDebito.CommandType = CommandType.StoredProcedure
            CmDebito.CommandText = "P_DebitaContaCorrente"
            CmDebito.Transaction = ObjSqlTransaction

            CmDebito.Parameters.Add(New SqlParameter("@Conta", SqlDbType.Int))
            CmDebito.Parameters.Add(New SqlParameter("@Valor", SqlDbType.Money))

            CmDebito.Parameters("@Conta").Value = 2
            CmDebito.Parameters("@Valor").Value = 10

            CmDebito.ExecuteNonQuery()

            Dim CmCredito As New SqlCommand()
            CmCredito.Connection = ObjSqlConnection
            CmCredito.CommandType = CommandType.StoredProcedure
            CmCredito.CommandText = "P_CreditoPoupanca"
            CmCredito.Transaction = ObjSqlTransaction

            CmCredito.Parameters.Add(New SqlParameter("@Conta", SqlDbType.Int))
            CmCredito.Parameters.Add(New SqlParameter("@Valor", SqlDbType.Money))

            CmCredito.Parameters("@Conta").Value = 1
            CmCredito.Parameters("@Valor").Value = 10

            CmCredito.ExecuteNonQuery()

            ObjSqlTransaction.Commit()
        Catch ex As Exception

            MessageBox.Show(ex.ToString())

            ObjSqlTransaction.Rollback()
        End Try

    End Sub

    Private Sub Cmd_TransacaoDistribuida_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cmd_TransacaoDistribuida.Click
        Dim ObjStringCnCurso2541 As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("Curso2541")
        Dim ObjStringCnCurso2541B As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("Curso2541B")

        Dim ObjCnCurso2541 As New SqlConnection(ObjStringCnCurso2541.ConnectionString)
        Dim ObjCnCurso2541B As New SqlConnection(ObjStringCnCurso2541B.ConnectionString)

        Using ObjTransactionScope = New TransactionScope()
            Try
                ObjCnCurso2541.Open()

                Dim CmDebito As New SqlCommand()
                CmDebito.Connection = ObjCnCurso2541
                CmDebito.CommandType = CommandType.StoredProcedure
                CmDebito.CommandText = "P_DebitaContaCorrente"

                CmDebito.Parameters.Add(New SqlParameter("@Conta", SqlDbType.Int))
                CmDebito.Parameters.Add(New SqlParameter("@Valor", SqlDbType.Money))

                CmDebito.Parameters("@Conta").Value = 2
                CmDebito.Parameters("@Valor").Value = 10

                CmDebito.ExecuteNonQuery()

                ObjCnCurso2541B.Open()

                Dim CmCredito As New SqlCommand()
                CmCredito.Connection = ObjCnCurso2541B
                CmCredito.CommandType = CommandType.StoredProcedure
                CmCredito.CommandText = "P_CreditoPoupanca"

                CmCredito.Parameters.Add(New SqlParameter("@Conta", SqlDbType.Int))
                CmCredito.Parameters.Add(New SqlParameter("@Valor", SqlDbType.Money))

                CmCredito.Parameters("@Conta").Value = 1
                CmCredito.Parameters("@Valor").Value = 10

                CmCredito.ExecuteNonQuery()

                ObjTransactionScope.Complete()
            Catch ex As Exception
                MessageBox.Show(ex.ToString())
            Finally
                If (ObjCnCurso2541.State = ConnectionState.Open) Then
                    ObjCnCurso2541.Close()
                End If
                If (ObjCnCurso2541B.State = ConnectionState.Open) Then

                    ObjCnCurso2541B.Close()
                End If
            End Try
        End Using
    End Sub
End Class
