<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Id:
        <asp:Label ID="Lbl_Id" runat="server"></asp:Label><br />
        Nome:
        <asp:TextBox ID="Txt_Nome" runat="server"></asp:TextBox><br />
        <br />
        <asp:Button ID="Cmd_Gravar" runat="server" OnClick="Cmd_Gravar_Click" Text="Gravar" /><asp:Label
            ID="Lbl_Mensagem" runat="server"></asp:Label></div>
    </form>
</body>
</html>
