<%@ Page language="c#" validateRequest=false Codebehind="formServices.aspx.cs" AutoEventWireup="false" Inherits="ControlMeeting.Controls.formServices" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>formServices</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/Geral.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="../Js/ObjectsIframe.js"></script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" onsubmit="if( isValidForm( 'Form1' , true , '#ffffff' , '#F8FBC5' ) ) { top.createLoading(); }else{ return false }"
			method="post" runat="server">
			<TABLE id="tbForm" runat="server" visible="True" cellSpacing="0" cellPadding="0" width="100%"
				border="0">
				<TR>
					<TD>
						<TABLE id="tbFormMount" borderColor="#e5e5e5" height="100%" cellSpacing="2" cellPadding="2"
							width="100%" align="center" border="1" runat="server">
							<TR>
								<TD align="center" bgColor="#e5e5e5" colSpan="2"><asp:label id="lblTitle" runat="server">Formulário</asp:label></TD>
							</TR>
						</TABLE>
						<br>
						<TABLE id="tbAnexo" borderColor="#e5e5e5" height="100%" cellSpacing="1" cellPadding="1"
							width="100%" align="center" border="1" runat="server" visible="False">
							<TR>
								<TD align="center">Anexar</TD>
								<TD><INPUT id="fileAnexo" style="WIDTH: 230px; HEIGHT: 16px" type="file" size="19" runat="server">
									<asp:button id="btnAnexar" runat="server" Text="Anexar"></asp:button>
									<asp:TextBox id="txtId" runat="server" Width="6px" Visible="False"></asp:TextBox></TD>
							</TR>
							<TR id="trAnexos" runat="server" visible="False">
								<TD align="center">Anexos</TD>
								<TD>
									<TABLE borderColor="#e5e5e5" height="100%" cellSpacing="1" cellPadding="1" width="100%"
										align="center" border="0">
										<tr>
											<td id="tdAnexos" runat="server"></td>
										</tr>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
						<TABLE borderColor="#e5e5e5" height="100%" cellSpacing="2" cellPadding="2" align="center"
							border="1">
							<TR>
								<TD align="center" bgColor="#e5e5e5" colSpan="2"><asp:button id="btnGravar" runat="server" Text="Gravar" Width="177px"></asp:button></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
