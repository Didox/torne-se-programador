<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
  codigo=request("codigo")
  codigo2=request("codigo2")
  imovel     =request("imovel")

if session("tipo")="2" then
  set cliente=conn.execute("select * from clientes where codigo="&session("cod"))
  interessado=ucase(replace(cliente("nome"),"'",""))
  ddd=cliente("ddd_fone")
  fone=replace(cliente("fone"),"'","")
  email=replace(cliente("email"),"'","")
end if
if request("flag") = 1 then
   opcao      =request("opcao")
   descricao  =replace(trim(ucase(request("descricao"))),"'","")
   interessado=ucase(replace(request("interessado"),"'",""))
   ddd=request("ddd")
   fone=replace(request("fone"),"'","")
   email=replace(request("email"),"'","")

   if interessado="" then
      msg=msg& " Nome.<br>"
   end if
   if ddd="" then
      msg=msg& " DDD.<br>"
   end if
   if fone="" then
      msg=msg& " Telefone.<br>"
   end if
   if opcao="" then
      msg=msg& " Opção.<br>"
   end if
   if descricao="" then
      msg=msg& " Descrição.<br>"
   end if

   if msg="" then
       conn.execute("insert into contato(interessado,cod_opcao,cod_imovel,data_contato, descricao, ddd, fone, email) values ('"&interessado&"',"&opcao&", "&imovel&",convert(datetime,'"&date()&"',103),'"&descricao&"', "&ddd&", '"&fone&"', '"&email&"')")%>
         <script>
            alert('Contato efetuado com sucesso!');
            window.close();
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onLoad="document.form1.interessado.focus()">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&imovel=<%=imovel%>" name="form1">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" bgcolor="E2DDC0"><table border="0" width="600" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top"><br>
            <table border="0" align=left width=300 cellspacing="0" cellpadding="0">
              <tr>
                <td><br>
                    <span span class="estilo">&nbsp;&nbsp;<b>Para efetuar um contato siga os passos descrito abaixo.<br>
                      <br>
                      </b> &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
                  &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAten&ccedil;&atilde;o no preenchimento dos campos obrigat&oacute;rios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;</td>
              </tr>
              <tr>
                <td><%if msg<>"" then%>
                    <table cellpadding="0" cellspacing="0" border="0" height=100 width="170">
                      <tr>
                        <td height=1><img src="../img/img_S_E.gif" border="0"></td>
                        <td height=1 width="100%" background="../img/img_S.gif">&nbsp;&nbsp;<font color="#FFFFFF"><b>Erros Encontrados</b></font></td>
                        <td height=1><img src="../img/img_S_D.gif" border="0"></td>
                      </tr>
                      <tr>
                        <td height=1 background="../img/img_E.gif">&nbsp;</td>
                        <td valign="top" height=100% width="100%"><font color="#CC0000"><%=msg%></font> </td>
                        <td height=1 background="../img/img_D.gif">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height=1><img src="../img/img_I_E.gif" border="0"> </td>
                        <td height=1 width="100%" background="../img/img_I.gif">&nbsp;</td>
                        <td height=1><img src="../img/img_I_D.gif" border="0"> </td>
                      </tr>
                    </table>
                  <%end if%>
                </td>
              </tr>
              <tr>
                <td><br></td>
              </tr>
              <tr>
                <td>&nbsp;&nbsp;<a href="javascript:history.back();"><img src="../../imagens/voltar1.gif" width="86" height="26" border=0 title="Voltar"></a> </td>
              </tr>
          </table></td>
        <td><table border="0" width=300>
            <tr>
              <td  colspan=2 class="estilo"><img src="../img/r_10.gif">&nbsp;CONTATO </td>
            </tr>
            <tr>
              <td colspan=2><img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Im&oacute;vel: </td>
            </tr>
            <tr>
              <td colspan=2><%set imovel_=conn.execute("select * from imoveis where codigo="&imovel)%>
                  <b><%=imovel_("descricao")%></b> </td>
            </tr>
            <tr>
              <td colspan=2><img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Nome: </td>
            </tr>
            <tr>
              <td colspan=2><input type="text" name="interessado" value="<%=interessado%>" maxlength=50 label="Nome" style="width:290; height:17; ">
              </td>
            </tr>
            <tr>
              <td width="18%"><img src="../img/obrigacao.gif">&nbsp;<span class="estilo">DDD: </td>
              <td width="82%"><img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Fone: </td>
            </tr>
            <tr>
              <td><input type="text" name="ddd" value="<%=ddd%>" maxlength=2 label="ddd" style="width:25; height:17; ">
              </td>
              <td><input name="fone" type="text" value="<%=fone%>" size="10" maxlength=20 label="fone">
              </td>
            </tr>
            <tr>
              <td colspan=2><img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Email: </td>
            </tr>
            <tr>
              <td colspan=2><input type="text" name="email" value="<%=email%>" maxlength=50 label="Nome" style="width:290; height:17; ">
              </td>
            </tr>
            <tr>
              <td colspan=2><table cellspacing=0 cellpadding=0>
                  <tr>
                    <td><img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Op&ccedil;&atilde;o: </td>
                  </tr>
                  <tr>
                    <td colspan=2><select name="opcao" style="width:100;">
                        <option value = ""></option>
                        <%set cbai=conn.execute("select * from opcao where status=0 ORDER BY descricao")%>
                        <%do while not cbai.eof %>
                        <%if cstr(cbai("codigo"))=opcao then%>
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
                    <td colspan=2><img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Desci&ccedil;&atilde;o: </td>
                  </tr>
                  <tr>
                    <td colspan=2><textarea name="descricao" cols="35" rows="5" label="Nome"><%=descricao%></textarea>
                    </td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td align=center colspan=2><input name="image" type="image" value="submit" src="../../imagens/botoes/enviar.gif" border=0>
              </td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

