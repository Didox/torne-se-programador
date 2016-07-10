<%@ Page language="c#" Codebehind="Contato.aspx.cs" AutoEventWireup="false" Inherits="SendMessage.WebForm1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link rel="stylesheet" href="admin.css" type="text/css">
		<script>
			function validate(){
				var TxtNome = document.getElementById("TxtNome")
				var TxtEmail = document.getElementById("TxtEmail")
				var TxtConc = document.getElementById("TxtConc")
				var TxtCidade = document.getElementById("TxtCidade")
				var TxtEstado = document.getElementById("TxtEstado")
				var TxtEstado = document.getElementById("TxtEstado")
				var TxtMsg = document.getElementById("TxtMsg")
				
				if( TxtNome.value == "" ){
					alert( "Preencha o nome" )
					TxtNome.focus()
					return false
				}
				
				if( TxtEmail.value == "" ){
					alert( "Preencha o email" )
					TxtEmail.focus()
					return false
				}
				
				if( TxtEmail.value.indexOf( "@" ) == -1 || TxtEmail.value.indexOf( "." ) == -1  ){
					alert( "email inválido" )
					TxtEmail.focus()
					return false
				}
				
				if( TxtConc.value == "" ){
					alert( "Preencha o endereço" )
					TxtConc.focus()
					return false
				}
				
				if( TxtCidade.value == "" ){
					alert( "Preencha a cidade" )
					TxtCidade.focus()
					return false
				}
				
				if( TxtEstado.value == "" ){
					alert( "Preencha o estado" )
					TxtEstado.focus()
					return false
				}
				
				if( TxtMsg.value == "" ){
					alert( "Preencha a mensagem" )
					TxtMsg.focus()
					return false
				}
				
				return true
			}
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout" bgcolor="#e8e8e8">
		<form id="Form1" method="post" onsubmit="return validate()" runat="server">
			<TABLE id="Table1" width="46%" align="left" border="0">
				<TR>
					<TD align="center" width="100%" colSpan="2" height="20"><asp:label id="Label1" runat="server" ForeColor="#404040" Font-Bold="True" Font-Names="Verdana"
							Font-Size="X-Small">Contato</asp:label></TD>
				</TR>
				<TR>
					<TD align="right" width="30%"><FONT face="Arial" size="1"><B>Nome:</B></FONT></TD>
					<TD width="70%"><asp:textbox id="TxtNome" runat="server" Width="232px"></asp:textbox></TD>
				</TR>
				<TR>
					<TD align="right" width="30%"><FONT face="Arial" size="1"><B>e-mail:</B></FONT></TD>
					<TD width="70%"><asp:textbox id="TxtEmail" runat="server" Width="232px"></asp:textbox></TD>
				</TR>
				<TR>
					<TD align="right" width="30%"><FONT face="Arial" size="1"><B>Endereço:</B></FONT></TD>
					<TD width="70%"><asp:textbox id="TxtConc" runat="server" Width="232px"></asp:textbox></TD>
				</TR>
				<TR>
					<TD align="right" width="30%"><FONT face="Arial" size="1"><B>Cidade:</B></FONT></TD>
					<TD width="70%"><asp:textbox id="TxtCidade" runat="server" Width="232px"></asp:textbox></TD>
				</TR>
				<TR>
					<TD align="right" width="30%"><FONT face="Arial" size="1"><B>Estado:</B></FONT></TD>
					<TD width="70%"><asp:textbox id="TxtEstado" runat="server" Width="32px"></asp:textbox></TD>
				</TR>
				<TR>
					<TD align="right" width="30%"><FONT face="Arial" size="1"><B>Mensagem:</B></FONT></TD>
					<TD width="70%"><asp:textbox id="TxtMsg" runat="server" Width="232px" Height="70px" TextMode="MultiLine"></asp:textbox></TD>
				</TR>
				<TR>
					<TD align="center" width="100%" colSpan="2" height="50">&nbsp;&nbsp;&nbsp;
						<asp:button id="BtEnviar" runat="server" Text="Enviar" Width="109px"></asp:button>&nbsp;</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
