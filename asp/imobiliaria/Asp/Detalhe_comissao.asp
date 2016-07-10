<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pesquisa=replace(trim(request("pesquisa")),"'","")
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
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_8.gif"></td>
              <td class="tb">
                   <B>DETALHE COMISSÃO</B>
              </td>
              <td class="tb" align=right><a href="Imprimir_comissao_contrato.asp?codigo=<%=codigo%>&codigo2=<%=codigo2%>&pagina=<%=pagina%>"><img alt="Imprimir Cliente" src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
          <%If itens.EOF = true then%>
              NÃO PAGO
            <%else
               itens.absolutePage = cINT(currentPage)
               do While Not itens.EOF and cont<itens.PageSize%>
            <tr>
              <td class="tb" width=60><b>&nbsp;TIPO:</b></td>
              <td class="tb" colspan=3>
                <%if itens("origem")=0 then%>
                  COMISSÃO
                <%else%>
                  ESTRONO
                <%end if%>
              </td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;CONTRATO:</b></td>
              <%set contratos=conn.execute("select * from contrato where codigo="&codigo)%>
              <td class="tb" colspan=3><%=contratos("numero")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;IMÓVEL:</b></td>
              <%set imovel=conn.execute("select * from imoveis where codigo="&contratos("cod_imovel"))%>
              <td class="tb" colspan=3><%=imovel("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" width=100><b>&nbsp;TIPO CONTA:</b></td>
              <%set conta=conn.execute("select * from tipo_conta where codigo="&itens("cod_tipo_conta"))%>
              <td class="tb"><%=conta("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;DATA:</b></td>
              <td class="tb"><%=itens("data")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;NÚMERO:</b></td>
              <td class="tb"><%=itens("numero")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;DECRIÇÃO:</b></td>
              <td class="tb"><%=itens("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;VALOR:</b></td>
              <td class="tb">R$ <%=formatnumber(itens("valor"),2)%></td>
            </tr>
            <%itens.movenext%>
           <%loop%>
          <%end if%>
          </table>
        </td>
      </tr>
      </form>
    </table>
    <table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
    </td>
  </tr>
</table>
</body>
</html>

