<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
codigo=request("codigo")
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3  
itens.open "select * from equipe where codigo = "&codigo,conn
set exibir = conn.execute("select * from corretor where cod_equipe="&codigo&" and codigo = "&itens("cod_supervisor"))%>
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
            <B>RELATÓRIO EQUIPE
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
         <%if not exibir.eof=true then%>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;EQUIPE:</b></td>
              <td class="navdroplist" colspan=5><%=itens("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;NOME:</b></td>
              <td class="navdroplist" colspan=5><%=exibir("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;ENDEREÇO:</b></td>
              <td class="navdroplist" colspan=5><%=exibir("endereco")%>&nbsp;-&nbsp; <%=exibir("numero")%> &nbsp;-&nbsp;<%=exibir("complemento")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;BAIRRO:</b></td>
              <td class="navdroplist"><%=exibir("bairro")%></td>
              <td class="navdroplist" width=60><b>&nbsp;CIDADE:</b></td>
              <td class="navdroplist" colspan=3><%=exibir("cidade")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;ESTADO:</b></td>
              <td class="navdroplist"><%=exibir("estado")%></td>
              <td class="navdroplist" width=60><b>&nbsp;CEP:</b></td>
              <td class="navdroplist" colspan=3><%=exibir("cep")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;TELEFONE:</b></td>
              <td class="navdroplist">(<%=exibir("ddd_fone")%>)<%=exibir("fone")%></td>
              <td class="navdroplist" width=60><b>&nbsp;CELULAR:</b></td>
              <td class="navdroplist" colspan=3>(<%=exibir("ddd_cel")%>)<%=exibir("celular")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;CPF:</b></td>
              <td class="navdroplist" colspan=5><%=exibir("cpf")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;IDENTIDADE:</b></td>
              <td class="navdroplist"><%=exibir("identidade")%></td>
              <td class="navdroplist" width=110><b>&nbsp;ORGÃO EMISSOR:</b></td>
              <td class="navdroplist"><%=exibir("orgao_emissor")%></td>
              <td class="navdroplist" width=110><b>&nbsp;DATA EMISSÃO:</b></td>
              <td class="navdroplist"><%=exibir("data_emissao")%></td>
              </td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;E-MAIL:</b></td>
              <td class="navdroplist" colspan=5><%=exibir("email")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;CRECI:</b></td>
              <td class="navdroplist"><%=exibir("creci")%></td>
              <td class="navdroplist" width=60><b>&nbsp;UNIDADE:</b></td>
              <%set unidade = conn.execute("select descricao from unidade where codigo="&exibir("cod_unidade"))%>
              <td class="navdroplist" colspan=3><%=unidade("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;LOGIN:</b></td>
              <td class="navdroplist" colspan=5><%=exibir("login")%></td>
            </tr>
          </table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=130><b>&nbsp;DATA INCLUSÃO:</b></td>
              <td class="navdroplist"><%=exibir("data_inclusao")%></td>
            </tr>
          </table>
          <%else%>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td align=center class="navdroplist"></td>
              <td  width=100%  class="navdroplist"><b>NÃO HÁ SUPERVISOR CADASTRADO PARA ESSA EQUIPE!</b></td>
              <td align=center class="navdroplist"></td>
            </tr>
          </table>
          <%end if%>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0>
       <tr>
         <td colspan=11><br></td>
       </tr>
       <tr>
         <td colspan=3>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist"><B><u>CORRETORES DA EQUIPE:</u></B></td>
            </tr>
          </table>  
         </td>
       </tr>
          <%set corretores=conn.execute ("select * from corretor where cod_equipe="&codigo&" and codigo<>"&itens("cod_supervisor"))%>
             <tr>
              <td align=left><font color=#FFFFFF class="navdroplist"><b>NOME</b></td>
              <td align=center><font color=#FFFFFF class="navdroplist"><b>CONTRATOS</b></td>
              <td align=center><font color=#FFFFFF class="navdroplist"><b>DATA DE CADASTRO</b></td>
            </tr>
             <%If corretores.EOF = true then%>
               <tr>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8 class="navdroplist">NÃO HÁ REGISTROS CADASTRADOS.</td>
                 <td bgcolor=#D8DCD8></td>
               </tr>
            <%else
               do While Not corretores.EOF%>
                  <tr>
                    <td class="navdroplist"><%=corretores("nome")%></td>
                    <td class="navdroplist" align=center>
                      <%set contador=conn.execute("select count(codigo) as total from contrato where cod_corretor="&corretores("Codigo")&" and status=0")%>
                      <%=contador("total")%>
                    </td>
                    <td class="navdroplist" align=center><%=corretores("data_inclusao")%></td>
                  </tr>
                  <%cont=cont+1%>
                  <%corretores.movenext%>
               <%loop%>
            <%end if%>
    </table>
    <br>
    <center><a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><font class="navdroplist">&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>