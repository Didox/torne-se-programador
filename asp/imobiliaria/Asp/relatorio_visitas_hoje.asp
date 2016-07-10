<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
Set acompanhamento = Server.CreateObject( "ADODB.Recordset" )
acompanhamento.activeConnection = conn
acompanhamento.CursorType = 3
acompanhamento.open "select acompanhamento.* , corretor.nome as corretor , imoveis.descricao as imovel from ((acompanhamento INNER JOIN corretor ON acompanhamento.cod_corretor = corretor.codigo)INNER JOIN imoveis ON imoveis.codigo = acompanhamento.cod_imovel) where acompanhamento.data = convert(datetime ,'"&date()&"', 103) and acompanhamento.status=0",conn%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO ACOMPANHAMENTO(S) DO DIA</B></td>
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
          
           QUANTIDADE DE REGISTRO:&nbsp<b><%=acompanhamento.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <%if not acompanhamento.eof then%>
            <%do while not acompanhamento.eof%>
            <tr> 
               <td class="tb" width=60><b>NOME:</b></td>
               <td class="tb" colspan=3><%=acompanhamento("nome")%></td>
            </tr>
            <tr>
               <td class="tb" width=60><b>E-MAIL:</b></td>
               <td class="tb" colspan=3><%=acompanhamento("email")%></td>
            </tr>
            <tr>
               <td class="tb" width=60><b>DDD:</b></td>
               <td class="tb" colspan=3><%=acompanhamento("ddd")%></td>
            </tr>
            <tr>
               <td class="tb" width=60><b>FONE:</b></td>
               <td class="tb" colspan=3><%=acompanhamento("fone")%></td>
            </tr>
            <tr> 
               <td class="tb" width=60><b>ACOMPANHAMENTO:</b></td>
               <td class="tb" colspan=3><%=acompanhamento("data")%></td>
            </tr>
            <tr>
               <td class="tb" width=60><b>CORRETOR:</b></td>
               <td class="tb" colspan=3><%=acompanhamento("corretor")%></td>
            </tr>
            <tr>
               <td class="tb" width=60><b>IMÓVEL:</b></td>
               <td class="tb" colspan=3><%=acompanhamento("imovel")%></td>
            </tr> 
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            <%acompanhamento.movenext
            loop%>
            <%else%>
            <tr>
               <td  class="tb" width=100%><b>Nenhum registro encontrado.</b></td>
            </tr>
            <%end if%>          
          </table> 
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>