<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top.ascx.cs" Inherits="WebControls_Top" %>
<table border="0" class="search" width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center" style="height: 30px">
            <table width="100%" height="77px">
                <tr>
                    <td class="topo" align="center">
                        <asp:Image ID="imgTopo" SkinID="topo" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center" style="height: 30px">
            <nobr>
             <select id="ddlCategory">
                <option value="">Todos</option>
                <option value="1">Revista</option>
                <option value="2">Livro</option>
                <option value="3">CD</option>
            </select>
            <input type="text" style="width:255;" maxlength="255" id="txtSearch" ></asp:TextBox> 
           <input type="button" id="btnBuscar" onclick="SearchProducts()" Value="Buscar"></asp:Button> 
    </nobr>
    </tr>
</table>
