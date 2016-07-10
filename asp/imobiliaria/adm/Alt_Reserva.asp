<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
pagina=request("pagina")
if request("flag") <> 1 then
   set Reserva=conn.execute("select * from Reserva where codigo="&codigo)
   nome=Reserva("nome")
   ddd=Reserva("ddd")
   fone=Reserva("fone")
   data=data_completa(Reserva("data"))
   validade=data_completa(Reserva("validade"))
   corretor=Reserva("cod_corretor")
   imovel=Reserva("cod_imovel")
else
   nome=replace(trim(ucase(request("nome"))),"'","")
   ddd=trim(ucase(request("ddd")))
   fone=trim(ucase(request("fone")))
   data=trim(ucase(request("data")))
   validade=trim(ucase(request("validade")))
   corretor=trim(ucase(request("corretor")))
   imovel=trim(ucase(request("imovel")))
   if nome<>"" then
      set verifica_nome=conn.execute("select * from Reserva where nome='"&nome&"' and codigo<>"&codigo)
      if not verifica_nome.eof then
         msg=msg&" Reserva já existe<br>"
      end if
   else
      msg=msg&" Reserva.<br>"
   end if
   if nome="" then
      msg=msg&"Nome.<br>"
   end if
   if imovel="" then
      msg=msg&"Imovel.<br>"
   end if
   if corretor="" then
      msg=msg&"Corretor.<br>"
   end if
   if not data_valida(data,0) then 
      msg = msg & "Data.<br>"
   end if
   if not data_valida(validade,0) then 
      msg = msg & "Validade.<br>"
   end if
   if len(fone) < 8 then
      msg=msg&"Telefone Inválido.<br>"
   end if
   if fone="" or DDD="" then
      msg=msg&"DDD/Telefone.<br>"
   end if     
   if msg="" then
      conn.execute("update Reserva set nome='"&nome&"',data=convert(datetime,'"&data&"',103),validade=convert(datetime,'"&validade&"',103) , ddd="&ddd&" , fone="&fone&"  , cod_corretor='"&corretor&"' , cod_imovel='"&imovel&"' where codigo="&codigo)%>
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.nome.focus()">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&codigo=<%=codigo%>" name="form1">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para alterar uma reserva siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento dos campos obrigatórios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/helpicon.gif" border=0>&nbsp;&nbsp;Campo com ajuda &nbsp;&nbsp;<br>
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
            <img src="../img/r_14.gif">&nbsp;ALTERAR RESERVA
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
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
           <table cellspacing=0 cellpadding=0>
              <tr>
                 <td>
                   <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Imovel:
                 </td>
              </tr>    
              <tr>
                <td>
                   <select name="imovel" style="background=#E8E8E8;">
                    <option value = ""></option>                    
                    <%set cbai=conn.execute("select * from imoveis ORDER BY descricao")%>
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
                <td width=140>
                 <img src="../img/obrigacao.gif"> <span class="estilo">Data:
                </td>
                <td width=140>
                 <img src="../img/obrigacao.gif"> <span class="estilo">Validade:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="data" value="<%=data%>"  maxlength=10 onkeypress="Numero();DATA(this)" label="data" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this);">&nbsp;
                </td>
                <td>
                  <input type="text" name="validade" value="<%=validade%>" maxlength=10 onkeypress="Numero();DATA(this)" label="validade" style="width:86; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this);">
                </td>
              </td>
            </table>
          </td>
        </tr>       
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td width=140>
                 <img src="../img/obrigacao.gif"> <span class="estilo">DDD/Fone:
                </td>
              </tr>
              <tr>
                <td>
                  <input type="text" name="ddd" value="<%=ddd%>"  maxlength=2 label="ddd" onkeypress="Numero()" style="width:26; height:17; background=#E8E8E8;">&nbsp;
                  <input type="text" name="fone" value="<%=fone%>" maxlength=30 label="fone" style="width:86; height:17; background=#E8E8E8;">
                </td>
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
</table><br><br><br><br><br><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>

