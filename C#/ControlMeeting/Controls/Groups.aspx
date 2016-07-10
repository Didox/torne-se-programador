<%@ Page language="c#" Codebehind="Groups.aspx.cs" AutoEventWireup="false" Inherits="Manager.Groups1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Groups</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/Geral.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="../Js/ObjectsIframe.js"></script>
		<script language="javascript">
		function formConfig( id,paran )
		{
			window.location="Groups.aspx?CommandName=Config&id=" + id + "&paran=" + paran
		}
		
		function formValidate( id )
		{
			if (confirm('Confirma exclusão do grupo ? '))
				window.location="Groups.aspx?CommandName=Exclude&id="+id
		}		
		
		function formAlter( id )
		{
			window.location="Groups.aspx?CommandName=Alter&id="+id
		}
						
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server" onsubmit="checkedAll( 'lstIAdd' );checkedAll( 'lstIAddUsers' )">
			<TABLE borderColor="#b0000e" height="100%" cellSpacing="0" cellPadding="0" width="600"
				border="0">
				<TR>
					<TD vAlign="top" width="85%">&nbsp;
						<TABLE id="Table1" cellSpacing="2" cellPadding="2" width="100%" border="0">
							<TR id="tbPesq" runat="server">
								<TD>
									<fieldset class="fieldSet" align="center"><legend class="legendSectionBanner" id="legend" runat="server"><asp:label id="LblTitPesq" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
												ForeColor="black">Pesquisar Groups</asp:label></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="600" border="0">
											<TR>
												<TD style="HEIGHT: 23px" align="left" colSpan="2"><asp:button id="btnIncluir" runat="server" CssClass="botao" Text="Incluir Novo"></asp:button></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 19px" width="100">&nbsp;&nbsp;
													<asp:label id="lblNome" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Nome:</asp:label></TD>
												<TD style="HEIGHT: 19px" width="80%"><asp:textbox id="txtDescription" runat="server" CssClass="campos" Width="255px"></asp:textbox></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 138px; HEIGHT: 17px" align="center"></TD>
												<td style="HEIGHT: 17px"><asp:button id="btnProcurar" runat="server" CssClass="botao" Text="Procurar"></asp:button></td>
											</TR>
											<TR>
												<TD colSpan="2"></TD>
											</TR>
										</TABLE>
									</fieldset>
									<fieldset class="fieldSet" align="center"><legend class="legend" id="Legend1" runat="server"><asp:label id="Label1" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
												ForeColor="Black">Pesquisar Groups</asp:label></legend>
										<asp:datagrid id="dgGroups" runat="server" Font-Size="XX-Small" Font-Names="Verdana" ForeColor="white"
											Width="100%" PageSize="3" EnableClientSort="True" SmartClientRendering="True" EnableColumnDrag="True"
											CellPadding="0" BorderColor="#F0F0F0" BorderWidth="4px" BackColor="white" AutoGenerateColumns="False">
											<FooterStyle Font-Bold="True" HorizontalAlign="Right" BackColor="#F0F0F0"></FooterStyle>
											<HeaderStyle Font-Bold="True" BackColor="#F0F0F0"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn>
													<HeaderStyle Width="80%"></HeaderStyle>
													<ItemTemplate>
														
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<a href='javascript:formConfig(<%# DataBinder.Eval(Container.DataItem, "Key") %>,0)' >
															<img alt="Adicionar Pastas" src="../imagens/dirFechadoSemMais.gif" border="0"></a>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<a href='javascript:formConfig(<%# DataBinder.Eval(Container.DataItem, "Key") %>,1)' >
															<img alt="Adicionar Usuarios" src="../imagens/user.gif" border="0"></a>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<a href='javascript:formAlter(<%# DataBinder.Eval(Container.DataItem, "Key") %>)' ><img src="../imagens/EditarItem.jpg" alt="Alterar" border="0"></a>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<a href='javascript:formValidate(<%# DataBinder.Eval(Container.DataItem, "Key") %>)' >
															<img alt="Excluir" src="../imagens/delete.gif" border="0"></a>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
											<PagerStyle Font-Bold="True" HorizontalAlign="Right" PageButtonCount="5" Mode="NumericPages"></PagerStyle>
										</asp:datagrid>
									</fieldset>
								</TD>
							</TR>
							<TR id="tbInclu" vAlign="top" runat="server">
								<TD>
									<fieldset class="fieldset" align="center"><legend class="legend" id="Legend2" runat="server"><asp:label id="lblTitIncluir" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
												ForeColor="black">Salvar Grupos</asp:label></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="600" border="0">
											<TR>
												<TD style="HEIGHT: 22px" width="143">&nbsp;
													<asp:label id="lbliNome" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Nome:</asp:label></TD>
												<TD style="HEIGHT: 22px"><asp:textbox id="txtIDescription" runat="server" CssClass="campos" Width="255px"></asp:textbox><asp:requiredfieldvalidator id="rfiDesciption" runat="server" ControlToValidate="txtIDescription" ErrorMessage="Preencha Corretamanete">Preencha Corretamanete</asp:requiredfieldvalidator><asp:textbox id="txtId" runat="server" CssClass="campos" Width="8px" Visible="False"></asp:textbox></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" align="center"></TD>
												<td style="HEIGHT: 23px"><asp:button id="btnInclu" runat="server" CssClass="botao" Text="Salvar"></asp:button><asp:button id="btniVoltar" runat="server" CssClass="botao" Text="<<" Width="80px" CausesValidation="False"></asp:button></td>
											</TR>
										</TABLE>
									</fieldset>
								</TD>
							</TR>
							<TR id="tbConfig" runat="server">
								<TD>
									<fieldset class="fieldSet"><legend class="legend" id="Legend3" runat="server"><asp:label id="Label2" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
												Font-Size="XX-Small">Configurações</asp:label></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="600" border="0">
											<TR>
												<TD style="HEIGHT: 22px" width="45%">
													<asp:label id="Label3" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Pastas:</asp:label><asp:listbox id="lstIFolders" runat="server" CssClass="campos" Width="100%" Height="100px" SelectionMode="Multiple"></asp:listbox></TD>
												<TD align="center" width="10%"><INPUT class="botao" style="WIDTH: 43px; HEIGHT: 17px" type="button" onclick="AddItem('lstIFolders','lstIAdd')"
														value=">>"><br>
													<INPUT class="botao" style="WIDTH: 43px; HEIGHT: 17px" type="button" onclick="AddItem('lstIAdd','lstIFolders')"
														value="<<">
												</TD>
												<TD style="HEIGHT: 22px" width="45%">
													<asp:label id="Label7" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Adicionados:</asp:label>
													<SELECT class="campos" id="lstIAdd" multiple runat="server" style="WIDTH:100%; HEIGHT:100px"
														size="2" NAME="lstIAdd">
													</SELECT></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 18px" align="center" width="50%" colSpan="3"><asp:button id="btnSave" runat="server" Text="Salvar" CssClass="botao"></asp:button>
													<asp:button id="btnCVoltar" runat="server" CssClass="botao" Text="<<" Width="80px" CausesValidation="False"></asp:button></TD>
											</TR>
										</TABLE>
									</fieldset>
								</TD>
							</TR>
							<TR id="tbConfigUser" runat="server">
								<TD>
									<fieldset class="fieldSet"><legend class="legend" id="Legend4" runat="server"><asp:label id="Label4" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
												Font-Size="XX-Small">Configurações</asp:label></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="600" border="0">
											<TR>
												<TD style="HEIGHT: 22px" width="45%">
													<asp:label id="Label5" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Usuários:</asp:label><asp:listbox id="lstIUsers" runat="server" CssClass="campos" Width="100%" Height="100px" SelectionMode="Multiple"></asp:listbox></TD>
												<TD align="center" width="10%"><INPUT class="botao" style="WIDTH: 43px; HEIGHT: 17px" type="button" onclick="AddItem('lstIUsers','lstIAddUsers')"
														value=">>"><br>
													<INPUT class="botao" style="WIDTH: 43px; HEIGHT: 17px" type="button" onclick="AddItem('lstIAddUsers','lstIUsers')"
														value="<<">
												</TD>
												<TD style="HEIGHT: 22px" width="45%">
													<asp:label id="Label6" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Adicionados:</asp:label>
													<SELECT class="campos" id="lstIAddUsers" multiple runat="server" style="WIDTH:100%; HEIGHT:100px"
														size="2" NAME="lstIAdd">
													</SELECT></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 18px" align="center" width="50%" colSpan="3"><asp:button id="btnSaveUsers" runat="server" Text="Salvar" CssClass="botao"></asp:button>
													<asp:button id="btnCVoltarUsers" runat="server" CssClass="botao" Text="<<" Width="80px" CausesValidation="False"></asp:button></TD>
											</TR>
										</TABLE>
									</fieldset>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
