<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
codigo =request("codigo")
pagina =request("pagina")
if request("flag") = 1 then 
cliente         =trim(request("cliente"))
imovel          =trim(request("imovel"))
corretor        =trim(request("corretor"))
servico         =trim(request("servico"))
inicio          =replace(trim(request("inicio")),"'","")
inicio_final    =replace(trim(request("inicio_final")),"'","")
vencimento      =replace(trim(request("vencimento")),"'","")
vencimento_final=replace(trim(request("vencimento")),"'","")
valor           =replace(trim(request("valor")),"'","")
valor_final     =replace(trim(request("valor_final")),"'","")

if cliente <> "0" then
   sql = sql&" and cod_cliente="&cliente
end if

if imovel <> "0" then
   sql = sql& " and cod_imovel="&imovel
end if

if servico <> "0" then
  sql = sql& " and tipo_servico="&servico
end if

if data_valida(inicio,0) and data_valida(inicio_final,0) and inicio<inicio_final then
  sql = sql& " and data_inicio between convert(datetime ,'"&inicio&"',103) and convert(datetime ,'"&inicio_final&"',103)"
end if

if data_valida(vencimento,0) and data_valida(vencimento_final,0) and vencimento<vencimento_final then
  sql = sql& " and data_vencimento between convert(datetime ,'"&vencimento&"',103) and convert(datetime ,'"&vencimento_final&"',103)"
end if

if (valor<>"")and(valor_final<>"") then
  sql = sql& " and valor between "&valor&" and "&valor_final
end if 
%>
<script>
  location.href="contratos_corretor.asp?codigo=<%=codigo%>&sql_filtro=<%=sql%>";
</script>
<%
end if
%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&codigo=<%=codigo%>" name="form1">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
      <table><tr><td></td></tr></table>
      <table width=100% bgcolor=#CCCCCC>
      <tr><td></td></tr>
      </table>
      <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
      <tr> 
        <td width=20><img src="../img/r_16.gif"></td>
        <td class="tb"><B>BUSCA CONTRATOS</B></td>
      </tr>
      </table>    
          
    <table border="0" width=376 align=LEFT>
        <tr>
          <td>
            <span class="estilo">Cliente:
          </td>
        </tr>
        <tr>
          <td>
              <%set cbai=conn.execute("select distinct clientes.codigo as codigo , clientes.nome as nome from ((clientes inner join contrato on contrato.cod_cliente=clientes.codigo)inner join corretor on corretor.codigo=contrato.cod_corretor) where corretor.codigo="&codigo&" ORDER BY clientes.nome")%>  
              <select name="cliente" style="background=#E8E8E8;">
              <option value="0" selected>TODOS</option>   
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))= cliente then%>
                   <option value="<%=cbai("codigo")%>" selected><%=cbai("nome")%>
                <%else%>
                   <option value="<%=cbai("codigo")%>"><%=cbai("nome")%>
                <%end if%>
                <%cbai.movenext%>
              <%loop%>
            </select>         
          </td>
        </tr>
        <tr>
          <td>
   <table cellspacing=0 cellpadding=0>
      <tr>
         <td>
           <span class="estilo">Imovel:
         </td>
      </tr>    
      <tr>
        <td>
            <select name="imovel" style="background=#E8E8E8;">
            <%set cbai=conn.execute("select distinct imoveis.codigo as codigo , imoveis.descricao as descricao from ((imoveis inner join contrato on imoveis.codigo=contrato.cod_imovel)inner join corretor on corretor.codigo=contrato.cod_corretor) where contrato.status=0 and imoveis.status<>1 and corretor.codigo="&codigo)%>
            <option value="0" selected>TODOS</option>   
             <%do while not cbai.eof %>
              <%if cstr(cbai("codigo"))= imovel then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
              <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
              <%end if%>
              <%cbai.movenext%>
            <%loop%>            
          </select>&nbsp;&nbsp;&nbsp;
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
         <span class="estilo">Serviço:
      </td>
    </tr>    
    <tr>
      <td>
        <select name="servico" style="background=#E8E8E8;">
          <%set cbai=conn.execute("select * from servico ORDER BY descricao")%>
          <option value="0" selected>TODOS</option>   
          <%do while not cbai.eof %>
          <%if cstr(cbai("codigo"))= servico then%>
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
         <span class="estilo">Data de incio:
       </td>
    </tr>
    <tr>
       <td>
         <input type="text" name="inicio" value="<%=inicio%>" maxlength=10 label="inicio" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this)">&nbsp;à
       </td>
       <td>
         <input type="text" name="inicio_final" value="<%=inicio_final%>" maxlength=10 label="inicio_final" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this)">
       </td>
    </tr>
    <tr>
       <td>
         <span class="estilo">Data de vencimento:
       </td>    
    </tr>
    <tr>
       <td>
         <input type="text" name="vencimento" value="<%=vencimento%>" maxlength=10 label="vencimento" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this)">&nbsp;à
       </td>
       <td>
         <input type="text" name="vencimento_final" value="<%=vencimento_final%>" maxlength=10 label="vencimento_final" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this)">
       </td>
    </tr>
    <tr>
       <td>
         <span class="estilo">Valor:
       </td>
    </tr>
    <tr>
       <td>
         <input type="text" name="valor" value="<%=valor%>" maxlength=20 label="valor" style="width:100; height:17; background=#E8E8E8;">&nbsp;à
       </td>
       <td>
         <input type="text" name="valor_final" value="<%=valor_final%>" maxlength=20 label="valor_final" style="width:100; height:17; background=#E8E8E8;">
       </td>
    </tr>
   </table>  
     <tr> 
       <td align=center>
         <br><input type="image" src="../img/ok.gif" value="submit" border=0>
       </td>
     </tr>   
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

