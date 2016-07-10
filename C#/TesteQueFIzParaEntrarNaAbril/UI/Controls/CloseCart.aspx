<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CloseCart.aspx.cs" Inherits="Controls_CloseCart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Fechar Pedidos</title>

    <script type="text/javascript" src="../jsObjects/JObjectsIframe.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pBusca" runat="server" Height="100%" Width="100%">
            <table width="100%" border="0" cellpadding="2" cellspacing="2">
                <tr>
                    <td height="30" class="produtos">
                        &nbsp;Fechar Compra
                    </td>
                </tr>
                <tr>
                    <td style="height: 315px" valign="top">
                        <asp:Label ID="lblSItens" runat="server" ForeColor="red" Text="Não existem produtos em seu carrinho de compras"></asp:Label>
                        
                        <asp:Label ID="lblTextPrice" runat="server" CssClass="desProd" Text="Valor Total: " ></asp:Label>
                        <asp:Label ID="lblTotalValue" runat="server" CssClass="desPrice" ></asp:Label>&nbsp;
                        &nbsp;<asp:Button ID="btnFechar"  OnClientClick="top.CreateLoading()" runat="server" OnClick="btnFechar_Click" Text="Fechar"
                            Width="130px" /><br /><br />
                        
                        <asp:DataList ID="dtlProducts" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                            Width="100%" OnItemDataBound="dtlProducts_ItemDataBound">
                            <ItemTemplate>
                                <table width="100%" border="0">
                                    <tr>
                                        <td height="10">
                                            <asp:Image ID="imgProd" ImageUrl="~/Images/product.jpg" Width="201" Height="147"
                                                runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDescription" CssClass="desProdM" runat="server" ></asp:Label>
                                            <br />
                                            <asp:Label ID="lblCategory" CssClass="desProdM" runat="server"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblPrice" CssClass="desPriceM" runat="server" ></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        
                        <br /><asp:Label ID="lblTextPrice2" runat="server" CssClass="desProd" Text="Valor Total: " ></asp:Label>
                        <asp:Label ID="lblTotalValue2" runat="server" CssClass="desPrice" ></asp:Label>
                        &nbsp;
                        <asp:Button ID="btnFechar2" runat="server" OnClientClick="top.CreateLoading()" OnClick="btnFechar2_Click" Text="Fechar"
                            Width="130px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
