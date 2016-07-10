<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
sql_filtro=request("sql_filtro")
data_vencimento=request("data_vencimento")
data_vencimento_inicio=request("data_vencimento_inicio")
Set itens = Server.CreateObject( "ADODB.Recordset" )
itens.activeConnection = conn
itens.CursorType = 3
itens.Open "SELECT contrato.*, contrato.codigo AS codigo, contrato.data_vencimento as vencimento ,contrato.numero AS numero, imoveis.descricao AS imovel, clientes.nome AS nome,  contrato.status AS status FROM ((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) where contrato.status=0"&sql_filtro&" ORDER BY numero",conn%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO DÍVIDAS CONTRATUAIS</B></td>
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
      </table>
      <br>
      <hr>
      <table border=0 cellspacing="0" cellpadding="0">
        <%if not itens.eof then%>
           <%do while not itens.eof%>
              <%devendo=0%>
              <%set perfil=conn.execute("select * from perfil_contrato where cod_contrato="&itens("codigo"))%>
              <%do while not perfil.eof%>
                 <%set pagamentos=conn.execute("select count(codigo) as parcelas_pagas from contas where cod_contrato="&itens("codigo")&" and cod_funcionario=0 and cod_tipo_conta="&perfil("cod_tipo_conta"))%>
                 <%data_inicio=perfil("data_inicio")%>
                 <%if weekday(day(perfil("data_inicio"))&"/"&month(data_vencimento)&"/"&year(data_vencimento))=1 then%>
                    <%data_inicio=perfil("data_inicio")+1%>
                 <%end if%>
                 <%if weekday(day(perfil("data_inicio"))&"/"&month(data_vencimento)&"/"&year(data_vencimento))=7 then%>
                    <%data_inicio=perfil("data_inicio")+2%>
                 <%end if%>
                 <%parcelas_pagar=int(DateDiff("m",data_inicio,data_vencimento)/perfil("meses")+1)%>
                 <%if day(data_inicio)>=Day(data_vencimento) then%>
                    <%parcelas_pagar=parcelas_pagar-1%>
                 <%end if%>
                 <%if parcelas_pagar>perfil("quantidade") then%>
                    <%parcelas_pagar=perfil("quantidade")%>
                 <%end if%>
                 <%if parcelas_pagar-pagamentos("parcelas_pagas")>0 then%>
                    <%devendo=devendo+parcelas_pagar-pagamentos("parcelas_pagas")%>
                 <%end if%>
                 <%perfil.movenext%>
              <%loop%>
              <%if devendo>0 then%>
                 <%set perfil=conn.execute("select * from perfil_contrato where cod_contrato="&itens("codigo"))%>
                 <%do while not perfil.eof%>
                    <%data_inicio=perfil("data_inicio")%>
                    <%cont=0%>
                    <%set pagamentos=conn.execute("select count(codigo) as parcelas_pagas from contas where cod_contrato="&itens("codigo")&" and cod_funcionario=0 and cod_tipo_conta="&perfil("cod_tipo_conta"))%>
                    <%if pagamentos("parcelas_pagas")>=perfil("quantidade") then%>
                       <%cont=perfil("quantidade")%>
                    <%end if%>
                    <%do while data_inicio<datevalue(data_vencimento) and cont<perfil("quantidade")%>
                       <%set pagamentos=conn.execute("select * from contas where cod_contrato="&itens("codigo")&" and cod_funcionario=0 and cod_tipo_conta="&perfil("cod_tipo_conta")&" and month(data)='"&month(data_inicio)&"' and year(data)='"&year(data_inicio)&"'")%>
                       <%if pagamentos.eof and datevalue(data_inicio)>=datevalue(data_vencimento_inicio) and datevalue(data_inicio)<=datevalue(data_vencimento) then%>
                          <%if exibir<>1 then%>
                             <tr>
                               <td class="navdroplist" colspan=4><b>NÚMERO:</b>&nbsp;&nbsp;<%=itens("numero")%></td>
                             </tr>
                             <tr>
                               <td class="navdroplist" colspan=4><b>IMÓVEL :</b>&nbsp;&nbsp;<%=itens("imovel")%></td>
                             </tr>
                             <tr>
                               <td class="navdroplist" colspan=4><b>DÍVIDAS:</b>&nbsp;&nbsp;<%=devendo%></td>
                             </tr>
                             <tr>
                               <td colspan=4>&nbsp;</td>
                             </tr>
                             <tr>
                               <td class="navdroplist" width=100 align=center><b>VENCIMENTO</b></td>
                               <td class="navdroplist" width=200><b>TIPO</b></td>
                               <td class="navdroplist" width=100 align=center colspan=2><b>VALOR</b></td>
                             </tr>
                             <%exibir=1%>
                          <%end if%>
                          <tr>
                            <td class="navdroplist" align=center><%=data_inicio%></td>
                            <%set tipo_conta=conn.execute("select * from tipo_conta where codigo="&perfil("cod_tipo_conta"))%>
                            <td class="navdroplist"><%=tipo_conta("descricao")%></td>
                            <td class="navdroplist" align=right>R$</td>
                            <td class="navdroplist" width=100 align=right><%=formatnumber(perfil("valor"),2)%></td>
                          </tr>
                       <%end if%>
                       <%cont=cont+1%>
                       <%data_inicio=dateadd("m",+1,data_inicio)%>
                    <%loop%>
                    <%perfil.movenext%>
                 <%loop%>
              <%end if%>
              <%exibir=0%>
              <%itens.moveNext%>
           <%loop%>
           </table>
        <%else%>
             <tr>
               <td class="navdroplist"><b>Nenhum registro encontrado.</b></td>
             </tr>
           </table>
        <%end if%>
        <br>
        <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
        <br>
    </td>
  </tr>
</table>
<br>
</body>
</html>