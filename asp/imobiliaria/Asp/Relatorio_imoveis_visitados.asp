<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
Set itens = Server.CreateObject( "aDODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3
itens.PageSize = 3
itens.Open "SELECT MAX(imoveis.codigo) as codigo, COUNT(visita.codigo) AS visitas FROM Imoveis INNER JOIN visita ON imoveis.codigo = visita.cod_imovel GROUP BY imoveis.codigo ORDER BY visitas DESC",conn%>
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
            <a href="<%=pagina%>.asp"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO IMÓVEIS MAIS VISITADOS</B></td>
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
           <td class="navdroplist"><b>DESCRIÇÃO</b></td>
           <td class="navdroplist"><b>TIPO DE IMOVEL</b></td>
           <td class="navdroplist"><b>ATUALIZADO</b></td>
           <td class="navdroplist" align=center><b>VISITAS</b></td>
         </tr>
       <tr><td class="navdroplist"><br></td></tr>
       <%do while not itens.eof%>
       <%set imovel=conn.execute("select * from imoveis where codigo="&itens("codigo"))%>
       <tr>
         <td class="navdroplist"><%=imovel("descricao")%></td>
         <td class="navdroplist">
         <%set cbai=conn.execute("select * from tipo_imovel where status=0 and codigo in ("&imovel("tipo_imovel")&") ORDER BY descricao")%>
         <%if not cbai.eof then%>
           <%=cbai("descricao")%>
         <%end if%>
         </td>
         <td class="navdroplist"><%=imovel("data_inclusao")%></td>
         <td class="navdroplist" align=center><%=itens("visitas")%></td>
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