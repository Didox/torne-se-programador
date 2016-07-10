<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
sql_filtro=replace(request("sql_filtro"),"$","%")
reload=request("reload")
bairro=request("bairro")
cidade=request("cidade")
estado=request("estado")

if estado="" or isnull(estado) then
   estado="0"
end if
if cidade="" or isnull(cidade) then
   cidade="0"
end if
if bairro="" or isnull(bairro) then
   bairro="0"
end if
if request("flag") = 1 and reload <> "3" then
   pagina =request("pagina")
   descricao   =request("descricao")
   unidade     =request("unidade")
   tipo_imovel =request("tipo_imovel")
   estagio_obra=request("estagio_obra")
   comodo      =request("comodo")
   quantidade  =request("quantidade")
   quantidade1 =request("quantidade1")
   servico     =request("servico")
   valor       =replace(replace(request("valor"),".",""),",",".")
   valor1      =replace(replace(request("valor1"),".",""),",",".")
   metragem    =request("metragem")
   disponivel     =request("disponivel")
   for each x in Request.Form
      if instr(x,"cmd")>0 and instr(Request.Form(x),",")<>0 and instr(Request.Form(x),",")<>len(Request.Form(x))-1 then
         sql=sql&" and codigo IN (SELECT cod_imovel FROM perfil_imovel WHERE cod_comodo = "&mid(Request.Form(x),1,instr(Request.Form(x),",")-1)&" AND quantidade = "&mid(Request.Form(x),instr(Request.Form(x),",")+1,len(Request.Form(x))-2)&" GROUP BY cod_imovel)"
      end if
   next
   if descricao <> "" then
      sql = sql&" and descricao like '$"&descricao&"$'"
   end if
   if unidade <> "" then
      sql = sql&" and cod_unidade="&unidade
   end if
   if bairro <> "0" then
      sql = sql& " and cod_bairro="&bairro
   end if
   if cidade <> "0" then
      sql = sql& " and cod_cidade="&cidade
   end if
   if estado <> "0" then
      sql = sql& " and cod_estado ="&estado
   end if
   if tipo_imovel <> "" then
      sql = sql& " and tipo_imovel="&tipo_imovel
   end if
   if estagio_obra <> "" then
      sql = sql&" and imoveis.cod_estagios_obra="&estagio_obra
   end if
   if metragem <> "" then
      sql = sql&" and imoveis.cod_metragem="&metragem
   end if
   if comodo <> "" then
      sql = sql&" and codigo IN(SELECT cod_imovel FROM perfil_imovel WHERE cod_comodo IN ("&comodo&"))"
   end if
   if quantidade <> "" and quantidade1 <> "" and quantidade > quantidade1 then
      sql = sql&" and codigo IN(SELECT cod_imovel FROM perfil_imovel WHERE quantidade between ("&quantidade&") and ("&quantidade1&"))"
   end if
   if servico <> "" then
      sql = sql&" and imoveis.codigo IN(SELECT cod_imovel FROM perfil_servico WHERE cod_servico IN ("&servico&"))"
   end if 
   if isnumeric(valor) and isnumeric(valor1) and valor > valor1 then
      sql = sql&" and codigo IN(SELECT cod_imovel FROM perfil_servico WHERE valor between ("&valor&") and ("&valor1&"))"
   end if 
   if disponivel = 1 then
      sql = sql&" and not codigo in (select cod_imovel from contrato where cod_imovel=Imoveis.codigo AND data_vencimento>convert(datetime,'"&date()&"',103))"
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
                  <select name="cidade" style="width:140;background=#E8E8E8;" onchange="document.form1.reload.value='3';document.form1.bairro.value='';document.form1.submit()">
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
                  <span class="estilo">Bairro:
                </td>
              </tr>
              <tr>
                <td>
                  <select name="bairro" style="width:140;background=#E8E8E8;">
                    <option value = "0">TODOS</option>
                    <%set cbai=conn.execute("select * from bairro where status=0 and cod_cidade="&cidade&" ORDER BY descricao")%>
                    <%if bairro="" or bairro="0" and not cbai.eof then%>
                       <%bairro=cbai("codigo")%>
                    <%end if%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=bairro then%>
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
          </tr>
          <tr>
          <td>
             <span class="estilo">&nbsp;Estágio da Obra:
          </td>          
         </tr>
          <tr>
          <td>
            <select name="estagios_obra" style="width:140;background=#E8E8E8;">
              <%set cbai=conn.execute("select * from estagios_obra where status=0 ORDER BY descricao")%>
                <option value="">TODOS</option>
              <%do while not cbai.eof %>
                <%if cstr(cbai("descricao"))=estagios_obra then%>
                  <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                <%else%>
                  <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                <%end if%>
                <%cbai.movenext%>
               <%loop%>
            </select>
          </td>
         </tr>
        </tr>
        <tr> 
          <td>
             <span class="estilo">&nbsp;Área Útil (m²):
          </td>          
        </tr>
        <tr>
          <td>
           <select name="metragem" style="width:140;background=#E8E8E8;">
           <option value = "">TODAS</option>
             <%set metragens=conn.execute("select * from metragem where status=0 ORDER BY descricao")%>
             <%if metragem="" or metragem="0" then%>
               <%metragem=metragens("codigo")%>
             <%end if%>
             <%do while not metragens.eof %>
                <%if cstr(metragens("codigo"))=metragem then%>
                 <option value="<%=metragens("codigo")%>" selected><%=metragens("descricao")%>
                <%else%>
                  <option value="<%=metragens("codigo")%>"><%=metragens("descricao")%>
                <%end if%>
                <%metragens.movenext%>
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
                  <span class="estilo">Comodo:
                </td>
                <td>
                 <span class="estilo">Quantidade:
                </td>
                <td></td>
              </tr>
              <%set cbai=conn.execute("select * from Tipo_comodo where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                    <input type=checkbox name="cmd_<%=cbai("codigo")%>" value="<%=cbai("codigo")%>"><%=cbai("descricao")%><br>
                <td>
                    &nbsp;<input type="text" name="cmd_<%=cbai("codigo")%>" value=""  maxlength=2 label="quantidade" style="width:60; height:17; background=#E8E8E8;" onkeypress="Numero()">
                </td>                
              </tr>
              <%%>
              <%cbai.movenext%>
              <%loop%>             
            </table> 
           </td>
          </tr>
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
            <tr>
            <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <span class="estilo">Valor Minimo:
                </td>
                <td>
                  <span class="estilo">Valor Maximo:
                </td>
             </tr>
             <tr><td colspan=2>
             <table border=0>
              <tr>
                 <td>
                   <input type="text" name="valor" value="<%=valor%>"  maxlength=15 label="valor" style="width:60; height:17; background=#E8E8E8;" >&nbsp;à 
                  </td>
                  <td>
                   <input type="text" name="valor1" value="<%=valor1%>"  maxlength=15 label="valor1" style="width:60; height:17; background=#E8E8E8;" > 
                  </td>
               </tr>
              </table>
             </td></tr>  
           </table>
           <tr><td></td></tr>
              <tr>
                 <td align=center>
                  <br><input type="image" src="../img/ok.gif" onclick="document.form1.submit()" value="submit" border=0>
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