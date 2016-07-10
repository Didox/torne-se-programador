<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
sql_filtro=replace(request("sql_filtro"),"$","%")
reload=request("reload")
cidade=request("cidade")
estado=request("estado")
tipo_imovel=request("tipo_imovel")
servico=request("servico")
pagina=request("pagina")
if estado="" or isnull(estado) then
   estado="0"
end if
if cidade="" or isnull(cidade) then
   cidade="0"
end if

if request("flag") = "1" and reload <> "3" then
   if cidade <> "0" then
      sql = sql& " and cod_cidade="&cidade
   end if
   if estado <> "0" then
      sql = sql& " and cod_estado ="&estado
   end if
   if tipo_imovel <> "" then
      sql = sql& " and tipo_imovel="&tipo_imovel
   end if
   if servico <> "" then
      sql = sql&" and imoveis.codigo IN(SELECT cod_imovel FROM perfil_servico WHERE cod_servico IN ("&servico&"))"
   end if%>
   <script>
     location.href="todos_imoveis.asp?sql_filtro=<%=sql%>";
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
      <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>" name="form1">
      <input type=hidden name="reload">
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_12.gif"></td>
              <td class="tb"><B>BUSCAR IMÓVEIS</B></td>
            </tr>
          </table>            
        <table border="0" width=376 align=LEFT>
        </tr> 
        <tr>
        <td>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <span class="estilo">Estado:
                </td>
              </tr>
              <tr>
               <td>
                  <select name="estado" style="width:140;background=#E8E8E8;" onchange="document.form1.reload.value='3';document.form1.cidade.value='0';document.form1.submit()" >
                    <option value = "0">TODOS</option>
                    <%set cbai=conn.execute("select * from estado where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=estado then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <span class="estilo">Cidade:
                </td>
              </tr>
              <tr>
                <td>
                  <select name="cidade" style="width:140;background=#E8E8E8;">
                    <option value = "0">TODOS</option>
                    <%set cbai=conn.execute("select * from cidade where status=0 and cod_estado="&estado&" ORDER BY descricao")%>
                    <%if cidade="" or cidade="0" and not cbai.eof then%>
                       <%cidade=cbai("codigo")%>
                    <%end if%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=cidade then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                </td>
               </tr>
            </table>
          </td>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
         <tr>
           <td>
            <span class="estilo">&nbsp;Tipo de Imovel:
          </td>        
         </tr>
         <tr>
          <td>
             <select name="tipo_imovel" style="width:140;background=#E8E8E8;">
             <%set cbai=conn.execute("select * from tipo_imovel where status=0 ORDER BY descricao")%>
                <option value="">TODOS</option>
             <%do while not cbai.eof %>
             <%if cstr(cbai("codigo"))=tipo_imovel then%>
                <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
             <%else%>
                <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
             <%end if%>
             <%cbai.movenext%>
             <%loop%>
             </select>
          </td>
          <tr>
            <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <span class="estilo">Serviço:
                </td>
              </tr>
              <tr>
                <td>
                  <select name="servico" style="width:140;background=#E8E8E8;">
                    <%set cbai=conn.execute("select * from servico ORDER BY descricao")%>
                         <option value="">TODOS</option>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=servico then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                  </td>
               </tr>
            </table>
            </td>
          </tr>
        </table>
           <tr><td></td></tr>
              <tr>
                 <td>
                  <br><input type="image" src="../img/ok.gif" value="submit" border=0>
                 </td>
              </tr>
              <tr>
                <td class="estilo"><br><br>
                  <a href="Main_filtro_imoveis_avancada.asp?pagina=Main_Inicio"><b>&nbsp;&nbsp;&nbsp;Pesquisa detalhada</b></a>
                </td>
              </tr>
           </td>
          <tr>
          </table>  
        </td>
      </tr>
    </table>
    <table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
    </td>
  </tr>
</table>
</form>
</body>
</html>