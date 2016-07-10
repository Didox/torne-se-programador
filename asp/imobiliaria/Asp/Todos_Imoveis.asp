<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
codigo=request("codigo")
pagina=request("pagina")
pesquisa=replace(trim(request("pesquisa")),"'","")
sql_filtro=replace(request("sql_filtro"),"$","%")
opcao=request("opcao")
box=request("deletar")
box2=request("publicar")
box3=request("disponivel")
ordem=request("ordem")
ordem2=request("ordem2")
if box <> "" then
   conn.Execute ("update Imoveis set status=1 where codigo IN ("&box&")")
end if
if box2 <> "" and opcao="publicar" then
   conn.Execute ("update Imoveis set publicar=1 where codigo IN ("&box2&")")
end if
if box2 <> "" and opcao="retirar" then
   conn.Execute ("update Imoveis set publicar=0 where codigo IN ("&box2&")")
end if
if box3 <> "" and opcao="disponivel" then
   conn.Execute ("update Imoveis set disponivel=1 where codigo IN ("&box3&")")
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
if pesquisa<>"" then
   sql="and imoveis.descricao like '%"&pesquisa&"%' "
end if
itens.Open "select * from imoveis  where status=0 "&sql&sql_filtro&" ORDER BY "&ordem&" "&ordem2,conn
set destaque=conn.execute("SELECT TOP 6 registro_foto.*, registro_foto.arquivo as arquivo, imoveis.descricao,registro_foto.descricao AS foto FROM (registro_foto INNER JOIN imoveis ON registro_foto.cod_imovel=imoveis.codigo) where registro_foto.status=0 AND destaque=1"&sql_filtro)
%>
<script lenguage="javascript">
  function pop_arquivo(url)
  {
    window.open(url,"pop_arquivo","resizable=yes,scrollbars=yes,location=no,top=0,left=40,width=700,height=500");
  }
</script>
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
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>&sql_filtro=<%=sql_filtro%>"name="form1">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
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
              <td><a href="Imprimir_Imoveis.asp?currentPage=<%=currentPage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&sql_filtro=<%=sql_filtro%>&pagina=Main_Imoveis"><img alt="Imprimir Imóveis" src="../img/icone-imprimir.gif" border=0></a></td>
              
            </tr>
            <tr height=5><td></td></tr>
          </table>
          <table width=100%>
            <tr>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>Imóveis Encontrados</b></td>
              <td align=left width=100 bgcolor=#B0B0B0><font color=#FFFFFF><b>Tipo do Imovel</b></td>
              <td align=center width=70 bgcolor=#B0B0B0><font color=#FFFFFF><b>Inclusão</b></td>
              <td align=center width=120 bgcolor=#B0B0B0><font color=#FFFFFF><b>Ações</b>
            </tr>
            <%If itens.EOF = true then%>
               <tr>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8>Não há Registros cadastrados.</td>
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
                    <td class="tb" bgcolor=<%=cor%>><a href="Detalhe_Imovel.asp?codigo=<%=itens("codigo")%>&pagina=Main_Imoveis"><%=itens("descricao")%></a></td>
                    <td class="tb" align=left bgcolor=<%=cor%>>
                    <%set cbai=conn.execute("select * from tipo_imovel where codigo in ("&itens("tipo_imovel")&") ORDER BY descricao")%>
                    <%if not cbai.eof then%>
                       <%=cbai("descricao")%>
                    <%end if%>
                    </td>
                    <td align="center" class="tb" bgcolor=<%=cor%>><%=itens("data_inclusao")%></td>
                    <td bgcolor=<%=cor%> align=center>
                      <%if destaque("codigo") <> "" then %>
                        <a href="javascript:pop_arquivo('Popup.asp?codigo=<%=destaque("codigo")%>&codigo2=<%=itens("codigo")%>')"><img src="../img/icone_foto.gif" alt="Detalhar Imóvel" border="0"></a>
                      <%else%>
                        <img src="../img/icone_foto.gif" alt="Nenhuma Foto Cadastrada" border="0">
                      <%end if%>
                      <%if session("tipo")="2" then%>
                        <a href="Cad_contato.asp?imovel=<%=itens("codigo")%>&pagina=Todos_Imoveis"><img src="../img/agenda.gif" alt="Agendar Visita" border=0></a>
                      <%else%>
                        &nbsp;
                      <%end if%>
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

