<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
codigo=request("codigo")
numero=request("numero")
pagina=request("pagina")
codigo2=request("codigo2")%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <%set exibir=conn.execute("select * from contrato where codigo="&codigo)%>
          <%set cliente  = conn.execute("select * from clientes where codigo="&exibir("cod_cliente"))%>
          <%set corretor = conn.execute("select * from corretor where codigo="&exibir("cod_corretor"))%>
          <%set imovel   = conn.execute("select * from imoveis where codigo="&exibir("cod_imovel"))%>
          <%set fiador1  = conn.execute("select * from fiador where codigo="&exibir("cod_fiador1"))%>
          <%set servico_contrato  = conn.execute("select * from servico where codigo="&exibir("tipo_servico"))%>
          <table><tr><td></td></tr></table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE DO CONTRATO</B>
              </td>
              <td class="tb" align=right><a href="Imprimir_detalhe_contrato.asp?codigo=<%=codigo%>&cliente=<%=cliente("codigo")%>&pagina=detalhe_contrato&pagina2=<%=pagina%>"><img alt="Imprimir Contratos" src="../img/icone-imprimir.gif" border=0></a><a href="<%=pagina%>.asp?codigo=<%=codigo2%>&tipo=1"><img src="../img/bot_voltar.gif" border=0></a></td>
            </tr>
          </table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=150><b>NUMERO:</b></td>
              <td class="tb" colspan=3 ><%=exibir("numero")%></td>
            </tr>
            <tr>
              <td class="tb" ><b>CLIENTE:</b></td>
              <td class="tb" colspan=3><%=cliente("nome")%></td>
            </tr>
            <tr>
              <td class="tb" ><b>IMÓVEL:</b></td>
              <td class="tb" colspan=3><%=imovel("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" ><b>FIADOR 1:</b></td>
              <td class="tb" colspan=3><%=fiador1("nome")%></td>
            </tr>
            <% if exibir("cod_fiador2") <> 0 then %>
            <%set fiador2  = conn.execute("select * from fiador where codigo="&exibir("cod_fiador2"))%>
            <tr>
              <td class="tb" ><b>FIADOR 2:</b></td>
              <td class="tb" colspan=3><%=fiador2("nome")%></td>
            </tr>
            <% end if %>
            <tr colspan=2>
               <td class="tb" ><b>INICIO:</b></td>
               <td class="tb" ><%=exibir("data_inicio")%></td>
               <td class="tb" ><b>&nbsp;VENCIMENTO:</b></td>
               <td class="tb" width=235><%=exibir("data_vencimento")%></td>
             </tr>
             <tr>
               <td class="tb" ><b>REAJUSTE:</b></td>
               <td class="tb" ><%=exibir("reajuste")%></td>
               <td class="tb" ><b>&nbsp;VALOR:</b></td>
               <td class="tb" >R$ <%=formatnumber(exibir("valor"),2)%></td>
             </tr>
            <tr>
              <td class="tb" ><b>TAXA ADMINISTRATIVA:</b></td>
              <td class="tb"><%=exibir("taxa")%>%</td>
              <td class="tb" ><b>&nbsp;SERVIÇO:</b></td>
              <td class="tb" ><%=servico_contrato("descricao")%></td>
            </tr>
            <tr>
              <td class="tb"><b>MULTA POR ATRAZO:</b></td>
              <td class="tb"><%=exibir("multa")%>%</td>
              <td class="tb" ><b>&nbsp;INDICE DE REAJUSTE:</b></td>
              <td class="tb">
                <%set indice = conn.execute("select * from indice where codigo="&exibir("cod_indice"))%>
                <%=indice("descricao")%></td>
            </tr>
            <tr>
              <td class="tb" ><b>COMISSÃO CORRETOR:</b></td>
              <td class="tb" colspan=3><%=exibir("comissao")%>%</td>
            </tr>
          </table>
          <table border=0 cellspacing=0 cellpadding=0>
            <td class="tb" width=130><b>TIPO DE PLANO:</b></td>            
              <table width=250 cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
                <tr>
                  <td bgcolor=#AAAAAA align=center>
                    <span class="estilo"><font color="#FFFFFF">Quantidade</font></span>
                  </td>
                  <td bgcolor=#AAAAAA width=100%>
                    <span class="estilo"><font color="#FFFFFF">Plano</font></span>
                  </td>
                  <td bgcolor=#AAAAAA a lign=center>
                    <span class="estilo"><font color="#FFFFFF">Valor</font></span>
                  </td>
                </tr>
                <%set plano1=conn.execute("select * from perfil_contrato where cod_contrato="&codigo&" and status=0 ORDER BY codigo desc")%>
                <%do while not plano1.eof %>
                <tr>
                  <td align=center>
                    <%=plano1("quantidade")%>
                  </td>
                  <td>
                    <%set plano_nome=conn.execute("select * from tipo_conta where codigo="&plano1("cod_tipo_conta"))%>
                    <%=plano_nome("descricao")%>
                  <td align=center>
                    R$<%=formatnumber(plano1("valor"),2)%>
                  </td>
                </tr>
                <%plano1.movenext%>
                <%loop%>
               <table border=0>
               <tr><td></td></tr>
               <tr><td></td></tr>
               </table>
               <table>
                <tr>
                <%if session("tipo")<>"2"then%>
                  <td><b><a href="Detalhe_cliente.asp?codigo=<%=cliente("codigo")%>&codigo2=<%=codigo2%>&pagina=Main_clientes">CLIENTE</b></td>
                <%else%>
                  <td>&nbsp;</td>
                <%end if%>
                  <td><b><a href="Detalhe_Imovel.asp?codigo=<%=imovel("codigo")%>&pagina=Imoveis">IMÓVEL</b></td>
                </tr>
              </table>
         </td>
      </tr>
</table>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>