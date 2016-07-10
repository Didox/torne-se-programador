<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="WebControls_menu" %>
<asp:Panel ID="pLogin" Visible="true" runat="server">
    <table border="0" width="150" height="100%" bordercolor="#000000" class="write" > 
        <tr>
            <td height="34" class="publicidade">
                &nbsp;Publicidades
            </td>
        </tr>
        <tr>
            <td height="100" valign="TOP">
                <table>
                    <tr>
                        <td class="Publi01">
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td class="Publi02">
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td class="Publi03">
                        </td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
        <tr>
            <td height="34" class="publicidade">
                &nbsp;Area Restrita
            </td>
        </tr>
        <tr>
            <td valign="TOP" class="font" nowrap="true">
                Nome:
                <asp:TextBox ID="txtUser" runat="server" Width="111"></asp:TextBox><br />
                <asp:Button ID="btnLog" runat="server" Text="Login" OnClick="btnLog_Click" OnClientClick="return Valida()"
                    Width="100%" /><br />
                <input type="button" value="Cadastrar" onclick="SingUp()" style="width: 100%" />
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="pUserLogado" Visible="false" runat="server">
    <table border="0" width="150" height="100%" bordercolor="#000000" class="write">
        <tr>
            <td height="34" class="publicidade">
                &nbsp;Área do usuário
            </td>
        </tr>
        <tr>
            <td height="34" valign="top" class="font" align="center">
                Bem vindo(a)
                <asp:Label ID="lblUser" runat="server"></asp:Label>
                <input type="button" value="Alterar Cadastro" onclick="SingUp()" style="width: 100%" />
                <asp:Button ID="btnLogoff" runat="server" Text="Logof" OnClick="btnLogoff_Click"
                    Width="100%" />
            </td>
        </tr>
        <tr>
            <td height="20" class="publicidade">
                &nbsp;Meu Carrinho
            </td>
        </tr>
        <tr>
            <td height="15" valign="top" class="font">
                <div id="dvItens" style="display: none;" runat="server">
                    <asp:Label ID="lblSitens" runat="server" ForeColor="Red" Text="Não existem produtos no seu carrinho"></asp:Label>
                </div>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" height="10">
                    <tr>
                        <td id="tbItensCart">
                            <asp:Repeater ID="repCart" runat="server" OnItemDataBound="repCart_ItemDataBound">
                                <ItemTemplate>
                                    <table width="100%" height="50" border="1" class="carrinho" bordercolor="#ffffff">
                                        <tr>
                                            <td height="10" width="10">
                                                <asp:Image ID="imgProd" ImageUrl="~/Images/product.jpg" Width="30" Height="17" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblDescription" CssClass="desProdM" runat="server"></asp:Label><br />
                                                <asp:Label ID="lblTextPrice" CssClass="desProdM" Text="Preço: " runat="server"></asp:Label>
                                                <asp:Label ID="lblPrice" CssClass="desPriceM" runat="server"></asp:Label><br />
                                                <a href="javascript:void(0)" runat="server" id="likDel">
                                                    <img border="0" id="imgD" src="images/del.gif" />
                                                    Retirar</a>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="desProdM12" align="center" id="dvPrice" ><asp:Label ID="lblValueT" Text="Valor Total: " Visible="false" runat="server" class="desProdM12"></asp:Label><asp:Label ID="lblPriceTotal" runat="server" Visible="false" class="desPriceM12"></asp:Label></div>
                        </td>
                    </tr>
                </table>
                <input id="btnFechar" type="button" value="Fechar Compra" style="width: 100%" onclick="Fechar()"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td height="34" class="publicidade">
                &nbsp;Publicidades
            </td>
        </tr>
        <tr>
            <td height="100%" valign="TOP">
                <table>
                    <tr>
                        <td class="Publi01">
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td class="Publi02">
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td class="Publi03">
                        </td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
    </table>
</asp:Panel>
