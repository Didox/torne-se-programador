<%@ Page Language="C#" Theme="Verde" AutoEventWireup="true" CodeFile="User.aspx.cs"
    Inherits="Controls_User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastro</title>

    <script type="text/javascript" src="../jsObjects/JObjectsIframe.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="2" cellspacing="2">
            <tr>
                <td height="30" class="produtos">
                    &nbsp;<asp:Label ID="lblTitle" runat="server" Text="Cadastro de usuários"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 100px" valign="top">
                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                        <tr>
                            <td style="width: 110px" > Nome do usuário
                            </td>
                            <td >
                                <asp:TextBox ID="txtName" runat="server" MaxLength="80" Width="178px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="Obrigatório"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 110px" > Descrição
                            </td>
                            <td >
                                <asp:TextBox ID="txtDescription" runat="server" Height="104px" MaxLength="255" TextMode="MultiLine"
                                    Width="178px"></asp:TextBox>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 110px" > Tema
                            </td>
                            <td >
                                <asp:DropDownList ID="ddlTheme" runat="server">
                                    <asp:ListItem>Azul</asp:ListItem>
                                    <asp:ListItem>Verde</asp:ListItem>
                                    <asp:ListItem>Vermelho</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="btnGravar" runat="server" OnClick="btnGravar_Click" Text="Gravar"
                                    Width="116px" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
