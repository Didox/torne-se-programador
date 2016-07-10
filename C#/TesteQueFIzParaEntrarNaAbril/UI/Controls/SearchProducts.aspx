<%@ Page Language="C#" Theme="Verde" AutoEventWireup="true" CodeFile="SearchProducts.aspx.cs"
    Inherits="Controls_SearchProducts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pedidos</title>

    <script type="text/javascript" src="../jsObjects/JObjectsIframe.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pBusca" runat="server" Height="100%" Width="100%">
            <table width="100%" border="0" cellpadding="2" cellspacing="2">
                <tr>
                    <td height="30" class="produtos">
                        &nbsp;Ofertas
                    </td>
                </tr>
                <tr>
                    <td style="height: 315px" valign="top">
                        <asp:Label ID="lblSitens" runat="server" ForeColor="red" Text="Não existem produtos com este critério de busca"></asp:Label>
                        <asp:DataList ID="dtlProducts" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                            DataSourceID="odsProducts" Width="100%">
                            <ItemTemplate>
                                <table width="100%" border="0">
                                    <tr>
                                        <td height="10">
                                            <!-- para IE 5 quando tiver problema com cash
                                             top.setTimeout('top.Reload()', 10);-->
                                            <asp:HyperLink ID="hplImage" ImageUrl="~/Images/product.jpg" NavigateUrl='<%# "~/controls/searchproducts.aspx?productDetId=" + Eval("ProductId") %>'
                                                onclick=" top.CreateLoading();" runat="server"></asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDescription" CssClass="desProdM" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="lblPrice" CssClass="desPriceM" runat="server" Text='<%# Bind("Price", "{0:R$ #,###.00}") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource ID="odsProducts" runat="server" SelectMethod="GetByParameters"
                            TypeName="ExameAbril.Business.Product">
                            <SelectParameters>
                                <asp:Parameter Name="productId_" Type="Int32" />
                                <asp:QueryStringParameter Name="description_" QueryStringField="description" Type="String" />
                                <asp:QueryStringParameter DefaultValue="" Name="category" QueryStringField="category"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pDetalhe" Visible="false" runat="server" Height="100%" Width="100%">
            <table width="100%" border="0" cellpadding="2" cellspacing="2">
                <tr>
                    <td height="30" class="produtos">
                        &nbsp;Detalhe do produto
                    </td>
                </tr>
                <tr>
                    <td style="height: 315px" valign="top">
                        <table width="100%" border="0">
                            <tr>
                                <td height="10" width="100">
                                    <asp:Image ID="imgProd" ImageUrl="~/Images/product.jpg" Width="201" Height="147"
                                        runat="server" />
                                </td>
                                <td>
                                    <asp:Label ID="lblDescription" CssClass="desProd" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblCategory" CssClass="desProd" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblTextPrice" CssClass="desProd" runat="server"></asp:Label>
                                    <asp:Label ID="lblPrice" CssClass="desPrice" runat="server"></asp:Label>
                                    <br />
                                    <input id="btnComprar" type="button" value="Comprar - Colocar no Carrinho" runat="server" style="width: 267px" />
                                    <br />
                                    <input id="btnVoltar" type="button" value="Voltar" onclick="history.go(-1);" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
