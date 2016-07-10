<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
codigo=request("codigo")
codigo2=request("codigo2")
pagina=request("pagina")
cliente=trim(request("cliente"))
reload=request("reload")
excluir=request("excluir")
valor_plano=request("valor_plano")
tipo_plano=request("tipo_plano")
data_inicio=request("data_inicio")
quantidade_plano=replace(request("quantidade_plano"),",","")
imovel = request("imovel")

if imovel<>"0" and imovel<>"" and reload="4" and excluir="" and isnumeric(quantidade_plano) and isnumeric(valor_plano) and data_valida(data_inicio,0) then
   conn.execute("delete perfil_contrato where cod_tipo_conta="&tipo_plano&" and cod_contrato="&codigo)
   set meses=conn.execute("select * from tipo_conta where codigo="&tipo_plano)
   conn.execute("insert into perfil_contrato (cod_contrato, cod_tipo_conta, valor, quantidade,meses,data_inicio) values ("&codigo&", "&tipo_plano&", "&replace(replace(csng(valor_plano),".",""),",",".")&","&quantidade_plano&","&meses("meses")&",convert(datetime,'"&data_inicio&"',103))")
end if

if excluir<>"" and reload="4" then
   conn.execute("delete perfil_contrato where codigo="&excluir)
end if

if request("flag") <> 1 then
   set contrato=conn.execute("select * from contrato where codigo="&codigo)
   cliente    =contrato("cod_cliente")
   numero     =contrato("numero")
   fiador1    =contrato("cod_fiador1")
   fiador2    =contrato("cod_fiador2")
   imovel     =contrato("cod_imovel")
   servicos   =contrato("tipo_servico")
   corretor   =contrato("cod_corretor")
   inicio     =data_completa(contrato("data_inicio"))
   vencimento =data_completa(contrato("data_vencimento"))
   reajuste   =data_completa(contrato("reajuste"))
   valor      =trim(formatnumber(csng(contrato("valor")),2))
   taxa       =contrato("taxa")
   multa      =contrato("multa")
   indice     =contrato("cod_indice")
   comissao   =trim(formatnumber(csng(contrato("comissao")),2))
   chave      =contrato("cod_chave_imovel")
else
   cliente    =trim(ucase(request("cliente")))
   numero     =replace(trim(ucase(request("numero"))),"'","")
   fiador1    =trim(ucase(request("fiador1")))
   fiador2    =trim(ucase(request("fiador2")))
   imovel     =trim(ucase(request("imovel")))
   servicos   =trim(ucase(request("servicos")))
   corretor   =trim(ucase(request("corretor")))
   inicio     =trim(ucase(request("inicio")))
   vencimento =trim(ucase(request("vencimento")))
   reajuste   =trim(ucase(request("reajuste")))
   valor      =trim(ucase(request("valor")))
   taxa       =trim(ucase(request("taxa")))
   multa      =trim(ucase(request("multa")))
   indice     =trim(ucase(request("indice")))
   comissao   =trim(ucase(request("comissao")))
   chave      =trim(ucase(request("chave")))
   if numero = "" then
     msg=msg&" Numero.<br>"
   end if
   if fiador1 = "" then
     msg=msg&" Fiador1.<br>"
   end if
   if imovel = "" then
     msg = msg&" Imóvel.<br>"
   end if
   if corretor = "" then
     msg = msg&" Corretor.<br>"
   end if
   if servicos = "" then
    msg = msg&" Serviço.<br>"
   end if
   if valor="" then
     msg=msg&" Valor.<br>"
   end if
   if indice="0" then
     msg=msg&" Índice.<br>"
   end if
   if not data_valida(inicio,0) then
      msg=msg&" Data de inicio incorreta.<br>"
   else
      if not data_valida(vencimento,0) then
         msg=msg&" Data de vencimento incorreta.<br>"
      else
         if datevalue(vencimento)<datevalue(inicio) then
             msg=msg&" Data de vencimento incorreta.<br>"
         else
            if not data_valida(reajuste,0) then
               msg=msg&" Data de reajuste incorreta.<br>"
            else
               if datevalue(reajuste)<datevalue(inicio) then
                  msg=msg&" Data de reajuste incorreta.<br>"
               end if
            end if
         end if
      end if
   end if
   if comissao <> "" then
     if not isnumeric(comissao) then 
      msg = msg&" Comissão incorreta.<br>"
     end if 
   end if
   if numero<>"" then
      set verifica_cliente=conn.execute("select * from contrato where numero='"&numero&"' and codigo<>"&codigo)
      if not verifica_cliente.eof then
         msg=msg&" Contrato já existe<br>"
      end if
   else
      msg=msg&" Contrato.<br>"
   end if
   
   if msg="" and reload=""then
      conn.execute("update contrato set cod_cliente="&cliente&", numero="&numero&", cod_imovel="&imovel&",cod_fiador1="&fiador1&",cod_fiador2="&fiador2&",tipo_servico="&servicos&",cod_corretor="&corretor&", data_inicio=convert(datetime , '"&inicio&"' , 103),data_vencimento=convert(datetime , '"&vencimento&"' , 103), valor="&replace(replace(csng(valor),".",""),",",".")&",multa="&multa&",taxa="&taxa&",cod_indice="&indice&",reajuste=convert(datetime,'"&reajuste&"',103), comissao="&replace(replace(csng(comissao),".",""),",",".")&" ,cod_chave_imovel="&chave&" where codigo="&codigo)%>
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.numero.focus()">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&codigo=<%=codigo%>&codigo2=<%=codigo2%>" name="form1">
<table border="0" width="777" cellspacing="0" cellpadding="0">
<input type=hidden name="reload">
<input type=hidden name="excluir">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para alterar o contrato siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento dos campos obrigatórios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/helpicon.gif" border=0>&nbsp;&nbsp;Campo com ajuda &nbsp;&nbsp;<br>
          </td>
        </tr>
        <tr>
          <td>
            <%if msg<>"" and reload = "" then%>
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
            &nbsp;&nbsp;<a href="<%=pagina%>.asp?codigo=<%if pagina="Detalhe_cliente" then response.write codigo2 else response.write codigo end if %>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
         <tr>
          <td class="estilo" width=100%>
            <img src="../img/r_9.gif">&nbsp;ALTERAR CONTRATO 
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td>
            <span class="estilo">Cliente:
          </td>
        </tr>
        <tr>
          <td>
           <input type="hidden" name="cliente" value="<%=cliente%>">
           <%set cliente = conn.execute("select * from clientes where codigo="&cliente)%>
           <%=cliente("nome")%>
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Número:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="numero" value="<%=numero%>" maxlength=20 label="Numero" style="width:60; height:17; background=#E8E8E8;" onkeypress="Numero()">
          </td>
        </tr>
        <tr>
          <td>
          
    <table cellspacing=0 cellpadding=0>
       <tr>
         <td>
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Fiador 1:
         </td>
       </tr>    
       <tr>
         <td>
           <select name="fiador1" style="background=#E8E8E8;">
            <option value = ""></option>
            <%set cbai=conn.execute("select * from fiador ORDER BY nome")%>
            <%do while not cbai.eof %>
              <%if cstr(cbai("codigo"))=cstr(fiador1) then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("nome")%>
              <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("nome")%>
              <%end if%>
              <%cbai.movenext%>
            <%loop%>
          </select>&nbsp;&nbsp;&nbsp;
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
           <span class="estilo">Fiador 2:
         </td>
      </tr>    
      <tr>
        <td>
           <select name="fiador2" style="background=#E8E8E8;">
             <option value = "0">
            <%set cbai=conn.execute("select * from fiador ORDER BY nome")%>
            <%do while not cbai.eof %>
              <%if cstr(cbai("codigo"))=cstr(fiador2) then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("nome")%>
              <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("nome")%>
              <%end if%>
              <%cbai.movenext%>
            <%loop%>
          </select>&nbsp;&nbsp;&nbsp;
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
         <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Corretor:
      </td>
    </tr>    
    <tr>
      <td>
        <select name="corretor" style="background=#E8E8E8;">
          <option value = ""></option>
          <%set cbai=conn.execute("select * from corretor ORDER BY nome")%>
          <%do while not cbai.eof %>
          <%if cstr(cbai("codigo"))=cstr(corretor) then%>
          <option value="<%=cbai("codigo")%>" selected><%=cbai("nome")%>
          <%else%>
          <option value="<%=cbai("codigo")%>"><%=cbai("nome")%>
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
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Imovel:
         </td>
      </tr>    
      <tr>
        <td>
           <select name="imovel" style="background=#E8E8E8;" onchange="document.form1.reload.value='1';document.form1.submit()">
            <option value = ""></option>
            <%set cbai=conn.execute("select * from imoveis where status = 0 ORDER BY descricao")%>
            <%do while not cbai.eof %>
              <%if cstr(cbai("codigo"))=cstr(imovel) then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
              <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
              <%end if%>
              <%cbai.movenext%>
            <%loop%>
          </select>&nbsp;&nbsp;&nbsp;
        </td>
      </tr>
   </table>
  </td>
</tr>
<%if imovel <> "" and Imovel <> "0" then%>
 <tr>
 <td>
 <table cellspacing=0 cellpadding=0>
    <tr>
       <td>
         <span class="estilo">Chave:
      </td>
      <td>
         <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Serviço:
      </td>
    </tr>    
    <tr>
      <td>
        <select name="chave" style="background=#E8E8E8;">
          <option value=""></option>
            <%set chaves=conn.execute("select cod_quadro , registro_chave.codigo as codigo from (registro_chave inner join imoveis on imoveis.codigo=registro_chave.cod_imovel) where registro_chave.status=0 and registro_chave.codigo<>"&chave&" and registro_chave.cod_imovel="&imovel)%>
            <%do while not chaves.eof%>
             <%if cstr(chaves("codigo"))=cstr(chave) then%>
                 <option value="<%=chaves("codigo")%>" selected><%=chaves("cod_quadro")%>
              <%else%>
                 <option value="<%=chaves("codigo")%>"><%=chaves("cod_quadro")%>
              <%end if%>
            <%chaves.movenext%>
            <%loop%>
        </select>
      </td>
      <td>
        <select name="servicos" style="background=#E8E8E8;">
          <option value = ""></option>
          <%set cbai=conn.execute("select * from servico ORDER BY descricao")%>
          <%do while not cbai.eof %>
          <%if cstr(cbai("codigo"))=cstr(servicos) then%>
          <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
          <%else%>
          <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
          <%end if%>
          <%cbai.movenext%>
          <%loop%>
        </select>
      </td>
    </tr>
    <tr colspan=2>
      <td>
         <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Multa por Atrazo:
      </td>
      <td>
         <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Taxa de Administração:
      </td>
    </tr>    
    <tr>
      <td>
        <select name="multa" style="background=#E8E8E8;">
          <option value="0">0%</option>
          <option value="1">1%</option>
          <option value="2">2%</option>
          <option value="3">3%</option>
          <option value="4">4%</option>
          <option value="5">5%</option>
          <option value="6">6%</option>
          <option value="7">7%</option>
          <option value="8">8%</option>
          <option value="9">9%</option>
          <option value="10">10%</option>
          <option value="11">11%</option>
          <option value="12">12%</option>
          <option value="13">13%</option>
          <option value="14">14%</option>
          <option value="15">15%</option>
          <option value="<%=multa%>" selected><%=multa%>%</option>
        </select>
      </td>
      <td>
        <select name="taxa" style="background=#E8E8E8;">
          <option value="0">0%</option>
          <option value="1">1%</option>
          <option value="2">2%</option>
          <option value="3">3%</option>
          <option value="4">4%</option>
          <option value="5">5%</option>
          <option value="6">6%</option>
          <option value="7">7%</option>
          <option value="8">8%</option>
          <option value="9">9%</option>
          <option value="10">10%</option>
          <option value="11">11%</option>
          <option value="12">12%</option>
          <option value="13">13%</option>
          <option value="14">14%</option>
          <option value="15">15%</option>
          <option value="16">16%</option>
          <option value="17">17%</option>
          <option value="18">18%</option>
          <option value="19">19%</option>
          <option value="20">20%</option>
          <option value="<%=taxa%>" selected><%=taxa%>%</option>
        </select>
      </td>
    </tr>
    <tr>
      <td>
         <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Valor:
      </td>
      <td>
         <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Indice Reajuste:
      </td>
    </tr>    
    <tr>
      <td>
        <input type="text" disabled name="valor2" maxlength=20 label="Valor" style="width:100; height:17; background=#E8E8E8;">
        <input type="hidden" name="valor">
      </td>
      <td>
        <select name="indice" style="background=#E8E8E8;">
          <option value="0"></option>
          <%set cbai=conn.execute("select * from indice where status=0 ORDER BY descricao")%>
          <%do while not cbai.eof %>
          <%if cstr(cbai("codigo"))=cstr(indice) then%>
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
         <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data de incio:
       </td>
       <td>
         <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data de vencimento:
       </td>    
    </tr>
    <tr>
       <td>
         <input type="text" name="inicio" value="<%=inicio%>" maxlength=10 label="inicio" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this)">
       </td>
       <td>
         <input type="text" name="vencimento" value="<%=vencimento%>" maxlength=10 label="vencimento" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this)">
       </td>
    </tr>
    <tr>
       <td>
          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data de reajuste:
       </td>
       <td>
         <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Comissão do corretor:
       </td>
    </tr>
    <tr>
       <td>
         <input type="text" name="reajuste" value="<%=reajuste%>" maxlength=10 label="reajuste" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this)">
       </td>
       <td>
         <input type="text" name="comissao" value="<%=comissao%>" label="reajuste" style="width:60;height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);">%
       </td>
    </tr>
    <tr>
        <td colspan=2>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data Inicio:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Qtd:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">plano:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Valor:
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="data_inicio" value=""  maxlength=10 label="data_inicio" style="width:73; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this)"> 
                </td>
                <td>
                  <input type="text" name="quantidade_plano" value=""  maxlength=3 label="quantidade_plano" style="width:40; height:17; background=#E8E8E8;" onkeypress="Numero()"> 
                </td>
                <td>
                  <select name="tipo_plano" style="background=#E8E8E8;">
                    <option value = ""></option>
                    <%set plano=conn.execute("select tipo_conta.codigo as codigo,tipo_conta.descricao as descricao from tipo_conta inner join perfil_plano on tipo_conta.codigo=perfil_plano.cod_tipo_conta where perfil_plano.cod_imovel="&imovel&" and tipo=0 ORDER BY descricao")%>
                    <%do while not plano.eof %>
                      <%if cstr(plano("codigo"))=cstr(tipo_plano) then%>
                         <option value="<%=plano("codigo")%>" selected><%=plano("descricao")%>
                      <%else%>
                         <option value="<%=plano("codigo")%>"><%=plano("descricao")%>
                      <%end if%>
                      <%plano.movenext%>
                    <%loop%>
                  </select>
                </td>
                <td>
                  <input type="text" name="valor_plano" label="valor_plano" style="width:60;height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);">
                </td>
                <td align=center>
                  <input type="image" src="../img/ok.gif" value="enviar" border=0 onclick="document.form1.reload.value='4'">
                </td>
              </tr>
            </table>
            <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Início</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Quantidade</font></span>
                </td>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">plano</font></span>
                </td>
                <td bgcolor=#AAAAAA a lign=center>
                  <span class="estilo"><font color="#FFFFFF">Valor</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%if imovel <> "" then%>
              <%set plano1=conn.execute("select * from perfil_contrato where cod_contrato="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not plano1.eof %>
              <tr>
                <td align=center>
                  <%=plano1("data_inicio")%>
                </td>
                <td align=center>
                  <%=plano1("quantidade")%>
                </td>
                <td>
                  <%set plano_nome=conn.execute("select * from tipo_conta where codigo="&plano1("cod_tipo_conta"))%>
                  <%=plano_nome("descricao")%>
                <td align=center>
                  R$<%=formatnumber(plano1("valor"),2)%>
                  <%valor_contrato=valor_contrato+plano1("valor")*plano1("quantidade")%>
                </td>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='4';document.form1.excluir.value='<%=plano1("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%plano1.movenext%>
              <%loop%>
              <script>
                document.form1.valor2.value='<%=formatnumber(valor_contrato,2)%>';
                document.form1.valor.value='<%=valor_contrato%>';
              </script>
              <%end if%>
            </table>
           </td>
        </tr>
      <%end if%>  
    </td>
</tr>
   </table>  
     <tr> 
       <td align=center>
         <br><input type="image" src="../img/ok.gif" value="submit" border=0>
       </td>
     </tr>   
  </table>
</td>
</tr>
</table><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>