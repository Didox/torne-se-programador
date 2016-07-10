<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
data=request("data_visita")
opcao=request("opcao")
pagina=request("pagina")
ordem=request("ordem")
ordem2=request("ordem2")

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
   ordem="visita.nome"
end if
if data<>"" then
  sql=" and visita.data_visita= convert(datetime,'"&data&"',103)"
end if
itens.Open "select visita.*, corretor.nome as corretor, servico.descricao as servico, visita.codigo as codigo, visita.hora_visita as hora, visita.data_visita as data, visita.nome as nome, imoveis.descricao as imovel from (((visita inner join imoveis on visita.cod_imovel=imoveis.codigo)inner join servico on visita.cod_servico=servico.codigo) inner join corretor on visita.cod_corretor=corretor.codigo) where visita.status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
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
            <a href="<%=pagina%>.asp?contrario=<%=contrario%>&codigo=<%=codigo%>&data=<%=data%>&tipo=3"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>IMPRIMIR VISITA</B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
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
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%do while not itens.eof%>
           <tr>
             <td class="navdroplist" width=40><b>CLIENTE:</b></td>
             <td class="navdroplist" colspan=3><%=itens("nome")%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=40><b>DDD/TELEFONE:</b></td>
             <td class="navdroplist">(<%=itens("ddd")%>) / <%=itens("fone")%></td>
             <td class="navdroplist" width=40><b>IMÓVEL:</b></td>
             <td class="navdroplist"><%=itens("imovel")%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=40><b>VISITA:</b></td>
             <td class="navdroplist"><%=itens("data")%></td>
             <td class="navdroplist" width=40><b>HORA:</b></td>
             <td class="navdroplist"><%=itens("hora")%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=40><b>CORRETOR:</b></td>
             <td class="navdroplist"><%=itens("corretor")%></td>
             <td class="navdroplist" width=40><b>SERVIÇO:</b></td>
             <td class="navdroplist"><%=itens("servico")%></td>
           </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
             <td colspan=4 height=10></td></tr>
             <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
             <tr><td colspan=4 height=10></td>
          </tr>  
          <tr>
            <td>&nbsp;</td>
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
    <center><a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>