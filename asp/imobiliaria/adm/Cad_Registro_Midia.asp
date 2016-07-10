<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
quantidade=request("quantidade")
imovel=trim(request(("imovel")))
unidade=request("unidade")
veiculo=request("veiculo")
reload=request("reload")

if request("flag") = 1 and reload = "" then

   if unidade="" then
     msg=msg&" Unidade Métrica.<br>"
   end if
   if veiculo="" then
     msg=msg&" Veículo de Comunicação.<br>"
   end if
   if quantidade="" then
     msg=msg&" Exibições.<br>"
   end if

     if msg="" and reload = "" then
       set verifica=conn.execute("select * from registro_midia where quantidade="&quantidade&" and cod_imovel="&imovel&" and cod_veiculo_comunicacao="&veiculo&" and cod_unidade_metrica="&unidade&" and status=0")
       if verifica.eof then
        conn.execute("insert into registro_midia (quantidade , cod_unidade_metrica, cod_imovel, cod_veiculo_comunicacao, data_inclusao) values ("&quantidade&" , "&unidade&", "&imovel&", "&veiculo&", convert(datetime,'"&date()&"',103))")%>
        <script>
           alert('Cadastro efetuado com sucesso!');
           location.href="<%=pagina%>.asp?imovel=<%=imovel%>";
        </script>
     <%else
        msg=msg&"Registro já cadastrado.<br>"
       end if
     end if
end if%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.unidade.focus()">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&imovel=<%=imovel%>" name="form1">
<input type="hidden" name="reload">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar um novo registro de mídia siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha o campo corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento do campo obrigatório.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
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
            &nbsp;&nbsp;<a href="<%=pagina%>.asp?imovel=<%=imovel%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_14.gif">&nbsp;CADASTRAR NOVO REGISTRO DE MÍDIA<br><br>
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Imóvel:
          </td>
        </tr>
        <tr>
          <td>
             <%set imovel=conn.execute("select descricao from imoveis where codigo="&imovel)%>
             <b><%=imovel("descricao")%></b>
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Unidade Métrica:
          </td>
        </tr>
        <tr>
          <td>
            <select name="unidade" style="width:140;background=#E8E8E8;" onchange="document.form1.reload.value='1';document.form1.submit();">
             <option value= ""></option>
             <%set cvec=conn.execute("select * from unidade_metrica where status=0 ORDER BY descricao")%>
             <%do while not  cvec.eof %>
              <%if cstr( cvec("codigo"))=unidade then%>
                 <option value="<%= cvec("codigo")%>" selected><%= cvec("descricao")%>
              <%else%>
                 <option value="<%= cvec("codigo")%>"><%= cvec("descricao")%>
              <%end if%>
              <% cvec.movenext%>
             <%loop%>
             </select>
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Veículo de Comunicação:
          </td>
        </tr>
        <tr>
          <td>
          <%if unidade = "" then %>
            <select name="veiculo" style="width:140;background=#E8E8E8;">
             <option value= ""></option>
            </select>
          <%else%>
            <select name="veiculo" style="width:140;background=#E8E8E8;">
             <option value= ""></option>
             <%set cvec=conn.execute("select * from veiculo_comunicacao where status=0 and cod_unidade_metrica="&unidade&" ORDER BY descricao")%>
             <%do while not  cvec.eof %>
              <%if cstr( cvec("codigo"))=veiculo then%>
                 <option value="<%= cvec("codigo")%>" selected><%= cvec("descricao")%>
              <%else%>
                 <option value="<%= cvec("codigo")%>"><%= cvec("descricao")%>
              <%end if%>
              <% cvec.movenext%>
             <%loop%>
             </select>
           <%end if%>
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Exibições:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="quantidade" value="<%=quantidade%>" maxlength=3 label="Serviço" style="width:50; height:17; background=#E8E8E8;" onkeypress="Numero();">
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
</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>

