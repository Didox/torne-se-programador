<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
codigo=request("codigo")
if request("flag") <> 1 then
   set clientes=conn.execute("select * from clientes where codigo="&codigo)
   tipo=clientes("tipo")
   nome=clientes("nome")
   cpf=clientes("cpf")
   creci=clientes("creci")
   identidade=clientes("identidade")
   endereco=clientes("endereco")
   numero=clientes("numero")
   complemento=clientes("complemento")
   bairro=clientes("bairro")
   cidade=clientes("cidade")
   estado=clientes("estado")
   cep=clientes("cep")
   ddd=clientes("ddd_fone")
   fone=clientes("fone")
   ddd_cel=clientes("ddd_cel")
   celular=clientes("celular")
   banco=clientes("cod_banco")
   agencia=clientes("agencia")
   conta=clientes("conta")
   profissao=clientes("profissao")
   email=clientes("email")
   login2=clientes("login")
   senha2=clientes("senha")
   senha3=clientes("senha")
   cartorio=clientes("cartorio")   
   escolaridade=clientes("cod_escolaridade")
   estado_civil=clientes("estado_civil")
   sexo=clientes("sexo")
   if not isnull(clientes("data_nascimento")) then
      data_nascimento=data_completa(clientes("data_nascimento"))
   end if
   empresa=clientes("empresa")
   if not isnull(clientes("data_admissao")) then
      data_admissao=data_completa(clientes("data_admissao"))
   end if
   cargo=clientes("cargo")
   renda=trim(formatnumber(csng(clientes("renda")),2))
   renda_extra=trim(formatnumber(csng(clientes("renda_extra")),2))
   orgao_emissor=clientes("orgao_emissor")
   if not isnull(clientes("data_emissao")) then
      data_emissao=data_completa(clientes("data_emissao"))
   end if
   tipo_imovel=clientes("tipo_imovel")
   if isnull(escolaridade) then
      escolaridade = 0
   end if
   if isnull(estado_civil) then
      estado_civil = 0
   end if
else
   tipo1     =replace(trim(ucase(request("tipo1"))),"'","")
   nome      =replace(trim(ucase(request("nome"))),"'","")
   cpf       =replace(trim(ucase(request("cpf"))),"'","")
   creci       =replace(trim(ucase(request("creci"))),"'","")
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
   ddd_cel   =replace(trim(ucase(request("ddd_cel"))),"'","")
   celular   =replace(trim(ucase(request("celular"))),"'","")
   senha2     =replace(trim(ucase(request("senha2"))),"'","")
   senha3     =replace(trim(ucase(request("senha3"))),"'","")
   login2     =replace(trim(ucase(request("login2"))),"'","")
   orgao_emissor=replace(trim(ucase(request("orgao_emissor"))),"'","")   
   data_emissao =request("data_emissao")
   email=replace(trim(ucase(request("email"))),"'","")
   if nome="" then
      msg=msg& " Nome.<br>"
   end if
   if cpf<>"" then
      cpf=replace(cpf,".","")
      cpf=replace(cpf,"-","")
      if tipo1="1" then
         if not CalculaCPF(cpf) then
            msg=msg&" CPF Inválido<br>"
         else
            set verifica_cpf=conn.execute("select * from clientes where cpf='"&cpf&"' and codigo<>"&codigo)
            if not verifica_cpf.eof then
               msg=msg&" CPF já existe<br>"
            end if  
         end if
      else   
         if not CalculaCNPJ(cpf) then
            msg=msg&" CNPJ Inválido<br>"
         else
            set verifica_cpf=conn.execute("select * from clientes where cpf='"&cpf&"' and codigo<>"&codigo)
            if not verifica_cpf.eof then
               msg=msg&" CNPJ já existe<br>"
            end if 
         end if
      end if
   else
      msg=msg&" CPF / CNPJ.<br>"
   end if
   if senha2="" then
     msg=msg&" Senha.<br>"
   end if
   if email = "" then
     msg=msg&" E-mail.<br>"
   end if
   if login2 <> email then
     msg=msg&" Confirme seu e-mail.<br>"
   end if
   if tipo1="1" then
      if identidade="" then
         msg=msg&" Identidade.<br>"
      end if
      if orgao_emissor="" then
         msg=msg&" Orgão Emissor.<br>"
      end if
      if data_emissao="" then
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
   if ddd="" then
      msg=msg&" DDD Fone.<br>"
   end if
   if fone="" then
      msg=msg&" Fone.<br>"
   end if
   if email <> "" then
      if not IsValidEmail(email) then
         msg=msg&" Email inválido.<br>"             
      end if
   end if
   if email<>"" then
      set verifica_login=conn.execute("select * from clientes where email='"&email&"' and codigo<>"&codigo)
      if not verifica_login.eof then
         msg=msg&" E-mail já existe<br>"
      else   
         if len(senha2) < 6 then
            msg=msg&" Senha deve conter 6 caractereres no mínimo.<br>"
         end if
      end if
   else
      msg=msg&" E-mail.<br>"
   end if
   if senha2 <> senha3 then
      msg=msg&" Confirmar senha.<br>"
   end if
   if msg="" then
      if ddd_cel="" then
         ddd_cel=0
      end if   
      conn.execute("update clientes set tipo="&tipo&",nome='"&nome&"',endereco='"&endereco&"',numero='"&numero&"',complemento='"&complemento&"',bairro='"&bairro&"',cidade='"&cidade&"',estado='"&estado&"',cep='"&cep&"',ddd_fone='"&ddd&"',fone='"&fone&"',ddd_cel='"&ddd_cel&"',celular='"&celular&"',cpf='"&cpf&"',identidade='"&identidade&"',email='"&email&"',login='"&login2&"',senha='"&senha2&"',data_inclusao=convert(datetime,'"&date()&"',103), data_emissao=convert(datetime,'"&data_emissao&"',103), orgao_emissor='"&orgao_emissor&"', creci = '"&creci&"' where codigo = "&codigo)%>
      <script>
         alert('Alteração efetuada com sucesso!');
         location.href="Imoveis.asp";
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
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
        <!--#INCLUDE FILE ="Main_Topo.asp"-->      
          <table><tr><td></td></tr></table>
          <table width=100% class="tabela001">
          <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&codigo=<%=codigo%>" name="form1">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 cellpadding="0" cellspacing="0" class="tabela002">
            <tr> 
              <td width=20><img src="../img/r_8.gif"></td>
              <td class="tb"><B>ALTERAR DADOS</B></td>
            </tr>
          </table>  
          
        <table border="0" width=376 align=LEFT>
        </tr> 
        <tr>
          <td>
            <%if tipo1="" or tipo1="1" then%>
               <input type="radio" name="tipo1" value="1" checked><span class="estilo">Pessoa Física
               <input type="radio" name="tipo1" value="2"><span class="estilo">Pessoa Jurídica
            <%else%>
               <input type="radio" name="tipo1" value="1"><span class="estilo">Pessoa Física
               <input type="radio" name="tipo1" value="2" checked><span class="estilo">Pessoa Jurídica
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
                  &nbsp;<input type="text" name="orgao_emissor" value="<%=orgao_emissor%>" maxlength=11 label="orgao" style="width:85; height:17; background=#E8E8E8;">
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
                  <input type="text" name="cpf" value="<%=cpf%>"  maxlength=18 label="cpf" style="width:145; height:17; background=#E8E8E8;" onkeypress="Numero()" readonly>
                </td>
              </tr>	 
              <tr>
                <td colspan=5>
                  &nbsp;<span class="estilo">CRECI:
                </td>
                
              </tr>
              <tr>
                <td colspan=5>
                  <input type="text" name="creci" value="<%=creci%>"  maxlength=30 label="cpf" style="width:145; height:17; background=#E8E8E8;">
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
                  <span class="estilo">CEP:
                </td>
              </tr>
              <tr>
                <td>
                  <select name="estado"  style="width:140;background=#E8E8E8;">
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
                  <input type="text" name="ddd_cel" value="<%=ddd_cel%>"  maxlength=2 label="ddd_cel" style="width:26; height:17; background=#E8E8E8;">&nbsp;<input type="text" name="celular" value="<%=celular%>" maxlength=30 label="celular" style="width:86; height:17; background=#E8E8E8;">
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">E-mail:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="email" value="<%=email%>"  label="email" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
        <td colspan=3>
          <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Confirme seu e-mail:
                </td>
              </tr>
                <td>
                  <input type="text" name="login2" value="<%=login2%>" label="login" style="width:290; height:17; background=#E8E8E8;">&nbsp;
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
             <br><input type="image" value="submit" src="../../imagens/botoes/GRAVAR.gif" width="86" height="26" border=0>
          </td>
        </tr>
    </table>
    </td></tr>
    <table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
    </td>
  </tr>
</table>
</form>
</body>
</html>

