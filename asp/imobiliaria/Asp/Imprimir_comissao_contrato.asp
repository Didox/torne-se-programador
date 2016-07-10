<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pesquisa=replace(trim(request("pesquisa")),"'","")
pagina=request("pagina") 
codigo=request("codigo")
codigo2=request("codigo2")
opcao=request("opcao")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
currentPage = Request( "currentPage" )
Set contador = Server.CreateObject( "ADODB.Recordset" )
contador.activeConnection = conn
contador.CursorType = adOpenStatic
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 3
itens.Open "SELECT * FROM contas where cod_funcionario="&codigo2&" and cod_contrato = "&codigo&" and contas.status=0 ORDER BY contas.descricao",conn%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br>
<table width=90% align="center" bgcolor="white">  <tr>
    <td>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td>
            <a href="<%=pagina%>.asp?codigo=<%=codigo2%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table class="navdroplist" width=100% align="center" bgcolor="#f7f7f7">
        <tr>
          <td class="navdroplist" align=center>
            <B>IMPRESSÃO CONTRATO
            </B>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <tr>
          <td width=30% class="navdroplist">
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td class="navdroplist">
             HORA DA SOLICITAÇÃO:&nbsp<b><%=time()%></b>
          </td>
          <td class="navdroplist">
            CONTRATOS ENCONTRADOS:&nbsp;<b><%=itens.recordcount%></b>
          </td>
        </tr>
      </table>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td><hr></td>
        </tr>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td  width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
        <%else
          itens.absolutePage = cINT(currentPage)
            do While Not itens.EOF and cont<itens.PageSize%>
        <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;TIPO:</b></td>
              <td class="navdroplist" colspan=3>
                <%if itens("origem")=0 then%>
                  COMISSÃO
                <%else%>
                  ESTRONO
                <%end if%>
              </td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;CONTRATO:</b></td>
              <%set contratos=conn.execute("select * from contrato where codigo="&codigo)%>
              <td class="navdroplist" colspan=3><%=contratos("numero")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;IMÓVEL:</b></td>
              <%set imovel=conn.execute("select * from imoveis where codigo="&contratos("cod_imovel"))%>
              <td class="navdroplist" colspan=3><%=imovel("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=100><b>&nbsp;TIPO CONTA:</b></td>
              <%set conta=conn.execute("select * from tipo_conta where codigo="&itens("cod_tipo_conta"))%>
              <td class="navdroplist"><%=conta("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;DATA:</b></td>
              <td class="navdroplist"><%=itens("data")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;NÚMERO:</b></td>
              <td class="navdroplist"><%=itens("numero")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;DECRIÇÃO:</b></td>
              <td class="navdroplist"><%=itens("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;VALOR:</b></td>
              <td class="navdroplist">R$ <%=formatnumber(itens("valor"),2)%></td>
            </tr>
            <%itens.movenext%>
           <%loop%>
          <%end if%>
    </table>
    <br>
    <center><a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><font class="navdroplist">&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>