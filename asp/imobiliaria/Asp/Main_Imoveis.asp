
<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
response.End()
pagina=request("pagina")
cliente=request("cliente")
pesquisa=replace(trim(request("pesquisa")),"'","")
sql_filtro=replace(request("sql_filtro"),"$","%")
corretor=request("corretor")
opcao=request("opcao")
box=request("deletar")
box2=request("publicar")
box3=request("disponivel")
ordem=request("ordem")
ordem2=request("ordem2")
pesquisa_topo=request("pesquisa_topo")

'response.Write(box&" --")
'response.End()
if box <> "" then
   conn.Execute ("update Imoveis set status=0 where codigo IN ("&box&")")
end if
if box2 <> "" and opcao="publicar" then
   conn.Execute ("update Imoveis set publicar=1 where codigo IN ("&box2&")")	
end if
if box2 <> "" and opcao="retirar" then
   conn.Execute ("update Imoveis set publicar=0 where codigo IN ("&box2&")")
end if
if box3 <> "" and opcao="disponivel" then
   conn.Execute ("update imoveis set disponivel=1 where codigo IN ("&box3&")")
end if
if box3 <> "" and opcao="remover" then
   conn.Execute ("update Imoveis set disponivel=0 where codigo IN ("&box3&")")
end if
currentPage = Request( "currentPage" )
Set contador = Server.CreateObject( "ADODB.Recordset" )
contador.activeConnection = conn
contador.CursorType = adOpenStatic
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 9
if ordem="" then
   ordem="imoveis.descricao"
end if
if ordem="imoveis.status" then
  ordem=ordem&""
end if
if pesquisa<>"" then
   sql="and imoveis.descricao like '%"&pesquisa&"%' "
end if
if cliente<>"" then
   sql="and imoveis.cod_cliente="&cliente 
end if
response.Write("select MAX(imoveis.codigo) as codigo,MAX(imoveis.disponivel) as disponivel,MAX(imoveis.publicar) as publicar,MAX(imoveis.data_inclusao) as data_inclusao,MAX(imoveis.tipo_imovel) as tipo_imovel,MAX(imoveis.status) as status,MAX(imoveis.descricao) as descricao, COUNT(visita.codigo) AS visitas FROM Imoveis LEFT JOIN visita ON imoveis.codigo = visita.cod_imovel where imoveis.status <> 0 "&sql&sql_filtro&" GROUP BY imoveis.codigo ORDER BY "&ordem&" "&ordem2)
response.End()
itens.Open "select MAX(imoveis.codigo) as codigo,MAX(imoveis.disponivel) as disponivel,MAX(imoveis.publicar) as publicar,MAX(imoveis.data_inclusao) as data_inclusao,MAX(imoveis.tipo_imovel) as tipo_imovel,MAX(imoveis.status) as status,MAX(imoveis.descricao) as descricao, COUNT(visita.codigo) AS visitas FROM Imoveis LEFT JOIN visita ON imoveis.codigo = visita.cod_imovel where imoveis.status <> 0 "&sql&sql_filtro&" GROUP BY imoveis.codigo ORDER BY "&ordem&" "&ordem2,conn
%>
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
          <table><tr><td></td></tr></table>
          <table width=100% class="tabela001">
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>"name="form1">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 cellpadding="0" cellspacing="0" class="tabela002">
            <tr> 
              <td width=20><img src="../img/r_12.gif"></td>
              <td class="tb"><B>PAINEL DE CONTROLE IMÓVEIS</B></td>
            </tr>
          </table>  
          <table width=100%
            <tr height=25><td></td></tr>
            <tr>
              <td width=10><img src="../img/icon_mini_search.gif"></td>
              <td valign=top><input type=text name="pesquisa" value="<%=pesquisa%>" style="width:190; height:17; background=#E8E8E8;"></td>
              <td><input type=image src="../img/pop_ok.gif" alt="Resultado"></td>
              <td><a href="Main_filtro_imoveis.asp"><img alt="Filtrar Imóveis" src="../img/filtro.gif" border=0></a></td>
              <td><a href="Imprimir_Imoveis.asp?currentPage=<%=currentPage%>&cliente=<%=cliente%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&sql_filtro=<%=sql_filtro%>&pagina=Main_Imoveis"><img alt="Imprimir Imóveis" src="../img/icone-imprimir.gif" border=0></a></td>
              <td><a href="Cad_Imoveis.asp?cliente=<%=cliente%>&pagina=Main_Imoveis"><img alt="Novo Imóvel" src="../img/novo_reg.gif" border=0></a></td>
            </tr>
            <tr height=5><td></td></tr>
      </table>
          <table width=100%>
            <tr bgcolor="#B5AE67">
              <td width=20><input type="checkbox" name="selecionar" onclick="todos()"></td>
              <td bgcolor=#B5AE67><font color=#FFFFFF><b>Imóveis Encontrados</b></td>
              <td width=90 align=left><font color=#FFFFFF><b>Tipo do Imovel</b></td>
              <td width=230 align=center><font color=#FFFFFF><b>Ações</b>
            </tr>
            <%If itens.EOF = true then%>
               <tr bgcolor="#F4F2EA">
                 <td></td>
                 <td bgcolor="#F4F2EA">Não há Registros cadastrados.</td>
                 <td></td>
                 <td></td>
            </tr>  
            <%else
               itens.absolutePage = cINT(currentPage)
               do While Not itens.EOF and cont<itens.PageSize
                  if cor="F4F2EA" then
                     cor="DADAB5"
                  else
                     cor="F4F2EA"
                  end if
                  if itens("status")=2 then
                     cor="F4F2EA"
                  end if
                  %> 
                  <tr>
                    <td bgcolor=<%=cor%>><input type=checkbox  name="deletar" value="<%=itens("codigo")%>"></td>
                    <td class="tb" bgcolor=<%=cor%>><a href="Detalhe_Imovel.asp?codigo=<%=itens("codigo")%>&pagina=Main_Imoveis"><%=itens("descricao")%></a></td>
                    <td class="tb" align=left bgcolor=<%=cor%>>
                    <%set cbai=conn.execute("select * from tipo_imovel where codigo in ("&itens("tipo_imovel")&") ORDER BY descricao")%>
                    <%if not cbai.eof then%>
                       <%=cbai("descricao")%>
                    <%end if%>
                    </td>
                    <td bgcolor=<%=cor%> align=center>
                      <a href="javascript:confirma('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&deletar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>')"><img src="../img/excluir_n.gif" alt="Excluir" border=0></a>
                      <a href="Alt_Imoveis.asp?codigo=<%=itens("codigo")%>&cliente=<%=cliente%>&pagina=Main_Imoveis"><img src="../img/editar.gif" alt="Editar" border=0></a>
                      <a href="Main_Registro_Fotos.asp?codigo=<%=itens("codigo")%>&pagina=Main_Imoveis"><img src="../img/icone_foto.gif" alt="Fotos" border=0></a>
                      <a href="Main_visita.asp?cod_imovel=<%=itens("codigo")%>&corretor=<%=corretor%>&pagina=Main_Imoveis"><img src="../img/agenda.gif" alt="Visitas" border=0></a>
                      <a href="main_acompanhamento.asp?imovel=<%=itens("codigo")%>&corretor=<%=corretor%>&pagina=Main_Imoveis"><img src="../img/opcoes.gif" alt="Acompanhamentos" border=0></a>
                      <a href="Main_Contato.asp?imovel=<%=itens("codigo")%>&pagina=Main_Imoveis"><img src="../img/ico_contato.gif" alt="Contatos" border=0></a>
                      <a href="Main_Registro_Midia.asp?imovel=<%=itens("codigo")%>&pagina=Main_Imoveis"><img src="../img/icone_video.gif" alt="Registro Mídia" border=0></a>
                      <a href="Cad_chave.asp?imovel=<%=itens("codigo")%>&pagina=Main_Imoveis"><img src="../img/chave_peq.gif" alt="Registrar Chaves" border=0></a>
                      <a href="Main_Registro_Concorrente.asp?imovel=<%=itens("codigo")%>&pagina=Main_Imoveis"><img src="../img/ico_tempo.gif" alt="Registro Concorrentes" border=0></a>
                      <a href="main_Reserva.asp?imovel=<%=itens("codigo")%>&corretor=<%=corretor%>&pagina=Main_Imoveis"><img src="../img/reservas.gif" alt="Reservas" border=0></a>
                      <%set planos = conn.execute("select * from ativacao_plano where cod_imovel= "&itens("codigo")&" and status=0 and not data_inativacao is null")%>
                        <%if itens("publicar")=0 or isnull(itens("publicar"))= true then%>
                           <a href="javascript:publicar('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&publicar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=publicar')"><img src="../img/andamento.gif" alt="Publicar na Internet" border=0></a>
                        <%else%>
                           <a href="javascript:remover('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&publicar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=retirar')"><img src="../img/andamento_v.gif" alt="Remover Publicação" border=0></a>
                        <%end if%>
                        <%if itens("disponivel")="0" then%>
                           <a href="javascript:disponivel('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&disponivel=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=disponivel')"><img src="../img/ico_tem.gif" alt="Disponibilizar na Pesquisa" border=0></a>
                        <%else%>
                           <a href="javascript:indisponivel('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&disponivel=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=remover')"><img src="../img/ico_nao.gif" alt="Remover da Pesquisa" border=0></a>
                        <%end if%>
                        <a href="Main_Despesas_Extras.asp?imovel=<%=itens("codigo")%>&corretor=<%=corretor%>&pagina=Main_Imoveis"><img src="../img/extra.gif" alt="Despesas Extas" border=0></a>
                      
                      <%sqlplan = "select * from ativacao_plano where cod_imovel= "&itens("codigo")&" and status=0 and data_inativacao is null"
                      'response.write sqlplan
                      set planos = conn.execute(sqlplan)%>
                      <%if not planos.eof then%>
                         <a href="Desativacao_plano.asp?imovel=<%=itens("codigo")%>&pagina=Main_Imoveis"><img src="../img/4.gif" alt="Desativar Plano de Midia" border=0></a>
                      <%else%>
                         <a href="Ativacao_plano.asp?imovel=<%=itens("codigo")%>&pagina=Main_Imoveis"><img src="../img/4.gif" alt="Ativar Plano de Midia" border=0></a>
                      <%end if%>
                    </td>
                  </tr>
                  <%cont=cont+1%>
                  <%itens.movenext%>
               <%loop%>
            <%end if%>
      </table>
          <table width=100%>
            <tr bgcolor="#B5AE67"> 
              <td align=center>
                <a href="javascript:confirma('')"><font color=#FFFFFF><B>Excluir Selecionados</b></a>
              </td>
              <td align=right>
                <select name="ordem" class="texto">
                  <%if ordem="imoveis.imoveis.descricao" then%>
                     <option value="imoveis.descricao" selected>Descrição
                  <%else%>
                     <option value="imoveis.descricao">Descrição
                  <%end if%>
                  <%if ordem="imoveis.tipo_imovel" then%>
                     <option value="imoveis.tipo_imovel" selected>Tipo
                  <%else%>
                     <option value="imoveis.tipo_imovel">Tipo
                  <%end if%>
                  <%if ordem="imoveis.Inclusao" then%>
                     <option value="imoveis.Inclusao" selected>Inclusão
                  <%else%>
                     <option value="imoveis.Inclusao">Inclusão
                  <%end if%>
                  <%if ordem="imoveis.status" then%>
                     <option value="imoveis.status" selected>Internet
                  <%else%>
                     <option value="imoveis.status">Internet
                  <%end if%>
                  <%if ordem="visitas" then%>
                     <option value="visitas" selected>visitas
                  <%else%>
                     <option value="visitas">Visitas
                  <%end if%>
                </select>
                <%if ordem2<>"" then%>
                   <input type="checkbox" name="ordem2" value="desc" checked>Decrescente
                <%else%>
                   <input type="checkbox" name="ordem2" value="desc">Decrescente
                <%end if%>
              <input type=image src="../img/pop_ok.gif" value="submit">              </td>
            </tr>
      </table> 
          <br>
          <table align=center>
            <tr>
              <td valign=top>
                <%if cINT(currentPage)>1 then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage-1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><img src="../img/anterior.gif" border=0></a>
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
                      [ <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=h&i%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><%=h&i%></a> ]
                   <%END IF
                Next%>
              </td>
              <td valign=top>
                <%if cINT(currentPage)<itens.PageCount then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage+1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><img src="../img/proxima.gif" border=0></a>
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

