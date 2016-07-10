<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pesquisa=replace(trim(request("pesquisa")),"'","")
pagina=request("pagina") 
codigo=request("codigo")
opcao=request("opcao")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
if box <> "" then
   conn.Execute ("update contrato set status=1 where codigo IN ("&box&")")
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
   ordem="contas.codigo"
end if
if pesquisa<>"" then
   if opcao="1" then
       sql= sql&" and tipo_conta.descricao like '%"&pesquisa&"%'"
   else
     if data_valida(pesquisa,0) then 
       sql= sql&" and contas.data = convert(datetime,'"&pesquisa&"',103) "
     end if
   end if
end if
itens.Open "SELECT contas.codigo as cod_conta,contrato.numero as numero,contas.cod_tipo_conta as plano ,contrato.cod_imovel as imovel,contas.data as data,contas.cod_tipo_conta as cod_plano,contas.valor as valor,contrato.cod_cliente as cliente FROM (contas INNER JOIN contrato ON contas.cod_contrato=contrato.codigo)INNER JOIN tipo_conta ON tipo_conta.codigo=contas.cod_tipo_conta WHERE contrato.codigo="&codigo&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
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
          <%set exibir=conn.execute("select * from contrato where codigo="&codigo)%>
          <%set cliente  = conn.execute("select * from clientes where codigo="&exibir("cod_cliente"))%>
          <%set corretor = conn.execute("select * from corretor where codigo="&exibir("cod_corretor"))%>
          <%set imovel   = conn.execute("select * from imoveis where codigo="&exibir("cod_imovel"))%>
          <%set fiador1  = conn.execute("select * from fiador where codigo="&exibir("cod_fiador1"))%>
          <%set servico_contrato  = conn.execute("select * from servico where codigo="&exibir("tipo_servico"))%>
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                   <B>DETALHE PAGAMENTO DO CONTRATO</B>
              </td>
              <td class="tb" align=right><a href="Imprimir_contrato_cliente.asp?codigo=<%=codigo%>&pagina=Main_contrato_pagamento"><img alt="Imprimir Cliente" src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=150><b>NUMERO:</b></td>
              <td class="tb" colspan=3 ><%=exibir("numero")%></td>
            </tr>
            <tr>
              <td class="tb" ><b>CLIENTE:</b></td>
              <td class="tb" colspan=3><%=cliente("nome")%></td>
            </tr>
            <tr>	
              <td class="tb" ><b>CORRETOR:</b></td>
              <td class="tb" colspan=3><%=corretor("nome")%></td>
            </tr>
            <tr>
              <td class="tb" ><b>IMÓVEL:</b></td>
              <td class="tb" colspan=3><%=imovel("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" ><b>FIADOR 1:</b></td>
              <td class="tb" colspan=3><%=fiador1("nome")%></td>
            </tr>
            <% if exibir("cod_fiador2") <> 0 then %>
            <%set fiador2  = conn.execute("select * from fiador where codigo="&exibir("cod_fiador2"))%>
            <tr>
              <td class="tb" ><b>FIADOR 2:</b></td>
              <td class="tb" colspan=3><%=fiador2("nome")%></td>
            </tr>
            <% end if %>
            <tr colspan=2>
               <td class="tb" ><b>INICIO:</b></td>
               <td class="tb" ><%=exibir("data_inicio")%></td>
               <td class="tb" ><b>&nbsp;VENCIMENTO:</b></td>
               <td class="tb" width=235><%=exibir("data_vencimento")%></td>
             </tr>
             <tr>
               <td class="tb" ><b>REAJUSTE:</b></td>
               <td class="tb" ><%=exibir("reajuste")%></td>
               <td class="tb" ><b>&nbsp;VALOR:</b></td>
               <td class="tb" >R$ <%=formatnumber(exibir("valor"),2)%></td>
             </tr>
            <tr>
              <td class="tb" ><b>TAXA ADMINISTRATIVA:</b></td>
              <td class="tb"><%=exibir("taxa")%>%</td>
              <td class="tb" ><b>&nbsp;SERVIÇO:</b></td>
              <td class="tb" ><%=servico_contrato("descricao")%></td>
            </tr>
            <tr>
              <td class="tb"><b>MULTA POR ATRAZO:</b></td>
              <td class="tb"><%=exibir("multa")%>%</td>
              <td class="tb" ><b>&nbsp;INDICE DE REAJUSTE:</b></td>
              <td class="tb">
                <%set indice = conn.execute("select * from indice where codigo="&exibir("cod_indice"))%>
                <%=indice("descricao")%></td>
            </tr>
          </table>
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>&codigo=<%=codigo%>"name="form1">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_16.gif"></td>
              <td class="tb"><B>PAGAMENTOS DO CONTRATO</B></td>
            </tr>
          </table>  
          <table width=100%>
            <tr>
              <td width=10><img src="../img/icon_mini_search.gif"></td>
              <td valign=top><input type=text name="pesquisa" value="<%=pesquisa%>" style="width:190; height:17; background=#E8E8E8;"></td>
              <%if opcao="" or opcao="1" then%>
              <td valign=top><input type=radio name="opcao" value=1 checked>Tipo</td>
              <td valign=top><input type=radio name="opcao" value=2 >Data de Vencimento</td>
              <%else%>
              <td valign=top><input type=radio name="opcao" value=1 >Tipo</td>
              <td valign=top><input type=radio name="opcao" value=2 checked>Data de Vencimento</td>
              <%end if%>
              <td><input type=image src="../img/pop_ok.gif" alt="Resultado"></td>
            </tr>
            <tr height=5><td></td></tr>
          </table>
          <table width=100%>
            <tr>
              <td width=200 bgcolor=#B0B0B0><font color=#FFFFFF><b>Tipo</b></td>
              <td bgcolor=#B0B0B0 align="center"><font color=#FFFFFF><b>Data de Pagamento</b></td>
              <td width=130 align=center width=100 bgcolor=#B0B0B0><font color=#FFFFFF><b>Valor</b></td>
            </tr>
            <%If itens.EOF = true then%>
               <tr>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8>Não há Registros cadastrados.</td>
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
                    <td class="tb" bgcolor=<%=cor%>>
                    <%set cbai=conn.execute("select * from tipo_conta where status = 0 and codigo="&itens("plano"))%>
                    <%=cbai("descricao")%></td>
                    <td class="tb" align=center bgcolor=<%=cor%>><%=itens("data")%></td>
                    <td class="tb" align=center bgcolor=<%=cor%>>R$ <%=formatnumber(itens("valor"),2)%></td>
                  </tr>
                  <%cont=cont+1%>
                  <%itens.movenext%>
               <%loop%>
            <%end if%>
          </table>
          <table width=100%>
            <tr> 
              <td bgcolor=#B0B0B0 align=right>
                <select name="ordem" class="texto">
                  <%if ordem="tipo_conta.codigo" then%>
                     <option value="tipo_conta.codigo" selected>Tipo
                  <%else%>
                     <option value="tipo_conta.codigo">Tipo
                  <%end if%>
                  <%if ordem="perfil_contrato.data_inicio" then%>
                     <option value="perfil_contrato.data_inicio" selected>Data de Pagamento
                  <%else%>
                     <option value="perfil_contrato.data_inicio">Data de Pagamento
                  <%end if%>
                  <%if ordem="perfil_contrato.valor" then%>
                     <option value="perfil_contrato.valor" selected>Valor
                  <%else%>
                     <option value="perfil_contrato.valor">Valor
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
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage-1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&codigo=<%=codigo%>"><img src="../img/anterior.gif" border=0></a>
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
                      [ <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=h&i%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&codigo=<%=codigo%>"><%=h&i%></a> ]
                   <%END IF
                Next%>
              </td>
              <td valign=top>
                <%if cINT(currentPage)<itens.PageCount then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage+1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&codigo=<%=codigo%>"><img src="../img/proxima.gif" border=0></a>
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

