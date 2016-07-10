<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
codigo=request("codigo")
Set visita = Server.CreateObject( "ADODB.Recordset" ) 
visita.activeConnection = conn
visita.CursorType = 3  
radio=request("radio")
opcao=request("opcao")
corretor=request("corretor")
imovel=request("imovel")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
pesquisa=replace(trim(ucase(request("pesquisa"))),"'","")
visita.open "select visita.codigo as codigo, visita.email as email_visita, visita.hora_visita as hora, visita.data_visita as data, visita.nome visita, visita.ddd as ddd_visita, visita.fone as fone_visita,imoveis.* ,imoveis.codigo as imovel, corretor.nome as corretor , corretor.email as email , corretor.ddd_fone as ddd , corretor.fone as fone from ((visita inner join corretor on visita.cod_corretor = corretor.codigo) inner join imoveis on visita.cod_imovel=imoveis.codigo)  where visita.status=0 and visita.codigo ="&codigo,conn
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
   ordem="proposta_visita.descricao"
end if
if pesquisa <> "" then
  sql=" and proposta_visita.descricao like '%"&pesquisa&"%' "
end if
itens.Open "select proposta_visita.* , visita.nome from (proposta_visita inner join visita on visita.codigo=proposta_visita.cod_visita) where proposta_visita.cod_visita="&codigo&" "&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="10" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br><br>
<table width=90% align="center" bgcolor="white">
  <tr>
    <td class="navdroplist">
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td class="navdroplist">
            <a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>IMPRESSÃO DETALHE INTERESSADO</B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <tr>
          <td class="navdroplist">
             SOLICITANTE:&nbsp<b><%=verificador("nome")%></b>
          </td>
        </tr>
        <tr>
          <td class="navdroplist"  width=30%>
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td class="navdroplist">
             HORA:&nbsp<b><%=time()%></b>
          </td>
          <td class="navdroplist">
           <%set contador = conn.execute("select count(proposta_visita.codigo) as total from (proposta_visita inner join visita on visita.codigo=proposta_visita.cod_visita) where proposta_visita.cod_visita="&codigo&" "&sql)%>
           QUANTIDADE DE REGISTRO:&nbsp<b><%=contador("total")%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
      <%If visita.EOF = true then%>
        <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tr>
        </table>
      <%else%>
        <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr> 
               <td valign=top>
                  <table width=100% border=0 cellspacing="0" cellpadding="0">
                    <tr>
                      <td><u><B>INTERESSADO</B></u></td>
                    </tr>
                    <tr>
	              <td class="navdroplist" width=60><b>NOME:</b></td>
                      <td class="navdroplist" colspan=3><%=visita("visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>E-MAIL:</b></td>
	               <td class="navdroplist" colspan=3><%=visita("email_visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>DDD:</b></td>
	               <td class="navdroplist" colspan=3><%=visita("ddd_visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>FONE:</b></td>
	               <td class="navdroplist" colspan=3><%=visita("fone_visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>DATA:</b></td>
	               <td class="navdroplist" colspan=3><%=visita("data")%></td>
	            </tr>
	            <tr>
	               <td class="navdroplist" width=60><b>HORA:</b></td>
	               <td class="navdroplist" colspan=3><%=visita("hora")%></td>
	            </tr>
	            <tr>
                      <td colspan=3 height=2>&nbsp;</td>
	          </table>
                  <table width=50% border=0 cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="navdroplist" colspan=2>
  	                <b><u>PAINEL DE CONTROLE PROPOSTAS</b></u>
  	              <td>
  	            </tr>
  	            <tr><td><br></td></tr>
  	            <tr>
  	              <td class="navdroplist"><b>DESCRICÃO</b></td>
  	              <td class="navdroplist" align=center><b>DATA CADASTRO</b></td>
  	            </tr>
  	          <%do while not itens.eof%>
                    <tr>
                      <td class="navdroplist"><%=itens("descricao")%></td>
                      <td class="navdroplist" align=center><%=itens("data_inclusao")%></td>
                    </tr>
                  <%itens.movenext
                   loop%>
                  </table>
	        </td>  
             </tr>
             <%end if%>
     </table>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>