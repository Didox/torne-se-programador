<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
codigo=request("codigo")
imovel=request("imovel")
%>
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
          <%set exibir=conn.execute("select * from contato where codigo="&codigo)%>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE CONTATO
                </B>
              </td>
              <td class="tb" align=right><a href="Imprimir_detalhe_contato.asp?codigo=<%=exibir("codigo")%>&imovel=<%=imovel%>&pagina=Main_contato"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=130><b>IMOVEL:</b></td>
              <%set imovel = conn.execute("select * from imoveis where codigo="&exibir("cod_imovel"))%>
              <td class="tb"><a href="Detalhe_Imovel.asp?codigo=<%=imovel("codigo")%>&pagina=Main_Imoveis"><%=ucase(imovel("descricao"))%></a></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>OPÇÃO:</b></td>
              <%set opcao = conn.execute("select * from opcao where codigo="&exibir("cod_opcao"))%>
              <td class="tb" colspan=3><%=ucase(opcao("descricao"))%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>DESCRIÇÃO:</b></td>
              <td class="tb" colspan=3><%=ucase(exibir("descricao"))%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>INTERESSADO:</b></td>
              <td class="tb" colspan=3><%=ucase(exibir("interessado"))%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>DDD/FONE:</b></td>
              <td class="tb"><%=exibir("ddd")%> - <%=exibir("fone")%></td><tr>
            </tr>
            <tr>
              <td class="tb" width=130><b>EMAIL:</b></td>
              <td class="tb"><%=ucase(exibir("email"))%></td><tr>
            </tr>
            <tr>
              <td class="tb" width=130><b>DATA CONTATO:</b></td>
              <td class="tb"><%=exibir("data_contato")%></td><tr>
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