<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
codigo=request("Funcionario")
setor =request("setor")
data_inicio=request("data_inicio")
data_final =request("data_final")
Set itens = Server.CreateObject( "ADODB.Recordset" )
itens.activeConnection = conn
itens.CursorType = 3
if codigo <> "0" then
  sql = sql&" and contas.Cod_funcionario="&codigo
end if
if setor <> "0" then
  sql = sql&" and contas.cod_setor="&setor
end if
itens.open "select contas.cod_funcionario as codigo , Funcionario.nome as nome , setor.descricao as setor , sum(contas.valor) from ((contas INNER JOIN Funcionario ON contas.cod_funcionario=Funcionario.codigo)INNER JOIN setor ON setor.codigo=contas.cod_setor) where contas.status=0 "&sql&" and contas.data between convert(datetime,'"&data_inicio&"',103) and convert(datetime,'"&data_final&"',103) group by contas.cod_funcionario,Funcionario.nome,setor.descricao order by funcionario.nome",conn
%>
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
            <a href="<%=pagina%>.asp?Funcionario=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO PAGAMENTO FUNCIONÁRIOS</B></td>
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
         <%if not itens.eof then%>
          <%do while not itens.eof%>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
           <tr>
              <td class="navdroplist" width=60><b>FUNCIONÁRIO :</b></td>
              <td class="navdroplist" colspan=3>&nbsp;&nbsp;<%=itens("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>SETOR :</b></td>
              <td class="navdroplist" colspan=3>&nbsp;&nbsp;<%=itens("setor")%></td>
            </tr>
          </table>  
          <br>
          <table width=560 border=0 border=1 cellspacing="1" cellpadding="0">
            <tr>
              <td class="navdroplist" bgcolor=#AAAAAA align="left" width=140 ><span class="estilo"><font color="#FFFFFF">DESCRIÇÃO</font></span></td>
              <td class="navdroplist" bgcolor=#AAAAAA align="center" width=140 ><span class="estilo"><font color="#FFFFFF">TIPO</font></span></td>
              <td class="navdroplist" bgcolor=#AAAAAA align="center" width=140 ><span class="estilo"><font color="#FFFFFF">DATA DE PAGAMENTO</font></span></td>
              <td class="navdroplist" bgcolor=#AAAAAA align="center" width=140 ><span class="estilo"><font color="#FFFFFF">VALOR</font></span></td>
            </tr>
          <%set itens2 = conn.execute("select * , contas.valor as valor from (contas INNER JOIN Funcionario ON contas.cod_funcionario=Funcionario.codigo) where contas.Cod_funcionario="&itens("codigo")&" and contas.status=0 and contas.tipo_funcionario = 1 and contas.data between convert(datetime,'"&data_inicio&"',103) and convert(datetime,'"&data_final&"',103)")%>
          <%do while not itens2.eof%>
            <tr>
              <td class="navdroplist" align="left" ><%=itens2("descricao")%></td>
              <td class="navdroplist" align="center" >
                 <%if itens2("tipo")=0 then %>
                   Pagamento
                 <%else%>
                   Extorno
                 <%end if%>
              </td>
              <td class="navdroplist" align="center" ><%=itens2("data")%></td>
              <td class="navdroplist" align="center" >R$<%=formatnumber(itens2("valor"),2)%></td>
            </tr>
            
            <%soma=soma+itens2("valor")%>
          <%
              itens2.movenext
            loop%>
            <tr>
              <td class="navdroplist" colspan=4 bgcolor="E8E8E8"></td>
            </tr>
            <tr><td></td></tr>
            <tr>
              <td class="navdroplist" align="center" ></td>
              <td class="navdroplist" align="center" ></td>
              <td class="navdroplist" align="right" ><b>Total</b></td>
              <td class="navdroplist" align="center" ><b>R$<%=formatnumber(soma,2)%><%soma=soma-soma%></b></td>
            </tr>
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
          </table>
          <%itens.moveNext%>
          <%loop%>
          <%else%>
           <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist"><b>Nenhum registro encontrado.</b></td>
            </tr>
           </table>
          <%end if%>
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>