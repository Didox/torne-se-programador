<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
pagina=request("pagina")
pesquisa=request("pesquisa")
opcao=request("opcao")
ordem2=request("ordem2")

currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "aDODB.Recordset" ) 
itens.activeConnection = conn
Set indice = Server.CreateObject( "aDODB.Recordset" ) 
indice.activeConnection = conn
itens.CursorType = 3
itens.PageSize = 3
if pesquisa <> "" then
   if isdate(pesquisa) and len(pesquisa)=10 then
      sql="and data_inclusao=convert(datetime ,'"&pesquisa&"',103) "   
   end if
end if
itens.open "select * from tipo_moeda where codigo = "&codigo,conn
indice.open "select * from indice_moeda where cod_moeda="&codigo&" and status=0"&sql&" "&ordem&" "&ordem2, conn%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO ÍNDICES MOEDA</B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <tr>
          <td class="navdroplist" colspan=2>
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
           <%set contador = conn.execute ("select count(codigo) as total from indice_moeda where cod_moeda="&codigo&" and status=0"&sql)%>
           QUANTIDADE DE REGISTRO:&nbsp<b><%=contador("total")%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
        <%If itens.EOF = true then%>
          <table width=100% align="center" bgcolor="#FFFFFF" border=0>
           <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
        <%else%>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0>
         <tr>
           <td class="navdroplist" width=50><b>MOEDA:</b></td>
           <td class="navdroplist"><%=itens("descricao")%></td>
           <td class="navdroplist" width=100><b>DATA INCLUSÃO:</b></td>
           <td class="navdroplist"><%=itens("data_inclusao")%></td>
         </tr>
       <tr><td class="navdroplist"colspna=4><br></td></tr>
       <%if indice.eof=true then%>
         <tr>
           <td align=center></td>
           <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
         </tR>
        </table>
       <%else%>
       <table align="left" bgcolor="#FFFFFF" border=0>
         <tr>
           <td class="navdroplist" align=center colspan=2><b>ATUALIZAÇÕES DA MOEDA</b></td>
         <tr>
         <tr>
           <td class="navdroplist" align=center><b>DATA:</b></td>
           <td class="navdroplist" align=center><b>VALOR:</b></td>
         </tr>
       <%do while not indice.eof%>
         <tr>
           <td class="navdroplist" align=center><%=indice("data_inclusao")%></td>
           <td class="navdroplist" align=center>R$ <%=formatnumber(indice("valor"),4)%></td>
         </tr>
      <%indice.movenext
        loop%>
       </table>
        <%end if%>
    <tr>
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