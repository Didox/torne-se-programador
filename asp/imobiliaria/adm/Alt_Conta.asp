<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
codigo=request("codigo")
if request("flag") <> 1 then
   set contas=conn.execute("select * from contas where codigo="&codigo)
   tipo=contas("tipo")
   tipo_conta=contas("cod_tipo_conta")
   setor=contas("cod_setor")
   data=data_completa(contas("data"))
   numero=contas("numero")
   valor=trim(formatnumber(csng(contas("valor")),2))
   descricao=contas("descricao")
else
   tipo=replace(trim(ucase(request("tipo"))),"'","")
   tipo_conta=trim(ucase(request("tipo_conta")))
   setor=trim(ucase(request("setor")))
   data=request("data")
   numero=request("numero")
   valor=replace(request("valor"),"'","")
   descricao  =replace(trim(ucase(request("descricao"))),"'","")
   if not data_valida(data,0) then   
      msg=msg&" Data.<br>"
   end if
   if tipo_conta="" then
      msg=msg&" Tipo da conta.<br>"
   end if
   if setor="" then
      msg=msg&" Setor.<br>"
   end if
   if descricao="" then
      msg=msg&" Descrição.<br>"
   end if
   if not isnumeric(valor) then
     msg=msg&" Valor.<br>"
   end if
   if msg="" then
      conn.execute("Update Contas set tipo = "&tipo&",cod_tipo_conta='"&tipo_conta&"',cod_setor='"&setor&"',data=convert(datetime,'"&data&"',103),numero='"&numero&"',valor="&replace(replace(csng(valor),".",""),",",".")&",descricao='"&descricao&"' where codigo="&codigo)%>
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
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar uma nova conta siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento dos campos obrigatórios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
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
            <img src="../img/r_11.gif">&nbsp;ALTERAR CONTAS<br><br>
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td span class="estilo" width=100%>
            Tipo de Permissão<br>
            <%if tipo="" or tipo="1" then%>
               <input type="radio" name="tipo" value="1" checked><span class="estilo">Entrada
               <input type="radio" name="tipo" value="2"><span class="estilo">Saída
            <%else%>
               <input type="radio" name="tipo" value="1"><span class="estilo">Entrada
               <input type="radio" name="tipo" value="2" checked><span class="estilo">Saída
            <%end if%>
          </td>
        </tr> 
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Tipo da Conta:
          </td>
        </tr>
        <tr>
          <td>
            <select name="tipo_conta" style="width:140;background=#E8E8E8;">
              <option value=""></option>
              <%set cbai=conn.execute("select * from Tipo_conta where status=0 and tipo=1 ORDER BY descricao")%>
              <%do while not cbai.eof %>
              <%if cstr(cbai("codigo"))=cstr(tipo_conta) then%>
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
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Setor:
          </td>
        </tr>
        <tr>
          <td>
            <select name="setor" style="width:140;background=#E8E8E8;">
              <option value=""></option>
              <%set cbai=conn.execute("select * from setor where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
              <%if cstr(cbai("codigo"))=cstr(setor) then%>
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
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data lançamento:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="data" value="<%=data%>" maxlength=20 label="login" style="width:126; height:17; background=#E8E8E8;"  onkeypress="Numero();DATA(this);">&nbsp;<a HREF="javascript:chamar_login()"><span span class="estilo"></a>
                </td>
              </tr>
              <tr>
                <td>
                  <span class="estilo">Numero:
                </td>
              </tr>
              <tr>                
                <td>
                  <input type="text" name="numero" value="<%=numero%>"  label="numero" style="width:126; height:17; background=#E8E8E8;" onkeypress="Numero();">&nbsp;<a HREF="javascript:chamar_senha()"><span span class="estilo"></a>
                </td>
              </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Descricao:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="descricao" value="<%=descricao%>"  label="descricao" style="width:150; height:17; background=#E8E8E8;">&nbsp;<a HREF="javascript:chamar_senha()"><span span class="estilo"></a>
                </td>
              </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Valor:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="valor" value="<%=valor%>" label="valor" style="width:60;height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);">&nbsp;<a HREF="javascript:chamar_senha()"><span span class="estilo"></a>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td align=center>
            <input type="image" src="../img/ok.gif" value="submit" border=0><br><br><br><br><br><br><br><br>
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

