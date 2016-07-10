<%@ Page language="c#" Codebehind="VerImagem2.aspx.cs" AutoEventWireup="false" Inherits="ftp.VerImagem2" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Visualização de Arquivo</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../css/css.css">
		<script>
			function resize()
			{
				doc = document.images[0];
				
					if ( doc.complete )
						{
							if ( doc.width > 50 || doc.height > 50 )
								window.resizeTo( doc.width + 90, doc.height + 120  )
						}
					else
						setTimeout( "resize()",250 );
			}
		
		</script>
		<style type="text/css">.Font { FONT-SIZE: 11px; FONT-FAMILY: verdana, arial }
	A { FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: verdana, arial; TEXT-DECORATION: none }
	A:visited { FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: verdana, arial; TEXT-DECORATION: none }
	A:hover { FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: verdana, arial; TEXT-DECORATION: none }
		</style>
	</HEAD>
	<body onload="resize()">
		<form id="frmDelDir" method="post" runat="server">
			<center><fieldset id="field" style="BORDER-RIGHT:black 1px solid; PADDING-RIGHT:10px; BORDER-TOP:black 1px solid; PADDING-LEFT:10px; PADDING-BOTTOM:10px; BORDER-LEFT:black 1px solid; WIDTH:90%; PADDING-TOP:10px; BORDER-BOTTOM:black 1px solid; HEIGHT:100%"
					align="middle">
					<legend class="Font">
						<b>Visualização de Arquivo</b></legend>
					<TABLE cellSpacing="10" cellPadding="0" width="100%" border="0" class="texto" id="tblDelDir"
						runat="server" height="100%">
						<TR>
							<TD align="center" vAlign="middle">
								<asp:Image id="imgView" runat="server"></asp:Image></TD>
						</TR>
					</TABLE>
				</fieldset>
			</center>
		</form>
	</body>
</HTML>
