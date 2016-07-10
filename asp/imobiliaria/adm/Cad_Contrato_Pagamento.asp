<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
codigo=request("codigo")
pagina=request("pagina")
set contrato=conn.execute("select * from contrato where codigo="&codigo)
if request("flag") = 1 then
   pagamento  =trim(ucase(request("pagamento")))
   valor =trim(ucase(request("valor")))
   plano =trim(ucase(request("radio")))
   if not data_valida(pagamento,0) then 
      msg=msg&" Data de pagamento incorreta.<br>"
   end if
   if valor="" then
     msg=msg&" Valor.<br>"
   end if
   if plano="" then
     msg=msg&" Escolha o plano.<br>"
   end if
   if msg="" then
      conn.execute("insert into contas (origem,descricao,tipo,data,valor,cod_contrato,cod_tipo_conta,data_inclusao) values(1,'PGTO. CONTRATO Nº "&contrato("numero")&"',1,convert(datetime,'"&pagamento&"',103),"&replace(replace(csng(valor),".",""),",",".")&","&codigo&","&plano&",convert(datetime,'"&date()&"',103))")
      %>
      <script>
         alert('Cadastro efetuada com sucesso!');
         location.href="Main_Contrato_Pagamento.asp?codigo=<%=codigo%>";
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastra o pagamento do contrato siga os passos descrito abaixo.<br><br></b>
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
            &nbsp;&nbsp;<a href="Main_Contrato_Pagamento.asp?codigo=<%=codigo%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
         <tr>
          <td class="estilo" width=100%>
            <img src="../img/r_9.gif">&nbsp;CADASTRAR CONTRATO PAGAMENTO
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
           <%set cliente = conn.execute("select * from clientes where codigo="&contrato("cod_cliente"))%>
           <%=cliente("nome")%>
          </td>
        </tr>
        <tr>
          <td>
            <span class="estilo">Número:
          </td>
        </tr>
        <tr>
          <td>
            <%=contrato("numero")%>
          </td>
        </tr>
<tr>
 <td>
 <table cellspacing=0 cellpadding=0>
      <tr>
         <td>
           <span class="estilo">Imovel:
         </td>
      </tr>    
      <tr>
        <td>
           <%set cbai=conn.execute("select * from imoveis where status = 0 and codigo="&contrato("cod_imovel"))%>
           <%=cbai("descricao")%>
        </td>
      </tr>
      <tr>
         <td>
           <span class="estilo">Tipo do plano:
         </td>
      </tr>    
      <tr>
        <td>
           <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=20>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">&nbsp;Início&nbsp;</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">&nbsp;Quantidade&nbsp;</font></span>
                </td>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">&nbsp;Plano&nbsp;</font></span>
                </td>
                <td bgcolor=#AAAAAA a lign=center>
                  <span class="estilo"><font color="#FFFFFF">&nbsp;Valor&nbsp;</font></span>
                </td>
              </tr>
              <%set plano1=conn.execute("select * from perfil_contrato where cod_contrato="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not plano1.eof %>
              <tr>
                <%set subtrai = conn.execute("SELECT COUNT(cod_tipo_conta) as tipo_conta FROM (contas INNER JOIN  contrato ON contas.cod_contrato = contrato.codigo) WHERE contas.status=0 and contas.cod_contrato = "&codigo&" AND contas.cod_tipo_conta ="&plano1("cod_tipo_conta"))  %>
                <%quant = plano1("quantidade")%>
                <%subt  = subtrai("tipo_conta")%>
                <td align=center>
                  <%if quant>subt then%>
                  <input type="radio" name="radio" value="<%=plano1("cod_tipo_conta")%>">
                  <%end if%>
                </td>
                <td align=center>
                  <%=plano1("data_inicio")%>
                </td>
                <td align=center>
                  <%=quant-subt%>
                  <%quant = 0%>
                  <%subt  = 0%>  
                </td>
                <td>
                  <%set plano_nome=conn.execute("select * from tipo_conta where codigo="&plano1("cod_tipo_conta"))%>
                  <%=plano_nome("descricao")%>
                <td>
                  R$<%=formatnumber(plano1("valor"),2)%>
                  <%valor_contrato=valor_contrato+plano1("valor")*plano1("quantidade")%>
                </td>
              </tr>
              <%plano1.movenext%>
              <%loop%>
              
            </table>
        </td>
      </tr>
      <tr>
         <td>
           <span class="estilo">Data de pagamento:
         </td>
      </tr> 
      <tr>
         <td>
           <input type="text" name="pagamento" value="<%=pagamento%>" maxlength=10 label="inicio" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this)">
         </td>
      </tr>
      <tr>
         <td>
           <span class="estilo">Valor:
         </td>
      </tr> 
      <tr>
         <td>
           <input type="text" name="Valor" value="<%=Valor%>" label="inicio"  style="width:100; height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);">
         </td>
      </tr>
   </table>
     <tr> 
       <td align=center>
         <br><input type="image" src="../img/ok.gif" value="submit" border=0>
       </td>
     </tr>
  </td>
</tr>
   </table>  
  </table>
</td>
</tr>
</table><br><br><br><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>