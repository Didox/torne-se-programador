Imports System.IO

Public Class Form1

    Private Ds As DataSet

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim DtClientes As New DataTable("Cliente")

        Dim DcId As New DataColumn("Id", GetType(Integer))
        Dim DcNome As New DataColumn("Nome", GetType(String))

        DtClientes.Columns.Add(DcId)
        DtClientes.Columns.Add(DcNome)

        Ds = New DataSet("Clientes")
        Ds.Tables.Add(DtClientes)

        Dtg_Clientes.DataSource = Ds.Tables(0)
    End Sub

    Private Sub Cmd_Incluir_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cmd_Incluir.Click
        Dim Row As DataRow = Ds.Tables(0).NewRow()
        Row("Id") = Txt_Id.Text
        Row("Nome") = Txt_Nome.Text
        Ds.Tables(0).Rows.Add(Row)
    End Sub

    Private Sub Cmd_GerarXml_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cmd_GerarXml.Click
        Ds.WriteXml("C:\Clientes.xml")
        MessageBox.Show("Xml gerado com sucesso")
    End Sub

    Private Sub Cmd_LerXml_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cmd_LerXml.Click
        Dim ObjCliente As New Cliente
        Dim Xml As String = ObjCliente.ObterClientesXml()

        Dim ObjStringReader As New StringReader(Xml)
        Ds.ReadXml(ObjStringReader)

        'Criação de um formulário dinâmico
        Dim ObjForm As New Form()
        Dim ObjDataGridView As New DataGridView()
        ObjDataGridView.DataSource = Ds.Tables(0)
        ObjForm.Controls.Add(ObjDataGridView)
        ObjDataGridView.Dock = DockStyle.Fill
        ObjForm.Show()
    End Sub
End Class
