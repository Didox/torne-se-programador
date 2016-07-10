<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
data_inicio=replace(trim(request("data_inicio")),"'","")
data_final=replace(trim(request("data_final")),"'","")
corretor=request("corretor")
if isdate(data_inicio) and isdate(data_final) then%>
   <script>
     location.href="Relatorio_Interessados_Corretor.asp?pagina=Relatorio_Interessados_Corretor_Dados&data_inicio=<%=data_inicio%>&data_final=<%=data_final%>&corretor=<%=corretor%>";
   </script>
<%end if%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb"><B>RELATÓRIO INTERESSADOS</B></td>
            </tr>
          </table>  
          <table border=0>
            <tr>
              <td colspan=3 height=30></td>
            </tr>
            <tr> 
              <td class="tb">Corretor</td>
            </tr>
            <tr>
              <td class="tb">
                <select name="corretor" style="background=#E8E8E8;">
                 <option value= ""></option>
                  <%set ccid=conn.execute("select * from corretor where status=0 ORDER BY nome")%>
                   <%do while not ccid.eof %>
                    <%if cstr(ccid("codigo"))=corretor then%>
                     <option value="<%=ccid("codigo")%>" selected><%=ccid("nome")%>
                    <%else%>
                     <option value="<%=ccid("codigo")%>"><%=ccid("nome")%>
                    <%end if%>
                   <%ccid.movenext%>
                   <%loop%>
                </select>
               </td>
            </tr>
          </table>  
          <table border=0>
            <tr>
              <td width=70>Data Inicial</td>
              <td width=20></td>
              <td width=70>Data Final</td>
            </tr>
            <tr>
              <td valign=top>
                 <input maxlength=10 type=text name="data_inicio" value="" style="width:90; height:17; background=#E8E8E8;" onkeyup="Numero(this.value,this);DATA(this.value,this)">
              </td>
              <td align=center>à</td>
              <td>
                 <input maxlength=10 type=text name="data_final" value="" style="width:90; height:17; background=#E8E8E8;" onkeyup="Numero(this.value,this);DATA(this.value,this)">
              </td>
            </tr>
            <tr>
              <td colspan=3 height=30><input type=image src="../img/icone-imprimir.gif"></td>
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

