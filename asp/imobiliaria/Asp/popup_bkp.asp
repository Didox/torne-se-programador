<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
codigo2=request("codigo2")
pagina=request("pagina") 
set destaque=conn.execute("SELECT TOP 6 registro_foto.*, registro_foto.descricao as reg_descricao, registro_foto.arquivo AS arquivo, imoveis.descricao, registro_foto.descricao AS foto FROM (registro_foto INNER JOIN imoveis ON registro_foto.cod_imovel = imoveis.codigo)  WHERE registro_foto.status = 0 AND registro_foto.cod_imovel = "&codigo2&""&sql_filtro)
set imovel=conn.execute("select imoveis.*,  bairro.descricao as bairro, cidade.descricao as cidade, estado.descricao as estado from (((imoveis INNER JOIN bairro on bairro.codigo=imoveis.cod_bairro)INNER JOIN cidade on cidade.codigo=imoveis.cod_cidade)INNER JOIN estado on estado.codigo=imoveis.cod_estado) where imoveis.codigo="&codigo2)
Set rsPE = conn.execute("Select * from perfil_imoveis where cod_imovel = "&codigo2)
Set rsPL = conn.execute("Select * from perfil_lazer where cod_imovel = "&codigo2)
Set rsPS = conn.execute("Select * from perfil_seguranca where cod_imovel = "&codigo2)
Set rsPI = conn.execute("Select * from perfil_imovel where cod_imovel = "&codigo2)
%>

<html>
<head>
<title>Detalhes do Imóvel</title>
<script language="javascript" src="formatacao.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="estilo.css" type="text/css">
<script language="javascript" src="formatacao.js"></script>
</head>
<script language="javascript">
  function pop_preco(url)
  {
    window.open(url,"pop_preco","resizable=yes,scrollbars=yes,location=no,top=0,left=100,width=300,height=200");
  }
  function linkImagem() {
     window.location="#linkImagem";
  }
  function changetext(whichcontent){

  if (document.all||document.getElementById){
  cross_el=document.getElementById? document.getElementById("descriptions"):document.all.descriptions
cross_el.innerHTML='<font face="Verdana"><small>'+whichcontent+'<font></small>'
  }
  else if (document.layers){
  document.d1.document.d2.document.write('<font face="Verdana"><small>'+whichcontent+'</small></font>')
  document.d1.document.d2.document.close()
 }
}
 </script>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table width="680" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td> 
      <table width="680" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td rowspan="2" align="right"> 
            <table width="680" border="0" cellspacing="0" cellpadding="0">
              <tr bgcolor="#EFF0EF"> 
                <td class="tb" align=right><a href="javascript:window.close();"><img src="../botoes/fechar.gif" width="103" height="29" border=0></a></td>
                <td colspan="4" height="6"> </td>
              </tr>
              <tr> 
                <td colspan="4" height="8"> </td>
              </tr>
              </tr>
            </table>
          </td>
          <td width="380" align="right" valign="top"> 
          </td>
        </tr>
        <tr> 
          <td valign="top">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2"> 
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td align="left">
      <table width="666" border="0" cellspacing="0" cellpadding="0">
        <tr>
	  <td width="15" width="15" height="8"</td>
          <td width="408">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="10" colspan="2"> </td>
              </tr>
              <tr> 
                <td class="estilo" height="16" colspan="2"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="../img/topico.gif" width="10" height="9"></td>
                      <td class="estilo"><%=imovel("descricao")%></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="8" colspan="2"> </td>
              </tr>
              <tr> 
                <td class="estilo" height="16" colspan="2"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="../img/topico.gif" width="10" height="9"></td>
                      <td class="estilo"><%=imovel("endereco")%></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="8" colspan="2"> </td>
              </tr>
              <tr> 
                <td class="estilo" height="16 colspan="2"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <%Set rsTipo = conn.execute("Select descricao from tipo_imovel where codigo="&imovel("tipo_imovel"))%>
                    <tr> 
                      <td colspan="2" class="estilo"><%=rsTipo("descricao")%></td>
                    </tr>
                    <%if imovel("subtipo_imovel") <> "" then%>
                    <tr> 
                      <td colpan="2" class="estilo"><%=imovel("subtipo_imovel")%></td>
                    </tr>
                    <%end if%>
                    <%if imovel("Dormitorio") <> "" then%>
                    <tr> 
                      <td colpan="2" class="estilo">Dormitório(s): <%=imovel("dormitorio")%></td>
                    </tr>
                    <%end if%>
                    <%if imovel("suites") <> "" then%>
                    <tr> 
                      <td colpan="2" class="estilo">Suíte(s): <%=imovel("suites")%></td>
                    </tr>
                    <%end if%>
                    <%if imovel("cod_metragem") <> "" then%>
                    <tr> 
                      <td colpan="2" class="estilo">Área útil: <%=imovel("cod_metragem")%> m²</td>
                    </tr>
                    <%end if%>
                    <%if imovel("cod_categoria") <> "" then
                       cate = conn.execute("Select descricao from tipo_categoria where codigo="&imovel("cod_categoria"))%>
                    <tr> 
                      <td colpan="2" class="estilo">Categoria: <%=cate("descricao")%></td>
                    </tr>
                    <%end if%>
                    <%if imovel("cod_idade_imovel") <> "" then
                       idade = conn.execute("Select descricao from tipo_idade_imovel where codigo="&imovel("cod_idade_imovel"))%>
                    <tr> 
                      <td colpan="2" class="estilo">Idade Imóvel: <%=idade("descricao")%></td>
                    </tr>
                    <%end if%>
                    <%if imovel("data_inclusao") <> "" then%>
                    <tr> 
                      <td colpan="2" class="estilo">Data Inclusão: <%=imovel("data_inclusao")%></td>
                    </tr>
                    <%end if%>
                    <%if imovel("divida") = "1" then%>
                    <tr> 
                      <td colpan="2" class="estilo">Imóvel com dívida</td>
                    </tr>
                    <%end if%>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="8" colspan="2"> </td>
              </tr>
            <%If not rsPE.eof then%>
              <tr> 
                <td class="estilo" height="16" colspan="2">
                  <span class="estilo"><b>Infraestrutura:</b>
                  <table width=60% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
                    <tr>
                      <td bgcolor=#AAAAAA width=100%>
                        <span class="estilo"><font color="#FFFFFF">Descrição</font></span>
                      </td>
                      <td bgcolor=#AAAAAA align=center>
                        <span class="estilo"><font color="#FFFFFF">Quantidade</font></span>
                      </td>
                    </tr>
                   <%do while not rsPE.eof %>
                    <tr>
                     <td>
                      <%set empreendimento_nome=conn.execute("select * from tipo_empreendimento where codigo="&rsPE("cod_empreendimento"))%>
                      <%=empreendimento_nome("descricao")%>
                     </td>
                     <td align=center>
                       <%=rsPE("quantidade")%>
                     </td>
                    </tr>
                 <%rsPE.movenext%>
                 <%loop%>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="8" colspan="2"> </td>
              </tr>
            <%End IF%>
            <%If not rsPL.eof then%>
              <tr> 
                <td class="estilo" height="16" colspan="2">
                  <span class="estilo"><b>Lazer:</b>
                  <table width=60% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
                    <tr>
                      <td bgcolor=#AAAAAA width=100%>
                        <span class="estilo"><font color="#FFFFFF">Descrição</font></span>
                      </td>
                    </tr>
                   <%do while not rsPL.eof %>
                    <tr>
                     <td>
                      <%set lazer_nome=conn.execute("select * from lazer where codigo="&rsPE("cod_lazer"))%>
                      <%=lazer_nome("descricao")%>
                     </td>
                    </tr>
                 <%rsPE.movenext%>
                 <%loop%>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="8" colspan="2"> </td>
              </tr>
            <%End IF%>
            <%If not rsPS.eof then%>
              <tr> 
                <td class="estilo" height="16" colspan="2">
                  <span class="estilo"><b>Segurança:</b>
                  <table width=60% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
                    <tr>
                      <td bgcolor=#AAAAAA width=100%>
                        <span class="estilo"><font color="#FFFFFF">Descrição</font></span>
                      </td>
                    </tr>
                   <%do while not rsPS.eof %>
                    <tr>
                     <td>
                      <%set seguranca_nome=conn.execute("select * from seguranca where codigo="&rsPS("cod_seguranca"))%>
                      <%=seguranca_nome("descricao")%>
                     </td>
                    </tr>
                 <%rsPE.movenext%>
                 <%loop%>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="8" colspan="2"> </td>
              </tr>
            <%End IF%>
            <%If not rsPI.eof then%>
              <tr> 
                <td class="estilo" height="16" colspan="2">
                  <span class="estilo"><b>Cômodos:</b>
                  <table width=80% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
                    <tr>
                      <td bgcolor=#AAAAAA width=100%>
                        <span class="estilo"><font color="#FFFFFF">Descrição</font></span>
                      </td>
                      <td bgcolor=#AAAAAA align=center>
                        <span class="estilo"><font color="#FFFFFF">Quantidade</font></span>
                      </td>
                    </tr>
                   <%do while not rsPI.eof %>
                    <tr>
                     <td>
                      <%set comodo_nome=conn.execute("select * from tipo_comodo where codigo="&rsPI("cod_comodo"))%>
                      <%=comodo_nome("descricao")%>
                     </td>
                     <td align=center>
                       <%=rsPI("quantidade")%>
                     </td>
                    </tr>
                 <%rsPI.movenext%>
                 <%loop%>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="8" colspan="2"> </td>
              </tr>
            <%End IF%>
              <tr> 
                <td height="28" align="center" valign="bottom">
                  <a href="javascript:pop_preco('detalhe_preco.asp?codigo=<%=session("cod")%>&codigo2=<%=codigo%>&imovel=<%=codigo2%>')"><img src="../img/tabela_precos.gif" width="133" height="17" border="0"></a>
                </td>
                <td>&nbsp;</td>
              <%if session("tipo")="2" or session("tipo")="" then%>
                <td height="28" align="center" valign="bottom">
                  <a href="cad_contato.asp?codigo=<%=session("cod")%>&codigo2=<%=codigo%>&imovel=<%=codigo2%>&pagina=popup.asp"><img src="../img/lista_interesse.gif" width="142" height="17" border="0"></a>
                </td>
              <%end if%>
              </tr>
            </table>
          </td>
          <td width="20"><img src="../img/pixel.gif" width="20" height="8"></td>
          <td width="208" valign="top"> 
          </td>
          <td width="20"><img src="../img/pixel.gif" width="20" height="8"></td>
        </tr>
      </table>
    </td>
  </tr>
</script>
  <tr> 
    <td> 
      <table width="680" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="14" width="37%"> </td>
          <td rowspan="2" valign="bottom" width="0%"><img src="../img/quina2.gif" width="20" height="18"></td>
          <td rowspan="2" width="63%" bgcolor="#B0B0B0" align="center" class="estilo"><font color="FFFFFF">
            <a name="linkImagem">IMAGENS DO EMPREENDIMENTO</a></font></td>
        </tr>
        <tr> 
          <td bgcolor="FF9900" height="4" width="37%"> </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="12"> </td>
  </tr>
  <tr> 
    <td> 
      <table width="667" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
           <script language="javascript">
              function linkImagem() {
                window.location="#linkImagem";
              	}
            count=0
            var content=new Array()
        <%count=0%>
          <%do while not destaque.eof %>
  	         content[<%=count%>] = "<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'><tr><td align='center'>" +
		              "<img src='../../imagens/fotos/<%=destaque("arquivo")%>' width='500'><br><br>" +
                              "<font class='estilo'><%=destaque("reg_descricao")%></font><br><br>" + 
                              "</td></tr></table>";
               document.write("<td class='estilo' align='center'> <table border=0 class='estilo' cellspacing='0' cellpadding='0' height='80' align=center> <tr> <td align='center'><a href='javascript:changetext(content[<%=count%>]);linkImagem();'><img src='../../imagens/fotos/<%=destaque("arquivo")%>' border='0' width=100></a></td> </tr> <tr> <td align='center' class='estilo'><%=destaque("reg_descricao")%></td> </tr> </table> </td>")
          <%count=count+1
          destaque.movenext
          loop%>
         </script>
        </tr>
      </table>
    </td>
  <tr> 
  </tr>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td align="center"> 
      <table width="96%" class="estilo" cellspacing="0" cellpadding="0" height="80">
        <tr> 
          <td width="100%" align="center">
		  	<ilayer id="d1" visibility="hide"> 
    	     <layer id="d2" visibility="hide"> 
    	      <div id="descriptions" align="center">

              </div>
             </layer>
    	    </ilayer>
	  </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td> 
    </td>
  </tr>
</table>
<table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="14" width="37%"> </td>
    <td rowspan="2" valign="bottom" width="0%"><img src="../img/quina2.gif" width="20" height="18"></td>
    <td rowspan="2" width="63%" bgcolor="#B0B0B0" align="right"> 
      <table width="416" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td bgcolor="#B0B0B0" width="191"></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td bgcolor="FF9900" height="4" width="37%"> </td>
  </tr>
</table>
</body>
</html>