<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Id: &nbsp;&nbsp; &nbsp; &nbsp;
        <asp:Label ID="lblId" runat="server"></asp:Label>&nbsp;<br />
        Nome:&nbsp;
        <asp:TextBox ID="txtNome" runat="server"></asp:TextBox><br />
        <asp:Button ID="cmdGravar" runat="server" Text="Salvar" OnClick="cmdGravar_Click" />
        &nbsp;
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="gvClientesOffLine" runat="server" CellPadding="4" ForeColor="#333333"
            GridLines="None">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:Button ID="btnRetClientes" runat="server" OnClick="btnRetClientes_Click" Text="get dataset" />
        <br />
        <asp:Button ID="cmdClientes" runat="server" OnClick="Button1_Click" Text="Objects CLientes" /><br />
        <asp:Label ID="lblClientes" runat="server"></asp:Label></div>
    </form>
</body>
</html>
