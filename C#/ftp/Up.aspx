<%@ Page language="c#" Codebehind="Up.aspx.cs" AutoEventWireup="false" Inherits="FTP.Up" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Upload</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<style type="text/css">.Font { FONT-SIZE: 11px; FONT-FAMILY: verdana, arial }
	A { FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: verdana, arial; TEXT-DECORATION: none }
	A:visited { FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: verdana, arial; TEXT-DECORATION: none }
	A:hover { FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: verdana, arial; TEXT-DECORATION: none }
	BODY { MARGIN: 0px }
	.campo_branco { BORDER-RIGHT: #666666 1px solid; BORDER-TOP: #666666 1px solid; FONT-SIZE: 10px; BORDER-LEFT: #666666 1px solid; COLOR: #000000; BORDER-BOTTOM: #666666 1px solid; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #ffffff }
		</style>
	</HEAD>
	<body class="body">
		<form id="upload" method="post" runat="server" enctype="multipart/form-data">
			<TABLE cellSpacing="10" cellPadding="0" width="100%" border="0" class="Font" id="tblUp"
				height="10">
				<TR>
					<TD>
						<INPUT onkeypress="return false" class="campo_branco" id="UPArq" type="file" name="UPArq"
							runat="server" size="2" style="WIDTH: 128px; HEIGHT: 16px">
						<asp:Button id="btnEnviar" runat="server" Text="Enviar" CssClass="campo_branco"></asp:Button>
						<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="Selecione um Arquivo"
							ControlToValidate="UPArq"></asp:RequiredFieldValidator></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
