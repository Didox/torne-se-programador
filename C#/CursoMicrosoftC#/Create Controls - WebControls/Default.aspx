<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="Controls" Namespace="Controls" TagPrefix="cc1" %>

<%@ Register Src="Control.ascx" TagName="Control" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Control ID="Control1" runat="server" TLabel1="Teste" TLabel2="Teste" />
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server" Height="209px" Width="683px">
            <cc1:NewTextBox ID="NewTextBox1" runat="server">leandro troxa</cc1:NewTextBox>
            <br />
            <br />
            <cc1:NewControl ID="NewControl1" runat="server" />
        </asp:Panel>
    </div>
    </form>
</body>
</html>
