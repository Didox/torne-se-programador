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
  itens.Open "SELECT contrato.*, fiador.nome as fiador1, corretor.nome as corretor, contrato.codigo AS codigo, contrato.data_vencimento as vencimento, contrato.numero AS numero, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, contrato.status AS status FROM (((((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) INNER JOIN corretor ON corretor.codigo = contrato.cod_corretor) INNER JOIN fiador ON fiador.codigo = contrato.cod_fiador1) where contrato.cod_cliente="&codigo2&" and contrato.status=0 "&sql&sql_filtro&" ORDER BY "&ordem&" "&ordem2,conn
else
  itens.Open "SELECT contrato.*, fiador.nome as fiador1, corretor.nome as corretor, contrato.codigo AS codigo, contrato.data_vencimento as vencimento, contrato.numero AS numero, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, contrato.status AS status FROM (((((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) INNER JOIN corretor ON corretor.codigo = contrato.cod_corretor) INNER JOIN fiador ON fiador.codigo = contrato.cod_fiador1) where contrato.cod_corretor="&codigo2&" and contrato.status=0 "&sql&sql_filtro&" ORDER BY "&ordem&" "&ordem2,conn
end if%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br>
<table width=90% align="center" bgcolor="white">  <tr>
    <td>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td>
            <a href="<%=pagina%>.asp?codigo=<%=codigo2%>&tipo=1"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table class="navdroplist" width=100% align="center" bgcolor="#f7f7f7">
        <tr>
          <td class="navdroplist" align=center>
            <B>RELATÓRIO CONTRATOS
            </B>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <tr>
          <td width=30% class="navdroplist">
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td class="navdroplist">
             HORA DA SOLICITAÇÃO:&nbsp<b><%=time()%></b>
          </td>
          <td class="navdroplist">
            CONTRATOS ENCONTRADOS:&nbsp;<b><%=itens.recordcount%></b>
          </td>
        </tr>
      </table>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td><hr></td>
        </tr>
      </table>
      <br>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td  width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tr>
        </table>
        <%else%>
       <tr>
         <td colspan=11><br></td>
       </tr>
       <%do while not itens.eof%>
       <tr>
         <td class="navdroplist" width=40><b>NÚMERO:</b></td>
         <td class="navdroplist" colspan=9><%=Ucase(itens("numero"))%></td>
       </tr>
       <%if session("tipo")="2" then%>
       <tr>
         <td class="navdroplist" width=40><b>CORRETOR:</b></td>
         <td class="navdroplist" colspan=9><%=itens("corretor")%></td>
       </tr>
       <%end if%>
       <tr>
       <tr>
         <td class="navdroplist" width=40><b>CLIENTE:</b></td>
         <td class="navdroplist" colspan=9><%=ucase(itens("nome"))%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=40><b>IMÓVEL:</b></td>
         <td class="navdroplist" width=200><%=ucase(itens("imovel"))%></td>
       </tr>
       <tr>
         <%set imovel_ = conn.execute("select * from imoveis where codigo = "&itens("cod_imovel"))%>
         <td class="navdroplist" width=40><b>ENDEREÇO:</b></td>
         <td class="navdroplist" width=200><%=Ucase(imovel_("endereco"))%> - <%=Ucase(imovel_("numero"))%> <%if imovel_("complemento") <>"" then%> - <%=Ucase(imovel_("complemento"))%><%end if%></td>
         <td class="navdroplist" width=40><b>BAIRRO:</b></td>
         <%set bairro = conn.execute("select descricao from bairro where codigo="&imovel_("cod_bairro"))%>
         <td class="navdroplist" width=200><%=Ucase(bairro("descricao"))%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=40><b>CIDADE:</b></td>
         <%set cidade = conn.execute("select descricao from cidade where codigo="&imovel_("cod_cidade"))%>
         <td class="navdroplist" width=200><%=Ucase(cidade("descricao"))%></td>
         <td class="navdroplist" width=40><b>ESTADO:</b></td>
         <%set estado = conn.execute("select * from estado where codigo="&imovel_("cod_estado"))%>
         <td class="navdroplist" width=200><%=Ucase(estado("descricao"))%></td>
       </tr>
       <tr>
         <td class="navdroplist"><b>FIADOR 1:</b></td>
         <td class="navdroplist"><%=ucase(itens("fiador1"))%></td>
         <%if itens("cod_fiador2") > 0 then%>
         <%set fiador2 = conn.execute("select nome from fiador where codigo="&itens("cod_fiador2"))%>
         <td class="navdroplist"><b>FIADOR 2:</b></td>
         <td class="navdroplist"><%=ucase(fiador2("nome"))%></td>
         <%end if%>
       </tr>
       <tr>
         <td class="navdroplist"><b>SERVIÇO:</b></td>
         <td class="navdroplist"><%=ucase(itens("servico"))%></td>
         <td class="navdroplist" width=100><b>VALOR:</b></td>
         <td class="navdroplist"><%=formatnumber(itens("valor"),2)%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=100><b>INICIO CONTRATO:</b></td>
         <td class="navdroplist" width=200><%=itens("data_inicio")%></td>
         <td class="navdroplist" width=120><b>TÉRMINO CONTRATO:</b></td>
         <td class="navdroplist"><%=itens("data_vencimento")%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=100><b>REAJUSTE CONTRATO:</b></td>
         <td class="navdroplist" width=200><%=itens("reajuste")%></td>
         <td class="navdroplist" width=120><b>COMISSÃO DO CORRETOR:</b></td>
         <td class="navdroplist"><%=itens("comissao")%>%</td>
       </tr>
       <tr>
         <td class="navdroplist" width=100><b>MULTA:</b></td>
         <td class="navdroplist"><%=itens("multa")%>%</td>
         <td class="navdroplist" width=100><b>TAXA ADMINISTRAÇÃO:</b></td>
         <td class="navdroplist"><%=itens("taxa")%>%</td>
       </tr>
       <tr>
         <td class="navdroplist" width=100><b>INDICE DE REAJUSTE:</b></td>
         <td class="navdroplist">
          <% set indice = conn.execute("select * from indice where codigo="&itens("cod_indice")) %>
          <%=indice("descricao")%>
         </td>
       </tr>
       <tr>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td class="navdroplist" colspan=11 bgcolor="E8E8E8"></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
       </tr>
       <%itens.MoveNext
       loop%>
    <%end if%>
    </table>
    <br>
    <center><a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><font class="navdroplist">&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>