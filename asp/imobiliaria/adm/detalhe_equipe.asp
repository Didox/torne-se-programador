<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
corretor=request("corretor")
imovel=request("imovel")
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 9
Set exibir = Server.CreateObject( "ADODB.Recordset" ) 
exibir.activeConnection = conn
exibir.CursorType = adOpenStatic  
exibir.PageSize = 3
itens.open "select * from equipe where codigo = "&codigo,conn%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <%exibir.open "select * from corretor where cod_equipe="&codigo&" and codigo = "&itens("cod_supervisor"), conn%>
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_8.gif"></td>
              <td class="tb">
                   <B>DETALHE EQUIPE</B>
              </td>
              <td class="tb" align=right><a href="Imprimir_detalhe_equipe.asp?codigo=<%=codigo%>&pagina=Detalhe_Equipe"><img alt="Imprimir Contratos" src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <table><tr height=10><td></td></tr></table>
          <%if not exibir.eof=true then%>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=60><b>&nbsp;EQUIPE:</b></td>
              <td class="tb" colspan=5><%=itens("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;SUPERVISOR:</b></td>
              <td class="tb" colspan=5><%=exibir("nome")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;ENDEREÇO:</b></td>
              <td class="tb" colspan=5><%=exibir("endereco")%>&nbsp;-&nbsp; <%=exibir("numero")%> &nbsp;-&nbsp;<%=exibir("complemento")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;BAIRRO:</b></td>
              <td class="tb"><%=exibir("bairro")%></td>
              <td class="tb" width=60><b>&nbsp;CIDADE:</b></td>
              <td class="tb" colspan=5><%=exibir("cidade")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;ESTADO:</b></td>
              <td class="tb"><%=exibir("estado")%></td>
              <td class="tb" width=60><b>&nbsp;CEP:</b></td>
              <td class="tb" colspan=3><%=exibir("cep")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;TELEFONE:</b></td>
              <td class="tb">(<%=exibir("ddd_fone")%>)<%=exibir("fone")%></td>
              <td class="tb" width=60><b>&nbsp;CELULAR:</b></td>
              <td class="tb" colspan=3>(<%=exibir("ddd_cel")%>)<%=exibir("celular")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;CPF:</b></td>
              <td class="tb" colspan=5><%=exibir("cpf")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;IDENTIDADE:</b></td>
              <td class="tb"><%=exibir("identidade")%></td>
              <td class="tb" width=110><b>&nbsp;ORGÃO EMISSOR:</b></td>
              <td class="tb"><%=exibir("orgao_emissor")%></td>
              <td class="tb" width=110><b>&nbsp;DATA EMISSÃO:</b></td>
              <td class="tb"><%=exibir("data_emissao")%></td>
              </td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;E-MAIL:</b></td>
              <td class="tb" colspan=5><%=exibir("email")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;CRECI:</b></td>
              <td class="tb"><%=exibir("creci")%></td>
              <td class="tb" width=60><b>&nbsp;UNIDADE:</b></td>
              <%set unidade = conn.execute("select descricao from unidade where codigo="&exibir("cod_unidade"))%>
              <td class="tb" colspan=3><%=unidade("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;LOGIN:</b></td>
              <td class="tb" colspan=5><%=exibir("login")%></td>
            </tr>
          </table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=130><b>&nbsp;DATA INCLUSÃO:</b></td>
              <td class="tb"><%=exibir("data_inclusao")%></td>
            </tr>
            <tr>
             <td class="tb" width=130><b>&nbsp;DIA DE PAGAMENTO:</b></td>
             <td class="tb"><%=exibir("pagamento")%></td>
            </tr>
          </table>
          <%else%>
          <table>
            <tr>
              <td></td>
              <td></td>
              <td class="tb"><B>NÃO HÁ SUPERVISOR CADASTRADO PARA ESSA EQUIPE.</B></td>
              <td></td>
              <td></td>
            </tr>
          </table>
          <%end if%>
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>&codigo=<%=codigo%>"name="form1">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_16.gif"></td>
              <td class="tb"><B>CORRETORES DA EQUIPE</B></td>
            </tr>
          </table>  
          <table width=100%
            <tr height=25><td></td></tr>
            <tr>
              <td width=10><img src="../img/icon_mini_search.gif"></td>
              <td valign=top><input type=text name="pesquisa" value="<%=pesquisa%>" style="width:190; height:17; background=#E8E8E8;"></td>
              <td valign=top>
                <%if opcao="" or opcao="1" then%>
                   <input type=radio name="opcao" value=1 checked>Número
                <%else%>
                   <input type=radio name="opcao" value=1>Número
                <%end if%>
              </td>
              <td valign=top>
                <%if opcao="2" then%>
                   <input type=radio name="opcao" value=2 checked>Imóvel
                <%else%>
                   <input type=radio name="opcao" value=2>Imóvel
                <%end if%>
              </td>
              <td><input type=image src="../img/pop_ok.gif" alt="Resultado"></td>
            </tr>
            <tr height=5><td></td></tr>
          </table>
           <%set corretores=conn.execute ("select * from corretor where cod_equipe="&codigo&" and codigo<>"&itens("cod_supervisor"))%>
          <table width=100%>
            <tr>
              <td bgcolor=#B0B0B0 width=20><input type="checkbox" name="selecionar" onclick="todos()"></td>
              <td align=left bgcolor=#B0B0B0><font color=#FFFFFF><b>Nome</b></td>
              <td align=center width=105 bgcolor=#B0B0B0><font color=#FFFFFF><b>Contratos</b></td>
              <td align=center width=100 bgcolor=#B0B0B0><font color=#FFFFFF><b>Data de Cadastro</b></td>
              <td align=center width=105 bgcolor=#B0B0B0><font color=#FFFFFF><b>Ações</b>
            </tr>
            <%If corretores.EOF = true then%>
               <tr>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8>Não há Registros cadastrados.</td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
               </tr>
            <%else
               do While Not corretores.EOF
                  if cor="DADAB5" then
                     cor="F4F2EA"
                  else
                     cor="DADAB5"
                  end if%> 
                  <tr>
                    <td class="tb" bgcolor=<%=cor%> width=20><input type=checkbox  name="deletar" value="<%=corretores("codigo")%>"></td>
                    <td class="tb" bgcolor=<%=cor%>><a href="Detalhe_corretor.asp?codigo=<%=corretores("codigo")%>&pagina=Main_Equipe"><%=corretores("nome")%></a></td>
                    <td class="tb" align=center bgcolor=<%=cor%>>
                      <%set contador=conn.execute("select count(codigo) as total from contrato where cod_corretor="&corretores("Codigo")&" and status=0")%>
                      <%=contador("total")%>
                    </td>
                    <td class="tb" align=center bgcolor=<%=cor%>><%=corretores("data_inclusao")%></td>
                    <td bgcolor=<%=cor%> align=center>
                      <a href="javascript:confirma('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&deletar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>')"><img src="../img/excluir_n.gif" alt="Excluir" border=0></a>
                      <a href="Alt_corretor.asp?codigo=<%=corretores("codigo")%>&pagina=Main_Equipe"><img src="../img/editar.gif" alt="Editar" border=0></a>
                      <a href="Main_Visita.asp?corretor=<%=corretores("codigo")%>&pagina=Main_Equipe"><img src="../img/acompanhamento.gif" alt="Acompanhamentos" border=0></a>
                      <a href="relatorio_comissao_dados.asp?corretor=<%=corretores("codigo")%>&pagina=Main_Equipe"><img src="../img/comissao.gif" alt="Extratos" border=0></a>
                    </td>
                    </td>
                  </tr>
                  <%cont=cont+1%>
                  <%corretores.movenext%>
               <%loop%>
            <%end if%>
          </table>
          <table width=100%>
            <tr> 
              <td align=center bgcolor=#B0B0B0>
                <a href="javascript:confirma('')"><font color=#FFFFFF><B>Excluir Selecionados</b></a>
              </td>
              <td bgcolor=#B0B0B0 align=right>
                <select name="ordem" class="texto">
                  <%if ordem="contrato.numero" then%>
                     <option value="contrato.numero" selected>Número
                  <%else%>
                     <option value="contrato.numero">Número
                  <%end if%>
                  <%if ordem="imoveis.descricao" then%>
                     <option value="imoveis.descricao" selected>Imóvel
                  <%else%>
                     <option value="imoveis.descricao">Imóvel
                  <%end if%>
                  <%if ordem="clientes.nome" then%>
                     <option value="clientes.nome" selected>Cliente
                  <%else%>
                     <option value="clientes.nome">Cliente
                  <%end if%>
                  <%if ordem="servico.descricao" then%>
                     <option value="servico.descricao" selected>Serviço
                  <%else%>
                     <option value="servico.descricao">Serviço
                  <%end if%>
                </select>
                <%if ordem2<>"" then%>
                   <input type="checkbox" name="ordem2" value="desc" checked>Decrescente
                <%else%>
                   <input type="checkbox" name="ordem2" value="desc">Decrescente
                <%end if%>
                <input type=image src="../img/pop_ok.gif" value="submit">
              </td>
            </tr>  
          </table> 
          <br>
          <table align=center>
            <tr>
              <td valign=top>
                <%if cINT(currentPage)>1 then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage-1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&cliente=<%=cliente%>&corretor=<%=corretor%>"><img src="../img/anterior.gif" border=0></a>
                <%else%>
                   <img src="../img/anterior.gif">
                <%end if%>
              </td>
              <td valign=top> 
                <%if itens.PageCount>10 then
                   if itens.PageCount-currentPage<10 then
                      if cint(currentpage)<=cint(itens.PageCount-5) then
                         i=currentpage
                         x=currentPage+9
                      else
                         i=itens.PageCount-4
                         x=itens.PageCount+5
                      end if
                   else
                      if currentpage>5 then
                         i=currentPage+1
                         x=currentPage+10
                      else
                         i=6
                         x=15
                      end if
                   end if
                else
                   i=6
                   x=itens.PageCount+5
                end if
                For i = i-5 to x-5
                   if i<10 then
                     h=0
                   else
                     h=""
                   end if
                   If i = cINT( currentPage ) THEN%>
                      [ <b><%=h&i%></b> ]
                   <%ELSE%>
                      [ <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=h&i%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&cliente=<%=cliente%>&corretor=<%=corretor%>"><%=h&i%></a> ]
                   <%END IF
                Next%>
              </td>
              <td valign=top>
                <%if cINT(currentPage)<itens.PageCount then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage+1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&cliente=<%=cliente%>&corretor=<%=corretor%>"><img src="../img/proxima.gif" border=0></a>
                <%else%>
                   <img src="../img/proxima.gif">
                <%end if%>
              </td>
            </tr>
          </table>  
        </td>
      </tr>
      </form>
    </table>
    <table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
    </td>
  </tr>
</table>
</body>
</html>
