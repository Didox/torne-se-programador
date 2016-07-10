<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
ordem=request("ordem")
ordem2=request("ordem2")
opcao=request("opcao")
pagina=request("pagina")
box=request("deletar")
pesquisa=replace(trim(request("pesquisa")),"'","") 
if box <> "" then
   conn.Execute ("update indice_moeda set status=1 where codigo IN ("&box&")")
end if
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 9
if pesquisa <> "" then
   if data_valida(pesquisa,0) then
      sql="and data_inclusao=convert(datetime ,'"&pesquisa&"',103) "   
   end if
end if
itens.open "select * from tipo_moeda where codigo = "&codigo,conn%>
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
              <td width=20><img src="../img/r_8.gif"></td>
              <td class="tb">
                   <B>DETALHE MOEDA</B>
              </td>
              <td class="tb" align=right><a href="Imprimir_detalhe_moeda.asp?ordem2=<%=ordem2%>&ordem=<%=ordem%>&codigo=<%=codigo%>&pagina=Detalhe_moeda"><img alt="Imprimir Indices" src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <table><tr height=10><td></td></tr></table>
          <%if not itens.eof=true then%>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=60><b>&nbsp;MOEDA:</b></td>
              <td class="tb" colspan=5><%=itens("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" width=110><b>&nbsp;DATA INCLUSÃO:</b></td>
              <td class="tb" colspan=5><%=itens("data_inclusao")%></td>
            </tr>
          </table>
          <%else%>
          <table>
            <tr>
              <td></td>
              <td></td>
              <td class="tb"><B>NÃO HÁ MOEDAS CADASTRADAS.</B></td>
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
              <td class="tb"><B>INDÍCES</B></td>
            </tr>
          </table>  
          <table width=100%
            <tr height=25><td></td></tr>
            <tr>
              <td width=10><img src="../img/icon_mini_search.gif"></td>
              <td valign=top>
                <input type=text name="pesquisa" value="<%=pesquisa%>" style="width:190; height:17;background:#E8E8E8;"  maxlength=10 onkeypress="Numero();DATA(this);">
                <input type=radio name="opcao" value=1 checked>Data
              </td>
              <td><input type=image src="../img/pop_ok.gif" alt="Resultado"></td>
              <td><a href="Cad_Indice_Moeda.asp?pagina=Detalhe_Moeda&codigo=<%=codigo%>"><img alt="Novo Indice da Moeda" src="../img/novo_reg.gif" border=0></a></td>
            </tr>
            <tr height=5><td></td></tr>
          </table>
           <%set indice=conn.execute ("select * from indice_moeda where cod_moeda="&codigo&" and status=0"&sql&" "&ordem&" "&ordem2)%>
          <table width=100%>
            <tr>
              <td bgcolor=#B0B0B0 width=20><input type="checkbox" name="selecionar" onclick="todos()"></td>
              <td align=left bgcolor=#B0B0B0><font color=#FFFFFF><b>Data</b></td>
              <td align=center width=105 bgcolor=#B0B0B0><font color=#FFFFFF><b>Valor</b></td>
              <td align=center width=105 bgcolor=#B0B0B0><font color=#FFFFFF><b>Ações</b>
            </tr>
            <%If indice.EOF = true then%>
               <tr>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8>Não há Registros cadastrados.</td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
               </tr>
            <%else
               do While Not indice.EOF
                  if cor="DADAB5" then
                     cor="F4F2EA"
                  else
                     cor="DADAB5"
                  end if%> 
                  <tr>
                    <td class="tb" bgcolor=<%=cor%> width=20><input type=checkbox  name="deletar" value="<%=indice("codigo")%>"></td>
                    <td class="tb" bgcolor=<%=cor%>><%=indice("data_inclusao")%></td>
                    <td class="tb" align=center bgcolor=<%=cor%>>R$ <%=formatnumber(indice("valor"),4)%></td>
                    <td bgcolor=<%=cor%> align=center>
                      <a href="javascript:confirma('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&deletar=<%=indice("codigo")%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&codigo=<%=codigo%>')"><img src="../img/excluir_n.gif" alt="Excluir" border=0></a>
                      <a href="Alt_Indice_moeda.asp?codigo2=<%=indice("codigo")%>&codigo=<%=codigo%>&pagina=Detalhe_moeda"><img src="../img/editar.gif" alt="Editar" border=0></a>
                    </td>
                    </td>
                  </tr>
                  <%cont=cont+1%>
                  <%indice.movenext%>
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
                  <%if ordem="data_inclusao" then%>
                     <option value=" order by data_inclusao" selected>Data
                  <%else%>
                     <option value=" order by data_inclusao" selected>Data
                  <%end if%>
                  <%if ordem="valor" then%>
                     <option value=" order by valor" selected>Valor
                  <%else%>
                     <option value=" order by valor" selected>Valor
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
