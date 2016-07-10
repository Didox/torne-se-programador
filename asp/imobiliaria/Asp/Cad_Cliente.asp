<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<%pagina=request("pagina")
codigo=Session.SessionID
reload=request("reload")
excluir=request("excluir")
descricao_bem = replace(trim(ucase(request("descricao_bem"))),"'","")
bem = trim(request("bem"))
valor = trim(request("valor"))
if reload="1" and excluir="" and isnumeric(valor) and descricao_bem<>"" and isnumeric(valor) then
   conn.execute("insert into bens (descricao, valor, cod_tipo_bens, cod_cliente) values ('"&descricao_bem&"', "&replace(replace(csng(valor),".",""),",",".")&", "&bem&", "&codigo&")")
end if
if excluir<>"" and reload="1" then
   conn.execute("delete bens where codigo="&excluir)
end if

if request("flag") = 1 then
   tipo      =replace(trim(ucase(request("tipo"))),"'","")
   nome      =replace(trim(ucase(request("nome"))),"'","")
   cpf       =replace(trim(ucase(request("cpf"))),"'","")
   identidade=replace(trim(ucase(request("identidade"))),"'","")
   endereco=replace(trim(ucase(request("endereco"))),"'","")
   numero    =replace(trim(ucase(request("numero"))),"'","")
   complemento=replace(trim(ucase(request("complemento"))),"'","")
   bairro    =replace(trim(ucase(request("bairro"))),"'","")
   cidade    =replace(trim(ucase(request("cidade"))),"'","")
   estado    =replace(trim(ucase(request("estado"))),"'","")
   cep       =replace(trim(ucase(request("cep"))),"'","")
   ddd       =replace(trim(ucase(request("ddd"))),"'","")
   fone      =replace(trim(ucase(request("fone"))),"'","")
   dddc      =replace(trim(ucase(request("dddc"))),"'","")
   celular   =replace(trim(ucase(request("celular"))),"'","")
   banco     =replace(trim(ucase(request("banco"))),"'","")
   agencia   =replace(trim(ucase(request("agencia"))),"'","")
   conta     =replace(trim(ucase(request("conta"))),"'","")
   profissao =replace(trim(ucase(request("profissao"))),"'","")
   email     =replace(trim(ucase(request("email"))),"'","")
   login2    =replace(trim(ucase(request("login2"))),"'","")
   senha2    =replace(trim(ucase(request("senha2"))),"'","")
   senha3    =replace(trim(ucase(request("senha3"))),"'","")
   cartorio    =replace(trim(ucase(request("cartorio"))),"'","")   
   escolaridade=request("escolaridade")
   estado_civil=request("estado_civil")
   sexo=request("sexo")
   data_nascimento=request("data_nascimento")
   empresa  =replace(trim(ucase(request("empresa"))),"'","")
   data_admissao=request("data_admissao")
   profissao  =replace(trim(ucase(request("profissao"))),"'","")
   cargo  =replace(trim(ucase(request("cargo"))),"'","")
   renda=request("renda")
   renda_extra=request("renda_extra")
   orgao_emissor    =replace(trim(ucase(request("orgao_emissor"))),"'","")   
   data_emissao    =request("data_emissao")
   tipo_imovel    =request("tipo_imovel")

   if nome="" then
      msg=msg& " Nome.<br>"
   end if
   if cpf<>"" then
      cpf=replace(cpf,".","")
      cpf=replace(cpf,"-","")
      if tipo=1 then
         if not CalculaCPF(cpf) then
            msg=msg&" CPF Inválido<br>"
         end if
      else   
         if not CalculaCNPJ(cpf) then
            msg=msg&" CNPJ Inválido<br>"
         end if
      end if
   else
      msg=msg&" CPF_CNPJ.<br>"
   end if     
   if tipo = "1" then
     if identidade="" then
        msg=msg&" Identidade.<br>"
     end if
     if orgao_emissor="" then
        msg=msg&" Orgão Emissor.<br>"
     end if
     if not data_valida(data_emissao,1) then
        msg=msg&" Data de Emissão.<br>"
     end if
   end if
   if endereco="" then
      msg=msg& " Logradouro.<br>"
   end if
   if numero="" then
      msg=msg& " Número.<br>"
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
   if cep="" then
      msg=msg&" CEP.<br>"
   end if
   if tipo = "1" then
     if escolaridade="" then
        msg=msg&" Escolaridade.<br>"
     end if
     if estado_civil="" then
        msg=msg&" Estado Civil.<br>"
     end if
     if sexo="" then
        msg=msg&" Sexo.<br>"
     end if
     if not data_valida(data_nascimento,1) then
        msg=msg&" Data de Nascimento.<br>"
     end if
     if profissao="" then
        msg=msg&" Profissão.<br>"
     end if
     if cargo="" then
        msg=msg&" Cargo.<br>"
     end if
     if empresa="" then
       msg=msg&" Empresa.<br>"
     end if
   end if
   if ddd="" then
      msg=msg&" DDD Fone.<br>"
   end if
   if fone="" then
      msg=msg&" Fone.<br>"
   end if
   if not isnumeric(renda) then
      if tipo="2" then
        msg=msg&" Renda.<br>"
      else
        msg=msg&" Capital Social.<br>"
      end if
   end if
   if banco="" then
      msg=msg&" Banco.<br>"
   end if
   if agencia="" then
      msg=msg&" Agência.<br>"
   end if
   if conta="" then
      msg=msg&" Conta.<br>"
   end if
   if tipo="1" then
     if not data_valida(data_admissao,1) then
        msg=msg&" Data de Admissão.<br>"
     end if
   end if
   if cartorio="" then
      msg=msg&" Cartório.<br>"
   end if
   if renda_extra="" then
      renda_extra=0
   end if
   if tipo_imovel="" then
      tipo_imovel=0
   end if
   if email <> "" then
      if not IsValidEmail(email) then
         msg=msg&" Email inválido.<br>"             
      end if
   end if
   if login2<>"" then
      set verifica_login=conn.execute("select * from clientes where login='"&login2&"' and status=0")
      if not verifica_login.eof then
         msg=msg&" Login já existe<br>"
      else   
         if senha2="" then
            msg=msg&" Senha.<br>"
         end if
      end if
   else
      msg=msg&" Login.<br>"
   end if
   if senha2 <> senha3 then
      msg=msg&" Confirmar senha.<br>"
   end if
   if msg="" and reload="" then
      if tipo = "1" then
       conn.execute("insert into clientes(tipo, nome, endereco, numero, complemento, bairro, cidade, estado, cep, ddd_fone, fone, ddd_cel, celular, cpf, identidade, email, login, senha, cod_banco, agencia, conta, renda, data_inclusao, cod_escolaridade, estado_civil, sexo, data_nascimento, data_admissao, renda_extra, empresa, cartorio, data_emissao, cargo, profissao, orgao_emissor, tipo_imovel) values ("&tipo&", '"&nome&"', '"&endereco&"', '"&numero&"', '"&complemento&"', '"&bairro&"', '"&cidade&"', '"&estado&"', '"&cep&"', "&ddd&", '"&fone&"', '"&dddc&"', '"&celular&"', '"&cpf&"', '"&identidade&"', '"&email&"', '"&login2&"', '"&senha2&"', "&banco&", '"&agencia&"', '"&conta&"', "&replace(replace(csng(renda),".",""),",",".")&", convert(datetime,'"&date()&"',103), "&escolaridade&", "&estado_civil&", "&sexo&", convert(datetime,'"&data_nascimento&"',103), convert(datetime,'"&data_admissao&"',103), "&replace(replace(csng(renda_extra),".",""),",",".")&", '"&empresa&"', '"&cartorio&"', convert(datetime,'"&data_emissao&"',103), '"&cargo&"', '"&profissao&"', '"&orgao_emissor&"', "&tipo_imovel&")")
       set cod_cliente = conn.execute("select * from clientes where nome='"&nome&"' and cpf = '"&cpf&"' and identidade = '"&identidade&"' and cod_banco = '"&banco&"' and agencia = '"&agencia&"' and conta = '"&conta&"' and profissao = '"&profissao&"' and email = '"&email&"' and senha='"&senha2&"' and login='"&login2&"' order by codigo desc")
       conn.execute("update bens set cod_cliente="&cod_cliente("codigo")&" where cod_cliente="&codigo)
      else
        conn.execute("insert into clientes(tipo,nome,endereco,numero,complemento,bairro,cidade,estado,cep,ddd_fone,fone,ddd_cel,celular,cpf,email,login,senha,cod_banco,agencia,conta,renda,data_inclusao,renda_extra, empresa, cartorio, tipo_imovel) values ("&tipo&",'"&nome&"','"&endereco&"','"&numero&"','"&complemento&"','"&bairro&"','"&cidade&"','"&estado&"','"&cep&"','"&ddd&"','"&fone&"','"&dddc&"','"&celular&"','"&cpf&"','"&email&"','"&login2&"','"&senha2&"',"&banco&",'"&agencia&"','"&conta&"',"&replace(replace(csng(renda),".",""),",",".")&",convert(datetime,'"&date()&"',103), "&replace(replace(csng(renda_extra),".",""),",",".")&", '"&empresa&"', '"&cartorio&"', "&tipo_imovel&")")
      end if%>
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar um novo cliente siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento dos campos obrigatórios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspEm caso de dúvida com o cep faça uma consulta online.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento do campo login e senha do cliente.<br>
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
            &nbsp;&nbsp;<a href="<%=pagina%>.asp"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_8.gif">&nbsp;CADASTRAR CLIENTE
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td>
            <%if tipo="" or tipo=1 then%>
               <input type="radio" name="tipo" value="1" checked><span class="estilo">Pessoa Física
               <input type="radio" name="tipo" value="2"><span class="estilo">Pessoa Jurídica
            <%else%>
               <input type="radio" name="tipo" value="1"><span class="estilo">Pessoa Física
               <input type="radio" name="tipo" value="2" checked><span class="estilo">Pessoa Jurídica
            <%end if%>
          </td>
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
                  <input type="text" name="identidade" value="<%=Identidade%>" maxlength=11 label="identidade" style="width:85; height:17; background=#E8E8E8;" onkeypress="Numero()">
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
            <input type="text" name="endereco" value="<%=endereco%>" maxlength=150 label="endereco" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
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
                  <input type="text" name="numero" value="<%=numero%>" maxlength=15 label="número" style="width:90; height:17; background=#E8E8E8;">
                </td>
                <td>
                  <input type="text" name="complemento" value="<%=complemento%>" maxlength=20 label="complemento" style="width:200; height:17; background=#E8E8E8;">
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
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Estado:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">CEP:
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
             <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Residência:
                </td>
                <td>
                  <span class="estilo">Escolaridade:
                </td>
             </tr>
              <tr>
                <td>
                  <select name="tipo_imovel" style="width:140;background=#E8E8E8;">
                    <option value=""></option>
                    <%set cbai=conn.execute("select * from Tipo_imovel_cliente where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))= cstr(tipo_imovel) then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                </td>
                <td>
                  <select name="escolaridade" style="background=#E8E8E8;">
                    <option value = ""></option>
                      <%set cbai=conn.execute("select * from tipo_escolaridade ORDER BY descricao")%>
                      <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))= cstr(escolaridade) then%>
                        <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                        <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                      <%loop%>
                 </select>&nbsp;&nbsp;&nbsp;
                </td>
              </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Estado Civil:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Sexo:
                </td>
              </tr>
              <tr>
                <td>
                  <select name="estado_civil" style="background=#E8E8E8;">
                    <option value = ""></option>
                      <%set cbai=conn.execute("select * from tipo_estado_civil where status=0 ORDER BY descricao")%>
                      <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))= cstr(estado_civil) then%>
                        <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                        <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                      <%loop%>
                 </select>&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                <%if sexo="" then%>
                  <input type="radio" name="sexo" value=0>Masculino
                  <input type="radio" name="sexo" value=1>Feminino
                <%else%>
                  <%if sexo=0 then%>
                    <input type="radio" name="sexo" value=0 checked>Masculino
                    <input type="radio" name="sexo" value=1>Feminino
                  <%else%>
                    <input type="radio" name="sexo" value=0>Masculino
                    <input type="radio" name="sexo" value=1 checked>Feminino
                  <%end if
                end if%>
                </td>
              </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data de Nascimento:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="data_nascimento" value="<%=data_nascimento%>" maxlength=10 label="Cidade" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this);">
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
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">DDD/Fone:
                </td>
                <td>
                  <span class="estilo">DDD/Celular:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="ddd" value="<%=ddd%>"  maxlength=2 label="ddd" style="width:26; height:17; background=#E8E8E8;">&nbsp;<input type="text" name="fone" value="<%=fone%>" maxlength=30 label="fone" style="width:86; height:17; background=#E8E8E8;">
                </td>
                <td>
                  <input type="text" name="dddc" value="<%=dddc%>"  maxlength=2 label="dddc" style="width:26; height:17; background=#E8E8E8;">&nbsp;<input type="text" name="celular" value="<%=celular%>" maxlength=30 label="celular" style="width:86; height:17; background=#E8E8E8;">
                </td>
              </tr>
            </table>
          </td>
        </tr> 
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td colspan=2>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Banco:
                </td>                
              </tr>
              <tr>
                <td colspan=2>
                  <select name="banco" style="background=#E8E8E8;">
	             <option value = "">
	            <%set bancos=conn.execute("select * from bancos ORDER BY descricao")%>
	            <%do while not bancos.eof %>
	              <%if cstr(bancos("codigo"))= banco then%>
	                 <option value="<%=bancos("codigo")%>" selected><%=bancos("descricao")%>
	              <%else%>
	                 <option value="<%=bancos("codigo")%>"><%=bancos("descricao")%>
	              <%end if%>
	              <%bancos.movenext%>
	            <%loop%>
	          </select>
                </td>
               </tr>
               <tr>
                <td colspan=2>
                 <table cellspacing=0 cellpadding=0 border=0>
                  <tr>
	            <td>
	             <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Agência:
	            </td>
	            <td>
	             <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Conta:
	            </td>
	          </tr>
	          <tr>
	            <td>
	              <input type="text" name="agencia" value="<%=agencia%>"  maxlength=10 label="Agencia" style="width:96; height:17; background=#E8E8E8;">
	            </td>
	            <td>
	             <input type="text" name="conta" value="<%=conta%>"  maxlength=20 label="Conta" style="width:97; height:17; background=#E8E8E8;">
	            </td>
	          </tr>
	         </table>
	        </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0 border=0>
              <tr>
                <td colspan=2>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Empresa onde trabalha:
                </td>
              </tr>
              <tr>
                <td colspan=2>
                  <input type="text" name="empresa" value="<%=empresa%>"  maxlength=40 label="Empresa" style="width:290; height:17; background=#E8E8E8;">
                </td>
              </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data de Admissão:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Profissão:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="data_admissao" value="<%=data_admissao%>"  maxlength=10 label="data_admissao" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this);">
                </td>
                <td>
                  <input type="text" name="profissao" value="<%=profissao%>"  maxlength=20 label="profissao" style="width:100; height:17; background=#E8E8E8;">
                </td>
              </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Cargo:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="cargo" value="<%=cargo%>"  maxlength=20 label="cargo" style="width:100; height:17; background=#E8E8E8;">
                </td>
              </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Renda:
                </td>
                <td>
                  <span class="estilo">Renda Extra:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="renda" value="<%=renda%>"  maxlength=18 label="renda" style="width:100; height:17; background:#E8E8E8;text-align: RIGHT;" onkeypress="Numero();" onkeyup="Moeda(this);">
                </td>
                <td>
                  <input type="text" name="renda_extra" value="<%=renda_extra%>"  maxlength=18 label="renda_extra" style="width:100; height:17; background:#E8E8E8;text-align: RIGHT;" onkeypress="Numero();" onkeyup="Moeda(this);">
                </td>
              </tr>
              <tr>
                <td>
                 <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Cartório:
                </td>
              </tr>
              <tr>
                <td colspan=2>
                  <input type="text" name="cartorio" value="<%=cartorio%>"  maxlength=30 label="cartorio" style="width:290; height:17; background=#E8E8E8;">
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
            <input type="text" name="email" value="<%=email%>"  maxlength=50 label="email" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td><span class="estilo">
                   <b>Bens do Cliente</b>
                </td>
              </tr>
              <tr>
                <td>
                  <input type=hidden name="reload">
                  <input type=hidden name="excluir">            
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Descrição:
                </td>
              </tr>              
              <tr>
               <td>
                  <input type="text" name="descricao_bem" value=""  maxlength=50 label="DescriçãodoBem" style="width:160; height:17; background=#E8E8E8;">                 
                </td>
              </tr>
             <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Tipo do Bem:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Valor:
                </td>
                <td></td>
              </tr>
               <tr>
                <td>
                  <select name="bem" style="width:140;background=#E8E8E8;">
                    <option value=""></option>
                    <%set cbai=conn.execute("select * from Tipo_bens where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=tipo_bens then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <td>
                  <input type="text" name="valor" value="" label="valor" style="width:60; height:17;background:#E8E8E8;text-align: RIGHT;" maxlength=18 onkeypress="Numero();" onkeyup="Moeda(this);"> 
                </td>
                <td>
                </td>
                <td align=center>
                  &nbsp;<input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='1'">
                </td>
              </tr>
            </table>
            <table width=84% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Bens</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Valor</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center width=2>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from bens where cod_cliente="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                    <%=cbai("descricao")%>
                </td>
                <td align=center width=90>
                  R$<%=formatnumber(cbai("valor"),2)%>
                </td>
                <td align=center width=2>
                  <a href="javascript:document.form1.reload.value='1';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
            </table>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Login:
                </td>
              </tr>
                <td>
                  <input type="text" name="login2" value="<%=login2%>" maxlength=20 label="login" style="width:126; height:17; background=#E8E8E8;">&nbsp;
                </td>
	      <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Senha:
                </td>
                <td>
                  &nbsp;&nbsp;<img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Confirmar Senha:
                </td>
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