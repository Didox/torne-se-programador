<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
data_inicio=replace(trim(request("data_inicio")),"'","")
data_final=replace(trim(request("data_final")),"'","")
ordem=request("ordem")
ordem2=request("ordem2")
tipo_conta=trim(request("tipo_conta"))
if tipo_conta<>""then
 sql = sql&" and tipo_conta.codigo="&tipo_conta
end if
if ordem="" then
   ordem="contas.data"
end if
Set conta = Server.CreateObject( "ADODB.Recordset" )
conta.activeConnection = conn
conta.CursorType = 3
conta.open "select contas.numero as numero, contas.codigo as codigo,contas.tipo as tipo,contas.descricao as descricao,tipo_conta.descricao as tipo_conta, setor.descricao as setor,contas.data as data,contas.valor as valor from ((contas INNER JOIN tipo_conta ON contas.cod_tipo_conta=tipo_conta.codigo)INNER JOIN setor ON contas.cod_setor=setor.codigo) where contas.data between convert(datetime ,'"&data_inicio&"', 103) and convert(datetime ,'"&data_final&"', 103) "&sql&"  and contas.status=0 ORDER BY "&ordem&" "&ordem2,conn%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO CONTA</B></td>
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
          
           QUANTIDADE DE REGISTRO:&nbsp<b><%=conta.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
          <table width=100% border=0 cellspacing="1" cellpadding="0">
         <%if not conta.eof then%>
         <tr>
           <td class="navdroplist" align=center><b>NÚMERO:</b></td>
           <td class="navdroplist"><b>DESCRIÇÃO:</b></td>
           <td class="navdroplist"><b>DATA:</b></td>
           <td class="navdroplist" align=center><b>ENTRADA:</b></td>
           <td class="navdroplist" align=center><b>SAÍDA:</b></td>
           <td class="navdroplist" align=center><b>CALCULO:</b></td>
         </tr>
         <tr><td class="navdroplist"><br></td></tr>
         <%do while not conta.eof%>
        <tr>
         <td class="navdroplist" align=center><%=conta("numero")%></td>       
         <td class="navdroplist"><%=conta("descricao")%></td>
         <td class="navdroplist"><%=conta("data")%></td>
         <%if conta("tipo")=1 then%>
         <td class="navdroplist"  align=center><font color="#0000FF">R$ <%=formatnumber(conta("valor"),2)%></td>
         <%else%>
         <td class="navdroplist"  align=center><font color="#FF0000"></td>
         <%end if%>
         <%if conta("tipo")=1 then%>
         <td class="navdroplist"  align=center><font color="#0000FF"></td>
         <%valor=valor+conta("valor")%>
         <%else%>
         <td class="navdroplist" align=center><font color="#FF0000">R$ <%=formatnumber(conta("valor"),2)%></td>
         <%valor=valor-conta("valor")%>
         <%end if%>
          <td class="navdroplist" align=center><font color="<%if instr(valor,"-") then response.write "#FF0000" else response.write "#0000FF"%>">R$ <%=formatnumber(valor,2)%></td>
        </tr>
        <%conta.MoveNext
        loop%>
          <tr><td></td></tr>
          <tr><td></td></tr>
          <%set entrada = conn.execute("select sum(valor) as entrada from contas where tipo=1")%>
          <%set saida = conn.execute("select sum(valor) as saida from contas where tipo=2")%>
          <tr>
             <td></td>
             <td></td>
             <td  class="navdroplist"  align=center><b>TOTAL</td>
             <td  class="navdroplist"  align=center><b>R$ <%=formatnumber(entrada("entrada"),2)%>
             </td>
             <td class="navdroplist" align=center><b>R$ <%=formatnumber(saida("saida"),2)%>
             </td>
             <td class="navdroplist" align=center><b>R$ <%=formatnumber(valor,2)%></td>
          </tr>
          <%else%>
           <tr>
              <td class="tb" align=left>Nenhum registro encontrado.</td>
           </tr>
          <%end if%>
          </table>
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>