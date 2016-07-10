<%@ Page language="c#" Codebehind="EnviaEmail.aspx.cs" AutoEventWireup="false" Inherits="EnviaAnexo.WebForm1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>Envia Anexo</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
  </HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table borderColor="#ffffff" cellSpacing="0" cellPadding="0" width="98%" border="0">
				<tr>
					<td align="right" width="100%" colSpan="2"><font face="Verdana" color="#0f4c22" size="1">Campos 
							com (*) são obrigatórios</font></td>
				</tr>
				<tr height="25">
					<td width="35%" bgColor="#ffffff"><font face="Verdana" color="#0f4c22" size="1">&nbsp; 
							*&nbsp; Nome</font>
					</td>
					<td width="65%" bgColor="#ffffff"><font face="Verdana" color="#0f4c22" size="1">
					
							<asp:TextBox id="txtNome" runat="server" style="BORDER-RIGHT:#000000 1px solid; BORDER-TOP:#000000 1px solid; FONT-SIZE:8pt; BORDER-LEFT:#000000 1px solid; COLOR:#0f4c22; BORDER-BOTTOM:#000000 1px solid; FONT-FAMILY:Verdana; BACKGROUND-COLOR:#ffffff" Width="264" Height="17"></asp:TextBox>
<asp:RequiredFieldValidator id=rfvNome runat="server" ErrorMessage="Nome" ControlToValidate="txtNome">*</asp:RequiredFieldValidator></font></td>
				</tr>
				<tr height="25">
					<td width="35%" bgColor="#ffffff"><font face="Verdana" color="#0f4c22" size="1">&nbsp; 
							*&nbsp; E-mail</font>
					</td>
					<td width="65%" bgColor="#ffffff"><font face="Verdana" color="#0f4c22" size="1">
							<asp:TextBox id="txtEmail" runat="server" style="BORDER-RIGHT:#000000 1px solid; BORDER-TOP:#000000 1px solid; FONT-SIZE:8pt; BORDER-LEFT:#000000 1px solid; COLOR:#0f4c22; BORDER-BOTTOM:#000000 1px solid; FONT-FAMILY:Verdana; BACKGROUND-COLOR:#ffffff" Width="264" Height="17"></asp:TextBox>
<asp:RequiredFieldValidator id=rvfEmail runat="server" ErrorMessage="E-mail" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator id=rrvEmail runat="server" ErrorMessage="E-mail" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator><span id="rvlEmail_2" controltovalidate="txtEmail" errormessage="Preencha corretamente o campo e-mail"
								<font></span></font></td>
				</tr>
				<tr height="25">
					<td style="HEIGHT: 56px" vAlign="top" width="35%" bgColor="#ffffff"><font face="Verdana" color="#0f4c22" size="1">&nbsp; 
							*&nbsp; Mensagem</font>
					</td>
					<td style="HEIGHT: 56px" width="65%" bgColor="#ffffff"><font face="Verdana" color="#0f4c22" size="1">
							<asp:TextBox id="txtMensagem" runat="server" style="BORDER-RIGHT:#000000 1px solid; BORDER-TOP:#000000 1px solid; FONT-SIZE:8pt; BORDER-LEFT:#000000 1px solid; COLOR:#0f4c22; BORDER-BOTTOM:#000000 1px solid; FONT-FAMILY:Verdana; BACKGROUND-COLOR:#ffffff" Width="264px" Height="59px" TextMode="MultiLine"> </asp:TextBox>
<asp:RequiredFieldValidator id=rfvMensagem runat="server" ErrorMessage="Mensagem" ControlToValidate="txtMensagem">*</asp:RequiredFieldValidator></font>
							</td>
				</tr>
				<TR>
					<TD style="HEIGHT: 26px" vAlign="top" width="35%" bgColor="#ffffff"><font face="Verdana" color="#0f4c22" size="1">&nbsp; 
							*&nbsp; Anexo</font></FONT>
					</TD>
					<TD style="HEIGHT: 26px" width="65%" bgColor="#ffffff"><input runat="server" name="txtAnexo" id="txtAnexo" type="file" style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; FONT-SIZE: 8pt; BORDER-LEFT: #000000 1px solid; WIDTH: 264px; COLOR: #0f4c22; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: Verdana; HEIGHT: 17px; BACKGROUND-COLOR: #ffffff"
							size="24">
<asp:RequiredFieldValidator id=rfvAnexo runat="server" ErrorMessage="Anexo" ControlToValidate="txtAnexo">*</asp:RequiredFieldValidator></TD>
				</TR>
				<tr>
					<td bgColor="#ffffff">&nbsp;&nbsp;&nbsp;
					</td>
					<td bgColor="#ffffff">							
						<asp:Button id="btnEnviar" runat="server" Text="Enviar" style="BORDER-RIGHT:#000000 1px solid; BORDER-TOP:#000000 1px solid; FONT-SIZE:8pt; BORDER-LEFT:#000000 1px solid; COLOR:#0f4c22; BORDER-BOTTOM:#000000 1px solid; FONT-FAMILY:Verdana; BACKGROUND-COLOR:#ffffff" Width="56px" Height="19px"></asp:Button></td>
				</tr>
			</table>
<asp:ValidationSummary id=vsMensagem style="Z-INDEX: 101; LEFT: 416px; POSITION: absolute; TOP: 216px" runat="server" ShowMessageBox="True" ShowSummary="False" HeaderText="Preencha corretamente os campos abaixo:"></asp:ValidationSummary>
		</form>
	</body>
</HTML>
