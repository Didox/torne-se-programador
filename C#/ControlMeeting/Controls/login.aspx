<%@ Page language="c#" Codebehind="login.aspx.cs" AutoEventWireup="false" Inherits="ControlMeeting.Controls.login" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>login</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../css/Geral.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="../Js/ObjectsIframe.js"></script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server" onsubmit="return validateLogin()">
			<TABLE id="Table1" bordercolor="#f0f0f0" cellSpacing="0" cellPadding="0" width="224" border="1"
				height="127">
				<TR>
					<TD colspan="2" bgcolor="#f0f0f0" align="center">
						<asp:Label id="Label1" runat="server" Font-Bold="True" Font-Size="X-Small">Login</asp:Label>
					</TD>
				</TR>
				<TR>
					<TD colspan="2" align="center">
					</TD>
				</TR>
				<TR>
					<TD style="HEIGHT: 1px">&nbsp;Usuário:</TD>
					<TD style="HEIGHT: 1px"><asp:textbox id="txtUsuario" onfocus="enableLogin( this )" validar="true" msgName="Usuário" onblur="desableLogin( this )"
							Width="97px" runat="server" CssClass="login_form" MaxLength="14"> Digite o usuario</asp:textbox></TD>
				</TR>
				<TR>
					<TD>&nbsp;Senha:</TD>
					<TD style="HEIGHT: 1px"><input type="text" value=" Senha" class="login_form" style="WIDTH:97px" onfocus="getSenhaEnable(this)"
							id="txtSenhaDesable"><asp:textbox style="DISPLAY:none" id="txtSenha" validar="true" msgName="Senha" onblur="getSenhaDisable(this)"
							Width="97px" runat="server" CssClass="login_form" TextMode="Password"></asp:textbox></TD>
				</TR>
				<TR>
					<TD colspan="2" align="center">
						<asp:Button id="btnLogar" runat="server" Text="Logar"></asp:Button></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
