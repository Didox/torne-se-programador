<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
pagina=request("pagina")
cliente =request("cliente")
servico=request("servico")
reload=request("reload")
despesa=request("despesa")
valor_despesa = replace(request("valor_despesa"),".","")
valor_despesa = replace(valor_despesa,",",".")
excluir=request("excluir")
comodo=request("comodo")
quantidade=request("quantidade")
quantidade_comodo=request("quantidade_comodo")
quantidade_plano=replace(request("quantidade_plano"),",","")
servico=request("servico")
empreendimento = request("empreendimento")
lazer = request("lazer")
seguranca = request("seguranca")
quantidade_empreendimento = replace(request("quantidade_empreendimento"),".","")
quantidade_empreendimento = replace(quantidade_empreendimento,",",".")
valor=request("valor")
valor_plano=request("valor_plano")
tipo_plano=request("tipo_plano")
observacao = request("observacao")
If request("moeda") <> "" then
  moeda =replace(request("moeda"),",","")
Else
  moeda = 7
End If
if reload="1" and excluir="" and isnumeric(quantidade) then
   conn.execute("delete perfil_imovel where cod_comodo="&comodo&" and cod_imovel="&codigo)
   sqlINS = "insert into perfil_imovel (cod_imovel, cod_comodo, quantidade) values ("&codigo&", "&comodo&", "&quantidade_comodo&")"
   'response.write sqlINS
   'response.end
   conn.execute(sqlINS)
end if
if reload="2" and excluir="" and isnumeric(valor) then
   conn.execute("delete perfil_servico where cod_servico="&servico&" and cod_imovel="&codigo)
   sqlins = "insert into perfil_servico (cod_imovel, cod_servico, valor, cod_moeda) values ("&codigo&", "&servico&", "&replace(replace(csng(valor),".",""),",",".")&","&moeda&")"
   'response.write sqlins
   'response.end
   conn.execute(sqlins)
end if
if reload="4" and excluir="" and isnumeric(quantidade_plano) and isnumeric(valor_plano) then
   conn.execute("delete perfil_plano where cod_tipo_conta="&tipo_plano&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_plano (cod_imovel, cod_tipo_conta, valor, quantidade,cod_moeda) values ("&codigo&", "&tipo_plano&", "&replace(replace(csng(valor_plano),".",""),",",".")&","&quantidade_plano&","&moeda&")")
end if
if reload="5" and excluir="" and isnumeric(despesa) and isnumeric(valor_despesa) then
   conn.execute("delete from gasto_extra where cod_despesa = "&despesa&" and cod_imovel = "&codigo)
   conn.execute("insert into gasto_extra (cod_imovel, cod_despesa, valor) values ("&codigo&", "&despesa&", "&valor_despesa&")")
end if
if reload="6" and excluir="" and isnumeric(empreendimento) and isnumeric(quantidade_empreendimento) then
   conn.execute("delete from perfil_empreendimento where cod_empreendimento = "&empreendimento&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_empreendimento (cod_imovel, cod_empreendimento, quantidade) values ("&codigo&", "&empreendimento&", "&quantidade_empreendimento&")")
end if
if reload="7" and excluir="" and isnumeric(lazer) then
   conn.execute("delete from perfil_lazer where cod_lazer = "&lazer&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_lazer (cod_imovel, cod_lazer) values ("&codigo&", "&lazer&")")
end if
if reload="8" and excluir="" and isnumeric(seguranca) then
   conn.execute("delete from perfil_seguranca where cod_seguranca = "&seguranca&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_seguranca (cod_imovel, cod_seguranca) values ("&codigo&", "&seguranca&")")
end if
if excluir<>"" and reload="4" then
   conn.execute("delete perfil_plano where codigo="&excluir)
end if
if excluir<>"" and reload="5" then
   conn.execute("delete from gasto_extra where codigo="&excluir)
end if
if excluir<>"" and reload="6" then
   conn.execute("delete from perfil_empreendimento where codigo="&excluir)
end if
if excluir<>"" and reload="7" then
   conn.execute("delete from perfil_lazer where codigo="&excluir)
end if
if excluir<>"" and reload="8" then
   conn.execute("delete from perfil_seguranca where codigo="&excluir)
end if
if excluir<>"" and reload="1" then
   conn.execute("delete perfil_imovel where codigo="&excluir)
end if
if excluir<>"" and reload="2" then
   conn.execute("delete perfil_servico where codigo="&excluir)
end if
if request("flag") <> 1 then
   set Imoveis=conn.execute("select * from Imoveis where codigo="&codigo)
   set exibirperfil=conn.execute("select * from perfil_imoveis where cod_imovel="&codigo)
   set plano_midia = conn.execute("select * from ativacao_plano where cod_imovel="&codigo)
   set ativacao_plano=conn.execute("select * from ativacao_plano where cod_imovel="&codigo)
   descricao=replace(trim(ucase(Imoveis("descricao"))),"'","")
   logradouro=replace(trim(ucase(Imoveis("endereco"))),"'","")
   unidade=trim(ucase(Imoveis("cod_unidade")))
   numero=replace(trim(ucase(Imoveis("numero"))),"'","")
   complemento=replace(trim(ucase(Imoveis("complemento")))   ,"'","")
   bairro=trim(ucase(Imoveis("cod_bairro")))
   cidade=trim(ucase(Imoveis("cod_cidade")))
   estado=trim(ucase(Imoveis("cod_estado")))
   tipo_imovel=trim(ucase(Imoveis("tipo_imovel")))
   subtipo_imovel=trim(ucase(Imoveis("subtipo_imovel")))
   estagios_obra=trim(ucase(exibirperfil("estagios_obra_imovel")))
   metragem=trim(ucase(exibirperfil("metragem_imovel")))
   classificacao=trim(ucase(Imoveis("cod_classificacao_imovel")))
   idade      =Imoveis("cod_idade_imovel")
   categoria  =Imoveis("cod_categoria")
   dormitorio = Imoveis("dormitorio")
   suites     = Imoveis("suites") 
   garagem    = Imoveis("garagem")
   divida     =Imoveis("divida")
   if not ativacao_plano.eof then
   midia      =ativacao_plano("cod_plano")
   else
   midia = 0
   end if
   flg_lancamento=trim(ucase(Imoveis("flg_lancamento")))
   observacao     =Imoveis("observacao")
else
   descricao=replace(trim(ucase(request("descricao"))),"'","")
   logradouro=replace(trim(ucase(request("logradouro"))),"'","")
   If request("unidade") <> "" then
     unidade=trim(ucase(request("unidade")))
   Else
     unidade = 0
   End If
   numero=replace(trim(ucase(request("numero"))),"'","")
   complemento=replace(trim(ucase(request("complemento"))),"'","")
   bairro=trim(ucase(request("bairro")))
   cidade=trim(ucase(request("cidade")))
   estado=trim(ucase(request("estado")))
   tipo_imovel=trim(ucase(request("tipo_imovel")))
   subtipo_imovel=trim(ucase(request("subtipo_imovel")))
   estagios_obra=trim(ucase(request("estagios_obra")))
   metragem=trim(ucase(request("metragem")))   
   comodo=trim(ucase(request("comodo")))
   quantidade=trim(ucase(request("quantidade"))) 
   classificacao=trim(ucase(request("classificacao")))     
   midia=trim(ucase(request("midia")))
   idade      =request("idade")
   categoria  =request("categoria")
   if request("dormitorio") <> "" then
   dormitorio = request("dormitorio")
   else
   dormitorio = 0
   end if
   suites     = request("suites") 
   garagem    = request("garagem")
   estagios_obra=trim(ucase(request("estagios_obra")))
   moeda =replace(request("moeda"),",","")
   quantidade_comodo=request("quantidade_comodo")
   divida     =request("divida")
   flg_lancamento= "N"
   observacao     =request("observacao")

   if divida = "" then
      divida = 0
   end if
   'if descricao<>"" then
      'set verifica_descricao=conn.execute("select * from Imoveis where descricao='"&descricao&"' and codigo<>"&codigo)
      'if not verifica_descricao.eof then
         'msg=msg&" Imovel já existe<br>"
      '	end if
   'else
   '   msg=msg&" Descrição.<br>"
   'end if
   if logradouro="" then
      msg=msg& " Logradouro.<br>"
   end if
   if numero="" then
      msg=msg& " Número.<br>"
   end if
   'if unidade="0" then
   '   msg=msg& " Unidade.<br>"
   'end if
   if estado="0" then
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
   if subtipo_imovel="" then
      msg=msg& " Subtipo de Imóvel.<br>"
   end if
   'if flg_lancamento="" then
   '   msg=msg& " Lançamento.<br>"
   'end if
   if estagios_obra="" or estagios_obra="0" then
      msg=msg& " Estágios Obra.<br>"
   end if
   if metragem="" or metragem="0" then
      msg=msg& " Metragem.<br>"
   end if
   set tipo_servico = conn.execute("select * from perfil_servico where cod_imovel="&codigo)
   if tipo_servico.eof then
      msg=msg& " Transação.<br>"
   end if
   'set tipo_comodo = conn.execute("select * from perfil_imovel where cod_imovel="&codigo)
   'if tipo_Comodo.eof then
   '   msg=msg& " Comodos.<br>"
   'end if
   'set plano = conn.execute("select * from Perfil_plano where cod_imovel="&codigo)
   'if classificacao="" then
   '   msg=msg& " Classificação.<br>"
   'end if
   'if plano.eof then
      'msg=msg& " Tipo.<br>"
   'end if
   if msg="" and  reload="" then 
      sqlIMO = "update Imoveis set descricao='"&descricao&"', endereco='"&logradouro&"', numero='"&numero&"', complemento='"&complemento&"',cod_bairro="&bairro&", cod_cidade="&cidade&", cod_estado="&estado&", tipo_imovel='"&tipo_imovel&"' , subtipo_imovel='"&subtipo_imovel&"' , cod_estagios_obra="&estagios_obra&" ,cod_metragem="&metragem&", data_inclusao=convert(datetime,'"&date()&"',103), cod_idade_imovel="&idade&", cod_categoria="&categoria&", dormitorio='"&dormitorio&"', suites='"&suites&"', garagem="&garagem&", divida="&divida&", flg_lancamento='"&flg_lancamento&"', observacao = '"&observacao&"' where codigo="&codigo
      'response.write sqlIMO
      'response.end
      conn.execute(sqlIMO)
      conn.execute("update ativacao_plano set cod_plano="&midia&" where cod_imovel="&codigo)%>
      <script>
        alert('Alteração efetuada com sucesso!');
        location.href="<%=pagina%>.asp?cliente=<%=cliente%>";
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#F4F2EA" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.descricao.focus()">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=Imoveis&codigo=<%=codigo%>&cliente=<%=cliente%>" name="form1">
<input type="hidden" name="reload">
<input type="hidden" name="excluir">
<table border="0" width="600" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table border="0" align=left width=380 cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <br>
            <span span class="estilo">&nbsp;&nbsp;<b>Para alterar os dados do imóvel siga os passos descrito abaixo.<br><br></b>
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
            &nbsp;&nbsp;<a href="javascript:history.back()"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_12.gif">&nbsp;ALTERAR IMÓVEL
          </td>
          <td>&nbsp;&nbsp;</td>
        </tr>
        </tr> 
        
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Estado:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Cidade:
                </td>
              </tr>
              <tr>
                <td>
                <%if session("tipo_login") <> 2 then%>
                  <select name="estado" style="width:140;background=#E8E8E8;" onchange="document.form1.reload.value='3';document.form1.cidade.value='';document.form1.submit()" >
                    <option value = "0"></option>
                    <%set cbai=conn.execute("select * from estado where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=cstr(estado) then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <%else%>
                  <%set cbai=conn.execute("select * from estado where codigo = "&cstr(estado)&"")
                  If not cbai.eof then
                    response.write " &nbsp;" &  cbai("descricao")
                  End If%>
                  <input type="hidden" name="estado" value="<%=cstr(estado)%>">
                <%end if%>
                </td>
                <td>
                <%if session("tipo_login") <> 2 then%>
                  <select name="cidade" style="width:140;background=#E8E8E8;" onchange="document.form1.reload.value='3';document.form1.bairro.value='';document.form1.submit()">
                    <option value = "0"></option>
                    <%set cbai=conn.execute("select * from cidade where status=0 and cod_estado="&estado&" ORDER BY descricao")%>
                    <%if cidade="" or cidade="0" and not cbai.eof then%>
                       <%cidade=cbai("codigo")%>
                    <%end if%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=cstr(cidade) then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <%else%>
                  <%set cbai=conn.execute("select * from cidade where codigo = "&cstr(cidade)&"")
                  if not cbai.eof then
                    response.write " &nbsp;" & cbai("descricao")
                  end if%>
                  <input type="hidden" name="cidade" value="<%=cstr(cidade)%>">
                <%end if%>
                </td>
              </tr>
            </table>
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
          <td class="tb"><%=logradouro%>
            <input type="hidden" name="logradouro" value="<%=logradouro%>">
          </td>
        </tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Número:&nbsp;&nbsp;
                  <span class="estilo">Complemento:
                </td>
              </tr>
              <tr>
                <td class="tb">
                  <%=numero%>
                  <input type="hidden" name="numero" value="<%=numero%>"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <%=complemento%>
                  <input type="hidden" name="complemento" value="<%=complemento%>">
                </td>
              </tr>
        
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Bairro:
                </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>
                <%if session("tipo_login") <> 2 then%>
                  <select name="bairro" style="width:140;background=#E8E8E8;">
                    <option value = "0"></option>
                    <%set cbai=conn.execute("select * from bairro where status=0 and cod_cidade="&cidade&" ORDER BY descricao")%>
                    <%if bairro="" or bairro="0" and not cbai.eof then%>
                       <%bairro=cbai("codigo")%>
                    <%end if%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=cstr(bairro) then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                 </select>
                <%else%>
                  <%set cbai=conn.execute("select * from bairro where codigo = "&cstr(bairro)&"")
                  if not cbai.eof then
                    response.write " &nbsp;" & cbai("descricao")
                  end if%>
                  <input type="hidden" name="bairro" value="<%=cstr(bairro)%>">
                <%end if%>
                </td>
                <td>&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
          <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Transação:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Valor:
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
                <td>
                  <input type="text" name="valor" value="<%=valor%>" label="valor" style="width:60; height:17; background=#E8E8E8;" onkeyup="Numero(this.value,this)">&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='2'">
                </td>
            <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Transação</font></span>
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
                  R$<%=formatnumber(cbai("valor"),2)%>
                </td>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='2';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
              </tr>
            </table>
          </td>
        </tr>
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
              <select name="tipo_imovel" style="width:140;background=#E8E8E8;">
            <option value = "">(Selecione)</option>
              <%set cbai=conn.execute("select * from tipo_imovel where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))=cstr(tipo_imovel) then%>
                  <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                <%else%>
                  <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                <%end if%>
                <%cbai.movenext%>
               <%loop%>
          </select>
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
              <option value = "Apartamento" <%if trim(UCase(subtipo_imovel)) = "APARTAMENTO" then%>selected<%end if%>>Apartamento</option>
              <option value = "Casa" <%if trim(UCase(subtipo_imovel)) = trim("CASA") then%>selected<%end if%>>Casa</option>
              <option value = "Flat" <%if trim(UCase(subtipo_imovel)) = "FLAT" then%>selected<%end if%>>Flat</option>
              <option value = "Loteamento" <%if trim(UCase(subtipo_imovel)) = "LOTEAMENTO" then%>selected<%end if%>>Loteamento</option>
              <option value = "Sobrado" <%if trim(UCase(subtipo_imovel)) = "SOBRADO" then%>selected<%end if%>>Sobrado</option>
            </select>
          </td>
         </tr>
         <tr>
           <td>
             <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Categoria:
           </td>
         </tr>
         <tr>
           <td>
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
      </table>
        </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
         <tr>
          <td>
            &nbsp;&nbsp;<span class="estilo">Nome do Condomínio (Descrição):
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="descricao" value="<%=descricao%>" maxlength=50 label="Descrição" style="width:290; height:17; background=#E8E8E8;">
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
                <%if trim(cbai("codigo"))=trim(estagios_obra) then%>
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
	       <td>
	        &nbsp;&nbsp;<span class="estilo">&nbsp;N° Domitórios:
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
	      
              
            </table>
            <table>
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
	      <tr>
	        <td>
	          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Idade do Imóvel:
	        </td>
	      </tr>
	      <tr>
	        <td>
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
	      </tr>
	      </table>

            <table><tr><td><B>Infraestrutura</td></tr></table>
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
                         <option value="<%=cbai("codigo")%>" <%if trim(cbai("codigo"))=trim(empreendimento) then%>selected<%end if%>><%=cbai("descricao")%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <td>
                  <input type="text" name="quantidade_empreendimento" value=""  maxlength=3 label="quantidade" style="width:60; height:17; background=#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);"> 
                </td>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='6'">
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
                  <a href="javascript:document.form1.reload.value='6';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
            </table>
            <table><tr><td><B>Lazer</td></tr></table>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Descrição:
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <select name="lazer" style="width:140;background=#E8E8E8;">
                    <option value = ""></option>
                    <%set cbai=conn.execute("select * from lazer where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                         <option value="<%=cbai("codigo")%>" <%if trim(cbai("codigo"))=trim(lazer) then%>selected<%end if%>><%=cbai("descricao")%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='7'">
                </td>
              </tr>
            </table>
            <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Descrição</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_lazer where cod_imovel="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set lazer_nome=conn.execute("select * from lazer where codigo="&cbai("cod_lazer"))%>
                  <%=lazer_nome("descricao")%>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='7';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
            </table>
            <table><tr><td><B>Segurança</td></tr></table>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Descrição:
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <select name="seguranca" style="width:140;background=#E8E8E8;">
                    <option value = ""></option>
                    <%set cbai=conn.execute("select * from seguranca where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                         <option value="<%=cbai("codigo")%>" <%if trim(cbai("codigo"))=trim(lazer) then%>selected<%end if%>><%=cbai("descricao")%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='8'">
                </td>
              </tr>
            </table>
            <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Descrição</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_seguranca where cod_imovel="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set seguranca_nome=conn.execute("select * from seguranca where codigo="&cbai("cod_seguranca"))%>
                  <%=seguranca_nome("descricao")%>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='8';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
            </table>
            <!--table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Plano de Midia:
                </td>
              </tr>
              <tr>
                <td>
                  <select name="midia" style="background=#E8E8E8;">
                    <option value = ""></option>
                    <%'set cbai=conn.execute("select * from planos where status=0 ORDER BY titulo")%>
                    <%'do while not cbai.eof %>
                      <%'if cstr(cbai("codigo"))=cstr(midia) then%>
                         <option value="<%'=cbai("codigo")%>" selected><%'=cbai("titulo")%>
                      <%'else%>
                         <option value="<%'=cbai("codigo")%>"><%'=cbai("titulo")%>
                      <%'end if%>
                      <%'cbai.movenext%>
                    <%'loop%>
                  </select>
                <td>
              </tr>
            </table-->
            <input type="hidden" name="midia" value="<%=midia%>">
          </td>
        </tr>
        <tr>
          <td>
             <span class="estilo">Observação*:</span>
          </td>
        </tr>
        <tr>
          <td>
             <textarea rows="5" name="observacao" maxlength=200 cols="37" style="background-color: #C0C0C0"><%=observacao%></textarea>
             <i>* até 2000 caracteres</i>
          </td>
        </tr>
        <!--tr>
           <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Plano:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Quantidade:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Valor:
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="quantidade_plano" value=""  maxlength=3 label="quantidade_plano" style="width:60; height:17; background=#E8E8E8;" onkeyup="Numero(this.value,this)"> 
                </td>
                <td>
                  <select name="tipo_plano" style="width:140;background=#E8E8E8;">
                    <option value = ""></option>
                    <%'set plano=conn.execute("select * from Tipo_conta where status=0 and tipo=1 ORDER BY descricao")%>
                    <%'do while not plano.eof %>
                      <%'if cstr(plano("codigo"))=tipo_plano then%>
                         <option value="<%'=plano("codigo")%>" selected><%'=plano("descricao")%>
                      <%'else%>
                         <option value="<%'=plano("codigo")%>"><%'=plano("descricao")%>
                      <%'end if%>
                      <%'plano.movenext%>
                    <%'loop%>
                  </select>
                <td>
                  <input type="text" name="valor_plano" value="" label="valor_plano" style="width:90; height:17; background=#E8E8E8;">&nbsp;&nbsp;&nbsp;&nbsp;
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
              <%'set plano1=conn.execute("select * from perfil_plano where cod_imovel="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%'do while not plano1.eof %>
              <tr>
                <td align=center>
                  <%'=plano1("quantidade")%>
                </td>
                <td>
                  <%'set plano_nome=conn.execute("select * from tipo_conta where codigo="&plano1("cod_tipo_conta"))%>
                  <%'=plano_nome("descricao")%>
                <td align=center>
                  R$<%'=formatnumber(plano1("valor"),2)%>
                </td>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='4';document.form1.excluir.value='<%'=plano1("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%'plano1.movenext%>
              <%'loop%>
            </table>
           </td>
        </tr-->
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
</body>
</html>