<%@ Page language="c#" Codebehind="fieldsForm.aspx.cs" AutoEventWireup="false" Inherits="ControlMeeting.Controls.fieldsForm" %>
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
			if (confirm('Confirma exclusão do campo ? '))
				window.location="fieldsForm.aspx?CommandName=Exclude&id="+id
		}
		
		function configOrdens()
		{
			window.location="fieldsForm.aspx?configOrdens=true"
		}
		
		function formConfig( id )
		{
			window.location="fieldsForm.aspx?CommandName=Config&id=" + id
		}
		
		function formAlter( id )
		{
			window.location="fieldsForm.aspx?CommandName=Alter&id="+id
		}
		
		function enableSize(){
			var obj = document.getElementById("ddlTypeField")
			if( obj ){
				if( obj.value == 5 ) 
					document.getElementById("tbTamanho").style.display = "block"
				else{
					document.getElementById("tbTamanho").style.display = "none" 
					if( obj.value == 3 ){
						document.getElementById("ddlMask").value = 5
					}
					else if( obj.value == 9 ){
						document.getElementById("ddlMask").value = 6
					}
					else if( obj.value == 7 ){
						document.getElementById("ddlMask").value = 8
					}
				}
				heightIframe()			
			}
		}
		
		function enableVarchar(){
			var obj = document.getElementById("ddlObject")
			if( obj ){
				var value  = obj.value
				var field = document.getElementById("ddlTypeField")
				document.getElementById("tbMasck").style.display = "none"
				
				switch( parseInt(value) ){
					case 1:
						if( parseInt(field.value) == 4 ){
							alert( "Para o tipo textbox não é permitido valor text" )
							field.value = 5
							enableSize()
							return false
						}
						document.getElementById("tbMasck").style.display = "block"
						break
					case 2:
						if( parseInt(field.value) != 5 ){
							alert( "Para o tipo radiobox é permitidos somente varchar" )
							field.value = 5
							enableSize()
							return false
						}
						break
					case 3:
						if( parseInt(field.value) != 5 ){
							alert( "Para o tipo checkbox é permitidos somente varchar" )
							field.value = 5
							enableSize()
							return false
						}
						break
					case 4:
						if( parseInt(field.value) != 5 ){
							alert( "Para o tipo combobox é permitidos somente varchar" )
							field.value = 5
							enableSize()
							return false
						}
						break
					case 5:
						if( parseInt(field.value) != 4 ){
							alert( "Para o tipo textboxmult é permitidos somente text" )
							field.value = 4
							return false
						}
						break
					case 6:
						if( parseInt(field.value) != 5 ){
							alert( "Para o tipo listbox é permitidos somente varchar" )
							field.value = 5
							enableSize()
							return false
						}
						break
					case 7:
						if( parseInt(field.value) != 5 ){
							alert( "Para o tipo filebox é permitidos somente varchar" )
							field.value = 5
							enableSize()
							return false
						}
						break
				}
				
				enableSize()
				return true
			}
		}	
						
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form2" method="post" onsubmit="return enableVarchar();" runat="server">
			<TABLE borderColor="whitesmoke" height="100" cellSpacing="0" cellPadding="0" width="600"
				border="0">
				<TR>
					<TD vAlign="top" width="85%">&nbsp;
						<TABLE id="Table1" cellSpacing="2" cellPadding="2" width="100%" border="0">
							<TR id="tbPesq" runat="server">
								<TD>
									<fieldset class="fieldSet" align="center"><legend id="legend" runat="server"><asp:label id="Label10" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
												ForeColor="Black"> Campos do formulário</asp:label></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="600" border="0">
											<TR>
												<td style="HEIGHT: 17px">
													&nbsp;<asp:button id="btnIncluir" runat="server" CssClass="botao" Text="Incluir Novo"></asp:button>&nbsp;
													<INPUT type="button" onclick="configOrdens()" value="Ordenar campos">&nbsp;
													<asp:button id="Button1" runat="server" Width="80px" CssClass="botao" Text="<< Forms" CausesValidation="False"></asp:button>
												</td>
											</TR>
											<TR>
												<TD colSpan="2"></TD>
											</TR>
										</TABLE>
									</fieldset>
									<fieldset class="fieldSet" align="center"><legend class="legend" id="Legend1" runat="server"><asp:label id="Label1" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
												ForeColor="Black"> Resultado</asp:label></legend>
										<asp:datagrid id="dgGroups" runat="server" ForeColor="White" Font-Names="Verdana" Font-Size="XX-Small"
											Width="100%" AutoGenerateColumns="False" BackColor="White" BorderWidth="4px" BorderColor="#F0F0F0"
											CellPadding="0" EnableColumnDrag="True" SmartClientRendering="True" EnableClientSort="True"
											PageSize="3">
											<FooterStyle Font-Bold="True" HorizontalAlign="Right" BackColor="#F0F0F0"></FooterStyle>
											<HeaderStyle Font-Bold="True" BackColor="#F0F0F0"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="Nome">
													<HeaderStyle Width="60%"></HeaderStyle>
													<ItemTemplate>
														<%# ((Business.BsField)DataBinder.Eval(Container.DataItem, "Value")).Name %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Obrigat&#243;rio">
													<HeaderStyle Width="15%"></HeaderStyle>
													<ItemTemplate>
														<%# ((Business.BsField)DataBinder.Eval(Container.DataItem, "Value")).Compulsory %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Preview">
													<HeaderStyle Width="15%"></HeaderStyle>
													<ItemTemplate>
														<%# ((Business.BsField)DataBinder.Eval(Container.DataItem, "Value")).Preview %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Detalhe">
													<HeaderStyle Width="15%"></HeaderStyle>
													<ItemTemplate>
														<%# ((Business.BsField)DataBinder.Eval(Container.DataItem, "Value")).Detail %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Exceção">
													<HeaderStyle Width="15%"></HeaderStyle>
													<ItemTemplate>
														<%# ((Business.BsField)DataBinder.Eval(Container.DataItem, "Value")).Exceptions %>
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
													<HeaderStyle Width="20"></HeaderStyle>
													<ItemTemplate>
														<a href='ItensFields.aspx?idField=<%# DataBinder.Eval(Container.DataItem, "Key") %>' >
															<img src="../imagens/addValue.gif" border="0" alt="Adicionar valores"> </a>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="20"></HeaderStyle>
													<ItemTemplate>
														<a href='javascript:formAlter(<%# DataBinder.Eval(Container.DataItem, "Key") %>)' ><img src="../imagens/EditarItem.jpg" border="0" alt="Alterar">
														</a>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="20"></HeaderStyle>
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
							<TR id="tbConfigGroup" runat="server">
								<TD>
									<fieldset class="fieldSet"><legend class="legend" id="Legend4" runat="server"><asp:label id="Label12" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
												Font-Size="XX-Small">Configurações</asp:label></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="600" border="0">
											<TR>
												<TD style="HEIGHT: 22px" width="45%">
													<asp:label id="Label13" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Grupos:</asp:label><asp:listbox id="lstIGroups" runat="server" CssClass="campos" Width="100%" Height="100px" SelectionMode="Multiple"></asp:listbox></TD>
												<TD align="center" width="10%"><INPUT class="botao" style="WIDTH: 43px; HEIGHT: 17px" type="button" onclick="AddItem('lstIGroups','lstIAddGroups')"
														value=">>"><br>
													<INPUT class="botao" style="WIDTH: 43px; HEIGHT: 17px" type="button" onclick="AddItem('lstIAddGroups','lstIGroups')"
														value="<<">
												</TD>
												<TD style="HEIGHT: 22px" width="45%">
													<asp:label id="Label14" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
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
							<TR id="tbConfigOrdens" runat="server">
								<TD>
									<fieldset class="fieldSet"><legend class="legend" id="Legend3" runat="server"><asp:label id="Label15" runat="server" ForeColor="black" Font-Bold="True" Font-Names="Verdana"
												Font-Size="XX-Small">Ordenar campos</asp:label></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="600" border="0">
											<TR>
												<TD style="HEIGHT: 22px" width="10%" align="center">
													<asp:listbox id="ltbOrdens" runat="server" CssClass="campos" Width="300" Height="100px" SelectionMode="Multiple"></asp:listbox><br>
													<INPUT class="botao" style="WIDTH: 43px; HEIGHT: 17px" type="button" onclick="OrdenaItem('ltbOrdens',1)"
														value="Cima"><br>
													<INPUT class="botao" style="WIDTH: 43px; HEIGHT: 17px" type="button" onclick="OrdenaItem('ltbOrdens',0)"
														value="Baixo"><br>
													<br>
												</TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 18px" align="center" width="50%" colSpan="3"><asp:button id="btnSalveOrder" runat="server" Text="Salvar" CssClass="botao"></asp:button>
													<asp:button id="btnVolteOrder" runat="server" CssClass="botao" Text="<<" Width="80px" CausesValidation="False"></asp:button></TD>
											</TR>
										</TABLE>
									</fieldset>
								</TD>
							</TR>
							<TR id="tbInclu" vAlign="top" runat="server">
								<TD>
									<fieldset class="fieldset" align="center"><legend class="legend" id="Legend2" runat="server"><asp:label id="lblTitIncluir" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
												ForeColor="Black"> Salvar</asp:label></legend>
										<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="600" border="0">
											<TR>
												<TD style="HEIGHT: 29px" width="143">&nbsp;
													<asp:label id="lbliNome" runat="server" Font-Size="XX-Small" Font-Names="Verdana" Font-Bold="True"
														ForeColor="Black">Nome:</asp:label></TD>
												<TD style="HEIGHT: 29px"><asp:textbox id="txtIDescription" runat="server" CssClass="campos" Width="255px" MaxLength="50"></asp:textbox><asp:requiredfieldvalidator id="rfiDesciption" runat="server" ControlToValidate="txtIDescription" ErrorMessage="Preencha Corretamanete">Preencha Corretamanete</asp:requiredfieldvalidator><asp:textbox id="txtId" runat="server" CssClass="campos" Width="8px" Visible="False"></asp:textbox></TD>
											</TR>
											<TR id="tbTamanho" runat="server" style="DISPLAY:none">
												<TD style="HEIGHT: 22px" width="143">&nbsp;
													<asp:label id="Label5" runat="server" ForeColor="Black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Tamanho:</asp:label></TD>
												<TD style="HEIGHT: 22px">
													<asp:textbox id="txtSize" runat="server" CssClass="campos" Width="72px" MaxLength="5"></asp:textbox></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 22px" width="143">&nbsp;&nbsp;<asp:label id="Label2" runat="server" ForeColor="Black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Tipo campo:</asp:label></TD>
												<TD style="HEIGHT: 22px">
													<asp:DropDownList onChange="enableSize( this.value )" id="ddlTypeField" runat="server"></asp:DropDownList></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 22px" width="143">&nbsp;&nbsp;<asp:label id="Label3" runat="server" ForeColor="Black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Tipo de objeto:</asp:label></TD>
												<TD style="HEIGHT: 22px">
													<asp:DropDownList onChange="enableVarchar()" id="ddlObject" runat="server"></asp:DropDownList></TD>
											</TR>
											<TR id="tbMasck" runat="server" style="DISPLAY:block">
												<TD style="HEIGHT: 21px" width="143">&nbsp;
													<asp:label id="Label4" runat="server" ForeColor="Black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Tipo de mascara:</asp:label></TD>
												<TD style="HEIGHT: 21px">
													<asp:DropDownList id="ddlMask" runat="server"></asp:DropDownList></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 21px" width="143">&nbsp;
													<asp:label id="Label6" runat="server" ForeColor="Black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Posição:</asp:label></TD>
												<TD style="HEIGHT: 21px">
													<asp:DropDownList id="ddlPosicao" runat="server">
														<asp:ListItem Value="0">0</asp:ListItem>
													</asp:DropDownList></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 21px" width="143">&nbsp;
													<asp:label id="Label7" runat="server" ForeColor="Black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Obrigatório:</asp:label></TD>
												<TD style="HEIGHT: 21px">
													<asp:RadioButtonList id="rdlCompulsory" runat="server" RepeatDirection="Horizontal">
														<asp:ListItem Value="true">Sim</asp:ListItem>
														<asp:ListItem Value="false">N&#227;o</asp:ListItem>
													</asp:RadioButtonList></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 21px" width="143">&nbsp;
													<asp:label id="Label8" runat="server" ForeColor="Black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Mostrar na Tabela:</asp:label></TD>
												<TD style="HEIGHT: 21px">
													<asp:RadioButtonList id="rdlPreview" runat="server" RepeatDirection="Horizontal">
														<asp:ListItem Value="true">Sim</asp:ListItem>
														<asp:ListItem Value="false">N&#227;o</asp:ListItem>
													</asp:RadioButtonList></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 21px" width="143">&nbsp;
													<asp:label id="Label9" runat="server" ForeColor="Black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Mostrar no preview</asp:label></TD>
												<TD style="HEIGHT: 21px">
													<asp:RadioButtonList id="rdlDetail" runat="server" RepeatDirection="Horizontal">
														<asp:ListItem Value="true">Sim</asp:ListItem>
														<asp:ListItem Value="false">N&#227;o</asp:ListItem>
													</asp:RadioButtonList></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 21px" width="143">&nbsp;
													<asp:label id="Label11" runat="server" ForeColor="Black" Font-Bold="True" Font-Names="Verdana"
														Font-Size="XX-Small">Este campo pode ser<br>&nbsp;alterado por outros<br>&nbsp;usuários?</asp:label></TD>
												<TD style="HEIGHT: 21px">
													<asp:RadioButtonList id="rdlExceptions" runat="server" RepeatDirection="Horizontal">
														<asp:ListItem Value="true">Sim</asp:ListItem>
														<asp:ListItem Value="false">N&#227;o</asp:ListItem>
													</asp:RadioButtonList></TD>
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
			<script>
				enableSize();
			</script>
		</form>
	</body>
</HTML>
