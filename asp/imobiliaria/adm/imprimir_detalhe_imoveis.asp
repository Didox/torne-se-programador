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
            <a href="<%=pagina%>.asp"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>DETALHE DO IMÓVEL <%=itens("descricao")%></B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <tr>
          <td width=20></td>
          <td class="navdroplist">
             SOLICITANTE:&nbsp<b><%=verificador("nome")%></b>
          </td>
          <td width=200></td>
          <td class="navdroplist">
           QUANTIDADE DE REGISTRO:&nbsp<b><%=itens.recordcount%></b>
          </td>
        </tr>
        <tr>
        <td width=20></td>
          <td class="navdroplist">
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td width=200></td>
          <td class="navdroplist">
             HORA:&nbsp<b><%=time()%></b>
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
              <td class="navdroplist"><b>TÍTULO:</b></td>
              <td class="navdroplist"><%=itens("descricao")%></td>
              <td class="navdroplist"><b>ENDEREÇO:</b></td>
              <td class="navdroplist"><%=itens("endereco")%></td>
            </tr>
            <tr>
              <td class="navdroplist"><b>NUMERO:</b></td>
              <td class="navdroplist"><%=itens("numero")%></td>
              <td class="navdroplist"><b>COMPLEMENTO:</b></td>
              <td class="navdroplist"><%=itens("complemento")%></td>
            </tr>
            <tr>
              <td class="navdroplist"><b>UNIDADE:</b></td>
              <td class="navdroplist">
              <%set unidade = conn.execute("select * from unidade where codigo = "&itens("cod_unidade"))%>
              <%=unidade("descricao")%></td>
              <td class="navdroplist"><b>BAIRRO:</b></td>
              <td class="navdroplist">
              <%set bairro = conn.execute("select * from bairro where codigo = "&itens("cod_bairro"))%>
              <%=bairro("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist"><b>CIDADE:</b></td>
              <td class="navdroplist">
              <%set cidade = conn.execute("select * from cidade where codigo = "&itens("cod_cidade"))%>
              <%=cidade("descricao")%></td>
              <td class="navdroplist"><b>ESTADO:</b></td>
              <td class="navdroplist">
              <%set estado = conn.execute("select * from estado where codigo = "&itens("cod_estado"))%>
              <%=estado("descricao")%></td>
            </tr>
              <td class="navdroplist"><b>ESTAGIO DA OBRA:</b></td>
              <td class="navdroplist">
              <%set obra = conn.execute("select * from estagios_obra where codigo = "&itens("cod_estagios_obra"))%>
              <%if not obra.eof then%>
               <%=obra("descricao")%>
              <%end if%>
              </td>
              <td class="navdroplist"><b>ÁREA ÚTIL (m²):</b></td>
              <td class="navdroplist">
              <%set metragem = conn.execute("select * from metragem where codigo = "&itens("cod_metragem"))%>
              <%=metragem("descricao")%></td>
            </tr>
            <tr>
            <td class="navdroplist"><b>IDADE IMÓVEL:</b></td>
              <td class="navdroplist">
              <%set idade = conn.execute("select * from tipo_idade_imovel where codigo = "&itens("cod_idade_imovel"))%>
              <%if not idade.eof then%>
              <%=idade("descricao")%>
              <%end if%>
              </td>
              <td class="navdroplist"><b>CATEGORIA:</b></td>
              <td class="navdroplist">
              <%set categoria = conn.execute("select * from Tipo_categoria where codigo = "&itens("cod_categoria"))%>
              <%=categoria("descricao")%></td>
            </tr>
            </tr>
              <td class="navdroplist"><b>N° DORMITÓRIO:</b></td>
              <td class="navdroplist"><%=itens("dormitorio")%></td>
              <td class="navdroplist"><b>SUITES:</b></td>
              <td class="navdroplist"><%=itens("suites")%></td>
            </tr>
            </tr>
              <td class="navdroplist"><b>VAGAS GARAGEM:</b></td>
              <td class="navdroplist"><%=itens("garagem")%></td>
              <td class="navdroplist"><b>COM DÍVIDA?:</b></td>
              <td class="navdroplist">
              <%if itens("divida") = "0" then%>
                 <%="Não"%>
              <%else%>
                 <%="Sim"%>
              <%end if%></td>
            </tr>
            </tr>
              <td class="navdroplist"><b>LOCAL DA CHAVE:</b></td>
              <td colspan=3 class="navdroplist">
              <%set quadro = conn.execute("select * from registro_chave where status=0 and cod_imovel="&itens("codigo"))%>
              <%if not quadro.eof then%>
                <%IF quadro("cod_quadro")<>"0" THEN%>
                  ENCONTRA-SE NO QUADRO NA POSIÇÃO N.º <%=quadro("cod_quadro")%>
                <%ELSE%>
                  <%set localizacao = conn.execute("select * from localizacao where status=0 and codigo="&quadro("cod_localizacao"))%>   
                  <%=localizacao("descricao")%>
                <%END IF%>  
              </td>
             </tr>
             <tr> 
              <td class="navdroplist"><b>COMENTÁRIO:</b></td>
              <td class="navdroplist" colspan=3><%=quadro("descricao")%></td>
             </tr> 
              <%else%>
                CHAVE NÃO REGISTRADA.</td>
              </tr>
              <%end if%>
            <tr><td><br></td></tr>
            <tr><td colspan=4 bgcolor="#F8F8F8"></td></tr>
          </table>
          <table width=100% align="center" bgcolor="#FFFFFF" border=0>
            <tr>
              <td class="navdroplist"><b>TIPO(S) DE SERVIÇO:</b>            
            <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="navdroplist"><font color="#FFFFFF">SERVIÇO</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="navdroplist"><font color="#FFFFFF">VALOR</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_servico where cod_imovel="&itens("codigo")&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td class="navdroplist">
                  <%set servico=conn.execute("select * from servico where codigo="&cbai("cod_servico"))%>
                  <%=servico("descricao")%>
                <td align=center class="navdroplist">
                  <%if cbai("cod_moeda")<>"0" then%> 
                    <%set moed = conn.execute("select * from tipo_moeda where status=0 and codigo="&cbai("cod_moeda"))%>
                    <%=moed("sigla")%>&nbsp;<%=formatnumber(cbai("valor"),2)%>
                  <%else%>
                    R$<%=formatnumber(cbai("valor"),2)%>
                  <%end if%> 
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
              </tr>
              </table>
            <table width=100% align="center" bgcolor="#FFFFFF" border=0>
             <tr>
                <table cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
                 <tr><td class="navdroplist"><b>DIFERÊNCIAL</b></td></tr>
                  <tr>
                    <td bgcolor=#AAAAAA width=100%>
                      <SPAN CLASS="NAVDROPLIST"><FONT COLOR="#FFFFFF">DESCRIÇÃO</FONT></SPAN>
                    </td>
                    <td bgcolor=#AAAAAA align=center>
                     <span class="navdroplist"><font color="#FFFFFF">QUANTIDADE</font></span>
                    </td>
                  </tr>
                  <%set cbai=conn.execute("select * from perfil_empreendimento where cod_imovel="&itens("codigo")&" and status=0 ORDER BY codigo desc")%>
                  <%do while not cbai.eof %>
                  <tr>
                    <td class="navdroplist">
                      <%set empreendimento_nome=conn.execute("select * from tipo_empreendimento where codigo="&cbai("cod_empreendimento"))%>
                      <%=empreendimento_nome("descricao")%></td>
                    <td align=center class="navdroplist">
                    <%=cbai("quantidade")%>
                    </td>
                  </tr>
                 <%cbai.movenext%>
                <%loop%>
              </table>
                <table cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
                  <tr><td class="navdroplist"><b>TIPO(S) DE COMODO:</b></td></tr>
                  <tr>
                    <td bgcolor=#AAAAAA width=100%>
                      <SPAN CLASS="NAVDROPLIST"><FONT COLOR="#FFFFFF">COMODO</FONT></SPAN>
                    </td>
                    <td bgcolor=#AAAAAA align=center>
                     <span class="navdroplist"><font color="#FFFFFF">QUANTIDADE</font></span>
                    </td>
                  </tr>
                  <%set cbai=conn.execute("select * from perfil_imovel where cod_imovel="&itens("codigo")&" and status=0 ORDER BY codigo desc")%>
                  <%do while not cbai.eof %>
                  <tr>
                    <td class="navdroplist">
                      <%set comodo_nome=conn.execute("select * from tipo_comodo where codigo="&cbai("cod_comodo"))%>
                      <%=comodo_nome("descricao")%></td>
                    <td align=center class="navdroplist">
                    <%=cbai("quantidade")%>
                    </td>
                  </tr>
                 <%cbai.movenext%>
                <%loop%>
              </table>
            </table>
            <table width=100% align="center" bgcolor="#FFFFFF" border=0>
             <tr>
               <td class="navdroplist"><b>TIPO(S) DE PLANO:</b></td>            
                 <table cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
                   <tr>
                     <td bgcolor=#AAAAAA align=center>
                       <span class="navdroplist"><font color="#FFFFFF">QUANTIDADE</font></span>
                     </td>
                     <td bgcolor=#AAAAAA width=100%>
                       <span class="navdroplist"><font color="#FFFFFF">PLANO</font></span>
                     </td>
                     <td bgcolor=#AAAAAA align=center>
                      <span class="navdroplist"><font color="#FFFFFF">VALOR</font></span>
                     </td>                
                   </tr>
                   <%set plano1=conn.execute("select * from perfil_plano where cod_imovel="&ITENS("codigo")&" and status=0 ORDER BY codigo desc")%>
                   <%do while not plano1.eof %>
                   <tr>
                     <td class="navdroplist">
                      <%=plano1("quantidade")%>
                     </td>
                     <td class="navdroplist">
                       <%set plano_nome=conn.execute("select * from tipo_conta where codigo="&plano1("cod_tipo_conta"))%>
                       <%=plano_nome("descricao")%>
                     </td>
                     <td class="navdroplist">
                       <%set moed = conn.execute("select * from tipo_moeda where status=0 and codigo="&plano1("cod_moeda"))%>
                       <%=moed("sigla")%>&nbsp;<%=formatnumber(plano1("valor"),2)%>
                     </td>                
                  </tr>
               <%plano1.movenext%>
              <%loop%>
            <td class="tb" width=130 colspan=2><b>DESPESAS EXTRAS:</b></td> 
            <table width=100% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Descrição</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Valor</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select gasto_extra.valor as valor, despesa.descricao as despesa from (gasto_extra inner join despesa on despesa.codigo=gasto_extra.cod_despesa) where cod_imovel="&itens("codigo")&" and gasto_extra.status=0 ORDER BY despesa.descricao desc")%>
              <%if cbai.eof=true then%>
                <tr>
                  <td>Nenhum registro encontrado.</td>
                  <td></td>
                </tr>
              <%else%>
                <%do while not cbai.eof %>
                <tr>
                  <td><%=cbai("despesa")%>
                  <td align=center>
                    R$<%=formatnumber(cbai("valor"),2)%>
                  </td>
                </tr>
                <%cbai.movenext%>
                <%loop%>
              <%end if%>
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
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><span class="navdroplist">&nbsp;Imprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>