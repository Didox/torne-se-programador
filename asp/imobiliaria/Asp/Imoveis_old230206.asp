<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
codigo=request("codigo")
pesquisa=replace(trim(request("pesquisa")),"'","")
sql_filtro=replace(request("sql_filtro"),"$","%")
opcao=request("opcao")
box=request("deletar")
box2=request("publicar")
box3=request("disponivel")
ordem=request("ordem")
ordem2=request("ordem2")
if box <> "" then
   conn.Execute ("update Imoveis set status="&request("sttu")&" where codigo IN ("&box&")")
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
   ordem="imoveis.endereco"
end if
if pesquisa<>"" then
   sql="and imoveis.endereco like '%"&pesquisa&"%' "
end if
if tipo_login<>"1" then
   sql = sql&" and imoveis.cod_cliente="&Verificador("codigo")   
end if
itens.Open "select * from imoveis  where status in (1,2) "&sql&sql_filtro&" ORDER BY "&ordem&" "&ordem2,conn
set destaque=conn.execute("SELECT registro_foto.*, registro_foto.arquivo as arquivo, imoveis.descricao,registro_foto.descricao AS foto FROM (registro_foto INNER JOIN imoveis ON registro_foto.cod_imovel=imoveis.codigo) where registro_foto.status=0 AND destaque=1"&sql_filtro)
%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<script language="javascript">
  function pop_arquivo(url)
  {
    window.open(url,"pop_arquivo","resizable=yes,scrollbars=yes,location=no,top=0,left=50,width=750,height=600");
  }
</script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#F4F2EA" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <table width="99%"  border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td><table width=100% class="tabela001" border="0">
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>"name="form1">
            <tr><td></td></tr>
          </table></td>
		  </tr>
		  <tr>
            <td><table width=100% border=0 class="tabela002" cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_12.gif"></td>
              <td class="tb"><B>PAINEL DE CONTROLE IMÓVEIS</B></td>
            </tr>
            </table></td>  
		  </tr>
		  </table>
          <table width=100% cellpadding="4">
            <tr height=25><td></td></tr>
            <tr>
              <td width=10><img src="../img/icon_mini_search.gif"></td>
              <td valign=top><input type=text name="pesquisa" value="<%=pesquisa%>" style="width:190; height:17; background=#E8E8E8;"></td>
              <td><input type=image src="../img/pop_ok.gif" alt="Resultado"></td>
              <%if tipo<>"2" then%>
              <td><a href="Main_filtro_imoveis.asp?codigo=<%=codigo%>"><img alt="Filtrar Imóveis" src="../img/filtro.gif" border=0></a></td>
              <%end if%>
              <td><a href="Imprimir_Imoveis.asp?currentPage=<%=currentPage%>&cliente=<%=verificador("codigo")%>&pesquisa=<%=pesquisa%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&opcao=<%=opcao%>&sql_filtro=<%=sql_filtro%>&sql=<%=sql%>&pagina=Imoveis"><img alt="Imprimir Imóveis" src="../img/icone-imprimir.gif" border=0></a></td>
              <%if tipo="2" then%>
              <td><a href="Main_Imoveis_Net.asp?cliente=<%=verificador("codigo")%>&pagina=Imoveis"><img alt="Novo Imóvel" src="../img/novo_reg.gif" border=0></a></td>
              <%end if%>
            </tr>
            <tr height=5><td></td></tr>
          </table>
          <table width=99% border="0" align="center">
            <tr>
              <td class="tabela001"><font color=#FFFFFF><b>Ref.</b></td>
              <td class="tabela001"><font color=#FFFFFF><b>Imóveis Encontrados</b></td>
              <td align=left width=100 class="tabela001"><font color=#FFFFFF><b>Tipo do Imovel</b></td>
              <td align=center width=70 class="tabela001"><font color=#FFFFFF><b>Inclusão</b></td>
              <td align=center width=70 class="tabela001"><font color=#FFFFFF><b>Ações</b></td>
            </tr>
            <%If itens.EOF = true then%>
               <tr>
                 <td class="tabela003"></td>
                 <td  class="tabela003"></td>
                 <td  class="tabela003">Não há Registros cadastrados.</td>
                 <td  class="tabela003"></td>
                 <td  class="tabela003"></td>
                
               </tr>  
            <%else
               itens.absolutePage = cINT(currentPage)
               do While Not itens.EOF and cont<itens.PageSize
                  if itens("status") = 1 then
                     cor="DADAB5"
                  else
                     cor="F4F2EA"
                  end if%> 
                  <tr>
                    <td class="tb" bgcolor=<%=cor%>><a href="Detalhe_Imovel.asp?codigo=<%=itens("codigo")%>&pagina=Imoveis"><%=itens("codigo")%></a></td>
                    <td class="tb" bgcolor=<%=cor%>><a href="Detalhe_Imovel.asp?codigo=<%=itens("codigo")%>&pagina=Imoveis"><%=itens("endereco")%></a></td>
                    <td class="tb" align=left bgcolor=<%=cor%>>
                    <%set cbai=conn.execute("select * from tipo_imovel where codigo in ("&itens("tipo_imovel")&") ORDER BY descricao")%>
                    <%if not cbai.eof then%>
                       <%=cbai("descricao")%>
                    <%end if%>
                    </td>
                    <td align="center" class="tb" bgcolor=<%=cor%>><%=itens("data_inclusao")%></td>
                    <td align="center" class="tb" bgcolor=<%=cor%>>
                      <%if itens("status") = "2" then%>
                      <%if tipo_login="2" then%>
                        <a href="javascript:confirma2('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&deletar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&sttu=1')"><img src="../img/excluir_n.gif" alt="Indisponibilizar Imóvel" border=0></a>
                        <a href="Alt_Imoveis.asp?codigo=<%=itens("codigo")%>&cliente=<%=cliente%>&pagina=Main_Imoveis"><img src="../img/editar.gif" alt="Editar" border=0></a>
                        <%if session("tipo_login") <> 2 then%>
                        <a href="Main_Registro_Fotos.asp?codigo=<%=itens("codigo")%>&pagina=Main_Imoveis"><img src="../img/icone_foto.gif" alt="Fotos" border=0></a>
                        <%end if%>
                        <%set planos = conn.execute("select * from ativacao_plano where cod_imovel= "&itens("codigo")&" and status=0 and not data_inativacao is null")%>
                         <%if itens("publicar")=0 or isnull(itens("publicar"))= true then%>
                           <a href="javascript:publicar('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&publicar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=publicar')"><img src="../img/andamento.gif" alt="Publicar na Internet" border=0></a>
                        <%else%>
                           <a href="javascript:remover('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&publicar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=retirar')"><img src="../img/andamento_v.gif" alt="Remover Publicação" border=0></a>
                        <%end if%>
                        <%set planos = conn.execute("select * from ativacao_plano where cod_imovel= "&itens("codigo")&" and status=0 and not data_inativacao is null")%>
                        <%'if planos.eof=false then%>
                           <!--a href="Desativacao_plano.asp?imovel=<%=itens("codigo")%>&pagina=Main_Imoveis"><img src="../img/4.gif" alt="Desativar Plano de Midia" border=0></a>
                        <%'else%>
                           <a href="Ativacao_plano.asp?imovel=<%=itens("codigo")%>&pagina=Main_Imoveis"><img src="../img/4.gif" alt="Ativar Plano de Midia" border=0></a-->
                        <%'end if%>
                      <%else%>  
                        <a href="javascript:popup2('popup.asp?codigo2=<%=itens("codigo")%>&pagina=Imoveis.asp')"><img src="../img/icone_foto.gif" alt="Fotos" border=0></a>
                      <%end if%>  
                      <%else%>
                        <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&deletar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&sttu=2"><img src="../img/excluir_n.gif" alt="Disponibilizar Imóvel" border=0></a>
                      <%end if%>
                    </td>                    
                  </tr>
                  <%cont=cont+1%>
                  <%itens.movenext%> 
               <%loop%>
            <%end if%>
          </table>
          <table width=99% border="0" align="center">
            <tr> 
              <td class="tabela001" align=right>
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
    
    </td>
  </tr>
</table>
</body>
</html>

