<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
opcao=request("opcao")
pagina=request("pagina")
mes=request("mes")
ano=request("ano")
if ano="" then
  ano=year(date)
end if
if request("flag")=1 and len(ano)=4 and isnumeric(ano) then%>
  <script>
    location.href="relatorio_comissao.asp?mes=<%=mes%>&ano=<%=ano%>&codigo=<%=codigo%>";
  </script>  
<%end if%>
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
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&codigo=<%=codigo%>">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb"><B>RELATÓRIO EXTRATO DE COMISSÃO</B></td>
            </tr>
          </table>  
          <table border=0>
          <tr>
              <td width=70>Mês</td>
              <td width=70>Ano</td>
           <tr>
            <tr>
              <td>
                 <select name="mes">              
		   <OPTION value="0">
                   <%for i=1 to 12%>
                     <OPTION value="<%=i%>" <%if cstr(i)=cstr(mes) then response.write "selected" end if%>><%if len(i)=1 then response.write "0" end if%><%=i%>
                   <%next%>
		 </select>
              </td>
              <td>
               <input type="text" name="ano" maxlength="4" size="4" value="<%=ano%>" onkeypress="Numero()">  
              </td>
              <td colspan=3 height=30>
               <input type=image src="../img/icone-imprimir.gif">
              </td>
            </tr>
          </table>
          <table width=100%>
            <tr> 
              <td align=center bgcolor=#B0B0B0></td>
            </tr>  
          </table> 
          <br>
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

