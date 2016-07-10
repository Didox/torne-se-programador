<%@ Page language="c#" Codebehind="ItensFields.aspx.cs" AutoEventWireup="false" Inherits="ControlMeeting.Controls.ItensFields" %>
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
				
		function formValidate( id )
		{
			if (confirm('Confirma exclusão do item ? '))
				window.location="ItensFields.aspx?CommandName=Exclude&id="+id
		}
		
		function formAlter( id )
		{
			window.location="ItensFields.aspx?CommandName=Alter&id="+id
		}
						
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form2" method="post" runat="server">
			<TABLE borderColor="whitesmoke" height="100" cellSpacing="0" cellPadding="0" width="600"
				border="0">
				<TR>
					<TD vAlign="top" width="85%">&nbsp;
						<TABLE id="Table1" cellSpacing="2" cellPadding="2" width="100%" border="0">
							<TR id="tbPesq" runat="server">
								<TD>
									<fieldset class="fieldSet" align="center"><legend class="legendSectionBanner" id="legend" runat="server"></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="600" border="0">
											<TR>
												<td style="HEIGHT: 17px">&nbsp;<asp:button id="btnIncluir" runat="server" CssClass="botao" Text="Incluir Novo"></asp:button>&nbsp;
													<asp:button id="Button1" runat="server" Width="80px" CssClass="botao" Text="<< Campos" CausesValidation="False"></asp:button></td>
											</TR>
											<TR>
												<TD colSpan="2"></TD>
											</TR>
										</TABLE>
									</fieldset>
									<fieldset class="fieldSet" align="center"><legend class="legend" id="Legend1" runat="server"><asp:label id="Label1" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
												ForeColor="Black"> Resultado</asp:label></legend>
										<asp:datagrid id="dgGroups" runat="server" Font-Size="XX-Small" Font-Names="Verdana" ForeColor="White"
											Width="100%" PageSize="3" EnableClientSort="True" SmartClientRendering="True" EnableColumnDrag="True"
											CellPadding="0" BorderColor="#F0F0F0" BorderWidth="4px" BackColor="White" AutoGenerateColumns="False">
											<FooterStyle Font-Bold="True" HorizontalAlign="Right" BackColor="#F0F0F0"></FooterStyle>
											<HeaderStyle Font-Bold="True" BackColor="#F0F0F0"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="Nome">
													<HeaderStyle Width="80%"></HeaderStyle>
													<ItemTemplate>
														<%# ((Business.BsItemField)DataBinder.Eval(Container.DataItem, "Value")).Value %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<a href='javascript:formAlter(<%# DataBinder.Eval(Container.DataItem, "Key") %>)' >
															<img src="../imagens/EditarItem.jpg" border="0" alt="Alterar"> </a>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<a href='javascript:formValidate(<%# DataBinder.Eval(Container.DataItem, "Key") %>)' >
															<img src="../imagens/delete.gif" border="0" alt="Excluir"> </a>
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
									<fieldset class="fieldset" align="center">
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="600" border="0">
											<TR>
												<TD style="HEIGHT: 22px" width="143">&nbsp;
													<asp:label id="lbliNome" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="Black">Nome:</asp:label></TD>
												<TD style="HEIGHT: 22px"><asp:textbox id="txtIDescription" runat="server" CssClass="campos" Width="255px"></asp:textbox><asp:requiredfieldvalidator id="rfiDesciption" runat="server" ControlToValidate="txtIDescription" ErrorMessage="Preencha Corretamanete">Preencha Corretamanete</asp:requiredfieldvalidator><asp:textbox id="txtId" runat="server" CssClass="campos" Width="8px" Visible="False"></asp:textbox></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" align="center"></TD>
												<td style="HEIGHT: 23px"><asp:button id="btnInclu" runat="server" CssClass="botao" Text="Salvar" Width="64px"></asp:button>&nbsp;<asp:button id="btniVoltar" runat="server" CssClass="botao" Text="<<" Width="80px" CausesValidation="False"></asp:button></td>
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
