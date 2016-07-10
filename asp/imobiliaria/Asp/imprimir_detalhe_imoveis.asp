<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
codigo=request("codigo")
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3  
itens.Open "select * from imoveis where codigo ="&codigo,conn%>
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
            <a href="<%=pagina%>.asp?codigo=<%=codigo%>&pagina=imoveis"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>IMPRESSÃO IMOVEL</B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
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
        <table width=100% border=0 cellspacing="1" cellpadding="0">
          <%do while not itens.eof%>
            <tr>
              <td class="navdroplist" width=17%><b>ENDEREÇO:</b></td>
              <td class="navdroplist" colspan=3><%=itens("endereco")%></td>
            </tr>
            <tr>
              <td class="navdroplist"><b>NUMERO:</b></td>
              <td class="navdroplist"><%=itens("numero")%></td>
            </tr>
            <tr>
              <td class="navdroplist" ><b>COMPLEMENTO:</b></td>
              <td class="navdroplist"><%=itens("complemento")%></td>
            </tr>
            <tr>
              <td class="navdroplist" ><b>BAIRRO:</b></td>
              <td class="navdroplist">
              <%set bairro = conn.execute("select * from bairro where codigo = "&itens("cod_bairro"))%>
              <%=bairro("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" ><b>CIDADE:</b></td>
              <td class="navdroplist">
              <%set cidade = conn.execute("select * from cidade where codigo = "&itens("cod_cidade"))%>
              <%=cidade("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" ><b>ESTADO:</b></td>
              <td class="navdroplist">
              <%set estado = conn.execute("select * from estado where codigo = "&itens("cod_estado"))%>
              <%=estado("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" ><b>VALOR R$:</b></td>
              <td class="navdroplist">
                <%=formatnumber(itens("valor_imovel"),2)%>
              </td>
            </tr>
            <tr>
              <td class="navdroplist" ><b>IDADE IMÓVEL:</b></td>
              <td class="navdroplist">
                <%=itens("idade")%> &nbsp;ano(s)
              </td>
            </tr>
            <tr>
              <td class="navdroplist" ><b>VAGAS GARAGEM:</b></td>
              <td class="navdroplist">
                <%=itens("garagem")%>
              </td>
            </tr>
            <tr>
              <td class="navdroplist" ><b>DIFERÊNCIAL:</b></td>
              <td class="navdroplist">
              <%set obra = conn.execute("select * from estagios_obra where codigo = "&itens("cod_estagios_obra"))%>
              <%=obra("descricao")%></td>
            </tr>
            <tr>
            <td class="navdroplist" width=130 colspan=2><b>INFRAESTRUTURA:</b>            
            <table width=250 cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="navdroplist"><font color="#FFFFFF">DESCRIÇÃO</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_empreendimento where cod_imovel="&itens("codigo")&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td class="navdroplist">
                  <%set empreendimento=conn.execute("select * from tipo_empreendimento where codigo="&cbai("cod_empreendimento"))%>
                  <%=empreendimento("descricao")%>
              </tr>
              <%cbai.movenext%>
              <%loop%>
              </tr>
                <table width=250 cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
                <tr>
                  <td class="navdroplist" width=130><b>LAZER:</b></td>
                </tr>
                <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <SPAN CLASS="NAVDROPLIST"><FONT COLOR="#FFFFFF">DESCRIÇÃO</FONT></SPAN>
                </td>
                </tr>
                <%set cbai=conn.execute("select * from perfil_lazer where cod_imovel="&itens("codigo")&" and status=0 ORDER BY codigo desc")%>
                <%do while not cbai.eof %>
                <tr>
                <td class="navdroplist">
                  <%set lazer_nome=conn.execute("select * from lazer where codigo="&cbai("cod_lazer"))%>
                  <%=lazer_nome("descricao")%>
                </td>
                </tr>
                <%cbai.movenext%>
              <%loop%>
             </table>
             <table cellspacing=0 cellpadding=0>
            <td class="navdroplist" width=130><b>SEGURANÇA:</b></td>            
            <table width=250 cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="navdroplist"><font color="#FFFFFF">DESCRIÇÃO</font></span>
                </td>
              </tr>
                <%set cbai=conn.execute("select * from perfil_seguranca where cod_imovel="&itens("codigo")&" and status=0 ORDER BY codigo desc")%>
                <%do while not cbai.eof %>
                <tr>
                <td class="navdroplist">
                  <%set seguranca_nome=conn.execute("select * from seguranca where codigo="&cbai("cod_seguranca"))%>
                  <%=seguranca_nome("descricao")%>
                </td>
                </tr>
                <%cbai.movenext%>
              <%loop%>
             </table>
             <table width=250 cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
               <tr>
                 <td class="navdroplist">
                    <b>TAMANHO DO CONJUNTO</b>
                 </td>
               </tr>
               <tr>
                 <td class="navdroplist">
                  <%set metragem=conn.execute("select * from metragem where codigo="&itens("cod_metragem"))%>
                  <%=metragem("descricao")%> m²
                 </td>
               </tr>
             </table>
             <table width=250 cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
               <tr>
                 <td class="navdroplist">
                    <b>OBSERVAÇÃO</b>
                 </td>
               </tr>
               <tr>
                 <td class="navdroplist">
                  <%=ucase(itens("observacao"))%>
                 </td>
               </tr>
             </table>
              </td>
             </tr>
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            <%itens.movenext
            loop%>
          </table>
     <%end if%>
    <br>
    <center><a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>