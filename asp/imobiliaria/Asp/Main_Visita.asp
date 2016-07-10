<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
codigo2=request("codigo")
pesquisa=replace(trim(request("pesquisa")),"'","")
opcao=request("opcao")
box=request("deletar")
cod_imovel=request("cod_imovel")
ordem=request("ordem")
ordem2=request("ordem2")
filtro=request("filtro")
codigo=request("codigo")
if box <> "" then
   conn.Execute ("update Visita set status=1 where codigo IN ("&box&")")
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
   ordem="visita.data_visita"
end if
if corretor <> "" then
  sql3=" and visita.cod_corretor="&corretor
end if
if cod_imovel <> "" then
  sql4 = " and visita.cod_imovel="&cod_imovel
end if
if pesquisa<>"" then
   if opcao="1" then
      sql="and visita.nome like '%"&pesquisa&"%' "
   else
      if opcao="2" then
         sql="AND imoveis.descricao like '%"&pesquisa&"%' "
      else
         if data_valida(pesquisa,0) then
            sql="and visita.data_visita = convert(datetime ,'"&pesquisa&"',103) "   
         end if
     end if
   end if
end if
if filtro = "vencidas" then
   sql2=" and data_visita < convert(datetime,'"&date()&"',103)"
else
   if filtro  = "hoje" then
      sql2 = " and data_visita = convert(datetime,'"&date()&"',103)"
   end if
end if
itens.Open "select visita.*, visita.codigo as codigo ,  visita.nome as nome , visita.hora_visita as hora, visita.data_visita as data, imoveis.descricao as imovel from ((visita inner join corretor on visita.cod_corretor = corretor.codigo) inner join imoveis on visita.cod_imovel=imoveis.codigo)  where visita.status=0 and visita.cod_corretor="&codigo&" "&sql&sql2&sql3&sql4&" ORDER BY "&ordem&" "&ordem2,conn%>
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
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>&codigo=<%=codigo%>&cod_imovel=<%=cod_imovel%>&"name="form1">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_14.gif"></td>
              <td class="tb"><B>PAINEL DE CONTROLE VISITAS</B></td>
            </tr>
          </table>  
          <table width=100%
            <tr height=25><td></td></tr>
            <tr>
              <td width=10><img src="../img/icon_mini_search.gif"></td>
              <td valign=top><input type=text name="pesquisa" value="<%=pesquisa%>" style="width:190; height:17; background=#E8E8E8;"></td>
              <td valign=top>
                <%if opcao="" or opcao="1" then%>
                   <input type=radio name="opcao" value=1 checked>Nome
                <%else%>
                   <input type=radio name="opcao" value=1>Nome
                <%end if%>
              </td>
              <td valign=top>
                <%if opcao="2" then%>
                   <input type=radio name="opcao" value=2 checked>Imovel
                <%else%>
                   <input type=radio name="opcao" value=2>Imovel
                <%end if%>
              </td>
              <td valign=top>
                <%if opcao="3" then%>
                   <input type=radio name="opcao" value=3 checked>Data
                <%else%>
                   <input type=radio name="opcao" value=3>Data
                <%end if%>
              </td>
              <td><input type=image src="../img/pop_ok.gif" alt="Resultado"></td>
              <td><a href="Imprimir_Visita.asp?currentPage=<%=currentPage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&codigo=<%=codigo%>&pagina=Main_Visita"><img src="../img/icone-imprimir.gif" border=0 alt="Imprimir Visitas"></a></td>
            </tr>
            <tr height=5><td></td></tr>
          </table>
          <table width=100%>
            <tr>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>&nbsp;</b></td>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>Nome</b></td>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>Imovel</b></td>
              <td bgcolor=#B0B0B0 align=center><font color=#FFFFFF><b>Visita</b></td>
              <td bgcolor=#B0B0B0 align=center><font color=#FFFFFF><b>Hora</b></td>
              <td align=center width=105 bgcolor=#B0B0B0><font color=#FFFFFF><b>Ações</b>
            </tr>
            <%If itens.EOF = true then%>
               <tr>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8>Não há Registros cadastrados.</td>
                 <td bgcolor=#D8DCD8></td>
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
                    <td bgcolor=<%=cor%> width=20>&nbsp;</td>
                    <td class="tb" bgcolor=<%=cor%>><a href="Detalhe_Visita.asp?codigo=<%=itens("codigo")%>&codigo2=<%=codigo%>&imovel=<%=itens("cod_imovel")%>&pagina=Main_Visita"><%=itens("nome")%></a></td>
                    <td class="tb" bgcolor=<%=cor%>><%=itens("imovel")%></td>
                    <td class="tb" align=center bgcolor=<%=cor%>><%=itens("data")%></td>
                    <td class="tb" align=center bgcolor=<%=cor%>><%=itens("hora")%></td>
                    <td bgcolor=<%=cor%> align=center>
                      <a href="Alt_Visita.asp?codigo=<%=itens("codigo")%>&codigo2=<%=codigo%>&pagina=Main_Visita"><img src="../img/editar.gif" alt="Editar" border=0></a>
                    </td>
                  </tr>
                  <%cont=cont+1%>
                  <%itens.movenext%>
               <%loop%>
            <%end if%>
          </table>
          <table width=100%>
            <tr> 
              <td bgcolor=#B0B0B0 align=right>
                <select name="filtro" class="texto">
   		  <%if filtro="todos" then%>
                     <option value="todos" selected>Todos
                  <%else%>
                     <option value="Todos">Todos
                  <%end if%>
                  <%if filtro="vencidas" then%>
                     <option value="vencidas" selected>Vencidas
                  <%else%>
                     <option value="vencidas">Vencidas
                  <%end if%>
                  <%if filtro="hoje" then%>
                     <option value="hoje" selected>Hoje
                  <%else%>
                     <option value="hoje">Hoje
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
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage-1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&corretor=<%=corretor%>"><img src="../img/anterior.gif" border=0></a>
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
                      [ <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=h&i%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&corretor=<%=corretor%>"><%=h&i%></a> ]
                   <%END IF
                Next%>
              </td>
              <td valign=top>
                <%if cINT(currentPage)<itens.PageCount then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage+1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&corretor=<%=corretor%>"><img src="../img/proxima.gif" border=0></a>
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

