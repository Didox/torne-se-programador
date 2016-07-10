<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina  =request("pagina")
reload=request("reload") 
if request("flag") = 1 then
   hora        =replace(trim(ucase(request("hora"))),"'","")
   corretor    =replace(trim(ucase(request("corretor"))),"'","")
   cod_imovel  =trim(ucase(request("cod_imovel")))
   data_visita =replace(trim(ucase(request("data_visita"))),"'","")
   nome        =replace(trim(ucase(request("nome"))),"'","")
   endereco    =replace(trim(ucase(request("endereco"))),"'","")
   numero      =replace(trim(ucase(request("numero"))),"'","")
   complemento =replace(trim(ucase(request("complemento"))),"'","")
   bairro      =replace(trim(ucase(request("bairro"))),"'","")
   cidade      =replace(trim(ucase(request("cidade"))),"'","")
   estado      =replace(trim(ucase(request("estado"))),"'","")
   cep         =replace(trim(ucase(request("cep"))),"'","")
   endereco    =replace(trim(ucase(request("endereco"))),"'","")
   ddd         =replace(trim(ucase(request("ddd"))),"'","")
   fone        =replace(trim(ucase(request("fone"))),"'","")
   email       =replace(trim(ucase(request("email"))),"'","")
   servicos    =replace(trim(ucase(request("servicos"))),"'","")
   visita      =trim(ucase(request("visita")))   
   if corretor = "" then
     msg = msg&" Corretor.<br>"
   end if
   if nome = "" then
     msg = msg&" Nome.<br>"
   end if
   if endereco = "" then
     msg = msg&" Logradouro.<br>"
   end if
   if numero = "" then
     msg = msg&" Numero.<br>"
   end if
   if bairro = "" then
     msg = msg&" Bairro.<br>"
   end if
   if cidade = "" then
     msg = msg&" Cidade.<br>"
   end if
   if estado = "" then
     msg = msg&" Estado.<br>"
   end if
   if ddd = "" then
     msg = msg&" DDD.<br>"
   end if
   if fone = "" then
     msg = msg&" Fone.<br>"
   end if
   if email <> "" then
      if not IsValidEmail(email) then
         msg=msg&" Email inválido.<br>"             
      end if
   end if
   if cod_imovel="" then
     msg = msg&" Imóvel.<br>"
   end if
   if servicos="" then
     msg = msg&" Serviço.<br>"
   end if
   
   if not data_valida(data_visita,0) and not data_valida(data_visita,0)<date() then
     msg=msg&" Data incorreta.<br>"
   end if
   if hora = "" then
      msg=msg&" Hora."
   end if
   if msg="" then
     set procura = conn.execute("select codigo from visita where hora_visita='"&hora&"' and data_visita=convert(datetime,'"&data_visita&"',103) and cod_corretor='"&corretor&"' and nome='"&nome&"'")
     if not procura.eof then
      msg=msg&" Já existe visita agendada para este horário."
     end if
   end if 
   if msg="" and reload="" then
      conn.execute("insert into Visita (hora_visita , cod_corretor , cod_imovel , data_visita , nome , email , ddd , fone, cod_servico, visita, endereco, numero, complemento, bairro, cidade, estado,cep,Cod_classificacao_interessado) values ('"&hora&"',"&corretor&","&cod_imovel&",convert(datetime,'"&data_visita&"',103) , '"&nome&"' , '"&email&"' , "&ddd&" , '"&fone&"',"&servicos&",0,'"&endereco&"', '"&numero&"', '"&complemento&"', '"&bairro&"', '"&cidade&"', '"&estado&"','"&cep&"',0)")%>
      <script>
         alert('Cadastro efetuado com sucesso!');
         location.href="<%=pagina%>.asp?corretor=<%=corretor%>&cod_imovel=<%=cod_imovel%>";
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.visita.focus()">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar um novo interresado siga os passos descrito abaixo.<br><br></b>
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
            &nbsp;&nbsp;<a href="<%=pagina%>.asp?corretor=<%=corretor%>&cod_imovel=<%=cod_imovel%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_14.gif">&nbsp;CADASTRAR NOVA VISITA<br><br>
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td>
            <input type=checkbox name="visita" <%if visita="1" then%> checked <%end if%>value=1><span class="estilo">Visita efetuada:
          </td>
        </tr>
        <tr>
         <td>
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Corretor:
         </td>
       </tr>    
       <tr>
         <td>
	   <select name="corretor" style="background=#E8E8E8;">
             <option value= ""></option>
	     <%set corretores=conn.execute("select * from corretor ORDER BY nome")%>
	     <%if corretor_cb="" or corretor_cb="0" then%>
		<%corretor_cb=corretores("codigo")%>
	     <%end if%>
	     <%do while not corretores.eof %>
		<%if cstr(corretores("codigo"))= corretor then%>
		   <option value="<%=corretores("codigo")%>" selected><%=corretores("nome")%>
		<%else%>
		   <option value="<%=corretores("codigo")%>"><%=corretores("nome")%>
                <%end if%>
                <%corretores.movenext%>
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
            <input type="text" name="nome" value="<%=nome%>" maxlength=45 label="nome" style="width:290; height:17; background=#E8E8E8;">
         </td>
       </tr>
       <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Logradouro:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="endereco" value="<%=endereco%>" maxlength=150 label="logradouro" style="width:290; height:17; background=#E8E8E8;">
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
                  <input type="text" name="numero" value="<%=numero%>" maxlength=10 label="número" style="width:90; height:17; background=#E8E8E8;">
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
                  <input type="text" name="cep" value="<%=cep%>" maxlength=10 onkeypress="Numero();CEP(this);" maxlength=14 label="" style="width:80; height:17; background=#E8E8E8;">&nbsp;&nbsp;<a HREF="javascript:chamar_cep()"><span span class="estilo"> <img src="../img/correios.gif" alt="Consultar correios" border=0></a>
                </td>
              </tr>
            </table>  
          </td>
        </tr>  
       <tr>
       <td>
         <table cellpadding="0" cellspacing="0" border="0" >
         <tr>
          <td>
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">DDD:
          </td>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Fone:
          </td>
         </tr>
         <tr>
          <td>
           <input type="text" name="ddd" value="<%=ddd%>" maxlength=2 label="ddd" style="width:30; height:17; background=#E8E8E8;" onkeypress="Numero();">
          </td>
         <td>
           <input type="text" name="fone" value="<%=fone%>" maxlength=20 label="fone" style="width:100; height:17; background=#E8E8E8;" >
         </td>
        </tr>
      </table>
      </td>
     </tr>
     <tr>
       <td>
         <span class="estilo">E-mail:
       </td>
     </tr>
     <tr>
       <td>
          <input type="text" name="email" value="<%=email%>" maxlength=50 label="email" style="width:290; height:17; background=#E8E8E8;">
       </td>
     </tr>
    <tr>
         <td>
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Imóvel:
         </td>
       </tr>    
       <tr>
        <td>
          <input type=hidden name="reload">
	  <select name="cod_imovel" style="background=#E8E8E8;" onchange="document.form1.reload.value='1';document.form1.submit()">
	   <%set imoveis=conn.execute("select * from imoveis ORDER BY descricao")%>
	   <%if cod_imovel="" or cod_imovel="0" then%>
	      <%cod_imovel=imoveis("codigo")%>
	   <%end if%>
	   <%do while not imoveis.eof %>
	      <%if cstr(imoveis("codigo"))= cod_imovel then%>
	        <option value="<%=imoveis("codigo")%>" selected><%=imoveis("descricao")%>
	      <%else%>
	        <option value="<%=imoveis("codigo")%>"><%=imoveis("descricao")%>
	      <%end if%>
	      <%imoveis.movenext%>
	   <%loop%>
	 </select>
       </td>
      </tr>
       <tr>
         <td>
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Serviço:
         </td>
       </tr>    
       <tr>
        <td>
        <select name="servicos" style="background=#E8E8E8;">
          <option value=""></option>
            <%set servico=conn.execute("select cod_servico from perfil_servico where cod_imovel="&cod_imovel)%>
            <%do while not servico.eof%>
              <%set cbai=conn.execute("select * from servico where codigo = "&servico("cod_servico")&"ORDER BY descricao")%>
              <%do while not cbai.eof %>
              <%if cstr(cbai("codigo"))= servicos then%>
                <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
              <%else%>
                <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
              <%end if%>
              <%cbai.movenext%>
              <%loop%>
              <%servico.movenext%>
            <%loop%>
        </select>
       </td>
      </tr>
      <tr>
       <td>
         <table cellpadding="0" cellspacing="0" border="0" >
         <tr>
          <td>
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data da visita:
          </td>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Hora:
          </td>
         </tr>
         <tr>
          <td>
           <input type="text" name="data_visita" value="<%=data_visita%>" maxlength=10 label="data visita" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this);">
          </td>
         <td>
           <input type="text" name="hora" value="<%=hora%>" maxlength=5 label="hora" style="width:50; height:17; background=#E8E8E8;" onkeypress="HORA(this);">
         </td>
        </tr>
      </table>
      </td>
     </tr>
     <tr>
      <td colspan=2>
       <table cellpadding="0" align=center cellspacing="0" border="0" >
         <tr>
            <td align=center>
              <input type="image" src="../img/ok.gif" value="submit" border=0>
            </td>
            <td></td>
         </tr>
       </table>
      </td>
    </tr>   
    </table>
   </td>
 </tr>
</table><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>

