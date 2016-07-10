<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%contrario=request("contrario")
corretor=request("corretor")
imovel=request("imovel")
pagina=request("pagina")
pesquisa=request("pesquisa")
opcao=request("opcao")
ordem2=request("ordem2")
currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "aDODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3
itens.PageSize = 3
if pesquisa<>"" then
   sql="and descricao like '"&pesquisa&"%' "
end if
if corretor <> "" then
  itens.Open "select * from acompanhamento where cod_corretor = "&corretor&" and cod_imovel="&imovel&" and status=0 "&sql&" order by descricao "&ordem2,conn
else  
  itens.Open "select * from acompanhamento where cod_imovel = "&imovel&" and cod_imovel="&imovel&" and status=0 "&sql&" order by descricao "&ordem2,conn
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
           QUANTIDADE DE REGISTRO:&nbsp<b>1</b>
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
              <td class="navdroplist" width=130><b>CORRETOR:</b></td>
              <%set corretor = conn.execute("select * from corretor where codigo="&itens("cod_corretor"))%>
              <td class="navdroplist" colspan=3><%=corretor("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=130><b>IMÓVEL:</b></td>
              <%set imovel = conn.execute("select * from imoveis where codigo="&itens("cod_imovel"))%>
              <td class="navdroplist" colspan=3><%=imovel("descricao")%></td>
            </tr>
            <tr>
              <tr><td class="navdroplist" width=130><b>ACOMPANHAMENTO:</b></td>
              <%set acompanhamento = conn.execute("select * from tipo_acompanhamento where codigo="&itens("acompanhamento"))%>
              <td class="navdroplist"><%=acompanhamento("descricao")%></td></tr>
            </tr>
            <tr>
              <td class="navdroplist" width=130><b>DATA:</b></td>
              <td class="navdroplist"><%=itens("data")%></td></tr>
            </tr>
            <tr>
              <td class="navdroplist" width=130><b>DESCRIÇÃO:</b></td>
              <td class="navdroplist"><%=itens("descricao")%></td>
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