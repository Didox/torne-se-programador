<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")%>
<%codigo2=request("codigo2")%>
<%pagina=request("pagina")%>
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
          <%set exibir=conn.execute("select * from proposta_visita where codigo="&codigo2)%>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE PROPOSTA
                </B>
              </td>
              <td class="tb" align=right><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
              <a href="Imprimir_detalhe_proposta_interessado.asp?codigo2=<%=exibir("codigo")%>&codigo=<%=codigo%>&pagina=Detalhe_Proposta_Interessado"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=5><b>TÍTULO:</b></td>
              <td class="tb"><%=exibir("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" colspan=2><b>TEXTO:</b></td>
              <td class="tb"><b></b></td>
            </tr>
            <tr>
              <td class="tb" colspan=2><%=exibir("texto")%></td>
              <td class="tb"><b></b></td>
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