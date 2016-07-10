<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=Session.SessionID
pagina=request("pagina")
reload=request("reload")
excluir=request("excluir")
valor=replace(trim(ucase(request("valor"))),"'","")
Pagamento=request("pagamento")

if request("flag") = 1  then
   tipo       =replace(trim(ucase(request("tipo"))),"'","")
   nome       =replace(trim(ucase(request("nome"))),"'","")
   cpf        =replace(trim(ucase(request("cpf"))),"'","")
   identidade =replace(trim(ucase(request("identidade"))),"'","")
   orgao_emissor =replace(trim(ucase(request("orgao_emissor"))),"'","")   
   data_emissao  =request("data_emissao")
   logradouro =replace(trim(ucase(request("logradouro"))),"'","")
   numero     =replace(trim(ucase(request("numero"))),"'","")
   complemento=replace(trim(ucase(request("compl"))),"'","")
   bairro     =replace(trim(ucase(request("bairro"))),"'","")
   cidade     =replace(trim(ucase(request("cidade"))),"'","")
   estado     =replace(trim(ucase(request("estado"))),"'","")
   cep        =replace(trim(ucase(request("cep"))),"'","")
   ddd_fone   =replace(trim(ucase(request("ddd_fone"))),"'","")
   fone       =replace(trim(ucase(request("fone"))),"'","")
   ddd_cel    =replace(trim(ucase(request("ddd_cel"))),"'","")
   celular    =replace(trim(ucase(request("celular"))),"'","")
   email      =replace(trim(ucase(request("email"))),"'","")
   login2     =replace(trim(ucase(request("login2"))),"'","")
   senha2     =replace(trim(request("senha2")),"'","")
   senha3     =replace(trim(request("senha3")),"'","")
   creci      =replace(trim(request("creci")),"'","")
   unidade    =replace(trim(request("unidade")),"'","")
   valor      =replace(trim(ucase(request("valor"))),"'","")
   pagamento  =request("pagamento")
   dia_pgto   =request("dia_pgto")
   equipe   =request("equipe")

   if equipe="" then
      msg=msg& " Equipe.<br>"
   end if
   
   if nome="" then
      msg=msg& " Nome.<br>"
   end if
   if identidade="" then
      msg=msg&" Identidade.<br>"
   end if
   if orgao_emissor="" then
      msg=msg&" Orgão Expeditor.<br>"
   end if
   if not data_valida(data_emissao,1) then 
      msg = msg & "Data de emissão.<br>"
   end if
   if cpf<>"" then
      if not CalculaCPF(cpf) then
         msg=msg&" CPF Inválido<br>"
      end if
      set verifica_cpf=conn.execute("select * from corretor where cpf='"&cpf&"'")
      if not verifica_cpf.eof then
         msg=msg&" CPF já existe<br>"
      end if        
   else
      msg=msg&" CPF.<br>"
   end if
   if logradouro="" or numero="" then
      msg=msg& " Logradouro.<br>"
   end if
   if numero="" then
      msg=msg&" Numero.<br>"
   end if
   if bairro="" then
      msg=msg&" Bairro.<br>"
   end if
   if cidade="" then
      msg=msg&" Cidade.<br>"
   end if
   if estado="" then
      msg=msg&" Estado.<br>"
   end if
   if fone="" then
      msg=msg&" Telefone.<br>"
   end if
   if email <> "" then
      if not IsValidEmail(email) then
         msg=msg&" Email inválido.<br>"             
      end if
   end if
   if login2<>"" then
      set verifica_login=conn.execute("select * from corretor where login='"&login2&"'")
      if not verifica_login.eof then
         msg=msg&" Login já existe;"
      else   
         if senha2="" then
            msg=msg&" Senha.<br>"
         end if
      end if
   end if
   if creci="" then
      msg=msg&" Creci.<br>"
   end if   
   if unidade="" then
      msg=msg&" Unidade.<br>"
   end if
   if dia_pgto="" then
     msg=msg&" Dia do Pagamento.<br>"
   end if
   if login2="" then
      msg=msg&" Login.<br>"
   end if
   if senha2<>senha3 then
      msg=msg&" Confirmar Senha.<br>"
   end if
   if msg="" then
      cpf=replace(cpf,".","")
      cpf=replace(cpf,"-","")
      conn.execute("insert into corretor(nome,endereco,numero,complemento,bairro,cidade,estado,cep,ddd_fone,fone,ddd_cel,celular,cpf,identidade,email,creci,cod_unidade,login,senha,data_inclusao,pagamento, orgao_emissor, data_emissao,cod_equipe) values ('"&nome&"','"&logradouro&"','"&numero&"','"&compl&"','"&bairro&"','"&cidade&"','"&estado&"','"&cep&"',"&ddd_fone&",'"&fone&"','"&ddd_cel&"','"&celular&"','"&cpf&"','"&identidade&"','"&email&"','"&creci&"',"&unidade&",'"&login2&"','"&senha2&"',convert(datetime,'"&date()&"',103),"&dia_pgto&", '"&orgao_emissor&"', convert(datetime,'"&data_emissao&"',103),"&equipe&")")%>
      <script>
         alert('Cadastro efetuado com sucesso!');
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
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>" name="form1">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar um novo corretor siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento dos campos obrigatórios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspEm caso de dúvida com o cep faça uma consulta online.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento do campo login e senha do corretor.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspa senha não deverá conter acentos ou caracteres especiais.<br><br>
            &nbsp;&nbsp;<img src="../img/helpicon.gif" border=0>&nbsp;&nbsp;Campo com ajuda &nbsp;&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/correios.gif" border=0>&nbsp;Pesquisa nos correios<br>
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
            &nbsp;&nbsp;<a href="<%=pagina%>.asp?contrario=<%=contrario%>&codigo=<%=codigo%>&pagina2=<%=pagina2%>&corretor=<%=corretor%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_16.gif">&nbsp;CADASTRAR NOVO CORRETOR
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Equipe:
          </td>
        </tr>
        <tr>
          <td>
            <select name="equipe" style="background=#E8E8E8;">
              <option value = ""></option>
              <%set cbai=conn.execute("select * from equipe ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if supervisor = "" then%>
                  <%supervisor=cbai("codigo")%>
                <%end if%>
                <%if cstr(cbai("codigo"))= equipe then%>
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
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Nome:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="nome" value="<%=nome%>" maxlength=50 label="Nome" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0 border=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Identidade:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Orgão Expeditor:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data de Emissão:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="identidade" value="<%=identidade%>" maxlength=11 label="identidade" style="width:85; height:17; background=#E8E8E8;" onkeypress="Numero()">
                </td>
                <td>
                  &nbsp;<input type="text" name="orgao_emissor" value="<%=orgao_emissor%>" maxlength=10 label="orgao" style="width:85; height:17; background=#E8E8E8;">
                </td>
                <td>
                  <input type="text" name="data_emissao" value="<%=data_emissao%>" maxlength=10 label="data_emissao" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this);">
                </td>
              </tr>
              <tr>
                <td colspan=5>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">CPF / CNPJ:
                </td>
              </tr>
              <tr>
                <td colspan=5>
                  <input type="text" name="cpf" value="<%=cpf%>"  maxlength=14 label="cpf" style="width:145; height:17; background=#E8E8E8;" onkeypress="Numero()">
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Logradouro:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="logradouro" value="<%=logradouro%>" maxlength=150 label="logradouro" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
            <table border="0" cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Número:
                </td>
                <td>
                  <span class="estilo">Complemento:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="numero" value="<%=numero%>" maxlength=10 label="número" style="width:90; height:17; background=#E8E8E8;">
                </td>
                <td>
                  <input type="text" name="compl" value="<%=compl%>" maxlength=20 label="complemento" style="width:200; height:17; background=#E8E8E8;">
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table border="0" cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Bairro:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Cidade:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="bairro" value="<%=bairro%>" maxlength=30 label="Bairro" style="width:145; height:17; background=#E8E8E8;">
                </td>
                <td>
                  <input type="text" name="cidade" value="<%=cidade%>" maxlength=30 label="Cidade" style="width:145; height:17; background=#E8E8E8;">
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table border="0" cellspacing=0 cellpadding=0>
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
                  <select name="estado"  style="background=#E8E8E8;">
                    <option value=""></option>
                    <OPTION value="ACRE">ACRE
	            <OPTION value="ALAGOAS">ALAGOAS
	            <OPTION value="AMAPA">AMAPA
	            <OPTION value="AMAZONAS">AMAZONAS
	            <OPTION value="BAHIA">BAHIA
	            <OPTION value="CEARÁ">CEARÁ
	            <OPTION value="DISTRITO FEDERAL">DISTRITO FEDERAL
       	            <OPTION value="ESPÍRITO SANTO">ESPÍRITO SANTO
       	            <OPTION value="GOIAS">GOIAS
       	            <OPTION value="MARANHÃO">MARANHÃO
       	            <OPTION value="MATO GROSSO">MATO GROSSO
       	            <OPTION value="MATO GROSSO DO SUL">MATO GROSSO DO SUL
       	            <OPTION value="MINAS GERAIS">MINAS GERAIS
       	            <OPTION value="PARÁ">PARÁ
       	            <OPTION value="PARAÍBA">PARAÍBA
       	            <OPTION value="PARANÁ">PARANÁ
       	            <OPTION value="PERNAMBUCO">PERNAMBUCO
       	            <OPTION value="PIAUÍ">PIAUÍ
       	            <OPTION value="RIO DE JANEIRO">RIO DE JANEIRO
       	            <OPTION value="RIO GRANDE DO NORTE">RIO GRANDE DO NORTE
       	            <OPTION value="RIO GRANDE DO SUL">RIO GRANDE DO SUL
       	            <OPTION value="RONDÔNIA">RONDÔNIA
       	            <OPTION value="RORAIMA">RORAIMA
       	            <OPTION value="SANTA CATARINA">SANTA CATARINA
       	            <OPTION value="SÃO PAULO">SÃO PAULO
       	            <OPTION value="SERGIPE">SERGIPE
            	    <OPTION value="TOCANTINS">TOCANTINS
       	            <OPTION value="EXTERIOR">EXTERIOR
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
            <table border="0" cellspacing=0 cellpadding=0>
              <tr>
                <td width=140>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">DDD/Fone:
                </td>
                <td>
                  <span class="estilo">DDD/Celular:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="ddd_fone" value="<%=ddd_fone%>" onkeypress="Numero()" maxlength=2 label="ddd" style="width:26; height:17; background=#E8E8E8;">&nbsp;<input type="text" name="fone" value="<%=fone%>" maxlength=30 label="fone" style="width:86; height:17; background=#E8E8E8;">
                </td>
                <td>
                  <input type="text" name="ddd_cel" value="<%=ddd_cel%>" onkeypress="Numero()" maxlength=2 label="ddd" style="width:26; height:17; background=#E8E8E8;">&nbsp;<input type="text" name="celular" value="<%=celular%>" maxlength=30 label="celular" style="width:86; height:17; background=#E8E8E8;">
                </td>
              </tr>
            </table>
          </td>
        </tr> 
        <tr>
          <td>
            <span class="estilo">Email:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="email" value="<%=email%>"  maxlength=40 label="email" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
	    <table border="0" cellspacing=0 cellpadding=0>
	      <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Creci:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Unidade:
                </td>
              </tr>    
              <tr>
                <td>
                  <input type="text" name="creci" value="<%=creci%>" maxlength=15 label="creci" style="width:126; height:17; background=#E8E8E8;">&nbsp;<span span class="estilo"></a>&nbsp;&nbsp;&nbsp;
              </td>
                <td>
                  <select name="unidade" style="width:140;background=#E8E8E8;">
                    <option value = ""></option>
                    <%set cbai=conn.execute("select * from unidade where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=unidade then%>
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
            <table border="0" cellspacing=0 cellpadding=0>
	      <tr>
	        <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">DIA DO PAGAMENTO:
                </td>
                <td></td>
	      </tr>
	      <tr>
	         <td>
                  <input type="text" name="dia_pgto" maxlength=2 value="<%=dia_pgto%>" label="dia_pgto" style="width:60; height:17; background=#E8E8E8;" onkeypress="Numero()">&nbsp;&nbsp;&nbsp;&nbsp;
          	</td>
	      </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Login:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="login2" value="<%=login2%>" maxlength=15 label="login" style="width:126; height:17; background=#E8E8E8;"></a>
          </td>
        </tr>
        <tr>
          <td>
            <table width=100% cellspacing=0 cellpadding=0 border="0">  
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
                  <input type="password" name="senha2" value="<%=senha2%>" maxlength=20 label="senha" style="width:126; height:17; background=#E8E8E8;">&nbsp;
                </td>
                <td>
                  &nbsp;&nbsp;<input type="password" name="senha3" value="<%=senha3%>" maxlength=20 label="senha" style="width:126; height:17; background=#E8E8E8;">
                </td>
              </tr>
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
</table>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>

