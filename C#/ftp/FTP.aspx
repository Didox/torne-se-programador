<%@ Page language="c#" Codebehind="FTP.aspx.cs" AutoEventWireup="false" Inherits="ftp.WebForm1" %>
<%@ Register TagPrefix="Grid" Namespace="Controle.Componentes" Assembly="Componentes" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FTP</title>
		<META http-equiv="Content-Type" content="text/html; charset=windows-1252">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script>
		function novaPasta(main,caminho)
		{
			document.getElementById("Frame").src="newdir.aspx?main="+main+"&dir="+caminho;
			//window.open("newdir.aspx?dir="+caminho,null,"height=5px,width=420px,status=no,toolbar=no,menubar=no,location=no");
			document.getElementById("env").style.display = "block";
			return false;
		}
		function VerImagem( caminho )
		{		
			window.open( 'VerImagem.aspx?path=' + caminho,null,"height=20px,width=250px,status=no,toolbar=no,menubar=no,location=no" )			
		}
		function EnviarArquivo(main,caminho)
		{
			//window.open("Up.aspx?dir="+caminho,null,"height=5px,width=420px,status=no,toolbar=no,menubar=no,location=no");
			//window.showModalDialog("Up.aspx?dir="+caminho, "", "dialogHeight:95px;dialogWidth:420px")
			document.getElementById("Frame").src="Up.aspx?main="+main+"&dir="+caminho;
			document.getElementById("env").style.display = "block";
			return false;
		}
		function SelecionarTodos()
		{
		  try{
			var f = document.Form1;
			for(x=0; x < f.elements.length; x++)
			{
				if(f.elements[x].type == "checkbox")
				{
					if(document.getElementById('Grid__ctl1_chkTodos').checked)
					{
						f.elements[x].checked = true;
					}
					else
					{						
						f.elements[x].checked = false;
					}
				}
			}
		  }
		  catch( e ){}		  
		}
			
		function ExcluirTodos()
		{
			document.getElementById("env").style.display = "none";
			doc = document.Form1;
			var qtd = 0;
							
			for ( x = 0; x < doc.elements.length; x++ )
			{
				if ( doc.elements[ x ].type == "checkbox" )
				{					
					if ( doc.elements[ x ].checked )
					{
						qtd++;
					}
				}
			}
			
			if ( qtd == 0 )
			{
				alert('Nenhum Arquivo foi Selecionado');
				return false;
			}
			else
			{
			
				if ( qtd == 1 )
				{
					mensagem = "Deseja Realmente Excluir o Arquivo Selecionado";
				}
				else
				{
					mensagem = "Deseja Realmente Excluir os " + qtd + " Arquivos Selecionados";
				}
			
			
				if ( confirm( mensagem ) )
					return true
				else
					return false
			}
		}
		function Abilita(){				
			if( document.getElementById("Operacoes").style.display == "none" ){
				document.getElementById("Ab").src="Imagens/FTP/UI_OM_expand.gif";
				document.getElementById("Operacoes").style.display = "block";
				document.getElementById("env").style.display = "none";								
			}
			else{
				document.getElementById("Ab").src="Imagens/FTP/UI_OM_collapse.gif";
				document.getElementById("Operacoes").style .display = "none";
				document.getElementById("env").style.display = "none";
			}
		}
		</script>
		<style type="text/css">.Font { FONT-SIZE: 11px; FONT-FAMILY: verdana, arial }
	A { FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: verdana, arial; TEXT-DECORATION: none }
	A:visited { FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: verdana, arial; TEXT-DECORATION: none }
	A:hover { FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: verdana, arial; TEXT-DECORATION: none }
	.campo_branco { BORDER-RIGHT: #666666 1px solid; BORDER-TOP: #666666 1px solid; FONT-SIZE: 10px; BORDER-LEFT: #666666 1px solid; COLOR: #000000; BORDER-BOTTOM: #666666 1px solid; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #ffffff }
		</style>
	</HEAD>
	<body onload="" MS_POSITIONING="GridLayout" leftmargin="0" topmargin="0" marginwidth="0"
		marginheight="0">
		<form id="Form1" method="post" runat="server">
			<table height="63" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td width="30%" background="imagens/FTP/topo.gif" height="41">&nbsp;&nbsp;&nbsp; <A onclick="history.go(-1)" href="#">
							<IMG alt="Anterior" src="imagens/FTP/anterior.gif" border="0"></A>&nbsp;&nbsp;
						<A onclick="history.go(+1)" href="#"><IMG alt="Proximo" src="imagens/FTP/proximo.gif" border="0"></A>&nbsp;&nbsp;
						<asp:imagebutton id="imbAcima" runat="server" ImageUrl="imagens/FTP/voltar.gif"></asp:imagebutton>&nbsp;
					</td>
					<td align="right" width="70%" background="imagens/FTP/topo.gif">&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td colSpan="2" height="25">
						<TABLE height="25" cellSpacing="0" cellPadding="0" width="100%" background="imagens/FTP/topo.gif"
							border="0">
							<TR>
								<TD class="Font" style="WIDTH: 74px">&nbsp;&nbsp;Endereço</TD>
								<TD><asp:textbox id="txtDir" runat="server" CssClass="campo_branco" Width="99%" ReadOnly="True"></asp:textbox></TD>
							</TR>
						</TABLE>
					</td>
				</tr>
			</table>
			<table height="42" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td width="6%">
						<table borderColor="beige" height="100%" cellSpacing="0" cellPadding="0" width="150" align="center"
							border="0">
							<tr>
								<td vAlign="top" align="center">
									<TABLE class="Font" borderColor="#cccccc" cellSpacing="0" cellPadding="0" width="100%"
										align="center" border="1">
										<TR>
											<td style="HEIGHT: 22px" width="99%" bgColor="#cccccc">&nbsp;&nbsp;&nbsp;<b>Operações</b>
											</td>
											<TD style="HEIGHT: 22px" align="right" width="1%" bgColor="#cccccc"><A onclick="Abilita()" href="javascript:void(0)"><IMG id="Ab" src="Imagens/FTP/UI_OM_expand.gif" border="0"></A>
											</TD>
										</TR>
										<TR id="Operacoes" style="DISPLAY: block">
											<TD colSpan="2"><br>
												&nbsp;&nbsp;&nbsp;<A id="linkNova" onclick="return novaPasta('')" href="#" runat="server"><IMG alt="Nova Pasta" src="imagens/FTP/novapasta.gif" border="0">&nbsp;&nbsp;&nbsp; 
													Nova Pasta
													<br>
												</A>&nbsp;&nbsp;&nbsp;<A id="linkUp" onclick="return EnviarArquivo('')" href="#" runat="server"><IMG alt="Enviar Arquivo" src="imagens/FTP/Enviar.gif" border="0">&nbsp;Enviar 
													Arquivo<br>
												</A>&nbsp;&nbsp;
												<asp:imagebutton id="imbExcluir" runat="server" ImageUrl="imagens/FTP/excluir.gif"></asp:imagebutton>&nbsp;&nbsp;&nbsp; 
												Excluir
												<br>
												<br>
											</TD>
										</TR>
										<TR id="env" style="DISPLAY: none" height="80">
											<TD colSpan="2"><iframe id="Frame" src="" frameBorder="0" width="99%" scrolling="no" height="100%"></iframe>
											</TD>
										</TR>
									</TABLE>
								</td>
								<td width="3" bgColor="beige"></td>
							</tr>
						</table>
					</td>
					<td vAlign="top" width="94%"><GRID:DATAGRID id="Grid" runat="server" CssClass="Font" Width="100%" EnableClientSort="True" SmartClientRendering="True"
							EnableColumnDrag="True" AutoGenerateColumns="False" BorderWidth="1px" BorderColor="Beige" CellPadding="0" background="imagens/FTP/fundo.gif"><HEADERSTYLE BackColor="Control"></HEADERSTYLE>
							<COLUMNS>
								<ASP:BOUNDCOLUMN DataField="Nome" HeaderText="Nome">
									<HEADERSTYLE Width="40%"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN DataField="Tamanho" HeaderText="Tamanho">
									<HEADERSTYLE Width="20%" HorizontalAlign="Center"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN DataField="Tipo" HeaderText="Tipo">
									<HEADERSTYLE Width="20%" HorizontalAlign="Center"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN DataField="Data" HeaderText="Data">
									<HEADERSTYLE Width="20%" HorizontalAlign="Center"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:TEMPLATECOLUMN HeaderText="Nome">
									<HEADERSTYLE Width="1px"></HEADERSTYLE>
									<HEADERTEMPLATE>
										<asp:CheckBox id="chkTodos" runat="server" Text=""></asp:CheckBox>
									</HEADERTEMPLATE>
									<ITEMTEMPLATE>
										<asp:CheckBox id="chkNome" runat="server" Text=""></asp:CheckBox>
									</ITEMTEMPLATE>
								</ASP:TEMPLATECOLUMN>
								<ASP:BOUNDCOLUMN DataField="NomeLimpo" HeaderText="NomeLimpo" Visible="false"></ASP:BOUNDCOLUMN>
							</COLUMNS>
						</GRID:DATAGRID></td>
				</tr>
				<tr>
					<td background="imagens/FTP/rodape.gif" colSpan="2" height="25"></td>
				</tr>
			</table>
			<asp:textbox id="acima" style="Z-INDEX: 101; LEFT: 280px; POSITION: absolute; TOP: 384px" runat="server"
				Visible="False"></asp:textbox></form>
	</body>
</HTML>
