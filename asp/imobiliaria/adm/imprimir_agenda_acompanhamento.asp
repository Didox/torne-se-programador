<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
contrario=request("contrario")
data=request("data_acompanhamento")
pagina=request("pagina")
opcao=request("opcao")
ordem=request("ordem")
ordem2=request("ordem2")

currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "aDODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3
itens.PageSize = 3

if ordem <> "" then
  ordem=" tipo_acompanhamento.descricao"
end if
if data <> "" then
  sql=" and acompanhamento.data=convert(datetime,'"&data&"',103)"
end if

itens.Open "select corretor.* , imoveis.descricao as imovel , acompanhamento.* ,acompanhamento.codigo as codigo, tipo_acompanhamento.descricao as tipo_acompanhamento from (((acompanhamento INNER JOIN Tipo_acompanhamento ON acompanhamento.cod_acompanhamento=tipo_acompanhamento.codigo)INNER JOIN imoveis ON imoveis.codigo=acompanhamento.cod_imovel)INNER JOIN corretor ON corretor.codigo=acompanhamento.cod_corretor) where acompanhamento.status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
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
            <a href="<%=pagina%>.asp?contrario=<%=contrario%>&codigo=<%=codigo%>&data=<%=data%>&tipo=2"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>IMPRIMIR ACOMPANHAMENTO</B></td>
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
           <%do while not itens.eof%>
           <tr>
              <td class="navdroplist"><b>CORRETOR:</b></td>
              <td class="navdroplist"><%=itens("nome")%></td>
              <td class="navdroplist"><b>IMÓVEL:</b></td>
              <td class="navdroplist"><%=itens("imovel")%></td>
            </tr>
            <tr>
              <td class="navdroplist"><b>ACOMPANHAMENTO:</b></td>
              <td class="navdroplist"><%=itens("tipo_acompanhamento")%></td>
              <td class="navdroplist"><b>DATA:</b></td>
              <td class="navdroplist"><%=itens("data")%></td>
            </tr>
            <tr>
              <td class="navdroplist"><b>DESCRIÇÃO:</b></td>
              <td class="navdroplist"><%=itens("descricao")%></td>
            </tr>
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
          <%itens.MoveNext%>
          <%loop%>   
    </table>
    <%end if%>
    <br>
    <center><a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>