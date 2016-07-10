<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
corretor=request("corretor")
imovel=request("imovel")
set itens = conn.execute( "select reserva.*,imoveis.descricao as imovel , corretor.nome as corretor from ((Reserva inner join imoveis on reserva.cod_imovel=imoveis.codigo)inner join corretor on reserva.cod_corretor=corretor.codigo) where reserva.status=0 and reserva.codigo="&codigo)%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE RESERVA
                </B>
              </td>
              <td class="tb" align=right><a href="Imprimir_detalhe_reserva.asp?cliente=<%=itens("codigo")%>&pagina=Main_reserva"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=130><b>NOME:</b></td>
              <td class="tb" colspan=3><%=itens("nome")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>DDD:</b></td>
              <td class="tb" colspan=3><%=itens("ddd")%></td>
            </tr>
            <tr>
              <tr>
                 <td class="tb" width=130><b>FONE:</b></td>
                 <td class="tb"><%=itens("fone")%></td>
              </tr>
              <td class="tb" width=130><b>CORRETOR:</b></td>
              <td class="tb"><a href="Detalhe_corretor.asp?codigo=<%=corretor%>&pagina=Main_corretor"><%=itens("corretor")%></a></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>IMOVEL:</b></td>
              <td class="tb"><a href="Detalhe_imovel.asp?codigo=<%=imovel%>&pagina=Main_Imoveis"><%=itens("imovel")%></a></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>VALIDADE:</b></td>
              <td class="tb"><%=itens("validade")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>INCLUSÃO:</b></td>
              <td class="tb"><%=itens("data")%></td>
            </tr>
         </table>
        </td>
      </tr>
    <table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
  </td>
</tr>
</table>
</body>
</html>