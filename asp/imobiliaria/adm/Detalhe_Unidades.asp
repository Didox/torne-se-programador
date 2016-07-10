<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")%>
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
          <%set exibir=conn.execute("select * from unidade where codigo="&codigo)%>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE UNIDADE
                </B>
              </td>
              <td class="tb" align=right><a href="Imprimir_detalhe_unidades.asp?cliente=<%=exibir("codigo")%>&pagina=Main_unidade"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=130><b>DESCRIÇÃO:</b></td>
              <td class="tb" colspan=3><%=exibir("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>ENDEREÇO:</b></td>
              <td class="tb" colspan=3><%=exibir("endereco")%> &nbsp; - &nbsp; <%=exibir("numero")%> &nbsp; - &nbsp; <%=exibir("complemento")%></td>
            </tr>
            <tr>
              <tr><td class="tb" width=130><b>BAIRRO:</b></td>
              <td class="tb"><%=exibir("bairro")%></td></tr>
              <td class="tb" width=130><b>CIDADE:</b></td>
              <td class="tb"><%=exibir("cidade")%></td>
            </tr>
            <tr>
              <tr><td class="tb" width=130><b>ESTADO:</b></td>
              <td class="tb"><%=exibir("estado")%></td></tr>
              <td class="tb" width=130><b>CEP:</b></td>
              <td class="tb"><%=exibir("cep")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>DDD / TELEFONE:</b></td>
              <td class="tb">(<%=exibir("ddd_fone")%>)&nbsp;<%=exibir("fone")%></td>
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