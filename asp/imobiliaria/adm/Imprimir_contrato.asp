<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pesquisa=request("pesquisa")
pagina=request("pagina")
sql=request("sql")
sql_filtro=request("sql_filtro")
codigo2=request("codigo2")
opcao=request("opcao")
ordem=request("ordem")
ordem2=request("ordem2")
currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 9
if sql<>"" then
  if opcao="1" then
    sql="and contrato.numero like '$"&pesquisa&"$' "
  else
    sql="and clientes.nome like '$"&pesquisa&"$' "
  end if
end if
sql_filtro=replace(request("sql_filtro"),"$","%")
if ordem="" then
   ordem="contrato.numero"
end if
if pesquisa<>"" then
   if opcao="1" then
      sql="and contrato.numero like '%"&pesquisa&"%' "
   else
      sql="and clientes.nome like '%"&pesquisa&"%' "
   end if
end if
itens.Open "SELECT contrato.* , corretor.nome as corretor,fiador.nome as fiador1, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, contrato.status AS status FROM (((((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo)INNER JOIN fiador ON contrato.cod_fiador1 = fiador.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN corretor ON contrato.cod_corretor = corretor.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) where contrato.status=0 "&sql&sql_filtro&" ORDER BY "&ordem&" "&ordem2,conn%>
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
            <a href="<%=pagina%>.asp"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table class="navdroplist" width=100% align="center" bgcolor="#f7f7f7">
        <tr>
          <td class="navdroplist" align=center>
            <B>RELATÓRIO CONTRATO(S)
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
       <tr>
         <td class="navdroplist" width=40><b>CORRETOR:</b></td>
         <td class="navdroplist" colspan=9><%=itens("corretor")%></td>
       </tr>
       <tr>
       <tr>
         <td class="navdroplist" width=40><b>CLIENTE:</b></td>
         <td class="navdroplist" colspan=9><%=ucase(itens("nome"))%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=40><b>IMÓVEL:</b></td>
         <td class="navdroplist" width=200><%=Ucase(itens("imovel"))%></td>
         <td class="tb"><b>CHAVE:</b></td>
         <td class="tb" colspan=3>
           <%set chave = conn.execute("select cod_quadro from registro_chave  where codigo="&itens("cod_chave_imovel"))%>
           <%if chave.eof = false then%>
           <%=chave("cod_quadro")%>
           <%end if%>
         </td>
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
         <%set estado = conn.execute("select descricao from estado where codigo="&imovel_("cod_bairro"))%>
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