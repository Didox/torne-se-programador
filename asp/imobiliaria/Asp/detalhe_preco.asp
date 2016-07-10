<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
imovel=request("imovel")
codigo2=request("codigo2")
pagina=request("pagina")
%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><style type="text/css">
<!--
body {
	background-color: #e2ddc0;
}
-->
</style></head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 text="#333333" link="#333333" vlink="#333333" alink="#333333">
  <table width="280" border=0 align=center cellpadding=0 cellspacing=0 bgcolor="E2DDC0">
    <tr><td>&nbsp;</td></tr>
    <tr>
      <td align="center">
           <table width=270 cellspacing=1 cellpadding=1 border=0 bordercolor="#BDB66F">
              <tr>
                <td width=130 height="20" class="txtp10b">
                  <b>TIPO DE SERVIÇO:</b>
                </td>
              </tr>
              <tr bgcolor="#B5AE67" class="txtp10b">
                <td width=100% height="20">
                Serviço</td>
                <td height="20" align=center>
                 Valor
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_servico where cod_imovel="&imovel&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td height="20">
                <%set servico=conn.execute("select * from servico where codigo="&cbai("cod_servico"))%>
                <%=servico("descricao")%>
                <td height="20" align=center>
                   R$<%=formatnumber(cbai("valor"),2)%>                </td>
              </tr>
            <%cbai.movenext%>
            <%loop%>
        </table>
<br>
            <table width=270 cellspacing=1 cellpadding=2 border=0>
              <tr>
                <td height="20" colspan=3 class="txtp10b"><b>TIPO DE PLANO:</b></td>            
              </tr>
              <tr bgcolor="#B5AE67" class="txtp10b">
                <td height="20" align=center>
                   Quantidade
                </td>
                <td width=100% height="20">
                   Descrição
                </td>
                <td height="20" align=center>
                   Valor
                </td>
              </tr>
                <%set plano1=conn.execute("select * from perfil_plano where cod_imovel="&imovel&" and status=0 ORDER BY codigo desc")%>
                <%do while not plano1.eof %>
              <tr>
                <td height="20" align=center>
                  <%=plano1("quantidade")%>                </td>
                <td height="20">
                  <%set plano_nome=conn.execute("select * from tipo_conta where codigo="&plano1("cod_tipo_conta"))%>
                <%=plano_nome("descricao")%>                </td>
                <td height="20" align=center>
                  R$<%=formatnumber(plano1("valor"),2)%>                </td>
             </tr>
             <%plano1.movenext%>
             <%loop%>
      </table>      </td>
    </tr>
     <tr>
        <td>&nbsp;</td>
     </tr>
     <tr>
        <td class="tb" align=center><a href="javascript:window.close();"><img src="../img/fechar.gif" border=0></a></td>
     </tr>
</table>
</body>
</html>