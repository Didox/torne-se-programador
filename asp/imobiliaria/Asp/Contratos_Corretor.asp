<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pesquisa=replace(trim(request("pesquisa")),"'","")
tipo=request("tipo")
pagina=request("pagina")
codigo=request("codigo")
codigo2=request("codigo2")
opcao=request("opcao")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
sql_filtro=request("sql_filtro")
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
itens.PageSize = 7
if ordem="" then
   ordem="contrato.numero"
end if
if pesquisa<>"" then
   if opcao="1" then
      sql="and contrato.numero like '%"&pesquisa&"%' "
   else
      sql="and imoveis.descricao like '%"&pesquisa&"%' "
   end if
end if

if session("tipo")="2" then
  itens.Open "SELECT contrato.*, contrato.codigo AS codigo, contrato.data_vencimento as vencimento, contrato.numero AS numero, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, contrato.status AS status FROM (((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) where contrato.cod_cliente="&session("cod")&" and contrato.status=0 "&sql&sql_filtro&" ORDER BY "&ordem&" "&ordem2,conn
  set divida=conn.execute("SELECT contrato.*, contrato.codigo AS codigo, contrato.data_vencimento as vencimento, contrato.numero AS numero, imoveis.descricao AS imovel, clientes.nome AS nome, contrato.status AS status FROM ((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) where contrato.cod_cliente="&session("cod")&" and contrato.status=0 "&sql&sql_filtro&" ORDER BY "&ordem&" "&ordem2)
else
  itens.Open "SELECT contrato.*, contrato.codigo AS codigo, contrato.data_vencimento as vencimento, contrato.numero AS numero, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, contrato.status AS status FROM (((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) where cod_corretor="&codigo&" and contrato.status=0 "&sql&sql_filtro&" ORDER BY "&ordem&" "&ordem2,conn
end if%>
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
          <%set exibir  = conn.execute("select * from corretor where codigo="&session("cod"))%>
          <table width=99% class="tabela001" align="center">
            <tr><td></td></tr>
          </table>
          <table width=100% bgcolor=#CCCCCC>
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>&codigo=<%=codigo%>"name="form1">
          </table>
          <table width=199% border=0 class="tabela002" cellspacing="0" cellpadding="0" align="center">
            <tr> 
              <td width=20><img src="../img/r_16.gif"></td>
              <td class="tb"><B>CONTRATOS</B></td>
            </tr>
          </table>  
          <table width=100%>
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
              <td><a href="Main_filtro_contrato.asp?codigo=<%=codigo%>&pagina=Contratos_Corretor"><img alt="Filtrar Contratos" src="../img/filtro.gif" border=0></a></td>
              <td><a href="Imprimir_contrato.asp?currentPage=<%=currentPage%>&codigo2=<%=codigo%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&pagina=Contratos_corretor"><img alt="Imprimir Contratos" src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
            <tr height=5><td></td></tr>
          </table>
          <table width=100%>
            <tr>
              <td align=center class="tabela001"><font color=#FFFFFF><b>Contrato</b></td>
              <td width=105 class="tabela001"><font color=#FFFFFF><b>Imóvel</b></td>
              <td align=center width=100 class="tabela001"><font color=#FFFFFF><b>Serviço</b></td>
              <td align=center width=100 class="tabela001"><font color=#FFFFFF><b>Data de Vencimento</b></td>
              <td align=center width=105 class="tabela001"><font color=#FFFFFF><b>Ações</b>
            </tr>
            <%If itens.EOF = true then%>
               <tr>
                 <td class="tabela003"></td>
                 <td class="tabela003"></td>
                 <td class="tabela003">Não há Registros cadastrados.</td>
                 <td class="tabela003"></td>
                 <td class="tabela003"></td>
                 <td class="tabela003"></td>
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
                    <td class="tb" align=center bgcolor=<%=cor%>><a href="Detalhe_contrato.asp?codigo=<%=itens("codigo")%>&codigo2=<%=codigo%>&pagina=Contratos_Corretor"><%=itens("numero")%></a></td>
                    <td class="tb" align=left bgcolor=<%=cor%>><%=itens("imovel")%></td>
                    <td class="tb" align=center bgcolor=<%=cor%>><%=itens("servico")%></td>
                    <td class="tb" align=center bgcolor=<%=cor%>><%=itens("vencimento")%></td>
                    <%set conta = conn.execute("SELECT * FROM contas where cod_funcionario="&session("cod")&" and cod_contrato = "&itens("codigo")&" and contas.status=0")%>
                      <td bgcolor=<%=cor%> align=center>
                    <%if not conta.eof then%>
                         <a href="Detalhe_comissao.asp?codigo=<%=itens("codigo")%>&codigo2=<%=codigo%>&pagina=Contratos_Corretor"><img src="../img/comissao.gif" alt="Comissão" border=0></a>
                    <%else%>
                      <%if session("tipo")=2 then%>
                      <%set perfil=conn.execute("select * from perfil_contrato where cod_contrato="&itens("codigo"))%>
                      <%do while not perfil.eof%>
                         <%set pagamentos=conn.execute("select count(codigo) as parcelas_pagas from contas where cod_contrato="&itens("codigo")&" and cod_funcionario=0 and cod_tipo_conta="&perfil("cod_tipo_conta"))%>
                         <%data_inicio=perfil("data_inicio")%>
                         <%if weekday(day(perfil("data_inicio"))&"/"&month(date())&"/"&year(date()))=1 then%>
                            <%data_inicio=perfil("data_inicio")+1%>
                         <%end if%>
                         <%if weekday(day(perfil("data_inicio"))&"/"&month(date())&"/"&year(date()))=7 then%>
                            <%data_inicio=perfil("data_inicio")+2%>
                         <%end if%>
                         <%parcelas_pagar=int(DateDiff("m",data_inicio,date())/perfil("meses")+1)%>
                         <%if day(data_inicio)>=Day(date()) then%>
                            <%parcelas_pagar=parcelas_pagar-1%>
                         <%end if%>
                         <%if parcelas_pagar>perfil("quantidade") then%>
                            <%parcelas_pagar=perfil("quantidade")%>
                         <%end if%>
                         <%if parcelas_pagar-pagamentos("parcelas_pagas")>0 then%>
                            <%devendo=1%>
                         <%end if%>
                         <%perfil.movenext%>
                      <%loop%>
                      <%if devendo=1 then%>
                         <a href="Main_contrato_pagamento.asp?codigo=<%=itens("codigo")%>&pagina=contratos_corretor"><img src="../img/honorarioon.gif" alt="Pagamento do Contrato" border=0></a>
                      <%else%>
                         <a href="Main_contrato_pagamento.asp?codigo=<%=itens("codigo")%>&pagina=contratos_corretor"><img src="../img/honorarioof.gif" alt="Pagamento do Contrato" border=0></a>
                      <%end if%>
                      <%devendo=0%>  
                      <%end if
                    end if%>
                       </td>
                  </tr>
                  <%cont=cont+1%>
                  <%itens.movenext%>
               <%loop%>
            <%end if%>
          </table>
          <table width=100%>
            <tr> 
              <td class="tabela001" align=right>
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
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?codigo=<%=session("cod")%>&codigo2=<%=codigo2%>&currentPage=<%=currentPage-1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><img src="../img/anterior.gif" border=0></a>
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
                      [ <a href="<%=request.servervariables("SCRIPT_NaME")%>?&codigo=<%=session("cod")%>&codigo2=<%=codigo2%>currentPage=<%=h&i%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><%=h&i%></a> ]
                   <%END IF
                Next%>
              </td>
              <td valign=top>
                <%if cINT(currentPage)<itens.PageCount then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?codigo=<%=session("cod")%>&codigo2=<%=codigo2%>&currentPage=<%=currentPage+1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><img src="../img/proxima.gif" border=0></a>
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

