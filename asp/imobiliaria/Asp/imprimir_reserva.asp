<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
pesquisa=request("pesquisa")
imovel=request("imovel")
opcao=request("opcao")
ordem=request("ordem")
ordem2=request("ordem2")
currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 9
if ordem="" then
   ordem="reserva.nome"
end if
if pesquisa<>"" then
   if opcao="1" then
      sql="and reserva.nome like '%"&pesquisa&"%' "
   else
      if data_valida(pesquisa,0) then
          sql="and reserva.validade=convert(datetime ,'"&pesquisa&"',103) "   
      end if
   end if
end if

if imovel="" then
  itens.Open "select reserva.*,imoveis.descricao as imovel , corretor.nome as corretor from ((Reserva inner join imoveis on reserva.cod_imovel=imoveis.codigo)inner join corretor on reserva.cod_corretor=corretor.codigo) where reserva.status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn
else
  itens.Open "select reserva.*,imoveis.descricao as imovel , corretor.nome as corretor from ((Reserva inner join imoveis on reserva.cod_imovel=imoveis.codigo)inner join corretor on reserva.cod_corretor=corretor.codigo) where reserva.status=0 and imoveis.codigo="&imovel&sql&" ORDER BY "&ordem&" "&ordem2,conn
end if%>
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
            <a href="<%=pagina%>.asp?contrario=<%=contrario%>&imovel=<%=imovel%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO DE RESERVA(S)</B></td>
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
           QUANTIDADE DE REGISTRO:&nbsp<b><%=itens.recordcount%></b>
          </td>
          
        </tr>
       
      </table>
      <br>
      <hr>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
        <%else%>
           <tr>
             <td class="navdroplist"><b>Descrição</b></td>
             <td class="navdroplist"><b>Imóvel</b></td>
             <td class="navdroplist"><b>Válidade</b></td>
           </tr>
       <tr><td class="navdroplist"><br></td></tr>
       <%do while not itens.eof%>
           <tr>
             <td class="navdroplist"><%=itens("nome")%></td>
             <td class="navdroplist"><%=itens("imovel")%></td>
             <td class="navdroplist"><%=itens("validade")%></td>
           </tr>
      <%itens.MoveNext
       loop%>
    <tr>
      <td class="navdroplist">&nbsp;</td>
      <td class="navdroplist">&nbsp;</td>
      <td class="navdroplist">&nbsp;</td>
    </tr>
    
    </table>
    <%end if%>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>