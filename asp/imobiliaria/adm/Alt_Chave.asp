<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
imovel=request("imovel")
codigo=request("codigo")
reload=request("reload")
if request("flag") <> 1  then
   set registro_chave=conn.execute("select * from registro_chave where codigo="&codigo)
   localizacao=registro_chave("cod_localizacao")
   quadro     =registro_chave("cod_quadro")
   descricao  =registro_chave("descricao")
   if quadro<>0 then
      local="1"
   else
      local="2"
   end if
else
   local=request("local")
   localizacao=request("localizacao")
   quadro     =request("quadro")
   descricao  =replace(trim(ucase(request("descricao"))),"'","")
   if local="0" then
     msg = msg&" Local da chave.<br>"
   end if
   if local="1" and quadro=""  then   
      msg = msg&" Posição no quadro de chaves.<br>"
   end if
   if local="2" and localizacao="" then
      msg = msg&" Localização.<br>"
   end if
   if local="1" then
      localizacao="0"
   else
      quadro="0"
   end if
   if msg="" and reload="" then
      conn.execute("update registro_chave set cod_imovel="&imovel&",cod_quadro="&quadro&",cod_localizacao="&localizacao&",descricao='"&descricao&"' where codigo="&codigo)%>
      <script>
         alert('Cadastro efetuado com sucesso!');
         location.href="<%=pagina%>.asp?imovel=<%=imovel%>";
      </script>
   <%end if
end if%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>
<script language="javascript">
  function abilita(tipo)
    {
     if (tipo=='Comum')
        {
          document.form1.titpri.disabled=true;
          document.form1.img.disabled=true;
          
        }
     else
        {
          document.form1.titpri.disabled=false;
          document.form1.img.disabled=false;
        }
    }
</script>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&codigo=<%=codigo%>&imovel=<%=imovel%>&registro_quadro=<%=registro_quadro%>" name="form1">
<input type="hidden" name="reload">
<input type="hidden" name="registro_quadro">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table width="778" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td bgcolor="#6C7692"><img src="../denilson/dot_transparent.gif" width="1" height="2"></td>
        </tr>
        <tr> 
          <td></td>
        </tr>
        <tr> 
          <td bgcolor="#999999"><img src="../denilson/dot_transparent.gif" width="1" height="1"></td>
        </tr>
        <tr>
          <td bgcolor="#CCCCCC"><img src="../denilson/dot_transparent.gif" width="1" height="2"></td>
        </tr>
      </table>
      <br>
      <table border="0" align=left width=380 cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <br>
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar um nova chave do imóvel siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha o campo corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento do campo obrigatório.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/helpicon.gif" border=0>&nbsp;&nbsp;Campo com ajuda &nbsp;&nbsp;<br>
          </td>
        </tr>
        <tr>
          <td>
            <%if msg<>"" and reload="" then%>
               <table cellpadding="0" cellspacing="0" border="0" height=100 width="170">
                 <tr>
                   <td height=1><img src="../img/img_S_E.gif" border="0"></td>
                   <td height=1 width="100%" background="../img/img_S.gif">&nbsp;&nbsp;<font color="#FFFFFF"><b>Erros Encontrados</b></font></td>
                   <td height=1><img src="../img/img_S_D.gif" border="0"></td>
                 </tr>
                 <tr>
                   <td height=1 background="../img/img_E.gif">&nbsp;</td>
                   <td valign="top" height=100% width="100%">
                     <font color="#CC0000"><%=msg%></font>
                   </td>
                   <td height=1 background="../img/img_D.gif">&nbsp;</td>
                 </tr>
                 <tr>
                   <td height=1>
                     <img src="../img/img_I_E.gif" border="0">
                   </td>
                   <td height=1 width="100%" background="../img/img_I.gif">&nbsp;</td>
                   <td height=1>
                     <img src="../img/img_I_D.gif" border="0">
                   </td>
                 </tr>
               </table>
            <%end if%>
          </td>
        </tr>
        <tr>
          <td><br></td>
        </tr>
        <tr>
          <td>
            &nbsp;&nbsp;<a href="<%=pagina%>.asp?imovel=<%=imovel%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_14.gif">&nbsp;CADASTRAR NOVA CHAVE DO IMÓVEL<br><br>
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td>
            <span class="estilo">Imóvel:
          </td>
        </tr>
        <tr>
          <td>
            <%set imoveis = conn.execute("select * from imoveis where status=0 and codigo="&imovel)%>
            <%=imoveis("descricao")%>
          </td>
        </tr>
        <tr>
          <td>
            A chaves está em:
          </td>
        </tr>
        <tr>
          <td>
           <select name="local" style="background=#E8E8E8;" onchange="document.form1.reload.value='1';document.form1.submit()">
               <%if local="" or local="0" then%>
                 <option value = 0 selected></option>  
                 <option value = 1>Imobiliaria</option>  
                 <option value = 2>Outros</option>  
               <%end if%>  
               <%if local="1" then%>
                 <option value = 0></option>  
                 <option value = 1 selected>Imobiliaria</option>  
                 <option value = 2>Outros</option>  
               <%end if%>
               <%if local="2" then%>
                 <option value = 0></option>  
                 <option value = 1>Imobiliaria</option>  
                 <option value = 2 selected>Outros</option>   
               <%end if%>
            </select>
          </td>
        </tr>
        <tr>
          <td>
            <span class="estilo">Posição no quadro de chaves:
          </td>
        </tr>
        <tr>
           <td colspan=2>
             <%if local<>"1" then%><input type=hidden name=quadro value="<%=quadro%>"><%end if%>
             <select name="quadro" style="background=#E8E8E8;" <%if local<>"1" then%>disabled<%end if%>> 
               <option value = ""></option>
                 <%set quadros  =conn.execute("SELECT *  FROM Quadro  WHERE codigo NOT IN  (SELECT cod_quadro FROM registro_chave WHERE status = 0 and codigo<>"&codigo&")")%>
                 <%do while not quadros.eof%>
                   <%if cstr(quadros("codigo"))=cstr(quadro) then%>
                      <option value="<%=quadros("codigo")%>" selected><%=quadros("codigo")%>
                   <%else%>
                      <option value="<%=quadros("codigo")%>"><%=quadros("codigo")%>
                   <%end if%>
                  <%quadros.movenext%>
                 <%loop%>                  
             </select>&nbsp;&nbsp;&nbsp;
           </td>
         </tr>
        <tr>
          <td>
            <span class="estilo">Localização:
          </td>
        </tr>
        <tr>
           <td colspan=2>
             <%if local<>"2" then%><input type=hidden name=localizacao value="<%=localizacao%>"><%end if%>
             <select name="localizacao" style="background=#E8E8E8;" <%if local<>"2" then%>disabled<%end if%>>
               <option value = ""></option>
                 <%set localizar=conn.execute("select * from localizacao ORDER BY descricao")%>
                 <%do while not localizar.eof %>
                 <%if cstr(localizar("codigo"))= cstr(localizacao) then%>
                 <option value="<%=localizar("codigo")%>" selected><%=localizar("descricao")%>
                 <%else%>
                 <option value="<%=localizar("codigo")%>"><%=localizar("descricao")%>
                 <%end if%>
                 <%localizar.movenext%>
                 <%loop%>
              </select>&nbsp;&nbsp;&nbsp;
           </td>
         </tr>
         <tr>
          <td>
            <span class="estilo">Comentários:
          </td>
        </tr>
        <tr>
          <td>
            <textarea name="descricao" label="descricao"><%=descricao%></textarea>
          </td>
        </tr>
         <tr>
          <td align=center>
            <input type="image" src="../img/ok.gif" value="submit" border=0>
          </td>
        </tr>   
      </table>
    </td>
  </tr>
</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>

