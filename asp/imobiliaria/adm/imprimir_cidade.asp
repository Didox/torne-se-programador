<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%contrario=request("contrario")
pesquisa=replace(trim(request("pesquisa")),"'","")
radio=request("radio")
opcao=request("opcao")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "aDODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3
itens.PageSize = 3
if pesquisa<>"" then
  if radio = "1" then 
    sql="and cidade.descricao like '%"&pesquisa&"%' "
  else
    sql="and estado.descricao like '%"&pesquisa&"%' "
  end if
end if
itens.Open "select cidade.codigo as codigo, cidade.descricao as cidade , estado.descricao as estado from (cidade INNER JOIN estado on cidade.cod_estado = estado.codigo) where cidade.status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
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
            <a href="main_cidade.asp?contrario=<%=contrario%>&codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO CIDADE(S)</B></td>
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
           <td class="navdroplist"><b>DESCRIÇÃO:</b></td>
           <td class="navdroplist"><b>ESTADO:</b></td>
         </tr>
       <tr><td class="navdroplist"><br></td></tr>
       <%do while not itens.eof%>
       <tr>
         <td class="navdroplist"><%=itens("cidade")%></td>
         <td class="navdroplist"><%=itens("estado")%></td>
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