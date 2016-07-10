<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
codigo=Session.SessionID
pagina  =request("pagina")
cliente =request("cliente")
servico =request("servico")
despesa =request("despesa")
reload  =request("reload")
excluir =request("excluir")
comodo  =request("comodo")
empreendimento=request("empreendimento")
midia  =request("midia")
quantidade_empreendimento =request("quantidade_empreendimento")
quantidade_plano =replace(request("quantidade_plano"),",","")
servico    =request("servico")
valor      =request("valor")
valor_plano=request("valor_plano")
tipo_plano =request("tipo_plano")
idade      =request("idade")
categoria  =request("categoria")
dormitorio = request("dormitorio")
suites     = request("suites") 
garagem    = request("garagem")
estagios_obra=trim(ucase(request("estagios_obra")))
moeda =replace(request("moeda"),",","")
quantidade_comodo=request("quantidade_comodo")
divida     =request("divida")

if divida = "" then
   divida = 0
end if

if reload="1" and excluir="" and isnumeric(quantidade_comodo) then
   conn.execute("delete perfil_imovel where cod_comodo="&comodo&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_imovel (cod_imovel, cod_comodo, quantidade) values ("&codigo&", "&comodo&", "&quantidade_comodo&")")
end if
if reload="2" and excluir="" and isnumeric(valor) and moeda <> "" then
   conn.execute("delete perfil_servico where cod_servico="&servico&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_servico (cod_imovel, cod_servico, valor, cod_moeda) values ("&codigo&", "&servico&", "&replace(replace(csng(valor),".",""),",",".")&","&moeda&")")
end if
if reload="4" and excluir="" and isnumeric(quantidade_plano) and isnumeric(valor_plano) then
   conn.execute("delete perfil_plano where cod_tipo_conta="&tipo_plano&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_plano (cod_imovel, cod_tipo_conta, valor, quantidade,cod_moeda) values ("&codigo&", "&tipo_plano&", "&replace(replace(csng(valor_plano),".",""),",",".")&","&quantidade_plano&","&moeda&")")
end if
if reload="5" and excluir="" and isnumeric(quantidade) then
   conn.execute("delete perfil_empreendimento where cod_empreendimento="&empreendimento&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_empreendimento (cod_imovel, cod_empreendimento, quantidade) values ("&codigo&", "&empreendimento&", "&quantidade_empreendimento&")")
end if
if excluir<>"" and reload="1" then
   conn.execute("delete perfil_imovel where codigo="&excluir)
end if
if excluir<>"" and reload="2" then
   conn.execute("delete perfil_servico where codigo="&excluir)
end if
if excluir<>"" and reload="4" then
   conn.execute("delete perfil_plano where codigo="&excluir)
end if
if excluir<>"" and reload="5" then
   conn.execute("delete perfil_empreendimento where codigo="&excluir)
end if
if request("flag")="2" then
  conn.execute("delete perfil_imovel where cod_imovel="&codigo)
  conn.execute("delete perfil_servico where cod_imovel="&codigo)
  conn.execute("delete perfil_plano where cod_imovel="&codigo)
  conn.execute("delete perfil_empreendimento where cod_imovel="&codigo)
%><script>
    location.href="<%=pagina%>.asp?cliente=<%=cliente%>";
  </script>
<%  
end if
if request("flag") = "1" then
   descricao    =replace(trim(ucase(request("descricao"))),"'","")
   logradouro   =replace(trim(ucase(request("logradouro"))),"'","")
   if replace(trim(ucase(request("unidade"))),"'","") <> "" then
     unidade      =replace(trim(ucase(request("unidade"))),"'","")
   else
     unidade = 0
   end if
   numero       =replace(trim(ucase(request("Numero"))),"'","")
   complemento  =replace(trim(ucase(request("complemento"))),"'","")
   bairro       =replace(trim(ucase(request("bairro"))),"'","")
   cidade       =replace(trim(ucase(request("cidade"))),"'","")
   estado       =replace(trim(ucase(request("estado"))),"'","")
   servico      =replace(trim(ucase(request("servico"))),"'","")
   despesa      =replace(trim(ucase(request("despesa"))),"'","")
   valor        =replace(trim(ucase(request("valor"))),"'","")
   tipo_imovel  =replace(trim(ucase(request("tipo_imovel"))),"'","")
   subtipo_imovel  =replace(trim(ucase(request("subtipo_imovel"))),"'","")
   estagios_obra=replace(trim(ucase(request("estagios_obra"))),"'","")
   metragem     =replace(trim(ucase(request("metragem"))),"'","")
   classificacao=trim(ucase(request("classificacao")))     
   flg_lancamento  =replace(trim(ucase(request("flg_lancamento"))),"'","")
   
   'response.write subtipo_imovel & ",,,,,,,"
   'response.end
   

   if descricao<>"" then
      set verifica_descricao=conn.execute("select * from Imoveis where descricao='"&descricao&"'")
      if not verifica_descricao.eof then
         msg=msg&" Imovel já existe<br>"
      end if
   'else
   '   msg=msg&" Descrição.<br>"
   end if
   if logradouro="" then
      msg=msg& " Logradouro.<br>"
   end if
   if numero="" then
      msg=msg& " Número.<br>"
   end if
   'if unidade="" then
   '   msg=msg& " Unidade.<br>"
   'end if
   if estado="" then
     msg=msg& " Estado.<br>"
   end if
   if cidade="0" then
     msg=msg& " Cidade.<br>"
   end if
   if Bairro="0" then
     msg=msg& " Bairro.<br>"
   end if
   if tipo_imovel="" then
      msg=msg& " Tipo de Imóvel.<br>"
   end if
   if classificacao="" then
      msg=msg& " Classificação.<br>"
   end if
   if midia="" then
      msg=msg& " Plano de Midia.<br>"
   end if
   if estagios_obra="" or estagios_obra="0" then
      msg=msg& " Estágios Obra.<br>"
   end if
   if metragem="" or metragem="0" then
      msg=msg& " Área Útil(m²).<br>"
   end if
   set tipo_servico = conn.execute("select * from perfil_servico where cod_imovel="&codigo)
   if tipo_servico.eof then
      msg=msg& " Serviço.<br>"
   end if
   set tipo_comodo = conn.execute("select * from perfil_imovel where cod_imovel="&codigo)
   if tipo_Comodo.eof then
      msg=msg& " Comodos.<br>"
   end if
   set tipo_empreendimento = conn.execute("select * from perfil_empreendimento where cod_imovel="&codigo)
   if tipo_empreendimento.eof then
      msg=msg& " Empreendimento.<br>"
   end if
   set tipo_servico = conn.execute("select * from perfil_servico where cod_imovel="&codigo)
   if tipo_servico.eof then
      msg=msg& " Serviço.<br>"
   end if
   if idade="" or idade="0" then
      msg=msg& " Idade do Imóvel.<br>"
   end if
   if categoria="" or categoria="0" then
      msg=msg& " Categoria.<br>"
   end if
   if dormitorio="" or dormitorio="0" then
      msg=msg& " N° Dormitórios.<br>"
   end if 
   set plano = conn.execute("select * from Perfil_plano where cod_imovel="&codigo)
   if plano.eof then
      msg=msg& " Tipo Plano.<br>"
   end if
   if msg="" and reload="" then
      if filename<>"" then
         Set MyFile = ScriptObject.CreateTextFile(server.mappath("../fotos/"&filename))
         For i = 1 to LenB(value)
             MyFile.Write chr(AscB(MidB(value,i,1)))
         Next
         MyFile.Close
      end if
      if cliente <> "" then
        sqlins = "insert into Imoveis (descricao , cod_unidade, endereco, numero, complemento, tipo_imovel, subtipo_imovel, cod_bairro, cod_cidade, cod_estado, cod_estagios_obra,cod_metragem, data_inclusao, cod_classificacao_imovel,cod_cliente, cod_idade_imovel, cod_categoria, dormitorio, suites, garagem, divida, flg_lancamento) values ('"&descricao&"',"&unidade&",'"&logradouro&"','"&numero&"','"&complemento&"','"&tipo_imovel&"','"&subtipo_imovel&"',"&bairro&","&cidade&","&estado&","&estagios_obra&","&metragem&",convert(datetime,'"&date()&"',103),"&classificacao&","&cliente&","&idade&", "&categoria&", '"&dormitorio&"', '"&suites&"', "&garagem&", "&divida&", '"&flg_lancamento&"')"
      else
        sqlins = "insert into Imoveis (descricao , cod_unidade, endereco, numero, complemento, tipo_imovel, subtipo_imovel, cod_bairro, cod_cidade, cod_estado, cod_estagios_obra,cod_metragem, data_inclusao, cod_classificacao_imovel, cod_idade_imovel, cod_categoria, dormitorio, suites, garagem, divida, flg_lancamento) values ('"&descricao&"',"&unidade&",'"&logradouro&"','"&numero&"','"&complemento&"','"&tipo_imovel&"','"&subtipo_imovel&"',"&bairro&","&cidade&","&estado&","&estagios_obra&","&metragem&",convert(datetime,'"&date()&"',103),"&classificacao&","&idade&", "&categoria&", '"&dormitorio&"', '"&suites&"', "&garagem&", "&divida&", '"&flg_lancamento&"')"
      end if
      'response.write sqlins
      'response.end
      conn.execute(sqlins)
      set cod_imovel=conn.execute("select * from imoveis where descricao='"&descricao&"' and endereco='"&logradouro&"' and numero='"&numero&"' and complemento='"&complemento&"' and cod_bairro="&bairro&" and cod_cidade="&cidade&" and cod_estado="&estado&" and cod_unidade="&unidade&" and tipo_imovel='"&tipo_imovel&"' and cod_estagios_obra='"&estagios_obra&"' order by codigo desc")
      conn.execute("update perfil_servico set cod_imovel="&cod_imovel("codigo")&" where cod_imovel="&codigo)
      conn.execute("update perfil_imovel set cod_imovel="&cod_imovel("codigo")&" where cod_imovel="&codigo)
      conn.execute("update perfil_empreendimento set cod_imovel="&cod_imovel("codigo")&" where cod_imovel="&codigo)
      conn.execute("update perfil_plano set cod_imovel="&cod_imovel("codigo")&" where cod_imovel="&codigo)
      conn.execute("update gasto_extra set cod_imovel="&cod_imovel("codigo")&" where cod_imovel="&codigo)
      conn.execute("insert into ativacao_plano(cod_plano, cod_imovel, data_inclusao) values ("&midia&","&cod_imovel("codigo")&", convert(datetime,'"&date()&"',103))")%>
        <script>
           alert('Cadastro efetuado com sucesso!');
           location.href="<%=pagina%>.asp?cliente=<%=cliente%>";
        </script>
   <%end if
end if
if estado="" or isnull(estado) then
   estado="0"
end if
if cidade="" or isnull(cidade) then
   cidade="0"
end if
if bairro="" or isnull(bairro) then
   bairro="0"
end if%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.descricao.focus()">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&cliente=<%=cliente%>" name="form1">
<input type="hidden" name="reload">
<input type="hidden" name="excluir">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar um novo imóvel siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento dos campos obrigatórios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
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
            &nbsp;&nbsp;<a href="Cad_Imoveis.asp?flag=2&pagina=<%=pagina %>&cliente=<%=cliente%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_12.gif">&nbsp;CADASTRAR NOVO IMÓVEL
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        </tr> 
        <tr>
          <td>
            &nbsp;&nbsp;<span class="estilo">Descrição:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="descricao" value="<%=descricao%>" maxlength=50 label="Descrição" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
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
            <input type="text" name="logradouro" value="<%=logradouro%>" maxlength=50 label="logradouro" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Número:&nbsp;&nbsp;
                  <span class="estilo">Complemento:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="numero" value="<%=numero%>"  maxlength=14 label="cpf" style="width:60; height:17; background=#E8E8E8;">
                  <input type="text" name="complemento" value="<%=complemento%>" maxlength=15 label="Identidade" style="width:145; height:17; background=#E8E8E8;">
                </td>
              </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  &nbsp;&nbsp;<span class="estilo">Unidade:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Estado:
                </td>
              </tr>
              <tr>
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
                <td>
                  <select name="estado" style="width:140;background=#E8E8E8;" onchange="document.form1.reload.value='3';document.form1.cidade.value='';document.form1.submit()" >
                    <option value = "0"></option>
                    <%set cbai=conn.execute("select * from estado where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=estado then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                </td>
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
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Bairro:
                </td>
              </tr>
              <tr>
                <td>
                  <select name="cidade" style="width:140;background=#E8E8E8;" onchange="document.form1.reload.value='3';document.form1.bairro.value='';document.form1.submit()">
                    <option value = "0"></option>
                    <%set cbai=conn.execute("select * from cidade where status=0 and cod_estado="&estado&" ORDER BY descricao")%>
                    <%if cidade="" or cidade="0" and not cbai.eof then%>
                       <%cidade=cbai("codigo")%>
                    <%end if%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=cidade then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                </td>
                <td>
                  <select name="bairro" style="width:140;background=#E8E8E8;">
                    <option value = "0"></option>
                    <%set cbai=conn.execute("select * from bairro where status=0 and cod_cidade="&cidade&" ORDER BY descricao")%>
                    <%if bairro="" or bairro="0" and not cbai.eof then%>
                       <%bairro=cbai("codigo")%>
                    <%end if%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=bairro then%>
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
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
         <tr>
           <td>	
             <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Tipo de Imovel:
          </td>
         </tr>
         <tr>
          <td>
             <%set cbai=conn.execute("select * from tipo_imovel where status=0 ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if instr(", "&tipo_imovel&"," , ", "&cbai("codigo")&",") > 0 then%>
                   <input type="checkbox" name="tipo_imovel" value="<%=cbai("codigo")%>" checked><span class="estilo"><%=cbai("descricao")%>
                <%else%>
                   <input type="checkbox" name="tipo_imovel" value="<%=cbai("codigo")%>"><span class="estilo"><%=cbai("descricao")%>
                <%end if%>
             <%cbai.movenext%>
             <%loop%>
          </td>
         </tr>
        </tr>
      </table>
        </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
         <tr>
           <td>	
             <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Subtipo de Imovel:
          </td>
         </tr>
         <tr>
          <td>
            <select name="subtipo_imovel" style="width:140;background=#E8E8E8;">
              <option value = ""></option>
              <option value = "Apartamento" <%if subtipo_imovel = "Apartamento" then%>selected<%end if%>>Apartamento</option>
              <option value = "Casa <%if subtipo_imovel = "Casa" then%>selected<%end if%>">Casa</option>
              <option value = "Flat" <%if subtipo_imovel = "Flat" then%>selected<%end if%>>Flat</option>
              <option value = "Loteamento" <%if subtipo_imovel = "Loteamento" then%>selected<%end if%>>Loteamento</option>
              <option value = "Sobrado" <%if subtipo_imovel = "Sobrado" then%>selected<%end if%>>Sobrado</option>
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
             <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Lançamento:
          </td>
         </tr>
         <tr>
          <td>
            <input type="radio" name="flg_lancamento" value="S" <%if flg_lancamento = "S" then%>checked<%end if%>><span class="estilo">Sim</span> &nbsp;
            <input type="radio" name="flg_lancamento" value="N" <%if flg_lancamento <> "S" then%>checked<%end if%>><span class="estilo">Não</span>
          </td>
         </tr>
      </table>
        </td>
        </tr>
          <td>
          <table border=0 cellspacing="0" cellpadding="0">
           <tr>
              <td>
                <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Estágio da Obra:
              </td>
              <td>
                <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Área Útil (m²):
              </td>
           </tr>
           <tr>
            <td>
             <select name="estagios_obra" style="width:140;background=#E8E8E8;">
              <option value = ""></option>
              <%set cbai=conn.execute("select * from estagios_obra where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))=cstr(estagios_obra) then%>
                  <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                <%else%>
                  <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                <%end if%>
                <%cbai.movenext%>
               <%loop%>
             </select>
            </td>
            <td>
             <input type="text" name="metragem" value="<%=metragem%>" size="5" maxlength="5" style="background=#E8E8E8;">
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
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Serviço:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Valor:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Moeda:
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <select name="servico" style="width:140;background=#E8E8E8;">
                    <option value = ""></option>
                    <%set cbai=conn.execute("select * from servico ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=servico then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                </td>
                <td>
                  <input type="text" name="valor" label="valor" style="width:90; height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);">&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                  <select name="moeda" style="background=#E8E8E8;">
                    <option value = ""></option>
                    <%set moedas=conn.execute("select * from Tipo_moeda ORDER BY descricao")%>
                    <%do while not moedas.eof %>
                      <%if cstr(moedas("codigo"))=moeda then%>
                         <option value="<%=moedas("codigo")%>" selected><%=moedas("descricao")%>
                      <%else%>
                         <option value="<%=moedas("codigo")%>"><%=moedas("descricao")%>
                      <%end if%>
                      <%moedas.movenext%>
                    <%loop%>
                  </select>
                </td>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='2';document.form1.excluir.value=''">
                </td>
            <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Serviço</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Valor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_servico where cod_imovel="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set servico=conn.execute("select * from servico where codigo="&cbai("cod_servico"))%>
                  <%=servico("descricao")%>
                <td align=center>
                  <%set moed = conn.execute("select * from tipo_moeda where status=0 and codigo="&cbai("cod_moeda"))%>
                  <%=moed("sigla")%><%=formatnumber(cbai("valor"),2)%>
                </td>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='2';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
              </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Classificação:
                </td>
              </tr>
              <tr>
                <td>
                  <select name="classificacao" style="background=#E8E8E8;">
                    <option value = ""></option>
                    <%set cbai=conn.execute("select * from classificacao_imovel where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=cstr(classificacao) then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <td>
              </tr>
              <tr>
                 <td class="tb" width=130><b>PLANO:</b></td>
              </tr>
              <tr>
                <td>
                  <select name="midia" style="background=#E8E8E8;">
                    <option value = ""></option>
                      <%set cbai=conn.execute("select * from planos where status=0 ORDER BY titulo")%>
                        <%do while not cbai.eof %>
                          <%if cstr(cbai("codigo"))=cstr(midia) then%>
                            <option value="<%=cbai("codigo")%>" selected><%=cbai("titulo")%>
                          <%else%>
                            <option value="<%=cbai("codigo")%>"><%=cbai("titulo")%>
                          <%end if%>
                       <%cbai.movenext%>
                       <%loop%>
                  </select>
                <td>
               </tr>
             </table><br>
            <table><tr><td><B>O IMÓVEL</td></tr></table>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <%if divida = "0" or divida = "" then%>
                    <input type="checkbox" name="divida" value="1"  label="suites" ><span class="estilo">Imóvel com dívida.</span>
                  <%else%>
                    <input type="checkbox" name="divida" value="1"  checked label="suites" ><span class="estilo">Imóvel com dívida.</span>
                  <%end if%>
                </td>
              </tr>
	      <tr>
	        <td colspan=2>
	          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Idade do Imóvel:
	        </td>
	        <td colspan=2>
	          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Categoria:
	        </td>
	      </tr>
	      <tr>
	        <td colspan=2>
	          <select name="idade" style="background=#E8E8E8;">
	            <option value = "0">(Selecione)</option>
	              <%set cbai=conn.execute("select * from tipo_idade_imovel where status=0 ORDER BY codigo")%>
	              <%do while not cbai.eof %>
	                <%if cstr(cbai("codigo"))=cstr(idade) then%>
	                  <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
	                <%else%>
	                  <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
	                <%end if%>
	                <%cbai.movenext%>
	               <%loop%>
	          </select>
	        </td>
	        <td colspan=2>
	          <select name="Categoria" style="background=#E8E8E8;">
	            <option value = "0"></option>
	              <%set cbai=conn.execute("select * from tipo_Categoria where status=0 ORDER BY descricao")%>
	              <%do while not cbai.eof %>
	                <%if cstr(cbai("codigo"))=cstr(Categoria) then%>
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
	        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;N° Domitórios:
	       </td>
	       <td>
	        <span class="estilo">&nbsp;Sendo Suites:
	       </td>
	      </tr>
	      <tr>
	        <td>
	          <select name="dormitorio" style="width:80;background=#E8E8E8;">
	            <%if dormitorio = "0" or dormitorio = "" then%>
	       	        <option value = "0">Nenhuma</option>
	       	    <%else%>
	       	        <option value="<%=dormitorio%>" selected><%=dormitorio%>
	       	    <%end if%>
	            <option value = "1">1</option>
	            <option value = "2">2</option>
	            <option value = "3">3</option>
	            <option value = "4">4</option>
	            <option value = "5">5</option>
	            <option value = "6">6</option>
	            <option value = "7">7</option>
	          </select>
	        </td>
	        <td>
	          <select name="Suites" style="width:80;background=#E8E8E8;">
	            <%if suites = "0" or suites = "" then%>
	       	        <option value = "0">Nenhuma</option>
	       	    <%else%>
	       	        <option value="<%=suites%>" selected><%=suites%>
	       	    <%end if%>
	            <option value = "1">1</option>
	            <option value = "2">2</option>
	            <option value = "3">3</option>
	            <option value = "4">4</option>
	            <option value = "5">5</option>
	            <option value = "6">6</option>
	            <option value = "7">7</option>
	          </select>
	        </td>
	      </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Comodo:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Quantidade:
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <select name="Comodo" style="width:140;background=#E8E8E8;">
                    <option value = ""></option>
                    <%set cbai=conn.execute("select * from Tipo_comodo where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=Comodo then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%> 
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <td>
                  <input type="text" name="quantidade_comodo" value=""  maxlength=3 label="quantidade_comodo" style="width:60; height:17; background=#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);"> 
                </td>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='1'">
                </td>
              </tr>
              <tr>
	       <td>
	        <span class="estilo">&nbsp;Vagas de Garagem:
	       </td>
	      </tr>
	      <tr>
	        <td>
	          <select name="garagem" style="width:80;background=#E8E8E8;">
	            <%if garagem = "0" or garagem = "" then%>
	       	        <option value = "0">Nenhuma</option>
	       	    <%else%>
	       	        <option value="<%=garagem%>" selected><%=garagem%>
	       	    <%end if%>
	            <option value = "1">1</option>
	            <option value = "2">2</option>
	            <option value = "3">3</option>
	            <option value = "4">4</option>
	            <option value = "5">5</option>
	          </select></td>
	      </tr>
            </table>
            <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Comodo</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Quantidade</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_imovel where cod_imovel="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set comodo_nome=conn.execute("select * from tipo_comodo where codigo="&cbai("cod_comodo"))%>
                  <%=comodo_nome("descricao")%>
                <td align=center>
                  <%=cbai("quantidade")%>
                </td>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='1';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
            </table>
            <table>
             
            </table>
            <table><tr><td><B>O EMPREENDIMENTO</td></tr></table>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Descrição:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Quantidade:
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <select name="empreendimento" style="width:140;background=#E8E8E8;">
                    <option value = ""></option>
                    <%set cbai=conn.execute("select * from Tipo_empreendimento where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=empreendimento then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <td>
                  <input type="text" name="quantidade_empreendimento" value=""  maxlength=3 label="quantidade" style="width:60; height:17; background=#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);"> 
                </td>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='5'">
                </td>
              </tr>
            </table>
            <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Descrição</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Quantidade</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_empreendimento where cod_imovel="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set empreendimento_nome=conn.execute("select * from tipo_empreendimento where codigo="&cbai("cod_empreendimento"))%>
                  <%=empreendimento_nome("descricao")%>
                <td align=center>
                  <%=cbai("quantidade")%>
                </td>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='5';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
            </table>
            
            
            
            
          </td>
        </tr>
        <tr>
           <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">QTD:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Tipo:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Valor:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Moeda:
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="quantidade_plano" value=""  maxlength=3 label="quantidade_plano" style="width:60; height:17; background=#E8E8E8;" onkeypress="Numero()"> 
                </td>
                <td>
                  <select name="tipo_plano" style="width:140;background=#E8E8E8;">
                    <option value = ""></option>
                    <%set plano=conn.execute("select * from tipo_conta where status=0 and tipo=0 ORDER BY descricao")%>
                    <%do while not plano.eof %>
                      <%if cstr(plano("codigo"))=tipo_plano then%>
                         <option value="<%=plano("codigo")%>" selected><%=plano("descricao")%>
                      <%else%>
                         <option value="<%=plano("codigo")%>"><%=plano("descricao")%>
                      <%end if%>
                      <%plano.movenext%>
                    <%loop%>
                  </select>
                <td>
                  <input type="text" name="valor_plano" label="valor_plano" style="width:90; height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);">&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                  <select name="moeda" style="background=#E8E8E8;">
                    <option value = ""></option>
                    <%set moedas=conn.execute("select * from Tipo_moeda ORDER BY descricao")%>
                    <%do while not moedas.eof %>
                      <%if cstr(moedas("codigo"))=moeda then%>
                         <option value="<%=moedas("codigo")%>" selected><%=moedas("descricao")%>
                      <%else%>
                         <option value="<%=moedas("codigo")%>"><%=moedas("descricao")%>
                      <%end if%>
                      <%moedas.movenext%>
                    <%loop%>
                  </select>
                </td>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='4'">
                </td>
              </tr>
            </table>
            <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Quantidade</font></span>
                </td>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Plano</font></span>
                </td>
                <td bgcolor=#AAAAAA a lign=center>
                  <span class="estilo"><font color="#FFFFFF">Valor</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%set plano1=conn.execute("select * from perfil_plano where cod_imovel="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not plano1.eof %>
              <tr>
                <td align=center>
                  <%=plano1("quantidade")%>
                </td>
                <td>
                  <%set plano_nome=conn.execute("select * from tipo_conta where codigo="&plano1("cod_tipo_conta"))%>
                  <%=plano_nome("descricao")%>
                <td align=center>
                  <%set moed = conn.execute("select * from tipo_moeda where status=0 and codigo="&plano1("cod_moeda"))%>
                  <%=moed("sigla")%><%=formatnumber(plano1("valor"),2)%>                  
                </td>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='4';document.form1.excluir.value='<%=plano1("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%plano1.movenext%>
              <%loop%>
            </table>
           </td>
        </tr>
        <tr>
          <td align=center>
            <input type="image" src="../img/ok.gif" value="submit" border=0>
          </td>
        </tr>
        </tr>
        </tr>   
      </table>
    </td>
  </tr>
</table>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</form>
</body>
</html>