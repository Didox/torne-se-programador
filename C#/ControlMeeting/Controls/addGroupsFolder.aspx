<%@ Page language="c#" Codebehind="addGroupsFolder.aspx.cs" AutoEventWireup="false" Inherits="ControlMeeting.Controls.addGroupsFolder" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>addGroupsFolder</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../css/Geral.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="../Js/ObjectsIframe.js"></script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server" onsubmit="checkedAll( 'lstIAddGroups' )">
			<table cellpadding="0" cellspacing="0" border="0">
				<TR>
					<TD>
						<fieldset class="fieldSet"><legend class="legend" id="Legend4" runat="server"><asp:label id="Label4" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
									Font-Size="XX-Small">Configurações</asp:label></legend>
							<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="600" border="0">
								<TR>
									<TD style="HEIGHT: 22px" width="45%">
										<asp:label id="Label5" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
											Font-Size="XX-Small">Grupos:</asp:label><asp:listbox id="lstIGroups" runat="server" CssClass="campos" Width="100%" Height="100px" SelectionMode="Multiple"></asp:listbox></TD>
									<TD align="center" width="10%"><INPUT class="botao" style="WIDTH: 43px; HEIGHT: 17px" type="button" onclick="AddItem('lstIGroups','lstIAddGroups')"
											value=">>"><br>
										<INPUT class="botao" style="WIDTH: 43px; HEIGHT: 17px" type="button" onclick="AddItem('lstIAddGroups','lstIGroups')"
											value="<<">
									</TD>
									<TD style="HEIGHT: 22px" width="45%">
										<asp:label id="Label6" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
											Font-Size="XX-Small">Adicionados:</asp:label>
										<SELECT class="campos" id="lstIAddGroups" multiple runat="server" style="WIDTH:100%; HEIGHT:100px"
											size="2" NAME="lstIAdd">
										</SELECT></TD>
								</TR>
								<TR>
									<TD style="HEIGHT: 18px" align="center" width="50%" colSpan="3"><asp:button id="btnSaveGroups" runat="server" Text="Salvar" CssClass="botao"></asp:button></TD>
								</TR>
							</TABLE>
						</fieldset>
					</TD>
				</TR>
			</table>
		</form>
	</body>
</HTML>
