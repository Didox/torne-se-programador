Imports System.Data

Public Class Cliente
    Public Function ObterClientesXml() As String
        Dim Ds As New DataSet
        Ds.ReadXml("C:\Clientes.xml")
        Return Ds.GetXml()
    End Function
End Class
