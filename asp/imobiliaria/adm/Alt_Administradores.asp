<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
pagina=request("pagina")
if request("flag") <> 1 then
   set administradores=conn.execute("select * from administradores where codigo="&codigo)
   nome=replace(trim(ucase(administradores("nome"))),"'","")
   email=replace(trim(ucase(administradores("email"))),"'","")
   login2=replace(trim(ucase(administradores("login"))),"'","")
   senha2=replace(trim(ucase(administradores("senha"))),"'","")
else
   nome=replace(trim(ucase(request("nome"))),"'","")
   email=replace(trim(ucase(request("email"))),"'","")
   login2=replace(trim(ucase(request("login2"))),"'","")
   senha2=replace(trim(ucase(request("senha2"))),"'","")
   senha3=replace(trim(ucase(request("senha3"))),"'","")
   if nome<>"" then
      set verifica_administradores=conn.execute("select * from administradores where nome='"&nome&"' and codigo<>"&codigo)
      if not verifica_administradores.eof then
         msg=msg&" Administrador já existe<br>"
      end if
   else
      msg=msg&" Nome.<br>"
   end if
   if email = "" then
      msg=msg&" Email.<br>"
   end if
   if email <> "" then
      if not IsValidEmail(email) then
         msg=msg&" Email inválido.<br>"             
      end if
   end if
   if login2 = "" then
      msg=msg&" Login.<br>"
   end if
   if senha2 = "" then
      msg=msg&" Senha.<br>"
   end if
   if senha2 <> senha3 then
      msg=msg&" Confirmar Senha.<br>"
   end if
   if msg="" then
      conn.execute("update administradores set nome='"&nome&"',email='"&email&"', login = '"&login2&"', senha = '"&senha2&"' where codigo="&codigo)%>
      <script>
         alert('Alteração efetuada com sucesso!');
         location.href="<%=pagina%>.asp";
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.nome.focus()">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&codigo=<%=codigo%>" name="form1">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar alterar os dados do administrador siga os passos:<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento dos campos obrigatórios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento do campo login e senha do administradores.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspa senha não deverá conter acentos ou caracteres especiais.<br><br>
            &nbsp;&nbsp;<img src="../img/helpicon.gif" border=0>&nbsp;&nbsp;Campo com ajuda &nbsp;&nbsp;<br>
          </td>
        </tr>
        <tr>
          <td>
            <%if msg<>"" then%>
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
            &nbsp;&nbsp;<a href="<%=pagina%>.asp"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_11.gif">&nbsp;ALTERAR ADMINISTRADOR<br><br>
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Nome:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="nome" value="<%=nome%>" maxlength=45 label="Nome" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Email:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="email" value="<%=email%>"  maxlength=40 label="email" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Login:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="login2" value="<%=login2%>" maxlength=20 label="login" style="width:126; height:17; background=#E8E8E8;">&nbsp;<a HREF="javascript:chamar_login()"><span span class="estilo"><img src="../img/helpicon.gif" border=0></a>
                </td>
              </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Senha:
                </td>
                <td>
                  &nbsp;&nbsp;<img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Confirmar Senha:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="password" name="senha2" value="<%=senha2%>" maxlength=15 label="senha" style="width:126; height:17; background=#E8E8E8;">&nbsp;<a HREF="javascript:chamar_senha()"><span span class="estilo"> <img src="../img/helpicon.gif" border=0></a>
                </td>
                <td>
                  &nbsp;&nbsp;<input type="password" name="senha3" value="<%=senha2%>" maxlength=15 label="senha" style="width:126; height:17; background=#E8E8E8;">&nbsp;<a HREF="javascript:chamar_senha()"><span span class="estilo"> <img src="../img/helpicon.gif" border=0></a>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td align=center>
            <input type="image" src="../img/ok.gif" value="submit" border=0><br><br><br><br><br><br><br><br><br><br><br><br>
          </td>
        </tr>   
      </table>
    </td>
  </tr>
</table>
<br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>

