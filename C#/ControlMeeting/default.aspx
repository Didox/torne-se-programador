<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="ControlMeeting.WebForm1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Sistema ZiDoc</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<META NAME="keywords" CONTENT="Sistema desenvolvido por Danilo Aparecido Dos Santos email didox_59@yahoo.com.br.">
		<meta name="description" content="Sistema desenvolvido por Danilo Aparecido Dos Santos.">
		<meta http-equiv="Author" name="Danilo Aparecido" content="Programação:Danilo Aparecido dos Santos">
		<meta http-equiv="Reply-to" content="didox_59@yahoo.com.br">
		<LINK href="css/Geral.css" type="text/css" rel="stylesheet">
		<LINK REL="SHORTCUT ICON" HREF="zicardIco.ico">
		<script language="JavaScript" src="Js/jsobjects.js"></script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<!--input type=text id="txtIdFolder" style="display:none" value=0 -->
			<!--input type=text id="txtIdFolderOpen" style="display:none" value=0 -->
			<input type="text" id="txtIdFolder" style="DISPLAY:none" value="0"> <input type="text" id="txtIdFolderOpen" style="DISPLAY:none" value="0">
			<TABLE id="tbGeral" height="100%" cellSpacing="0" bordercolor="#f1f1f1" cellPadding="0"
				width="100%" border="0">
				<TR>
					<TD style="HEIGHT: 10px" colspan="100" background="imagens/FundoTop.jpg"></TD>
				</TR>
				<TR>
					<TD class="tdTitle" align="center" style="HEIGHT: 35px" colspan="100" background="imagens/FundoTopB.jpg">						
						<TABLE id="tbGeral" height="100%" cellSpacing="0" bordercolor="#f1f1f1" cellPadding="0"
							width="100%" border="0">
							<TR>
								<TD width="90%" class="tdTitle" align=center>ZiDoc</TD>
								<TD width="10%" id="nameUser"></TD>
							</TR>
						</table>
					</TD>
				</TR>
				<TR>
					<TD style="HEIGHT: 10px" colspan="100" background="imagens/FundoTop.jpg"></TD>
				</TR>
				<TR>
					<TD id="tbColFolders" width="200" valign="top">
						<TABLE WIDTH="100%" height="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<TR>
								<TD width="90%">
									<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
										<TR>
											<TD align="center" height="29" background="imagens/FundoTopB.jpg">
												<b><font color="#666666">:: Pastas :: </font></b>
											</TD>
										</TR>
									</TABLE>
									<TABLE WIDTH="100%" height="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
										<TR>
											<TD align="center" height="15" background="imagens/Fundo.jpg">
												<div id="lyMenu" style="OVERFLOW: auto; WIDTH: 190px; HEIGHT: 100%">
													<TABLE WIDTH="100%" height="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
														<TR>
															<TD height="1%" valign="top">
																<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																	<TR id="0">
																		<TD height="15" id="Root">
																			<TABLE WIDTH="100%" id="tbFolders" runat="server" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																			</TABLE>
																		</TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
														<TR>
															<TD height="99%" isRoot="true" onmousedown="createMenuFolder(1)" valign="top">
																&nbsp;
															</TD>
														</TR>
													</TABLE>
												</div>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD height="150">
									<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
										<TR>
											<TD align="center" height="29" background="imagens/FundoTopB.jpg">
												<b><font color="#666666">:: Opções :: </font></b>
											</TD>
										</TR>
									</TABLE>
									<TABLE WIDTH="100%" height="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
										<TR>
											<TD align="center" valign="top" background="imagens/Fundo.jpg">
												<div id="lyOpions" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 80%">
													<TABLE WIDTH="100%" height="15" BORDER="0" CELLSPACING="2" CELLPADDING="2">
														<TR>
															<TD height="15">
																<TABLE style="CURSOR:hand" onclick="newDirAjax()" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																	<TR>
																		<TD><img src="imagens/NewDir.gif"></TD>
																		<TD>&nbsp;Nova Pasta</TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
														<TR>
															<TD height="15">
																<TABLE style="CURSOR:hand" onclick="deleteFolder()" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																	<TR>
																		<TD><img src="imagens/delete.gif"></TD>
																		<TD isDelete="true">&nbsp;Excluir</TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
														<TR id="tbCreateForm" style="DISPLAY:none">
															<TD height="15">
																<TABLE style="CURSOR:hand" onclick="createForm()" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																	<TR>
																		<TD><img src="imagens/form.gif"></TD>
																		<TD>
																			&nbsp;Formulários</TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
														<TR id="tbCreateGroups" style="DISPLAY:none">
															<TD height="15">
																<TABLE style="CURSOR:hand" onclick="createGroups()" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																	<TR>
																		<TD><img src="imagens/groups.gif"></TD>
																		<TD isDelete="true">&nbsp;Grupos</TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
														<TR id="tbCreateUsers" style="DISPLAY:none">
															<TD height="15">
																<TABLE style="CURSOR:hand" onclick="createUsers()" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																	<TR>
																		<TD><img src="imagens/user.gif"></TD>
																		<TD>&nbsp;Usuários</TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
														<TR>
															<TD height="15">
																<TABLE style="CURSOR:hand" onclick="login()" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																	<TR>
																		<TD><img src="imagens/logoff.gif"></TD>
																		<TD>&nbsp;Logoff</TD>
																	</TR>
																	<TR>
																		<TD></TD>
																		<TD>&nbsp;</TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
													</TABLE>
												</div>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</TD>
					<td bgcolor="#dededd" id="tbE-Resize" onmouseout="this.bgColor='#DEDEDD'" onmouseover="this.bgColor='#f0f0f0'"
						onmousedown="setCol(this)" width="3" style="CURSOR:e-resize">
						<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
							<tr>
								<td></td>
							</tr>
						</table>
					</td>
					<TD id="tbColContent" valign="top">
						<TABLE WIDTH="100%" id="tbContentGeral" height="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<TR>
								<TD id="tbMainContent" height="50%">
									<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
										<TR>
											<TD align="left" height="29" background="imagens/FundoTopB.jpg">
												<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
													<TR>
														<TD><b><font color="#666666">&nbsp;&nbsp; :: Conteúdos :: </font></b>
														</TD>
														<TD class="maisMenos" id="tbMaisMenosContent" width="20"><a class="aWhite" href="javascript:desabledGuiaContent()">
																<img src="imagens/setaAberta.gif" border="0"> </a>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<div id="lyContent" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 94%">
										<TABLE WIDTH="100%" height="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
											<TR>
												<TD valign="top" id="tbContent" style="DISPLAY:block" height="1%" bgcolor="#f7f5f1">
													<TABLE WIDTH="100%" id="tbItens" BORDER="0" CELLSPACING="0" CELLPADDING="2">
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD align="center" id="tbLogo" bgcolor="#f7f5f1" onmousedown="createMenu()" height="99%">
													<TABLE WIDTH="100%" height="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
														<TR>
															<TD height="1%"></TD>
														</TR>
														<TR>
															<TD height="99%" align="center" valign="bottom"><img src="imagens/FundoLogo.gif"></TD>
														</TR>
														<TR>
															<TD height="1%" align="right"><img src="imagens/fundoCanto.gif"></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
									</div>
								</TD>
							</TR>
							<TR>
								<TD id="tbMainPreview" height="1%">
									<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
										<TR>
											<TD align="left" height="15" background="imagens/FundoTopB.jpg">
												<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
													<TR>
														<TD><b><font color="#666666">&nbsp;&nbsp; :: Preview :: </font></b>
														</TD>
														<TD class="maisMenos" id="tbMaisMenosPreview" width="20">
															<a class="aWhite" href="javascript:desabledGuiaPreview()"><img src="imagens/setaFechada.gif" border="0">
															</a>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<div id="lyPrewiew" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 92%">
										<TABLE WIDTH="100%" height="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
											<TR>
												<TD valign="top" style="DISPLAY:block" height="15" bgcolor="#f7f5f1">
													<TABLE WIDTH="100%" height="100%" BORDER="0" CELLSPACING="4" CELLPADDING="4">
														<TR>
															<TD ondblclick="openPreview()" onmousedown="createMenu( 1 )" bgcolor="#ffffff" valign="top"
																id="tbPreview" style="DISPLAY:none" height="15">
															</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
									</div>
								</TD>
							</TR>
						</TABLE>
						<TABLE bgcolor="#f7f5f1" WIDTH="100%" height="87%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<TR>
								<TD height="1%"></TD>
							</TR>
							<TR>
								<TD height="99%" align="center" valign="bottom"><img src="imagens/FundoLogo.gif"></TD>
							</TR>
							<TR>
								<TD height="1%" align="right"><img src="imagens/fundoCanto.gif"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<TR>
					<TD style="HEIGHT: 10px" colspan="100" background="imagens/FundoTop.jpg"></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
