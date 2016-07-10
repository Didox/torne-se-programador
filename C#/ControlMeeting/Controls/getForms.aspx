<%@ Page language="c#" Codebehind="GetForms.aspx.cs" AutoEventWireup="false" Inherits="ControlMeeting.Controls.GetForms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>GetForms</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../css/Geral.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="../Js/ObjectsIframe.js"></script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" onsubmit="top.createLoading()" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" height="100%" border="0">
				<TR>
					<TD align="center">
						<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="300" border="0">
							<TR>
								<TD align="center">Selecione o tipo de form para adicionar</TD>
							</TR>
							<TR>
								<TD>
									<asp:RadioButtonList id="rdlForms" runat="server" Width="288px"></asp:RadioButtonList></TD>
							</TR>
							<TR>
								<TD align="center">
									<asp:Button id="btnAdicionar" runat="server" Text="Adicionar" Width="123px"></asp:Button></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
