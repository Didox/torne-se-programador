<%tipo_login=session("tipo_login")
login=session("login")
senha=session("senha")
if tipo_login="" or login="" or senha="" then
   tipo_login=replace(trim(ucase(request("tipo_login"))),"'","")
   login=replace(trim(ucase(request("login"))),"'","")
   senha=replace(trim(ucase(request("senha"))),"'","")
   if tipo_login="1" then
      set Verificador=conn.execute("select * from corretor where login='"&login&"' and senha='"&senha&"'")
      tipo="1"
   else
     if tipo_login="2" then
        set Verificador=conn.execute("select * from clientes where login='"&login&"' and senha='"&senha&"'")
        tipo="2"
     else
     set Verificador=conn.execute("select * from clientes where login='"&login&"' and senha='"&senha&"'")
        tipo=""
     end if
   end if
   if not Verificador.eof then
      session("login")=login
      session("senha")=senha
      session("tipo_login")=tipo_login
      session("tipo")=tipo
      session("cod")=verificador("codigo")
   else
      msg_login="Login e/ou senha inválidos!"
   end if
else
   if tipo_login="1" then
      set Verificador=conn.execute("select * from corretor where login='"&login&"' and senha='"&senha&"'")
      tipo="1"
   else
      set Verificador=conn.execute("select * from clientes where login='"&login&"' and senha='"&senha&"'")
      tipo="2"
   end if
end if%>
<link href="estilo.css" rel="stylesheet" type="text/css">
      <table width=100% cellspacing="0" border=0 cellpadding="0" height="100%">
      <tr>
      <td width=160 valign=top>
<table width=160 height="100%" border=0 cellpadding="0" cellspacing="0" class="tabela002">
              <tr><td height="5" class="tabela001"><img src="../../imagens/white.jpg" width="1" height="1"></td>
              </tr>
              <%if tipo_login<>"" and msg_login="" then%>
                 <tr valign="top"><td height="18" align=center>BEM VINDO</td>
  </tr>
                 <tr valign="top"><td height="18" align=center><%=verificador("nome")%></td></tr>
			  <tr>
			    <td valign="top">
				  <table class="tabela002">
              <%if tipo="1" then%>
  <tr>
                  <td>&nbsp;<img src="../img/seta_preta.gif">&nbsp;<a href="Contratos_corretor.asp?codigo=<%=verificador("codigo")%>"><b>CONTRATOS</b></a></td>
  </tr>
                <tr valign="top">
                  <td>&nbsp;<img src="../img/seta_preta.gif">&nbsp;<a href="imoveis.asp?codigo=<%=verificador("codigo")%>"><b>IMÓVEIS</b></a></td>
  </tr>
                  <tr valign="top">
                  <td>&nbsp;<img src="../img/seta_preta.gif">&nbsp;<a href="cad_tipo_plano.asp"><b>PLANOS DE MIDIA</b></a></td>
  </tr>

                <tr valign="top">
                  <td>&nbsp;<img src="../img/seta_preta.gif">&nbsp;<a href="Main_Visita.asp?codigo=<%=verificador("codigo")%>"><b>VISITAS</b></a></td>
  </tr>
                <tr>
                  <td valign="top">&nbsp;<img src="../img/seta_preta.gif">&nbsp;<a href="relatorio_comissao_dados.asp?codigo=<%=verificador("codigo")%>"><b>RELATÓRIO</b></a></td>
              <%else
                 if tipo="2" then%>
                  <td>&nbsp;<img src="../img/seta_preta.gif">&nbsp;<a href="Contratos_corretor.asp?codigo=<%=verificador("codigo")%>"><b>MEUS CONTRATOS</b></a></td>
                </tr>
                <tr valign="top">
                  <td>&nbsp;<img src="../img/seta_preta.gif">&nbsp;<a href="Imoveis.asp?codigo=<%=verificador("codigo")%>"><b>MEUS IMÓVEIS</b></a></td>
  </tr>
                <tr valign="top">
                  <td>&nbsp;<img src="../img/seta_preta.gif">&nbsp;<a href="Alt_cliente_net.asp?codigo=<%=verificador("codigo")%>"><b>ALTERAR MEUS DADOS</b></a></td>
  </tr>
                 <%else%>
                   <tr valign="top">
                     <td>&nbsp;<img src="../img/seta_preta.gif">&nbsp;<a href="Main_Administradores.asp"><b>WEB</b></a></td>
  </tr>
                 <%end if
               end if%>
              </tr>
              <tr>
                  <td>&nbsp;<img src="../img/seta_preta.gif">&nbsp;<a href="../../anuncie_logoff.asp?ifr=1"><b>SAIR DO SISTEMA</b></a></td>
  </tr>
              </table>			  </td>
			  <%else%>
                 <tr>
                   <td valign="top"><table>
                     <form method=post action="../../anuncie_verif.asp?flag=login&pagina=<%=pagina%>&sql_filtro=<%=sql_filtro%>" name="form2">
                       <%if request("flag")="login" and msg_login<>"" then%>
                       <tr>
                         <td  colspan=2><font class="estilo"><font color=red><%=msg_login%></font></font></td>
                       </tr>
                       <%else%>
                       <br>
                       <%end if%>
                       <tr>
                         <td  colspan="2"><b>Para entrar, digite seu e-mail e sua senha de acesso</b><br></td>
                       </tr>
					   <tr>
                         <td><font class="estilo">E-mail:</font> </td>
                         <td><input type="text" size=18 name="email" style="font-family: arial; font-size: 7pt" value="<%=login%>" />                         </td>
                       </tr>
                       <tr>
                         <td><font class="estilo">Senha:</font> </td>
                         <td><input type="password" size=18 name="senha" style="font-family: arial; font-size: 7pt" value="<%=senha%>" />
                           &nbsp; </td>
                       </tr>
                       <tr>
                         <td colspan=2><%if tipo_login="" or tipo_login="1" then%>
                             <input type="radio" name="tipo_login" value="1" checked />
                             <span class="estilo">Corretor
                               <input type="radio" name="tipo_login" value="2" />
                               Cliente
                               <%else%>
                               <input type="radio" name="tipo_login" value="1" />
                               Corretor
                               <input type="radio" name="tipo_login" value="2" checked />
                               Cliente
                               <%end if%>
                           </span></td>
                       </tr>
                       <tr>
                         <td colspan="2"><input name="image" type="image" value="submit" src="../../imagens/botoes/ENTRAR1.gif" border=0 /></td>
                      </tr>
                     </form>
                   </table></td>
                 </tr>
              <%end if%>
              <tr height=10><td></td></tr>
              <tr><td height="5" class="tabela001"><img src="../../imagens/white.jpg" width="1" height="1"></td>
              </tr>
              <tr>
                 <%if tipo="" or msg_login<>"" then%>
                   <td class="estilo">
                  
                 <%end if%>                </td>
              </tr>
              <tr><td>&nbsp;</td></tr>
              <!--tr>
                <td class="estilo">
                  <a href="Main_filtro_imoveis.asp?pagina=Main_Inicio"><b>&nbsp;&nbsp;&nbsp;Pesquisa</b></a>
                </td>
              </tr-->
              <tr>
                <td>&nbsp;</td>
              </tr>
                   <tr>
                        <td>
                           <%if msg <> "" and reload = "" then%>
  <tr height=250>
		                <td>
		                  <table cellpadding="0" cellspacing="0" border="0" height=100 width="170">
                                    <tr>
                                      <td height=1><img src="../img/img_S_E.gif" border="0"></td>
                                      <td height=1 width="100%" background="../img/img_S.gif">&nbsp;&nbsp;<font color="#FFFFFF"><b>Erros Encontrados</b></font></td>
                                      <td height=1><img src="../img/img_S_D.gif" border="0"></td>
                                    </tr>
                                    <tr>
                                      <td height=1 background="../img/img_E.gif">&nbsp;</td>
                                      <td valign="top" height=100% width="100%">
                                        <font color="#CC0000"><%=msg%></font>                                      </td>
                                      <td height=1 background="../img/img_D.gif">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td height=1>
                                        <img src="../img/img_I_E.gif" border="0">                                      </td>
                                      <td height=1 width="100%" background="../img/img_I.gif">&nbsp;</td>
                                      <td height=1>
                                        <img src="../img/img_I_D.gif" border="0">                                      </td>
                                    </tr>
                          </table>		                </td>
  </tr>
		           <%else%>
		              <tr height=250><td></td></tr>
                           <%end if%>
                       </td>
                     </tr>
              <tr><td height="5"><img src="../../imagens/white.jpg" width="1" height="1"></td>
              </tr>             
               <tr><td align=center>&nbsp;</td></tr>
</table>
          </td>
          <td valign=top>