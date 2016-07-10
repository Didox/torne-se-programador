<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
imovel=request("imovel")
excluir=request("excluir")
reload=request("reload")
valor_despesa=request("valor_despesa")
despesa=request("despesa")
codigo=request("codigo")   

if reload="1" and excluir="" and isnumeric(quantidade) then
   conn.execute("delete gasto_extra where cod_imovel="&imovel&" and cod_despesa="&despesa)
   conn.execute("insert into gasto_extra (cod_despesa, cod_imovel, valor) values ("&despesa&", "&imovel&", "&replace(replace(csng(valor_despesa),".",""),",",".")&")")
end if

if request("flag") <> 1 then
   set gasto_extra = conn.execute("select * from gasto_extra where cod_imovel="&imovel&" and codigo= "&codigo)
   valor_despesa=trim(formatnumber(csng(gasto_extra("valor")),2))
   despesa=gasto_extra("cod_despesa")
else
   valor_despesa = request("valor_despesa")
   despesa=request("despesa")
   
   if descricao<>"" then
      set verifica_descricao=conn.execute("select * from despesa where codigo='"&despesa&"'")
      if not verifica_descricao.eof then
         msg=msg&" Despesa já existe<br>"
      end if
   end if
   if reload = "1" then
     if despesa = "" then
        msg=msg&" Despesa.<br>"
     end if
     if valor_despesa = "" then
        msg=msg&" Valor.<br>"
     end if
   end if

   if msg="" and reload = "" then%>
      <script>
         alert('Cadastro efetuado com sucesso!');
         location.href="<%=pagina%>.asp?imovel=<%=imovel%>";
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.valor_despesa.focus()">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&imovel=<%=imovel%>" name="form1">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar uma nova despesa siga os passos descrito abaixo.<br><br></b>
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
            &nbsp;&nbsp;<a href="<%=pagina%>.asp?imovel=<%=imovel%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_14.gif">&nbsp;CADASTRAR NOVA DESPESA EXTRA<br><br>
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <%set nome_imovel=conn.execute("select * from imoveis where codigo="&imovel)%>
                  <b><%=nome_imovel("descricao")%></b>
                </td>
              </tr>
              <tr><td>&nbsp;</td></tr>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Despesa Extra:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Valor:
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <select name="despesa" style="width:140;background=#E8E8E8;">
                    <option value = ""></option>
                    <%set cbai=conn.execute("select * from despesa ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=cstr(despesa) then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>

                <td>
                  <input type="text" name="valor_despesa" value="<%=valor_despesa%>" label="valor" style="width:60;height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);">&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='1';document.form1.excluir.value=''">
                </td>
            <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Despesa Extra</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Valor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from gasto_extra where cod_imovel="&imovel&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set gasto=conn.execute("select * from despesa where codigo="&cbai("cod_despesa")&" order by descricao")%>
                  <%=gasto("descricao")%>
                <td align=center>
                  R$<%=formatnumber(cbai("valor"),2)%>
                </td>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='1';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
              </tr>
      </table>  
        <tr> 
          <td align=center>
            <br><input type="image" src="../img/ok.gif" value="submit" border=0>
          </td> 
        </tr>   
      </table>
            </table><br>
            
          </td>
        </tr>   
      </table>
    </td>
  </tr>
</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>