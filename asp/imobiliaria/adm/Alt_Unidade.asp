<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
pagina=request("pagina")
if request("flag") <> 1 then
   set Unidade=conn.execute("select * from Unidade where codigo="&codigo)
   descricao=replace(trim(ucase(Unidade("descricao"))),"'","")
   logradouro=replace(trim(ucase(Unidade("endereco"))),"'","")
   numero=replace(trim(ucase(Unidade("numero"))),"'","")
   compl=replace(trim(ucase(Unidade("complemento"))),"'","")
   bairro=replace(trim(ucase(Unidade("bairro"))),"'","")
   cidade=replace(trim(ucase(Unidade("cidade"))),"'","")
   estado=replace(trim(ucase(Unidade("estado"))),"'","")
   cep=trimreplace((ucase(Unidade("cep"))),"'","")
   ddd=trim(ucase(Unidade("ddd_fone")))
   fone=trim(ucase(Unidade("fone")))
else
   descricao=replace(trim(ucase(request("descricao"))),"'","")
   logradouro=replace(trim(ucase(request("logradouro"))),"'","")
   numero=replace(trim(ucase(request("numero"))),"'","")
   compl=replace(trim(ucase(request("compl"))),"'","")
   bairro=replace(trim(ucase(request("bairro"))),"'","")
   cidade=replace(trim(ucase(request("cidade"))),"'","")
   estado=replace(trim(ucase(request("estado"))),"'","")
   cep=trim(ucase(request("cep")))
   ddd=trim(ucase(request("ddd")))
   fone=trim(ucase(request("fone")))
   if descricao<>"" then
      set verifica_descricao=conn.execute("select * from Unidade where descricao='"&descricao&"' and codigo<>"&codigo)
      if not verifica_descricao.eof then
         msg=msg&" Unidade já existe<br>"
      end if
   else
      msg=msg&" Unidade.<br>"
   end if
   if descricao = "" then
      msg = msg & "Descrição.<br>"
   end if
   if logradouro="" or numero="" then
      msg=msg&"Logradouro.<br>"
   end if
   if bairro=""then
      msg=msg&"Bairro.<br>"
   end if
   if cidade="" then
      msg=msg&"Cidade.<br>"
   end if
   if estado="" then
      msg=msg&"Estado.<br>"
   end if
   if ddd="" then
      msg=msg&"DDD.<br>"
   end if
   if fone="" then
      msg=msg&"Fone.<br>"
   end if     
   if msg="" then
      conn.execute("update Unidade set descricao='"&descricao&"', endereco='"&logradouro&"', numero='"&numero&"', complemento='"&compl&"',bairro='"&bairro&"', cidade='"&cidade&"', estado='"&estado&"', cep='"&cep&"',ddd_fone="&ddd&",fone='"&fone&"' where codigo="&codigo)%>
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.descricao.focus()">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para alterar a unidade siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento dos campos obrigatórios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspEm caso de dúvida com o cep faça uma consulta online.<br>
            &nbsp;&nbsp;<img src="../img/helpicon.gif" border=0>&nbsp;&nbsp;Campo com ajuda &nbsp;&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/correios.gif" border=0>&nbsp;Pesquisa nos correios<br>
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
            <img src="../img/r_3.gif">&nbsp;ALTERAR UNIDADE
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
         
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Descrição:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="descricao" value="<%=descricao%>" maxlength=50 label="descricao" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
           <img src="../img/obrigacao.gif"> <span class="estilo">Logradouro:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="logradouro" value="<%=logradouro%>" maxlength=50 label="logradouro" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif"><span class="estilo">Número:
                </td>
                <td>
                  <span class="estilo">Complemento:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="numero" value="<%=numero%>" maxlength=30 label="número" style="width:90; height:17; background=#E8E8E8;">
                </td>
                <td>
                  <input type="text" name="compl" value="<%=compl%>" maxlength=30 label="complemento" style="width:200; height:17; background=#E8E8E8;">
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
                  <img src="../img/obrigacao.gif"><span class="estilo">Bairro:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Cidade:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="bairro" value="<%=bairro%>" maxlength=50 label="Bairro" style="width:145; height:17; background=#E8E8E8;">
                </td>
                <td>
                  <input type="text" name="cidade" value="<%=cidade%>" maxlength=50 label="Cidade" style="width:145; height:17; background=#E8E8E8;">
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
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Estado:
                </td>
                <td>
                  <span class="estilo">CEP:
                </td>
              </tr>
              <tr>
                <td>
                  <select name="estado"  style="width:140;background=#E8E8E8;">
                    <option value = ""></option>
                    <OPTION value="AC">ACRE
	            <OPTION value="AL">ALAGOAS
	            <OPTION value="AP">AMAPA
	            <OPTION value="AM">AMAZONAS
	            <OPTION value="BA">BAHIA
	            <OPTION value="CE">CEARÁ
	            <OPTION value="DF">DISTRITO FEDERAL
       	            <OPTION value="ES">ESPÍRITO SANTO
       	            <OPTION value="GO">GOIAS
       	            <OPTION value="MA">MARANHÃO
       	            <OPTION value="MT">MATO GROSSO
       	            <OPTION value="MS">MATO GROSSO DO SUL
       	            <OPTION value="MG">MINAS GERAIS
       	            <OPTION value="PA">PARÁ
       	            <OPTION value="PB">PARAÍBA
       	            <OPTION value="PR">PARANÁ
       	            <OPTION value="PE">PERNAMBUCO
       	            <OPTION value="PI">PIAUÍ
       	            <OPTION value="RJ">RIO DE JANEIRO
       	            <OPTION value="RN">RIO GRANDE DO NORTE
       	            <OPTION value="RS">RIO GRANDE DO SUL
       	            <OPTION value="RO">RONDÔNIA
       	            <OPTION value="RR">RORAIMA
       	            <OPTION value="SC">SANTA CATARINA
       	            <OPTION value="SP">SÃO PAULO
       	            <OPTION value="SE">SERGIPE
            	    <OPTION value="TO">TOCANTINS
       	            <OPTION value="EX">EXTERIOR
       	            <OPTION value="<%=estado%>" selected><%=estado%>
       	          </select>
                </td>
                <td>
                  <input type="text" name="cep" value="<%=cep%>" maxlength=10 onkeypress="Numero();CEP(this);" maxlength=14 label="cpf" style="width:80; height:17; background=#E8E8E8;">&nbsp;&nbsp;<a HREF="javascript:chamar_cep()"><span span class="estilo"> <img src="../img/correios.gif" alt="Consultar correios" border=0></a>
                </td>
              </tr>
            </table>
          </td>
        </tr> 
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td width=140>
                 <img src="../img/obrigacao.gif"> <span class="estilo">DDD/Fone:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="ddd" value="<%=ddd%>"  maxlength=2 label="ddd" onkeypress="Numero()" style="width:26; height:17; background=#E8E8E8;">&nbsp;
                  <input type="text" name="fone" value="<%=fone%>" maxlength=30 label="fone" style="width:86; height:17; background=#E8E8E8;">
                </td>
              </tr>
            </table>
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
</table><br><br><br><br><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>

