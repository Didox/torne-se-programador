<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
codigo2=request("codigo2")
imovel=request("imovel")
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
   ordem="acompanhamento.descricao"
end if
if pesquisa <> "" then
  if radio = 1 then
    sql=" and acompanhamento.descricao like '%"&pesquisa&"%' "
  else
    if radio = 2 then
      sql=" and tipo_acompanhamento.descricao like '%"&pesquisa&"%' "
    else
      if data_valida(pesquisa,0) then
      sql=" and acompanhamento.data = convert(datetime,'"&pesquisa&"',103)"
      end if
    end if
  end if
end if
itens.Open "select acompanhamento.* , acompanhamento.cod_corretor as corretor, acompanhamento.cod_imovel as imovel from ((acompanhamento INNER JOIN imoveis ON imoveis.codigo=acompanhamento.cod_imovel)INNER JOIN corretor ON corretor.codigo=acompanhamento.cod_corretor) where acompanhamento.status=0 and acompanhamento.cod_corretor = "&codigo2&" and acompanhamento.cod_visita="&codigo&" and acompanhamento.cod_imovel="&imovel&" "&sql&" ORDER BY "&ordem,conn%>
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
                <B>DETALHE VISITA
                </B>
              </td>
              <td class="tb" align=right><a href="Imprimir_detalhe_visita.asp?codigo=<%=codigo%>&codigo2=<%=codigo2%>&currentPage=<%=currentPage-1%>&radio=<%=radio%>&imovel=<%=imovel%>&ordem2=<%=ordem2%>&ordem=<%=ordem%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&pagina=detalhe_visita"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <%set visita= conn.execute( "select visita.*, visita.codigo as codigo,visita.nome as nome,visita.email as email_visita,visita.ddd as ddd, visita.fone as fone, visita.hora_visita as hora, visita.data_visita as data, imoveis.* , imoveis.codigo as codigo_imovel, corretor.nome as corretor , corretor.email as email ,corretor.ddd_fone as ddd ,corretor.fone as fone  from ((visita inner join corretor on visita.cod_corretor = corretor.codigo) inner join imoveis on visita.cod_imovel=imoveis.codigo)  where visita.status=0 and visita.codigo="&codigo)%>
          <table width=30% border=0 cellspacing="0" cellpadding="0">
            <tr> 
               <td class="tb"><b>NOME:</b></td>
               <td class="tb"><%=visita("nome")%></td>
            </tr>
            <tr>
               <td class="tb"><b>E-MAIL:</b></td>
               <td class="tb"><%=visita("email_visita")%></td>
            </tr>
            <tr>
               <td class="tb"><b>DDD:</b></td>
               <td class="tb"><%=visita("ddd")%></td>
            </tr>
            <tr>
               <td class="tb"><b>FONE:</b></td>
               <td class="tb"><%=visita("fone")%></td>
            </tr>
            <tr> 
               <td class="tb"><b>VISITA:</b></td>
               <td class="tb"><%=visita("data")%></td>
            </tr>
            <tr>
               <td class="tb"><b>HORA:</b></td>
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
            <td><b><a href="Detalhe_Imovel.asp?codigo=<%=visita("cod_imovel")%>&pagina=Main_Imoveis">IMÓVEL</b></td>                                          
            </tr>  
          </table>
          <br>
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=h&i%>&codigo=<%=codigo%>&codigo2=<%=codigo2%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&opcao=<%=opcao%>"name="form1">
        <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_14.gif"></td>
              <td class="tb"><B>PAINEL DE CONTROLE ACOPANHAMENTOS</B></td>
            </tr>
          </table>  
          <table width=100%>
            <tr height=1><td></td></tr>
            <tr>
              <td width=10><img src="../img/icon_mini_search.gif"></td>
              <td valign=top><input type=text name="pesquisa" value="<%=pesquisa%>" style="width:190; height:17; background=#E8E8E8;"></td>
              <td>
               <%if radio=1 or radio="" then%>
                 <input type="radio" name="radio" value=1 checked>Descrição
                 <input type="radio" value=2 name="radio">Tipo
                 <input type="radio" value=3 name="radio">Data</td>
               <%else %>
               <%if radio=2 then%>
                 <input type="radio" name="radio" value=1>Descrição
                 <input type="radio" value=2 name="radio" checked>Tipo
                 <input type="radio" value=3 name="radio">Data</td>
               <%else%>
                 <input type="radio" name="radio" value=1>Descrição
                 <input type="radio" value=2 name="radio" >Tipo
                 <input type="radio" value=3 name="radio" checked>Data</td>
               <%end if%>
               <%end if%>
              <td><input type=image src="../img/pop_ok.gif" alt="Resultado"></td>
                <td><a href="Cad_Acompanhamento.asp?codigo=<%=codigo%>&imovel=<%=visita("cod_imovel")%>&corretor=<%=visita("cod_corretor")%>&pagina=Detalhe_Visita&ordem=<%=ordem%>&ordem2=<%=ordem2%>&codigo2=<%=codigo2%>"><img src="../img/novo_reg.gif" alt="Novo Acompanhamento" border=0></a></td>
            </tr>
            <tr height=5><td></td></tr>
          </table>
          <table width=100%>
            <tr>
              <td bgcolor=#B0B0B0 width=20>&nbsp;</td>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>Descrição</b></td>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>Tipo do Acompanhamento</b></td>
              <td bgcolor=#B0B0B0 align=center><font color=#FFFFFF><b>Data de Vencimento</b></td>
              <td align=center width=105 bgcolor=#B0B0B0><font color=#FFFFFF><b>Ações</b>
            </tr>
            <%If itens.EOF = true then%>
               <tr>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8 width=300 >Não há Registros cadastrados.</td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
               </tr>  
            <%else
               itens.absolutePage = cINT(currentPage)
               do While Not itens.EOF and cont<itens.PageSize
                  if cor="D8DCD8" then
                     cor="EFF0EF"
                  else
                     cor="D8DCD8"
                  end if%> 
                  <tr>
                    <td class="tb" bgcolor=<%=cor%>>&nbsp;</td>
                    <td class="tb" bgcolor=<%=cor%>><a href="detalhe_acompanhamento.asp?codigo=<%=itens("codigo")%>&pagina=Main_acompanhamento&corretor=<%=itens("corretor")%>&imovel=<%=itens("imovel")%>"><%=itens("descricao")%></a></td>
                    <%set tipo_acompanhamento =conn.execute("select * from tipo_acompanhamento where codigo="&itens("cod_acompanhamento"))%>
                    <td class="tb" bgcolor=<%=cor%>><%=tipo_acompanhamento("descricao")%></td>
                    <td class="tb" bgcolor=<%=cor%> align=center><%=itens("data")%></td>
                    <td bgcolor=<%=cor%> align=center>
                      <a href="Alt_acompanhamento.asp?acomp=<%=itens("codigo")%>&codigo=<%=codigo%>&imovel=<%=imovel%>&corretor=<%=visita("cod_corretor")%>&pagina=Detalhe_Visita&ordem=<%=ordem%>&ordem2=<%=ordem2%>&codigo2=<%=codigo2%>"><img src="../img/editar.gif" alt="Editar" border=0></a>
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
          <table width=100% border=0>
            <tr height=1><td></td></tr>
          </table>
          <table align=center>
            <tr>
              <td valign=top>
                <%if cINT(currentPage)>1 then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage-1%>&codigo=<%=codigo%>&codigo2=<%=codigo2%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&imovel=<%=imovel%>&opcao=<%=opcao%>"><img src="../img/anterior.gif" border=0></a>
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
                      [ <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=h&i%>&codigo=<%=codigo%>&codigo2=<%=codigo2%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&imovel=<%=imovel%>&opcao=<%=opcao%>"><%=h&i%></a> ]
                   <%END IF
                Next%>
              </td>
              <td valign=top>
                <%if cINT(currentPage)<itens.PageCount then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage+1%>&codigo=<%=codigo%>&codigo2=<%=codigo2%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&imovel=<%=imovel%>&opcao=<%=opcao%>"><img src="../img/proxima.gif" border=0></a>
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