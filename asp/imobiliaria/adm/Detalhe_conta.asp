<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
pagina=request("pagina")
set itens=conn.execute("select * from contas where status=0 and codigo="&codigo)%>
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
                <B>DETALHE CONTA</B>
              </td>
              <td class="tb" align=right><a href="Imprimir_detalhe_contas.asp?cliente=<%=itens("codigo")%>&pagina=Main_contas&codigo=<%=codigo%>"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
            </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=130><b>NÚMERO:</b></td>
              <td class="tb"><%=itens("numero")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>DESCRIÇÃO:</b></td>
              <td class="tb" colspan=3><%=itens("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>TIPO:</b></td>
              <% if itens("tipo")=1 then%>
                <td class="tb">ENTRADA</td>
              <%else%>
                <td class="tb">SAÍDA</td>         
              <%end if%>
            </tr>
            <tr>
              <tr><td class="tb" width=130><b>TIPO CONTA:</b></td>
              <%set tipo = conn.execute("select descricao from tipo_conta where codigo="&itens("cod_tipo_conta"))%>
              <td class="tb"><%=tipo("descricao")%></td></tr>
            </tr>
            <%set corretor = conn.execute("select nome from corretor where codigo="&itens("cod_funcionario"))%>
            <%if not corretor.eof then%>
               <tr>
                 <td class="tb" width=130><b>CORRETOR:</b></td>
                 <td class="tb"><%=corretor("nome")%></td>
               </tr>
            <%end if%>
            <tr>
              <%set setor = conn.execute("select descricao from setor where codigo="&itens("cod_setor"))%>
              <%if not setor.eof then%>
                 <td class="tb" width=130><b>SETOR:</b></td>
                 <td class="tb"><%=setor("descricao")%></td>
              <%end if%>
            </tr>
            <tr>
              <td class="tb" width=130><b>DATA:</b></td>
              <td class="tb"><%=itens("data")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>ORIGEM:</b></td>
              <td class="tb">
                <%if itens("origem")=0 then%>
                   CONTA COMUM
                <%end if%>
                <%if itens("origem")=1 then%>
                   PAGAMENTO CONTRATO
                <%end if%>
                <%if itens("origem")=2 then%>
                   PAGAMENTO FUNCIONÁRIOS
                <%end if%>
              </td>
            </tr>
            <tr>
              <td class="tb" width=130><b>VALOR:</b></td>
              <td class="tb">R$<%=formatnumber(itens("valor"),2)%></td>
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