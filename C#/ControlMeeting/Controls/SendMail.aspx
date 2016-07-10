<%@ Page language="c#" Codebehind="SendMail.aspx.cs" AutoEventWireup="false" Inherits="ControlMeeting.Controls.SendMail" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
    <title>SendMail</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
	<LINK href="../css/Geral.css" type="text/css" rel="stylesheet">
	<script language="JavaScript" src="../Js/ObjectsIframe.js"></script>
</HEAD>
  <body MS_POSITIONING="GridLayout">
	
    <form id="Form1" method="post" runat="server">
			<table borderColor="#000000" cellSpacing="0" cellPadding="0" width="390" border="0" >
				<tr>
					<td align="right" width="100%" colSpan="2"><font face="Verdana" size="1">Campos 
							com (*) são obrigatórios</font></td>
				</tr>
				<tr height="25">
					<td width="150"  bgColor="#ffffff"><font face="Verdana" size="1">&nbsp; 
						*&nbsp; E-mail&nbsp; </font>
					</td>
					<td width="80%" bgColor="#ffffff"><font face="Verdana" size="1">
							<asp:TextBox id="txtEmail" runat="server"  Width="264" Height="17"></asp:TextBox>
								<asp:RequiredFieldValidator id=rvfEmail runat="server" ErrorMessage="E-mail" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator id=rrvEmail runat="server" ErrorMessage="E-mail" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator><span id="rvlEmail_2" controltovalidate="txtEmail" errormessage="Preencha corretamente o campo e-mail"
								<font></span></font>
					</td>
				</tr>
					<tr height="25">
					<td width="150"  bgColor="#ffffff"><font face="Verdana" size="1">&nbsp; 
						*&nbsp; Assunto&nbsp; </font>
					</td>
					<td width="65%" bgColor="#ffffff"><font face="Verdana" size="1">
							<asp:TextBox id="txtSubject" runat="server"  Width="264" Height="17"></asp:TextBox>
								<asp:RequiredFieldValidator id="rrfSubject" runat="server" ErrorMessage="Assunto" ControlToValidate="txtSubject">*</asp:RequiredFieldValidator>								
							</font>
					</td>
				</tr>
				<tr height="25">
					<td width="150" style=" HEIGHT: 56px" vAlign="top" bgColor="#ffffff">&nbsp; 
							*&nbsp; Mensagem&nbsp; 
					</td>
					<td style="HEIGHT: 56px" width="65%" bgColor="#ffffff"><font face="Verdana" size="1">
							<asp:TextBox id="txtMensagem" runat="server"  Width="264px" Height="59px" TextMode="MultiLine"> </asp:TextBox>
							<asp:RequiredFieldValidator id=rfvMensagem runat="server" ErrorMessage="Mensagem" ControlToValidate="txtMensagem">*</asp:RequiredFieldValidator></font>
					</td>
				</tr>
				<tr>
					<td bgColor="#ffffff" >&nbsp;&nbsp;&nbsp;
					</td>
					<td bgColor="#ffffff">							
						<asp:Button id="btnEnviar" runat="server" Text="Enviar"  Width="56px" Height="19px"></asp:Button>
					</td>
				</tr>
			</table>
			<asp:ValidationSummary id=vsMensagem style="Z-INDEX: 101; LEFT: 416px; POSITION: absolute; TOP: 216px" runat="server" ShowMessageBox="True" ShowSummary="False" HeaderText="Preencha corretamente os campos abaixo:"></asp:ValidationSummary>
     </form>
  </body>
</HTML>
