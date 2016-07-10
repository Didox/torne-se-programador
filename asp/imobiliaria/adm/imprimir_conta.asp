<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pesquisa=replace(trim(request("pesquisa")),"'","")
pagina=request("pagina")
radio=request("radio")
opcao=request("opcao")
box=request("deletar")
exibir=request("exibir")
ordem=request("ordem")
ordem2=request("ordem2")
if box <> "" then
   conn.Execute ("update contas set status=1 where codigo IN ("&box&")")
end if
currentPage = Request( "currentPage" )
Set contador = Server.CreateObject( "ADODB.Recordset" )
contador.activeConnection = conn
contador.CursorType = adOpenStatic
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 9
if ordem="" then
   ordem="contas.data"
end if
if pesquisa<>"" then
  if radio = "1" then 
    sql=" and contas.descricao like '%"&pesquisa&"%' "
  else
    if radio = "2" then
      sql=" and tipo_conta.descricao like '%"&pesquisa&"%' "
    else
      if isdate(pesquisa) and len(pesquisa)=10 then
         sql=" and contas.data = convert(datetime,'"&pesquisa&"',103)"
      end if
    end if
  end if
end if
if exibir<>"0" then
   if exibir="" then
      exibir=month(date())&"/"&year(date())
   end if
   sql=sql&" and datepart(month,contas.data)='"&month(exibir)&"'"
end if
itens.Open "select contas.numero as numero,contas.codigo as codigo,contas.tipo as tipo,contas.descricao as descricao,tipo_conta.descricao as tipo_conta,contas.data as data,contas.valor as valor from contas INNER JOIN tipo_conta ON contas.cod_tipo_conta=tipo_conta.codigo where contas.status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn
%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="10" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br><br>
<table width=90% align="center" bgcolor="white">
  <tr>
    <td class="navdroplist">
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td class="navdroplist">
            <a href="<%=pagina%>.asp?contrario=<%=contrario%>&codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO CONTA(S)</B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        
        <tr>
          
          <td class="navdroplist">
             SOLICITANTE:&nbsp<b><%=verificador("nome")%></b>
          </td>
        </tr>
        <tr>
          <td class="navdroplist"  width=30%>
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td class="navdroplist">
             HORA:&nbsp<b><%=time()%></b>
          </td>
          <td class="navdroplist">
           QUANTIDADE DE REGISTRO:&nbsp<b><%=itens.recordcount%></b>
          </td>
          
        </tr>
       
      </table>
      <br>
      <hr>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
        <%else%>
         <tr>
           <td class="navdroplist" align=center><b>NÚMERO:</b></td>
           <td class="navdroplist"><b>DESCRIÇÃO:</b></td>
           <td class="navdroplist"><b>TIPO CONTA:</b></td>
           <td class="navdroplist"><b>DATA:</b></td>
           <td class="navdroplist" align=center><b>VALOR:</b></td>
         </tr>
       <tr><td class="navdroplist"><br></td></tr>
       <%do while not itens.eof%>
       <tr>
         <td class="navdroplist" align=center><%=itens("numero")%></td>       
         <td class="navdroplist"><%=itens("descricao")%></td>
         <td class="navdroplist"><%=itens("tipo_conta")%></td>
         <td class="navdroplist"><%=itens("data")%></td>
         <%if itens("tipo")=1 then%>
         <td class="navdroplist"  align=center><font color="#0000FF">R$ <%=formatnumber(itens("valor"),2)%></td>
         <%valor=valor+itens("valor")%>
         <%else%>
         <td class="navdroplist" align=center><font color="#FF0000">R$ <%=formatnumber(itens("valor"),2)%></td>
         <%valor=valor-itens("valor")%>
         <%end if%>
       </tr>
      <%itens.MoveNext
       loop%>
       <tr>
          <td class="navdroplist">&nbsp;</td>
          <td class="navdroplist">&nbsp;</td>
          <td class="navdroplist">&nbsp;</td>
          <td class="navdroplist"><b>SALDO</b></td>
          <td class="navdroplist" align=center><b>R$ <%=formatnumber(valor,2)%></b></td>
       </tr>
       
    <tr>
      <td class="navdroplist">&nbsp;</td>
      <td class="navdroplist">&nbsp;</td>
      <td class="navdroplist">&nbsp;</td>
      <td class="navdroplist">&nbsp;</td>
      <td class="navdroplist">&nbsp;</td>
      <td class="navdroplist">&nbsp;</td>
    </tr>
    </table>
    <%end if%>
    <br>
    <center><a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>