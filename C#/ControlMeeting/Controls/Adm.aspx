<%@ Page language="c#" Codebehind="adm.aspx.cs" AutoEventWireup="false" Inherits="ControlMeeting.Controls.adm" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Default2</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/Geral.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="../Js/ObjectsIframe.js"></script>
		<script language="javascript">
		
		function formConfig( id )
		{
			window.location="Adm.aspx?CommandName=Config&id=" + id
		}
		
		function formValidate( id )
		{
			if ( confirm("Confirma exclusão do usuario ? ") )
				window.location="adm.aspx?CommandName=Exclude&id=" + id
		}
		function formAlter( id )
		{
			window.location="adm.aspx?CommandName=Alter&id="+id
		}
		
		function desable()	
		{
			if( document.getElementById('tbs').style.display == 'none' ){
				document.getElementById('tbs').style.display = 'block';
				document.getElementById('tbcs').style.display = 'block';
				document.getElementById('Opcao').innerHTML= '<a href=javascript:desable(); ><font color=#ffffff><b>( - )</b></font></a>';
			}
			else{
				document.getElementById('tbs').style.display = 'none';
				document.getElementById('tbcs').style.display = 'none';
				document.getElementById('Opcao').innerHTML= '<a href=javascript:desable();><font color=#ffffff><b>( + )</b></font></a>';
			}
		}
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server" onsubmit="checkedAll( 'lstIAddGroups' )">
			<TABLE borderColor="#b0000e" height="100%" cellSpacing="0" cellPadding="0" width="780"
				border="0">
				<TR>
					<TD vAlign="top" width="85%">&nbsp;
						<TABLE id="Table1" cellSpacing="2" cellPadding="2" width="100%" border="0">
							<TR id="tbPesq" runat="server">
								<TD vAlign="top">
									<fieldset class="fieldset" align="center"><legend class="legend" id="legendSection1" runat="server"><asp:label id="LblTitPesq" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
												ForeColor="black">Pesquisar Usuário</asp:label></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="HEIGHT: 24px" align="left" colSpan="2"><asp:button id="btnIncluir" runat="server" CssClass="botao" Text="Incluir Novo"></asp:button></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 17px" width="143"><asp:label id="lblName" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Nome Usuário:</asp:label></TD>
												<TD style="HEIGHT: 17px"><asp:textbox id="txtPName" runat="server" CssClass="campos" Width="255px"></asp:textbox></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 19px" width="143"><asp:label id="lblLogin" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Login:</asp:label></TD>
												<TD style="HEIGHT: 19px"><asp:textbox id="txtPLogin" runat="server" CssClass="campos"></asp:textbox></TD>
											</TR>
											<TR>
												<TD align="center"></TD>
												<td><asp:button id="btnProcurar" runat="server" CssClass="botao" Text="Procurar"></asp:button></td>
											</TR>
											<TR>
												<TD colSpan="2"></TD>
											</TR>
										</TABLE>
									</fieldset>
									<fieldset class="fieldset" align="center"><legend class="legend" id="Legend1" runat="server"><asp:label id="Label1" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
												ForeColor="black">Registers</asp:label></legend>
										<asp:datagrid id="dgUsers" runat="server" Font-Size="XX-Small" Font-Names="Verdana" ForeColor="white"
											Width="100%" AutoGenerateColumns="False" BackColor="white" BorderWidth="4px" BorderColor="#F0F0F0"
											CellPadding="0" EnableColumnDrag="True" SmartClientRendering="True" EnableClientSort="True"
											PageSize="3">
											<FooterStyle Font-Bold="True" HorizontalAlign="Right" BackColor="#F0F0F0"></FooterStyle>
											<HeaderStyle Font-Bold="True" BackColor="#F0F0F0"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="Nome">
													<HeaderStyle Width="60%"></HeaderStyle>
													<ItemTemplate>
														
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Login">
													<HeaderStyle Width="30%"></HeaderStyle>
													<ItemTemplate>
														
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<a href='javascript:formConfig(<%# DataBinder.Eval(Container.DataItem, "Key") %>)' >
															<img alt="Adicionar Grupos" src="../imagens/groups.gif" border="0"></a>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<a href='javascript:formAlter(<%# DataBinder.Eval(Container.DataItem, "Key") %>)' ><img alt="Alterar" src="../imagens/EditarItem.jpg" border="0"></a>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<a href='javascript:formValidate(<%# DataBinder.Eval(Container.DataItem, "Key") %>)' >
															<img src="../imagens/delete.gif" alt="Excluir" border="0"></a>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
											<PagerStyle Font-Bold="True" HorizontalAlign="Right" PageButtonCount="5" Mode="NumericPages"></PagerStyle>
										</asp:datagrid>
									</fieldset>
								</TD>
							</TR>
							<FIELDSET></FIELDSET>
							<TR id="tbInclu" vAlign="top" runat="server">
								<TD>
									<fieldset class="fieldset" align="center"><legend class="legend" id="Legend2" runat="server"><asp:label id="lblIncluirUser" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
												ForeColor="black">Incluir User</asp:label></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="HEIGHT: 20px" width="143"><asp:label id="lblIName" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Nome Usuário:</asp:label></TD>
												<TD style="HEIGHT: 20px"><asp:textbox id="txtIName" runat="server" CssClass="campos" Width="255px"></asp:textbox><asp:requiredfieldvalidator id="rfiName" runat="server" ControlToValidate="txtIName" ErrorMessage="Preencha Corretamanete">Preencha Corretamanete</asp:requiredfieldvalidator></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" width="143"><asp:label id="lblEmail" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Email:</asp:label></TD>
												<TD style="HEIGHT: 23px"><asp:textbox id="txtIEmail" runat="server" CssClass="campos"></asp:textbox></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" width="143">
													<asp:label id="Label2" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Administrador:</asp:label></TD>
												<TD style="HEIGHT: 23px">
													<asp:RadioButtonList id="rdlAdm" runat="server" RepeatDirection="Horizontal">
														<asp:ListItem Value="true">Sim</asp:ListItem>
														<asp:ListItem Value="false" Selected="True">N&#227;o</asp:ListItem>
													</asp:RadioButtonList></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" width="143"><asp:label id="lblIlogin" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Login:</asp:label></TD>
												<TD style="HEIGHT: 23px"><asp:textbox id="txtILogin" runat="server" CssClass="campos"></asp:textbox><asp:requiredfieldvalidator id="rfIlogin" runat="server" ControlToValidate="txtIlogin" ErrorMessage="Preencha Corretamanete">Preencha Corretamanete</asp:requiredfieldvalidator></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" width="143"><asp:label id="lblIsenha" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Senha:</asp:label></TD>
												<TD style="HEIGHT: 23px"><asp:textbox id="txtISenha" runat="server" CssClass="campos" Width="156px" TextMode="Password"></asp:textbox><asp:requiredfieldvalidator id="rfisenha" runat="server" ControlToValidate="txtiSenha" ErrorMessage="Preencha Corretamanete">Preencha Corretamanete</asp:requiredfieldvalidator></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 20px" width="143"><asp:label id="lblIcSenha" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">C. Senha:</asp:label></TD>
												<TD style="HEIGHT: 20px"><asp:textbox id="txtICSenha" runat="server" CssClass="campos" Width="156px" TextMode="Password"></asp:textbox><asp:comparevalidator id="cvConfere" runat="server" ControlToValidate="txticSenha" ErrorMessage="Senha não confere"
														ControlToCompare="txtiSenha">Senha não confere</asp:comparevalidator></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" align="center"></TD>
												<td style="HEIGHT: 23px"><asp:button id="btnInclu" runat="server" CssClass="botao" Text="Salvar"></asp:button><asp:button id="btnIVoltar" runat="server" CssClass="botao" Text="<<" Width="80px" CausesValidation="False"></asp:button></td>
											</TR>
											<TR>
												<TD colSpan="2"></TD>
											</TR>
										</TABLE>
									</fieldset>
								</TD>
							</TR>
							<TR id="tbAlter" vAlign="top" runat="server">
								<TD>
									<fieldset class="fieldset" align="center"><legend class="legend" id="Legend3" runat="server"><asp:label id="lblAlterUser" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
												ForeColor="black">Alterar Usuario</asp:label></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="HEIGHT: 20px" width="143"><asp:label id="lblaName" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Nome Usuário:</asp:label></TD>
												<TD style="HEIGHT: 20px"><asp:textbox id="txtAName" runat="server" CssClass="campos" Width="255px"></asp:textbox><asp:requiredfieldvalidator id="rfaName" runat="server" ControlToValidate="txtAName" ErrorMessage="Preencha Corretamanete">Preencha Corretamanete</asp:requiredfieldvalidator><asp:textbox id="txtId" runat="server" CssClass="campos" Width="16px" Visible="False"></asp:textbox></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" width="143"><asp:label id="lblaEmail" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Email:</asp:label></TD>
												<TD style="HEIGHT: 23px"><asp:textbox id="txtAEmail" runat="server" CssClass="campos"></asp:textbox></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" width="143">
													<asp:label id="Label3" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Administrador:</asp:label></TD>
												<TD style="HEIGHT: 23px">
													<asp:RadioButtonList id="rdlAdmin2" runat="server" RepeatDirection="Horizontal">
														<asp:ListItem Value="true">Sim</asp:ListItem>
														<asp:ListItem Value="false" Selected="True">N&#227;o</asp:ListItem>
													</asp:RadioButtonList></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" width="143"><asp:label id="lblalogin" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Login:</asp:label></TD>
												<TD style="HEIGHT: 23px"><asp:textbox id="txtALogin" runat="server" CssClass="campos"></asp:textbox><asp:requiredfieldvalidator id="rfalogin" runat="server" ControlToValidate="txtalogin" ErrorMessage="Preencha Corretamanete">Preencha Corretamanete</asp:requiredfieldvalidator></TD>
											</TR>
											<TR id="tbs" style="DISPLAY: none">
												<TD style="HEIGHT: 24px" width="143"><asp:label id="lblasenha" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">Senha:</asp:label></TD>
												<TD style="HEIGHT: 24px"><asp:textbox id="txtASenha" runat="server" CssClass="campos" Width="156px" TextMode="Password"></asp:textbox></TD>
											</TR>
											<TR id="tbcs" style="DISPLAY: none">
												<TD style="HEIGHT: 19px" width="143"><asp:label id="lblacSenha" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="black">C. Senha:</asp:label></TD>
												<TD style="HEIGHT: 19px"><asp:textbox id="txtACSenha" runat="server" CssClass="campos" Width="156px" TextMode="Password"></asp:textbox><asp:comparevalidator id="cvaConfere" runat="server" ControlToValidate="txtacSenha" ErrorMessage="Senha não confere"
														ControlToCompare="txtaSenha">Senha não confere</asp:comparevalidator></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 24px" align="center"></TD>
												<td style="HEIGHT: 24px"><asp:button id="btnAlterar" runat="server" CssClass="botao" Text="Salvar"></asp:button><asp:button id="btnAVoltar" runat="server" CssClass="botao" Text="<<" Width="80px" CausesValidation="False"></asp:button></td>
											</TR>
											<TR>
												<TD id="Opcao" style="HEIGHT: 24px" width="143" colSpan="2"><A href="javascript:desable();"><font color="#00000"><b>( 
																+ )</b></font></A></TD>
											</TR>
											<TR>
												<TD colSpan="2"></TD>
											</TR>
										</TABLE>
									</fieldset>
								</TD>
							</TR>
							<TR id="tbConfigGroup" runat="server">
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
												<TD style="HEIGHT: 18px" align="center" width="50%" colSpan="3"><asp:button id="btnSaveGroups" runat="server" Text="Salvar" CssClass="botao"></asp:button>
													<asp:button id="btnCVoltarGroups" runat="server" CssClass="botao" Text="<<" Width="80px" CausesValidation="False"></asp:button></TD>
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
