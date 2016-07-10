<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
servico=request("servico")
imovel=request("imovel")
corretor=request("corretor")
data_inicial=request("data_inicial")
data_final=request("data_final")
intervalo=DAteDiff("m",datevalue(data_inicial),datevalue(data_final))+1
if servico <> "0" then
  sql = "and codigo="&servico
end if
if imovel <> "0" then
  sql2 = "and cod_imovel="&imovel
end if
if corretor <> "0" then
  sql2 = "and cod_corretor="&corretor
end if
contador=intervalo/12
if instr(contador,",")<>0 then
   contador=fix(contador)+1
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
            <a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO CONTRATO(S) POR SERVIÇO(S)</B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <tr>
          <td class="navdroplist">
            SOLICITANTE:&nbsp<b><%=verificador("nome")%></b>
          </td>
          <td class="navdroplist">
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td class="navdroplist">
            HORA:&nbsp<b><%=time()%></b>
          </td>
        </tr>
        <tr>
          <%if imovel<>"0" then%>
             <%set imoveis=conn.execute("select * from imoveis where codigo="&imovel)%>
             <td class="navdroplist">
               IMOVEL:&nbsp<b><%=imoveis("descricao")%></b>
             </td>
          <%end if%>
          <%if corretor<>"0" then%>
             <%set corretores=conn.execute("select * from corretor where codigo="&corretor)%>
             <td class="navdroplist">
               CORRETOR:&nbsp<b><%=corretores("nome")%></b>
             </td>
          <%end if%>
          <%if servico<>"0" then%>
             <%set servicos=conn.execute("select * from servico where codigo="&servico)%>
             <td class="navdroplist">
               SERVIÇO:&nbsp<b><%=servicos("descricao")%></b>
             </td>
          <%end if%>
        </tr>
      </table>
      <br>
      <hr>
      <table bordercolor="#F7F7F7" border=1 cellspacing="0" cellpadding="0">
        <%do while cont_total<contador%>
           <tr><td colspan=13>&nbsp;</td></tr>
           <tr>
             <td class="navdroplist" width=50>&nbsp;</td>
             <%data=data_inicial%>
             <%do while datevalue(data_inicial)<=datevalue(data_final) and limite<12%>
                <td class="navdroplist width=50" align=center><b><%=month(data_inicial)%>/<%=year(data_inicial)%></b></td>
                <%data_inicial=dateadd("m",+1,data_inicial)%>
                <%limite=limite+1%>
             <%loop%>
             <%limite=0%>
           </tr>
           <%set serv=conn.execute("select * from servico where status=0 "&sql)%>
           <%do while not serv.eof%>
              <tr>
                <td class="navdroplist"><b><%=serv("descricao")%></b></td>
                <%for i=1 to intervalo%>
                   <%if datevalue(data)<=datevalue(data_final) then%>
                      <%set contrato=conn.execute("select count(codigo) as total from contrato where status=0 and tipo_servico="&serv("codigo")&" and data_inicio between convert(datetime,'"&data&"',103) and convert(datetime,'"&dateadd("d",-1,dateadd("m",+1,data))&"',103)"&sql2)%>
                      <td class="navdroplist" align=center  width=50><%=contrato("total")%></td>
                   <%end if%>
                   <%data=dateadd("m",+1,data)%>
                   <%if i>=12 then%>
                      <%exit for%>
                   <%end if%>
                <%next%>
              </tr>
              <%data=dateadd("m",-12,data)%>
              <%serv.movenext%>
           <%loop%>
           <%cont_total=cont_total+1%>
        <%loop%>
      </table>
      <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>