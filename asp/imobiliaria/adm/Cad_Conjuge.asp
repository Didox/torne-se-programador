<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%cliente=request("cliente")
pagina=request("pagina")
if request("flag") <> 1 then
   set nome_cliente=conn.execute("select * from clientes where codigo="&cliente)
   cliente=nome_cliente("codigo")
   logradouro=replace(trim(ucase(nome_cliente("endereco"))),"'","")
   numero=replace(trim(ucase(nome_cliente("numero"))),"'","")
   compl=replace(trim(ucase(nome_cliente("complemento"))),"'","")
   bairro=replace(trim(ucase(nome_cliente("bairro"))),"'","")
   cidade=replace(trim(ucase(nome_cliente("cidade"))),"'","")
   estado=replace(trim(ucase(nome_cliente("estado"))),"'","")
   cep=trim(ucase(nome_cliente("cep")))
   ddd=trim(ucase(nome_cliente("ddd_fone")))
   fone=trim(ucase(nome_cliente("fone")))
else
   logradouro=replace(trim(ucase(request("logradouro"))),"'","")
   numero    =replace(trim(ucase(request("numero"))),"'","")
   compl     =replace(trim(ucase(request("compl"))),"'","")
   bairro    =replace(trim(ucase(request("bairro"))),"'","")
   cidade    =replace(trim(ucase(request("cidade"))),"'","")
   estado    =replace(trim(ucase(request("estado"))),"'","")
   cep       =replace(trim(ucase(request("cep"))),"'","")
   nome      =replace(trim(ucase(request("nome"))),"'","")
   cpf       =replace(trim(ucase(request("cpf"))),"'","")
   identidade=replace(trim(ucase(request("identidade"))),"'","")
   ddd       =replace(trim(ucase(request("ddd"))),"'","")
   fone      =replace(trim(ucase(request("fone"))),"'","")
   dddc      =replace(trim(ucase(request("dddc"))),"'","")
   celular   =replace(trim(ucase(request("celular"))),"'","")
   profissao =replace(trim(ucase(request("profissao"))),"'","")
   renda     =replace(trim(ucase(request("renda"))),"'","")
   email     =replace(trim(ucase(request("email"))),"'","")
   data_nascimento=replace(trim(ucase(request("data_nascimento"))),"'","")
   data_emissao   =replace(trim(ucase(request("data_emissao"))),"'","")
   orgao_emissor  =replace(trim(ucase(request("orgao_emissor"))),"'","")
   if nome="" then
      msg=msg& " Nome.<br>"
   end if
   if cidade="" then
      msg=msg&" Cidade.<br>"
   end if
   if estado="" then
      msg=msg&" Estado.<br>"
   end if
   if identidade="" then
      msg=msg&" Identidade.<br>"
   end if
   if orgao_emissor = "" then
      msg=msg&" Orgão Emissor.<br>"
   end if
   if cpf<>"" then
      cpf=replace(cpf,".","")
      cpf=replace(cpf,"-","")
      if not CalculaCPF(cpf) then
         msg=msg&" CPF Inválido<br>"
      else
         set verifica_cpf=conn.execute("select * from conjuge where cpf='"&cpf&"'")
         if not verifica_cpf.eof then
            msg=msg&" CPF já existe<br>"
         end if  
      end if
   else
      msg=msg&" CPF Inválido.<br>"
   end if
   if not data_valida(data_nascimento,1) then
      msg=msg&" Data de Nascimento.<br>"
   end if
   if not data_valida(data_emissao,1) then   
      msg=msg&" Data de Emissão.<br>"
   end if
   if email <> "" then
      if not isvalidEmail(email) then   
         msg=msg&" E-mail inválido.<br>"
      end if
   end if
   if renda="" then
      renda=0
   end if
   if profissao="" then
    msg=msg&" Profissão.<br>"
   end if

   if dddc="" then
      dddc=0
   end if
   if msg="" then
      cpf=replace(cpf,".","")
      cpf=replace(cpf,"-","")
      conn.execute("insert into conjuge(cod_cliente,nome,endereco,numero,complemento,bairro,cidade,estado,cep,ddd_fone,fone,ddd_cel,celular,cpf,identidade,email,renda,profissao,data_inclusao,data_nascimento,data_emissao,orgao_emissor) values ("&cliente&",'"&nome&"','"&logradouro&"','"&numero&"','"&compl&"','"&bairro&"','"&cidade&"','"&estado&"','"&cep&"',"&ddd&",'"&fone&"',"&dddc&",'"&celular&"','"&cpf&"','"&identidade&"','"&email&"',"&replace(replace(csng(renda),".",""),",",".")&",'"&profissao&"',convert(datetime,'"&date()&"',103),convert(datetime,'"&data_nascimento&"',103),convert(datetime,'"&data_emissao&"',103),'"&orgao_emissor&"')")%>
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
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&cliente=<%=cliente%>" name="form1">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar um conjugê siga os passos descrito abaixo.<br><br></b>
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
            <img src="../img/r_8.gif">&nbsp;CADASTRAR CONJUGÊ
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="estilo">
            <%set nome_cliente=conn.execute("select * from clientes where codigo="&cliente)%>
            <b>CLIENTE:</b>&nbsp;<%=nome_cliente("nome")%>
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
          <table cellspacing=0 cellpadding=0>
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
                  <input type="text" name="identidade" value="<%=identidade%>" maxlength=15 label="identidade" style="width:85; height:17; background=#E8E8E8;">
                </td>
                <td>
                  &nbsp;<input type="text" name="orgao_emissor" value="<%=orgao_emissor%>" maxlength=10 label="orgao" style="width:85; height:17; background=#E8E8E8;">
                </td>
                <td>
                  <input type="text" name="data_emissao" value="<%=data_emissao%>" maxlength=10 label="data_emissao" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this);">
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
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">CPF / CNPJ:
                </td>
                <td>
                 &nbsp; <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data Nascimento:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="cpf" value="<%=cpf%>"  maxlength=11 label="cpf" style="width:145; height:17; background=#E8E8E8;" onkeypress="Numero()">
                </td>
                <td>
                 &nbsp; <input type="text" name="data_nascimento" value="<%=data_nascimento%>" maxlength=10 label="Data Nascimento" style="width:126; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this)">
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <span class="estilo">Logradouro:
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
                  <span class="estilo">Número:
                </td>
                <td>
                  <span class="estilo">Complemento:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="numero" value="<%=numero%>" maxlength=10 label="número" style="width:90; height:17; background=#E8E8E8;" onkeypress="Numero()">
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
                  <span class="estilo">Bairro:
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
                  <span class="estilo">DDD/Fone:
                </td>
                <td>
                  <span class="estilo">DDD/Celular:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="ddd" value="<%=ddd%>"  maxlength=2 label="ddd" style="width:26; height:17; background=#E8E8E8;">&nbsp;<input type="text" name="fone" value="<%=fone%>" maxlength=20 label="fone" style="width:86; height:17; background=#E8E8E8;">
                </td>
                <td>
                  <input type="text" name="dddc" value="<%=dddc%>"  maxlength=2 label="ddd" style="width:26; height:17; background=#E8E8E8;">&nbsp;<input type="text" name="celular" value="<%=celular%>" maxlength=20 label="celular" style="width:86; height:17; background=#E8E8E8;">
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
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Profissão:
                </td>
                <td>
                  <span class="estilo">Renda:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="profissao" value="<%=profissao%>"  maxlength=45 label="Profissão" style="width:190; height:17; background=#E8E8E8;">
                </td>
                <td>
                  <input type="text" name="renda" value="<%=renda%>" label="Renda" style="width:100; height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);">
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