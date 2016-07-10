<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
codigo=request("codigo")
numero=request("numero")
pagina=request("pagina")
pagina2=request("pagina2")
codigo2=request("codigo2")

currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3  
itens.PageSize = 9

itens.Open "SELECT contrato.*, corretor.nome as corretor,fiador.nome as fiador1, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, contrato.status AS status FROM (((((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo)INNER JOIN fiador ON contrato.cod_fiador1 = fiador.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN corretor ON contrato.cod_corretor = corretor.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) where contrato.status=0 and contrato.codigo="&codigo,conn%>
<%set exibir=conn.execute("select * from contrato where codigo="&codigo)%>
<%set cliente  = conn.execute("select * from clientes where codigo="&exibir("cod_cliente"))%>
<%set corretor = conn.execute("select * from corretor where codigo="&exibir("cod_corretor"))%>
<%set imovel   = conn.execute("select * from imoveis where codigo="&exibir("cod_imovel"))%>
<%set fiador1  = conn.execute("select * from fiador where codigo="&exibir("cod_fiador1"))%>
<%set servico_contrato  = conn.execute("select * from servico where codigo="&exibir("tipo_servico"))%>
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
            <a href="<%=pagina%>.asp?codigo=<%=codigo%>&pagina=<%=pagina2%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table class="navdroplist" width=100% align="center" bgcolor="#f7f7f7">
        <tr>
          <td class="navdroplist" align=center>
            <B>IMPRESSÃO CONTRATO
            </B>
          </td>
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
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td  width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
        <%else%>
           <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=19%><b>NUMERO DO CONTRATO:</b></td>
              <td class="navdroplist" ><%=exibir("numero")%></td>
            </tr>
            <tr>
              <td heigth=2></td>
            </tr>
           </table>
           <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=10%><b>CLIENTE:</b></td>
              <td class="navdroplist" colspan=3><%=cliente("nome")%></td>
            </tr>
            <tr>
              <td heigth=2></td>
            </tr>
            <tr>   
              <td class="navdroplist"><b>CORRETOR:</b></td>
              <td class="navdroplist" colspan=3><%=corretor("nome")%></td>
           </tr>
           <tr>
              <td heigth=2></td>
            </tr>
            <tr>
              <td class="navdroplist"><b>IMÓVEL:</b></td>
              <td class="navdroplist" colspan=3><%=imovel("descricao")%></td>
            </tr>
            <tr>
              <td heigth=2></td>
            </tr>
            <tr>   
              <td class="navdroplist"><b>FIADOR 1:</b></td>
              <td class="navdroplist" colspan=3><%=fiador1("nome")%></td>
            </tr>
            <tr>
              <td heigth=2></td>
            </tr>            
            <%if exibir("cod_fiador2") <> 0 then %>
            <%set fiador2  = conn.execute("select * from fiador where codigo="&exibir("cod_fiador2"))%>
            <tr>
              <td class="navdroplist"><b>FIADOR 2:</b></td>
              <td class="navdroplist"><%=fiador2("nome")%></td>
            </tr>
            <tr>
              <td heigth=2></td>
            </tr>
            <tr>
              <td class="tb"><b>CHAVE:</b></td>
              <td class="tb" colspan=3>
                <%set chave = conn.execute("select cod_quadro from registro_chave  where codigo="&exibir("cod_chave_imovel"))%>
                <%if not chave.eof then%>
                   <%=chave("cod_quadro")%>
                <%end if%>
              </td>
            </tr> 
            <tr>
              <td heigth=2></td>
            </tr>
            </table>
            <%else%>
             <tr>
              <td class="tb"><b>CHAVE:</b></td>
              <td class="tb" colspan=3>
                <%set chave = conn.execute("select cod_quadro from registro_chave  where codigo="&exibir("cod_chave_imovel"))%>
                <%=chave("cod_quadro")%>
              </td>
            </tr> 
            <tr>
              <td heigth=2></td>
            </tr>
            </table>
            <%end if %>
            
             <table width=100% border=0 cellspacing="0" cellpadding="0">   
              <tr> 
                <td class="navdroplist" width=10%><b>INICIO:</b></td>
                <td class="navdroplist" width=10%><%=exibir("data_inicio")%></td>
                <td class="navdroplist" width=11%><b>VENCIMENTO:</b></td>
                <td class="navdroplist" ><%=exibir("data_vencimento")%></td>
              </tr>
              <tr>
                <td heigth=2></td>
              </tr>
              <tr>    
                <td class="navdroplist" ><b>REAJUSTE:</b></td>
                <td class="navdroplist" ><%=exibir("reajuste")%></td>
                <td class="navdroplist" ><b>VALOR:</b></td>
                <td class="navdroplist" >R$ <%=formatnumber(exibir("valor"),2)%></td>
              </tr>
              <tr>
                 <td heigth=2></td>
              </tr>
              <tr>
                <td class="navdroplist" ><b>SERVIÇO:</b></td>
                <td class="navdroplist" ><%=servico_contrato("descricao")%></td>
              </tr>  
              <tr>
                <td heigth=2></td>
              </tr>
           </table>
          <table width=100% align="center" bgcolor="#FFFFFF">
        <tr bgcolor="#F8F8F8">
          <td heigth=2 bgcolor="#858282"></td>
        </tr>
      </table>
          <table width=400 border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=165 ><b>TAXA DE ADMINISTRAÇÃO:</b></td>
              <td class="navdroplist"><%=exibir("taxa")%>%</td>
              <tr height=5><td></td></tr>                            
            </tr>
            <tr>
              <td class="navdroplist" width=165><b>MULTA POR ATRAZO:</b></td>
              <td class="navdroplist"><%=exibir("multa")%>%</td>
              <tr height=5><td></td></tr>
            </tr>
            <tr>
              <td class="navdroplist" width=165><b>INDICE DE REAJUSTE:</b></td>
              <td class="navdroplist">
                <%set indice = conn.execute("select * from indice where codigo="&exibir("cod_indice"))%>
                <%=indice("descricao")%></td>
              <tr height=5><td></td></tr>
            </tr>
            <tr>
              <td class="navdroplist" width=165><b>COMISSÃO DO CORRETOR:</b></td>
              <td class="navdroplist"><%=exibir("comissao")%>%</td>
              <tr height=5><td></td></tr>
            </tr>
            <tr colspan=2>
          </table>
          <table border=0 cellspacing=0 cellpadding=0>
            <td class="navdroplist" width=130><b>TIPO DE PLANO:</b></td>            
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
          <%end if%>
    </table>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><font class="navdroplist">&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>