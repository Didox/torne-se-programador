<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
if request("flag") = 1 then
   If request("tpo1") <> "" then
     tipo1     =replace(trim(ucase(request("tpo1"))),"'","")
   Else
     tipo1     =replace(trim(ucase(request("tipo1"))),"'","")
   End If
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
   sexo = request("sexo")
   data_nascimento = request("data_nascimento")
   orgao_emissor=replace(trim(ucase(request("orgao_emissor"))),"'","")   
   data_emissao =request("data_emissao")
   responsavel     =replace(trim(ucase(request("responsavel"))),"'","")
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
            set verifica_cpf=conn.execute("select * from clientes where cpf='"&cpf&"'")
            if not verifica_cpf.eof then
               msg=msg&" CPF já existe<br>"
            end if  
         end if
      else   
         if not CalculaCNPJ(cpf) then
            msg=msg&" CNPJ Inválido<br>"
         else
            set verifica_cpf=conn.execute("select * from clientes where cpf='"&cpf&"'")
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
   if login2 <> email then
     msg=msg&" Confirme seu e-mail.<br>"
   end if
   if email = "" then
     msg=msg&" E-mail.<br>"
   end if
   'if tipo1="1" then
      'if identidade="" then
      '   msg=msg&" Identidade.<br>"
      'end if
      'if orgao_emissor="" then
      '   msg=msg&" Orgão Emissor.<br>"
      'end if
      'if data_emissao="" then
         'msg=msg&" Data de Emissão.<br>"
      'end if
   'end if
   'if endereco="" then
      'msg=msg& " Logradouro.<br>"
   'end if
   'if numero="" then
      'msg=msg& " Número.<br>"
   'end if
   'if bairro="" then
      'msg=msg&" Bairro.<br>"
   'end if
   'if cidade="" then
   '   msg=msg&" Cidade.<br>"
   'end if
   'if estado="" then
   '   msg=msg&" Estado.<br>"
   'end if
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
      set verifica_login=conn.execute("select * from clientes where email='"&email&"'")
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
      sqlins = "insert into clientes(tipo,nome,endereco,numero,complemento,bairro,cidade,estado,cep,ddd_fone,fone,ddd_cel,celular,cpf,"
      If identidade <> "" and orgao_emissor <> "" and data_emissao <> "" then
        sqlins = sqlins & " identidade,orgao_emissor,data_emissao,"
      End If
      sqlins = sqlins & " data_nascimento, email,data_inclusao,status,senha,login,responsavel,creci,sexo)" 
      sqlins = sqlins & " values ("&tipo1&",'"&nome&"','"&endereco&"','"&numero&"','"&complemento&"','"&bairro&"','"&cidade&"','"&estado&"','"&cep&"',"
      sqlins = sqlins & "'"&ddd&"','"&fone&"','"&ddd_cel&"','"&celular&"','"&cpf&"',"
      If identidade <> "" and orgao_emissor <> "" and data_emissao <> "" then
        sqlins = sqlins & "'"&identidade&"','"&orgao_emissor&"',convert(datetime,'"&data_emissao&"',103),"
      End If
      sqlins = sqlins & "convert(datetime,'"&data_nascimento&"',103),'"&email&"',convert(datetime,'"&date()&"',103),2,'"&senha2&"','"&login2&"','"&responsavel&"','"&creci&"',"&sexo&")"
      'response.write sqlins
      conn.execute(sqlins)
      set cod_cliente = conn.execute("select * from clientes where status=2 order by codigo desc")
      %>      
      <script>
         alert('Cadastro efetuado com sucesso!');
         location.href="Main_imoveis_net.asp?login=<%=login2%>&senha=<%=senha2%>&tipo_login=2&flag=login&cliente=<%=cod_cliente("codigo")%><%if request("str") = "cad" then%>&str=cad<%end if%>";
      </script>
   <%end if
end if
If request("tpo1") <> "" then
  tipo1 = request("tpo1")
End If
%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<script language="JavaScript">
function verpessoa(tp){
  window.location = "Main_Cliente_Net.asp?tpo1="+tp<%if request("str")="cad" then%>+"&str=cad"<%end if%>;
}
</script>
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#F4F2EA" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td valign="top">
        <!--#INCLUDE FILE ="Main_Topo.asp"-->      
      
          <table width=99% class="tabela001" align="center">
          <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&currentPage=<%=currentPage%><%if request("str") = "cad" then%>&str=cad<%end if%>" name="form1">
            <tr><td></td></tr>
          </table>
          <table width=99% border=0 align="center" cellpadding="0" cellspacing="0" class="tabela002">
            <tr> 
              <td width=20><img src="../img/r_8.gif"></td>
              <td class="tb"><B>CADASTRAR CLIENTE</B></td>
            </tr>
          </table>  
          <%If request("str") = "cad" then%>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr> 
              <td height="20" class="tb">
            </tr>
          </table> 
          <%End If%>
        
        <table border="0" width=376 align=LEFT>
        </tr> 
        <tr>
          <td>
            <%if tipo1="" or tipo1="1" then%>
               <input type="radio" name="tipo1" value="1" checked onClick="verpessoa(this.value);"><span class="estilo">Pessoa Física
               <input type="radio" name="tipo1" value="2" onClick="verpessoa(this.value);"><span class="estilo">Pessoa Jurídica
            <%else%>
               <input type="radio" name="tipo1" value="1" onClick="verpessoa(this.value);"><span class="estilo">Pessoa Física
               <input type="radio" name="tipo1" value="2" checked onClick="verpessoa(this.value);"><span class="estilo">Pessoa Jurídica
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
            <input type="text" name="nome" value="<%=nome%>" maxlength=45 label="Nome" style="width:290; height:17; ">
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0 border=0>
              <tr>
                <td>
                  &nbsp;&nbsp;<span class="estilo">Identidade:
                </td>
                <td>
                  &nbsp;&nbsp;<span class="estilo">Orgão Expeditor:
                </td>
                <td>
                  &nbsp;&nbsp;<span class="estilo">Data de Emissão:
                </td>
              <td>
                  &nbsp;&nbsp;<span class="estilo">Data de Nascimento:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="identidade" value="<%=Identidade%>" maxlength=11 label="identidade" style="width:85; height:17; " onKeyPress="Numero()">
                </td>
                <td>
                  &nbsp;<input type="text" name="orgao_emissor" value="<%=orgao_emissor%>" maxlength=11 label="orgao" style="width:85; height:17; ">
                </td>
                <td>
                  &nbsp;<input type="text" name="data_emissao" value="<%=data_emissao%>" maxlength=10 label="data_emissao" style="width:100; height:17; " onKeyPress="Numero();DATA(this);">
                </td>
				<td>
                  &nbsp;<input type="text" name="data_nascimento" value="<%=data_nascimento%>" maxlength=10 label="data_nascimento" style="width:100; height:17; " onKeyPress="Numero();DATA(this);">
                </td>
              </tr>
              <tr>
                <td colspan=5>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">CPF / CNPJ:
                </td>
                
              </tr>
              <tr>
                <td colspan=5>
                  <input type="text" name="cpf" value="<%=cpf%>"  maxlength=18 label="cpf" style="width:145; height:17; " onKeyPress="Numero()">
                </td>
              </tr>	 
              <tr>
                <td colspan=5>
                  &nbsp;<span class="estilo">CRECI:
                </td>
                
              </tr>
              <tr>
                <td colspan=5>
                  <input type="text" name="creci" value="<%=creci%>"  maxlength=30 label="cpf" style="width:145; height:17; ">
                </td>
              </tr>	           
            </table>
			<table cellspacing=0 cellpadding=0 border=0>
			<tr>
			<td>
			<img src="../img/obrigacao.gif">&nbsp;<span class="estilo">SEXO:
			</td>
			</tr>
			<tr>
			 <td>
                <%if sexo="" then%>
                  <input type="radio" name="sexo" value=0><span class="estilo">Masculino</span>
                  <input type="radio" name="sexo" value=1><span class="estilo">Feminino</span>
                <%else%>
                  <%if sexo=0 then%>
                    <input type="radio" name="sexo" value=0 checked><span class="estilo">Masculino</span>
                    <input type="radio" name="sexo" value=1><span class="estilo">Feminino</span>
                  <%else%>
                    <input type="radio" name="sexo" value=0><span class="estilo">Masculino</span>
                    <input type="radio" name="sexo" value=1 checked><span class="estilo">Feminino</span>
                  <%end if
                end if%>
                </td>
			</tr>
			</table>
          </td>
        </tr>
        <!--tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Logradouro:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="endereco" value="<%=endereco%>" maxlength=150 label="endereco" style="width:290; height:17; ">
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
                  <input type="text" name="numero" value="<%=numero%>" maxlength=15 label="número" style="width:90; height:17; ">
                </td>
                <td>
                  <input type="text" name="complemento" value="<%=complemento%>" maxlength=20 label="complemento" style="width:200; height:17; ">
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
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Estado:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="bairro" value="<%=bairro%>" maxlength=30 label="Bairro" style="width:145; height:17; ">
                </td>
                <td>
                  <select name="estado"  style="width:140;">
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
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Cidade:
                </td>
                <td>
                  <span class="estilo">CEP:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="cidade" value="<%=cidade%>" maxlength=30 label="Cidade" style="width:145; height:17; ">
                 </td>
                <td>
                  <input type="text" name="cep" value="<%=cep%>" maxlength=10 onkeypress="Numero();CEP(this);" maxlength=14 label="cpf" style="width:80; height:17; ">&nbsp;&nbsp;<a HREF="javascript:chamar_cep()"><span span class="estilo"> <img src="../img/correios.gif" alt="Consultar correios" border=0></a>
                </td>
              </tr>
             </table>
           </td>
          </tr-->
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
                  <input type="text" name="ddd" value="<%=ddd%>"  maxlength=2 label="ddd" style="width:26; height:17; ">&nbsp;<input type="text" name="fone" value="<%=fone%>" maxlength=30 label="fone" style="width:86; height:17; ">
                </td>
                <td>
                  <input type="text" name="ddd_cel" value="<%=ddd_cel%>"  maxlength=2 label="ddd_cel" style="width:26; height:17; ">&nbsp;<input type="text" name="celular" value="<%=celular%>" maxlength=30 label="celular" style="width:86; height:17; ">
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <%If tipo1 = 2 then%>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Responsável:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="responsavel" value="<%=responsavel%>" maxlength=45 label="Responsavel" style="width:290; height:17; ">
          </td>
        </tr>
        <%End If%>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Email:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="email" value="<%=email%>"  maxlength=50 label="email" style="width:290; height:17; ">
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
                  <input type="text" name="login2" value="<%=login2%>" maxlength=50 label="login" style="width:290; height:17; ">&nbsp;
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
                  <input type="password" name="senha2" value="<%=senha2%>" maxlength=20 label="senha" style="width:126; height:17; ">&nbsp;
                </td>
                <td>
                  &nbsp;&nbsp;<input type="password" name="senha3" value="<%=senha3%>" maxlength=20 label="senha" style="width:126; height:17; ">
                </td>
            </tr>
              </tr>
          </table>
        </td>
      </tr>
        <tr>
          <td align=center>
             <br>
             <input name="image" type="image" value="submit" src="../../imagens/botoes/GRAVAR1.gif" width="86" height="26" border=0>
          </td>
        </tr>
    </table>
    </td></tr>
    </td>
  </tr>
</table>
</form>
</body>
</html>

