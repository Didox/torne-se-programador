<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
codigo=request("codigo")
pesquisa=replace(trim(request("pesquisa")),"'","")
radio=request("radio")
opcao=request("opcao")
corretor=request("corretor")
imovel=request("imovel")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
if box <> "" then
   conn.Execute ("update acompanhamento set status=1 where codigo IN ("&box&")")
end if
currentPage = Request( "currentPage" )
Set contador = Server.CreateObject( "ADODB.Recordset" )
contador.activeConnection = conn
contador.CursorType = adOpenStatic
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 3
if ordem="" then
   ordem=" descricao"
end if
if ordem2<>"" then
  ordem2=" desc"
end if
if pesquisa <> "" then
  if radio = 1 then
    sql=" and descricao like '%"&pesquisa&"%' "
  else
    if data_valida(pesquisa,0) then
       sql=" and data_inclusao = convert(datetime,'"&pesquisa&"',103)"
    end if
  end if
end if
itens.Open "SELECT * FROM proposta_visita WHERE status = 0 AND cod_visita ="&codigo&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
<%sql=replace(request("sql"),"%","$")%>

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
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr>
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE INTERESSADO
                </B>
              </td>
              <td class="tb" align=right><a href="Imprimir_Detalhe_Proposta_Visita.asp?pesquisa=<%=pesquisa%>&codigo=<%=codigo%>&currentPage=<%=currentPage-1%>&radio=<%=radio%>&corretor=<%=corretor%>&imovel=<%=imovel%>&ordem2=<%=ordem2%>&ordem=<%=ordem%>&opcao=<%=opcao%>&pagina=Detalhe_Proposta_Visita"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <%set visita= conn.execute( "select visita.*, visita.codigo as codigo,visita.nome as nome,visita.email as email_visita,visita.ddd as ddd, visita.fone as fone, visita.hora_visita as hora, visita.data_visita as data, imoveis.* , imoveis.codigo as codigo_imovel, corretor.nome as corretor , corretor.email as email ,corretor.ddd_fone as ddd ,corretor.fone as fone  from ((visita inner join corretor on visita.cod_corretor = corretor.codigo) inner join imoveis on visita.cod_imovel=imoveis.codigo)  where visita.status=0 and visita.codigo="&codigo)%>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr> 
               <td class="tb" width=60><b>NOME:</b></td>
               <td class="tb"><%=visita("nome")%></td>
            </tr>
            <tr>
               <td class="tb" width=60><b>E-MAIL:</b></td>
               <td class="tb"><%=visita("email_visita")%></td>
            </tr>
            <tr>
               <td class="tb" width=60><b>DDD:</b></td>
               <td class="tb"><%=visita("ddd")%></td>
            </tr>
            <tr>
               <td class="tb" width=60><b>FONE:</b></td>
               <td class="tb"><%=visita("fone")%></td>
            </tr>
            <tr> 
               <td class="tb" width=60><b>VISITA:</b></td>
               <td class="tb"><%=visita("data")%></td>
            </tr>
            <tr>
               <td class="tb" width=60><b>HORA:</b></td>
               <td class="tb"><%=visita("hora")%></td>
            </tr>
            <tr>
               <%if visita("visita")=1 then%>
                 <td class="tb" colspan=2><b>VISITA EFETUADA</b></td>
               <%else%>
                 <td class="tb" colspan=2><b>VISITA NÃO EFETUADA</b></td>
               <%end if%>
            </tr>
          </table>
          <br>
          <table><tr height=10>
            <tr><td></td></tr>
            <tr>
            <td><b><a href="detalhe_corretor.asp?codigo=<%=visita("cod_corretor")%>&pagina=Main_corretor">CORRETOR</b></td>
            <td><b><a href="Detalhe_Imovel.asp?codigo=<%=visita("cod_imovel")%>&pagina=Main_Imoveis">IMÓVEL</b></td>                                          
            </tr>  
          </table>
          <br>
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?sql=<%=sql%>&currentPage=<%=h&i%>&codigo=<%=codigo%>&ordem=<%=ordem%>&opcao=<%=opcao%>"name="form1">
        <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_14.gif"></td>
              <td class="tb"><B>PAINEL DE CONTROLE PROPOSTAS</B></td>
            </tr>
          </table>  
          <table width=100%
            <tr height=25><td></td></tr>
            <tr>
              <td width=10><img src="../img/icon_mini_search.gif"></td>
              <td valign=top><input type=text name="pesquisa" value="<%=pesquisa%>" style="width:190; height:17; background=#E8E8E8;"></td>
              <td>
               <%if radio=1 or radio="" then%>
                 <input type="radio" name="radio" value=1 checked>Descrição
                 <input type="radio" value=2 name="radio">Data</td>
               <%else %>
               <%if radio=2 then%>
                 <input type="radio" name="radio" value=1>Descrição
                 <input type="radio" value=2 name="radio">Data</td>
               <%else%>
                 <input type="radio" name="radio" value=1>Descrição
                 <input type="radio" value=2 name="radio" checked>Data</td>
               <%end if%>
               <%end if%>
              <td><input type=image src="../img/pop_ok.gif" alt="Resultado"></td>
              <td><a href="Cad_Proposta_Interessado.asp?codigo=<%=codigo%>&pagina=Detalhe_Proposta_Visita"><img src="../img/novo_reg.gif" alt="Novo Acompanhamento" border=0></a></td>
            </tr>
            <tr height=5><td></td></tr>
          </table>
          <table width=100%>
            <tr>
              <td bgcolor=#B0B0B0 width=20><input type="checkbox" name="selecionar" onclick="todos()"></td>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>Descrição</b></td>
              <td bgcolor=#B0B0B0  width=100 align=center><font color=#FFFFFF><b>Data Inclusão</b></td>
              <td align=center width=60 bgcolor=#B0B0B0><font color=#FFFFFF><b>Ações</b>
            </tr>
            <%If itens.EOF = true then%>
               <tr>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8 width=300 >Não há Registros cadastrados.</td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
               </tr>  
            <%else
               itens.absolutePage = cINT(currentPage)
               do While Not itens.EOF and cont<itens.PageSize
                  if cor="DADAB5" then
                     cor="F4F2EA"
                  else
                     cor="DADAB5"
                  end if%> 
                  <tr>
                    <td bgcolor=<%=cor%> width=20><input type=checkbox  name="deletar" value="<%=itens("codigo")%>"></td>
                    <td class="tb" bgcolor=<%=cor%>><a href="Detalhe_Proposta_Interessado.asp?codigo2=<%=itens("codigo")%>&codigo=<%=codigo%>&pagina=Detalhe_Proposta_visita"><%=itens("descricao")%></a></td>
                    <td class="tb" bgcolor=<%=cor%>  width=100 align=center><%=itens("data_inclusao")%></td>
                    <td bgcolor=<%=cor%> width=60 align=center>
                      <a href="javascript:confirma('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&deletar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>')"><img src="../img/excluir_n.gif" alt="Excluir" border=0></a>
                      <a href="Alt_Proposta_Interessado.asp?codigo2=<%=itens("codigo")%>&codigo=<%=codigo%>&pagina=Detalhe_Proposta_visita"><img src="../img/editar.gif" alt="Editar" border=0></a>
                    </td>
                  </tr>
                  <%cont=cont+1%>
                  <%itens.movenext%>
               <%loop%>
            <%end if%>
          </table>
          <table width=100%>
            <tr> 
              <td align=center bgcolor=#B0B0B0>
                <a href="javascript:confirma('')"><font color=#FFFFFF><B>Excluir Selecionados</b></a>
              </td>
              <td bgcolor=#B0B0B0 align=right>
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
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage-1%>&codigo=<%=codigo%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><img src="../img/anterior.gif" border=0></a>
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
                      [ <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=h&i%>&codigo=<%=codigo%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><%=h&i%></a> ]
                   <%END IF
                Next%>
              </td>
              <td valign=top>
                <%if cINT(currentPage)<itens.PageCount then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage+1%>&codigo=<%=codigo%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><img src="../img/proxima.gif" border=0></a>
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
    <table w