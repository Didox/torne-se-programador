<%@ Page Language="C#" Theme="Verde" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"
    MasterPageFile="~/Master.master" Title="Abril Ecommerce" %>

<%@ Register Src="WebControls/Menu.ascx" TagName="Menu" TagPrefix="uc2" %>

<%@ Register Src="WebControls/Top.ascx" TagName="Top" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="cphTopo" ID="Content1" runat="server">
    <uc1:Top ID="Top1" runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderID="cphMenu" ID="Content2" runat="server">
    <uc2:Menu ID="Menu1" runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderID="cphMeio" ID="cBusca" runat="server">
    <iframe src="Controls/SearchProducts.aspx" id="sProducts" frameborder="0" width="101%" height="100" ></iframe>
</asp:Content>
