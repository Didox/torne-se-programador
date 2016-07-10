<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
codigo=request("codigo")
codigo2=request("codigo2")
ordem=request("ordem")
ordem2=request("ordem2")
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3  
itens.Open "select * from clientes where codigo ="&codigo,conn
set contrato = conn.execute("select * from contrato where cod_cliente="&codigo&" order by numero")
Set conta = Server.CreateObject( "ADODB.Recordset" ) 
if ordem="" then
   ordem="contas.codigo"
end if
if pesquisa<>"" then
   if opcao="1" then
       sql= sql&" and tipo_conta.descricao like '%"&pesquisa&"%'"
   else
     if data_valida(pesquisa,0) then 
       sql= sql&" and contas.data = convert(datetime,'"&pesquisa&"',103) "
     end if
   end if
end if
conta.Open "SELECT contas.codigo as cod_conta,contrato.numero as numero,contas.cod_tipo_conta as plano ,contrato.cod_imovel as imovel,contas.data as data,contas.cod_tipo_conta as cod_plano,contas.valor as valor,contrato.cod_cliente as cliente FROM (contas INNER JOIN contrato ON contas.cod_contrato=contrato.codigo)INNER JOIN tipo_conta ON tipo_conta.codigo=contas.cod_tipo_conta WHERE contas.status=0 and contrato.codigo="&codigo2&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br>
<table width=90% align="center" bgcolor="white">  <tr>
    <td>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td>
            <a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table class="navdroplist" width=100% align="center" bgcolor="#f7f7f7">
        <tr>
          <td class="navdroplist" align=center>
            <B>RELATÓRIO CONTRATOS
            </B>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <tr>
          <td width=30% class="navdroplist">
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td class="navdroplist">
             HORA DA SOLICITAÇÃO:&nbsp<b><%=time()%></b>
          </td>
          <td class="navdroplist">
            CONTRATOS ENCONTRADOS:&nbsp;<b><%=itens.recordcount%></b>
          </td>
        </tr>
      </table>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td><hr></td>
        </tr>
      </table>
      <br>
         <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;CLIENTE:</b></td>
              <td class="navdroplist" colspan=5><%=itens("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;ENDEREÇO:</b></td>
              <td class="navdroplist" colspan=5><%=itens("endereco")%>&nbsp;-&nbsp; <%=itens("numero")%> &nbsp;-&nbsp;<%=itens("complemento")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;BAIRRO:</b></td>
              <td class="navdroplist"><%=itens("bairro")%></td>
              <td class="navdroplist" width=105><b>&nbsp;CIDADE:</b></td>
              <td class="navdroplist"><%=itens("cidade")%></td>
              <td class="navdroplist" width=60><b>&nbsp;ESTADO:</b></td>
              <td class="navdroplist"><%=itens("estado")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;CEP:</b></td>
              <td class="navdroplist"><%=itens("cep")%></td>
              <td class="navdroplist" width=105><b>&nbsp;TELEFONE:</b></td>
              <td class="navdroplist">(<%=itens("ddd_fone")%>)<%=itens("fone")%></td>
              <td class="navdroplist" width=60><b>&nbsp;CELULAR:</b></td>
              <td class="navdroplist">(<%=itens("ddd_cel")%>)<%=itens("celular")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;CPF:</b></td>
              <td class="navdroplist" colspan=5><%=itens("cpf")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;IDENTIDADE:</b></td>
              <td class="navdroplist"><%=itens("identidade")%></td>
              <td class="navdroplist" width=105><b>&nbsp;ORGÃO EMISSOR:</b></td>
              <td class="navdroplist"><%=itens("orgao_emissor")%></td>
              <td class="navdroplist" width=105><b>&nbsp;DATA EMISSÃO:</b></td>
              <td class="navdroplist"><%=itens("data_emissao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;BANCO:</b></td>
              <td class="navdroplist">
                 <%set bancos=conn.execute("select * from bancos where codigo="&itens("cod_banco"))%>
                 <%=bancos("descricao")%>
              </td>
              <td class="navdroplist" width=105><b>&nbsp;AGÊNCIA:</b></td>
              <td class="navdroplist"><%=itens("agencia")%></td>
              <td class="navdroplist" width=60><b>&nbsp;CONTA:</b></td>
              <td class="navdroplist"><%=itens("conta")%></td>
            </tr>
            <tr>
            <%if itens("renda_extra") >0 then%>
              <td class="navdroplist" width=60><b>&nbsp;RENDA:</b></td>
              <td class="navdroplist">R$ <%=formatnumber(itens("renda"),2)%></td>
              <td class="navdroplist" width=105><b>&nbsp;RENDA EXTRA:</b></td>
              <td class="navdroplist">R$ <%=formatnumber(itens("renda_extra"),2)%></td>
            <%else%>
              <td class="navdroplist" width=60><b>&nbsp;RENDA:</b></td>
              <td class="navdroplist" colspan=3>R$ <%=formatnumber(itens("renda"),2)%></td>
            <%end if%>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;EMPRESA QUE TRABALHA:</b></td>
              <td class="navdroplist"><%=itens("empresa")%></td>
              <td class="navdroplist" width=60><b>&nbsp;PROFISSÃO:</b></td>
              <td class="navdroplist"><%=itens("profissao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;CARGO:</b></td>
              <td class="navdroplist"><%=itens("cargo")%></td>
              <td class="navdroplist" width=105><b>&nbsp;DATA ADMISSÃO:</b></td>
              <td class="navdroplist"><%=itens("data_admissao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;E-MAIL:</b></td>
              <td class="navdroplist" colspan=5><%=itens("email")%></td>
            </tr>
            <tr>
              <%if tipo_imovel<0 then%>
                <td class="navdroplist" width=105><b>&nbsp;DATA INCLUSÃO:</b></td>
                <td class="navdroplist"><%=itens("data_inclusao")%></td>
                <td class="navdroplist" width=105><b>&nbsp;TIPO IMÓVEL:</b></td>
              <%set tipo = conn.execute("select * from tipo_imovel_cliente where codigo="&itens("tipo_imovel"))%>
                <td class="navdroplist" colspan=3><%=tipo("descricao")%></td>
              <%else%>
                <td class="navdroplist" width=105><b>&nbsp;DATA INCLUSÃO:</b></td>
                <td class="navdroplist" colspan=5><%=itens("data_inclusao")%></td>
              <%end if%>
            </tr>
          </table>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%If contrato.EOF = true then%>
        <tr>
          <td align=center></td>
          <td  width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tr>
        </table>
        <%else%>
       <tr>
         <td colspan=4>&nbsp;</td>
       </tr>
       <tr>
         <td colspan=4>&nbsp;</td>
       </tr>
       <tr>
         <td class="navdroplist" colspan=11><b>CONTRATOS DESTE CLIENTE</b></td>
       </tr>
       <tr>
         <td colspan=4>&nbsp;</td>
       </tr>
       <%do While Not contrato.EOF%>
            <tr>
              <td class="navdroplist" width=60><b>NÚMERO:</b></td>
              <td class="navdroplist" colspan=3><%=contrato("numero")%></td>
              <td class="navdroplist" width=60><b>CORRETOR:</b></td>
              <%set corretor = conn.execute("select nome from corretor where codigo="&contrato("cod_corretor"))%>
              <td class="navdroplist" colspan=3><%=corretor("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>IMÓVEL:</b></td>
              <%set imovel = conn.execute("select descricao from imoveis where codigo="&contrato("cod_imovel"))%>
              <td class="navdroplist" colspan=3><%=imovel("descricao")%></td>
              <td class="navdroplist" width=60><b>VALOR:</b></td>
              <td class="navdroplist" colspan=3><%=formatnumber(contrato("valor"),2)%></td>
            </tr>
            <tr>
              <td bgcolor=#CCCCCC colspan=8 height=1></td>
            </tr>
            <tr>
              <td colspan=4></td>
            </tr>
            <%cont=cont+1
             contrato.movenext
            loop%>
    <%end if%>
    </table>
    <table>
      <tr>
        <td class="navdroplist"><u><b>PAGAMENTOS DO CLIENTE:</b></u></td>
      </tr>
    </table>
    <table width=100% border=1 cellspacing="0" cellpadding="0">
      <tr>
        <td class="navdroplist"><b>TIPO</b></td>
        <td class="navdroplist" align="center"><b>DATA</b></td>
        <td class="navdroplist" align="center"><b>VALOR</b></td>
      </tr>
      <tr>
      <%do While Not conta.EOF%>
      <%set cbai=conn.execute("select * from tipo_conta where status = 0 and codigo="&conta("plano"))%>
      </td>
        <td class="navdroplist"><%=cbai("descricao")%></td>
        <td class="navdroplist" align="center"><%=conta("data")%></td>
        <td class="navdroplist" align="center">R$ <%=formatnumber(conta("valor"),2)%></td>
      </tr>
      <%conta.movenext
      loop%>
      <tr>
        <td class="navdroplist"><b>&nbsp;</b></td>
        <td class="navdroplist" align=left><b>TOTAL</b></td>
        <%set valor = conn.execute("SELECT SUM(valor) AS total FROM contas WHERE status = 0 AND cod_contrato="&codigo2)%>
        <td class="navdroplist" align="center"><b>R$ <%=formatnumber(valor("total"),2)%></b></td>
      </tr>
    </table>
    <br>
    <center><a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><font class="navdroplist">&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>