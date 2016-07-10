<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pesquisa=replace(trim(request("pesquisa")),"'","")
codigo=request("codigo")
radio=request("radio")
opcao=request("opcao")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
if box <> "" then
   conn.Execute ("update registro_foto set status=1 where codigo IN ("&box&")")
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
   ordem="registro_foto.descricao"
end if
if pesquisa<>"" then
    sql="and registro_foto.descricao like '%"&pesquisa&"%' "
end if
itens.Open "select registro_foto.*, registro_foto.cod_imovel as imovel ,registro_foto.descricao as descricao from registro_foto  where registro_foto.cod_imovel="&codigo&" and registro_foto.status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<script>
function popup(arquivo,w,h)
{
  fenetre=window.open('imagem.asp?codigo='+arquivo,"imagem","resizable=no,scrollbars=no,location=no,top=20,left=20,width="+w+",height="+h)
}
  function popup2(url)
  {
    window.open(url,"popup","resizable=yes,scrollbars=yes,location=no,top=0,left=0,width=740,height=540");
  }
</script> 
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
           <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>&pagina=<%=pagina%>&codigo=<%=codigo%>"name="form1">
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <input type="hidden" name="codigo" value=<%=codigo%>>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_14.gif"></td>
              <td class="tb"><B>PAINEL DE CONTROLE REGISTRO DE FOTOS</B></td>
            </tr>
          </table>  
          <table width=100%
            <tr height=25><td></td></tr>
            <tr>
              <td width=10><img src="../img/icon_mini_search.gif"></td>
              <td valign=top><input type=text name="pesquisa" value="<%=pesquisa%>" style="width:190; height:17; background=#E8E8E8;"></td>
              <td>
                 <input type="radio" name="radio" value="1" checked>Comodo
                 <input type="radio" value="2" name="radio">Descrição
              </td>
              <td><input type=image src="../img/pop_ok.gif" alt="Resultado"></td>
              <td><a href="javascript:popup2('popup.asp?codigo2=<%=codigo%>&pagina=Main_Registro_Fotos.asp')"><img src="../img/Botao_foto.gif" border=0 alt=Fotos></a></td>
              <td><a href="main_fotos.asp?pagina=Main_Registro_Fotos&codigo=<%=codigo%>"><img alt="Nova Foto" src="../img/novo_reg.gif" border=0></a></td>
            </tr>
            <tr height=5><td></td></tr>
          </table>
          <table width=100%>
            <tr>
              <td bgcolor=#B0B0B0 width=20><input type="checkbox" name="selecionar" onclick="todos()"></td>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>Descrição</b></td>
              <td align=center width=105 bgcolor=#B0B0B0><font color=#FFFFFF><b>Ações</b>
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
                    <td bgcolor=<%=cor%> width=20><input type=checkbox  name="deletar" value="<%=itens("codigo")%>"></td>
                    <td class="tb" bgcolor=<%=cor%>><%=itens("arquivo")%></td>
                    <td bgcolor=<%=cor%> align=center>
                      <a href="javascript:confirma('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&codigo=<%=request("codigo")%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&deletar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>')"><img src="../img/excluir_n.gif" alt="Excluir" border=0></a>
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

