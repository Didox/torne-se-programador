<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
imovel=request("codigo")
pagina=request("pagina")
data=request("data")
reload=request("reload")
vencimento=request("vencimento")
midia=request("midia")
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 9
if midia <> "" then
   sql= " and codigo="&midia
end if
if request("flag")="1" then
imovel=request("imovel")
Verificador.close
Set Verificador = nothing

tipo_login=session("tipo_login")
login=session("login")
senha=session("senha")

if tipo_login="1" then
  tabela = "corretor"
else
  tabela = "clientes"
end if

set Verificador=conn.execute("select * from ["&tabela&"] where login='"&login&"' and senha='"&senha&"'")

If not Verificador.eof then
  nome = Verificador("nome")
  cpf = Verificador("cpf")
  endereco = Verificador("endereco") & " " & Verificador("numero") & " " & Verificador("complemento")
  bairro = Verificador("bairro")
  cidade = Verificador("cidade")
  estado = Verificador("estado")
  cep = Verificador("cep")
Else
  nome = "João Bolonha"
  cpf = "111.111.111-11"
  endereco = "Rua teste 117"
  bairro = "Santana"
  cidade = "São Paulo"
  estado = "SP"
  cep = "01001-001"
End If

'response.write nome & "<br>"
'response.write cpf & "<br>"
'response.write endereco & "<br>"
'response.write bairro & "<br>"
'response.write cidade & "<br>"
'response.write estado & "<br>"
'response.write cep & "<br>"
'response.end

Verificador.close
Set Verificador = nothing

Set cbai=conn.execute("select * from planos where codigo = "&request("midia")&"")

If not cbai.eof then
  valor = formatnumber(cbai("valor"),2)
Else
  valor = 123.45
End If

data_vcto = date + 5

  if request("tipo_pgto") = "hsbc" then
  %>
  <script>
    //window.open('../../boleto/cobrebemx/exemplos/ASP-Boleto-On-Line/exemplocbx.asp?cod_plano=<%=request("midia")%>','_blank','toolbar=yes,location=no,directories=no,status=no,menubar=yes,scrollbars=yes,resizable=yes,top=20,left=120,width=700,height=500');
    //window.open('http://cartao.locaweb.com.br/boleto/ficha2.comp?valor=<%=valor%>&banco=hsbc&agencia=1956&codigo_cedente=3423867&numdoc=2&conta=plenanet&sacado=<%=nome%>&cgccpfsac=<%=cpf%>&datadoc=<%=date%>&vencto=<%=data_vcto%>&instr1=ESTE+E+UM+BOLETO+DE+TESTE+NAO+PASSIVEL+DE+PAGAMENTO&instr2=SR+CAIXA+NAO+RECEBER+SOBRE+HIPOTESE+ALGUMA','boleto_hsbc','toolbar=yes,location=no,directories=no,status=no,menubar=yes,scrollbars=yes,resizable=yes,top=20,left=120,width=600,height=400');
  </script>
  <%
  elseif request("tipo_pgto") = "unibanco" then
  %>
  <script>
    //window.open('http://cartao.locaweb.com.br/boleto/ficha2.comp?valor=<%=valor%>&banco=unibanco&agencia=0208&codigo_cedente=2093111&numdoc=2&conta=plenanet-unibanco&sacado=<%=nome%>&cgccpfsac=<%=cpf%>&datadoc=<%=date%>&vencto=<%=data_vcto%>&instr1=ESTE+E+UM+BOLETO+DE+TESTE+NAO+PASSIVEL+DE+PAGAMENTO&instr2=SR+CAIXA+NAO+RECEBER+SOBRE+HIPOTESE+ALGUMA','boleto_unibanco','toolbar=yes,location=no,directories=no,status=no,menubar=yes,scrollbars=yes,resizable=yes,top=20,left=120,width=600,height=400');
  </script>
  <%
  elseif request("tipo_pgto") = "bb" then
  %>
  <script>

	window.open('http://comercio.locaweb.com.br/boleto/boleto.comp?valor=<%=valor%>&banco=bb&agencia=30740&codigo_bb=1055306&codigo_cedente=251348&numdoc=1&conta=plenanet-bb&sacado=<%=nome%>&cgccpfsac=<%=cpf%>&datadoc=<%=date%>&vencto=<%=data_vcto%>&instr1=Até+o+vencimento,+pagar+em+qualquer+agência+bancária','boleto_bb','toolbar=yes,location=no,directories=no,status=no,menubar=yes,scrollbars=yes,resizable=yes,top=20,left=120,width=600,height=400');
  </script>
  <%
  elseif request("tipo_pgto") = "trans" then
  %>
  <script>
    window.open('../../transf_bb.asp?imovel=<%=imovel%>','boleto_bb','toolbar=yes,location=yes,directories=no,status=no,menubar=yes,scrollbars=yes,resizable=yes,top=20,left=120,width=750,height=400');
  </script>
  <%
  end if
   if midia="" then
      msg=msg&" Plano.<br>"
   end if  
   if msg="" and reload = "" then
      conn.execute("insert into ativacao_plano (cod_plano, cod_imovel, data_inclusao ) values ("&midia&","&imovel&", convert(datetime,'"&date()&"',103))")
   %>
<script language="JavaScript">
function retorna(){
  top.window.location = "../../anuncie_imovel.asp?cod_pagina=984"
}
</script>
<table border="0" width="100%" height="100%" cellspacing="0" cellpadding="0" bgcolor="F4F2EA">
  <tr>
    <td>
     
      <table border="0" width=100%>
        <tr>
          <td align="center"><font face="verdana" size="2" color="red"><b>Cadastro efetuado com sucesso. Clique <a href="javascript:retorna()">aqui</a> para 
          visualizar sua lista de imóveis</b></font></td>
        </tr>
      </table> 
    </td>
  </tr>
</table>
   <%response.end
   end if
end if
itens.Open "select * from imoveis where codigo="&imovel&" ORDER BY descricao",conn
set exibir=conn.execute("SELECT  * FROM Planos WHERE status=0"&sql)
set planos = conn.execute("select * from ativacao_plano where cod_imovel= "&imovel&" and status=0 and data_efetivacao<>null")%>
<html>
<head>
<script>
function aviso_iframe(data,dias)
  {
  if (data.length==10)
     {
       var strData = new String(data);
       var dia = new String(strData.substr(0,2));
       var mes = new String(strData.substr(3,2));
       var ano = new String(strData.substr(6,4));
       if (dia.substr(0,1) == "0"){dia = dia.substr(1,1);}
       if (mes.substr(0,1) == "0"){mes = mes.substr(1,1);}
       var hoje=new Date(parseInt(ano),parseInt(mes-1),parseInt(dia),00,00,00);
       hoje.setDate(hoje.getDate() + parseInt(dias));
       dia = hoje.getDate();
       mes = hoje.getMonth()+1;
       ano = hoje.getFullYear();
       document.all['total'].innerHTML=dia+'/'+mes+'/'+ano;
       document.form10.vencimento.value=dia+'/'+mes+'/'+ano;
     }
   else
     {
       document.all['total'].innerHTML='';
       document.form10.vencimento.value='';
     }
  }

function aceitacont(){
  if (document.form10.aceita_contrato.checked){
     document.form10.tipo_pgto[0].disabled = false;
     document.form10.tipo_pgto[1].disabled = false;
  }
  else{
     document.form10.tipo_pgto[0].disabled = true;
     document.form10.tipo_pgto[1].disabled = true;
  }
}

function subform(){
  if (document.form10.midia(0).checked == false && document.form10.midia(1).checked == false && document.form10.midia(2).checked == false){
    alert("Selecione o Plano desejado");
  }
  else if (document.form10.aceita_contrato.checked == false){
    alert("É necessário aceitar o contrato primeiramente antes de finalizar o cadastro.");
  }
  else if (document.form10.tipo_pgto.checked == false){
    alert("Selecione a opção Gerar Boleto antes de finalizar o cadastro");
  }
  else{
    document.form10.submit();
  }
}
</script>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#F4F2EA" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="600" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td>
    <!--#INCLUDE FILE ="Main_Topo.asp"-->
    <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&imovel=<%=imovel%><%if request("str") = "cad" then%>&str=cad<%end if%>" name="form10">
    <input type="hidden" name="reload">
       <table width="99%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
          <td><table width=99% border=0 align="center" cellpadding="0" cellspacing="0" class="tabela002">
            <tr>
              <td height="6" colspan="2" class="tabela001"><img src="../../imagens/white.jpg" width="1" height="5"></td>
            </tr>
            <tr> 
              <td width=20><img src="../img/r_14.gif"></td>
              <td class="tb"><B>CADASTRAR PLANO DE MÍDIA</B>&nbsp;</td>
            </tr>
          </table>  </td>
		  </tr></table>
	  <table  cellspacing="0" cellpadding="5" border="0">
        <tr>
          <td colspan="2">
            <%If request("str") = "cad" then%>
          
            <%End If%>
          </td>
        </tr>
        <tr>
           <td class="tb" width=130><b>PLANO:</b></td>
        </tr>
        <tr>
           <td>
            <%set cbai=conn.execute("select * from planos where status=0 ORDER BY titulo")%>
              <%do while not cbai.eof %>
                  <input type=radio name="midia" value=<%=cbai("codigo")%>><%if cbai("imagem") <> "" then%><img src="../../imagens/<%=cbai("imagem")%>" border="0">&nbsp;<%end if%> <%=cbai("titulo")%> (<%=cbai("descricao")%> ) Valor: R$ <%=formatnumber(cbai("valor"),2)%><br>
               <%cbai.movenext%>
              <%loop%>
            
           <td>
        </tr>
       
      <%contrato = conn.execute("Select descricao from contrato_site")%>
        <tr>
          <td class="tb" width=130><b>CONTRATO:</b></td>
        </tr>
        <tr>
           <td class="tb">
           <textarea name="contrato" cols="70" rows="15" readonly><%=contrato("descricao")%></textarea><br>
           <input type="checkbox" name="aceita_contrato" value="S" onClick="aceitacont();"> Aceito o contrato e estou de acordo com todos seus termos.
           </td>
        </tr>
        <tr>
           <td class="tb" width=130>&nbsp;</td>
        </tr>
        <tr>
           <td class="tb" width=200><b>FORMA DE PAGAMENTO:</b></td>
        </tr>
        <tr>
           <td>
             <table width="100%" cellspacing="0" cellpadding="0" border="0">
               <tr>
                 <td  class="tb">
                   <img src="../../Imagens/bancos/001.jpg" width="77" height="35"><br>
                   <input type="radio" name="tipo_pgto" value="bb" disabled> Gerar Boleto
                 </td>
                 <td  class="tb">
                   <img src="../../Imagens/bancos/001.jpg" width="77" height="35"><br>
                   <input type="radio" name="tipo_pgto" value="trans" disabled> Transferência Eletrônica
                 </td>
               </tr>
             </table>
           </td>
        </tr>
        <tr>
          <td class="tb">
            <b> A exibição do seu imóvel em nosso site será liberada após a confirmação de pagamento do boleto acima escolhido.</b>
          </td>
        </tr>
        <tr><td align="center"><br><img src="../../imagens/valores.gif"></td></tr>
         <tr> 
           <td align=center>
           <a href="javascript:subform()"><img src="../../imagens/botoes/GRAVAR1.gif" value="submit" border=0></a>
           </td>
         </tr>   
      </table>  
     </td>
   </tr>
  </table>
</td>
</tr>
</table>

</body>
</html>