<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
pagina=request("pagina")
set itens=conn.execute("select * from imoveis  where status=0")
set destaque=conn.execute("SELECT registro_foto.*, registro_foto.arquivo as arquivo, imoveis.descricao,registro_foto.descricao AS foto FROM (registro_foto INNER JOIN imoveis ON registro_foto.cod_imovel=imoveis.codigo) where registro_foto.status=0 AND destaque=1"&sql_filtro)
%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<script language="javascript">
  function pop_arquivo(url)
  {
    window.open(url,"pop_arquivo","resizable=yes,scrollbars=yes,location=no,top=0,left=20,width=750,height=510");
  }
</script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#F4F2EA" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" cellspacing="0" cellpadding="0">
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
            <%set exibir=conn.execute("select * from imoveis where codigo="&codigo)
          set exibirperfil=conn.execute("select * from perfil_imoveis where cod_imovel="&codigo)%>
          <table width=99% class="tabela001" align="center">
            <tr><td></td></tr>
          </table>
          <table width=99% border=0 align="center" cellpadding="0" cellspacing="0" class="tabela002">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE IMÓVEL</B></td>
              <td class="tb" align=right>
                <a href="javascript:pop_arquivo('popup.asp?codigo2=<%=codigo%>&codigo=<%=destaque("codigo")%>&pagina=Main_inicio')"><img src="../img/Botao_foto.gif" alt="Fotos do Imóvel" border=0></a>
                <a href="Imprimir_detalhe_imoveis.asp?codigo=<%=exibir("codigo")%>&pagina=Detalhe_imovel"><img src="../img/icone-imprimir.gif" border=0></a>
                <a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../../imagens/voltar1.gif" width="86" height="26" border=0></a>              </td>
            </tr>
          </table>
          <table width=400 border=2 cellpadding="0" cellspacing="0" bordercolor="#F4F2EA" bgcolor="#F4F2EA" >
            <tr>
              <td width="35%" height="18" class="tb"><b>ENDEREÇO:</b></td>
              <td width="65%" colspan=3 class="tb"><%=exibir("endereco")%><!-- &nbsp; - &nbsp; <%'=exibir("numero")%> <%'=exibir("complemento")%>--></td>
            </tr>
            <tr>
            <tr><td class="tb" height="18"><b>BAIRRO:</b></td>
              <%set bairro = conn.execute ("select * from bairro where codigo = "&exibir("cod_bairro"))%>
              <td class="tb"><%=bairro("descricao")%></td></tr>
              <td class="tb" height="18"><b>CIDADE:</b></td>
              <%set cidade = conn.execute ("select * from cidade where codigo = "&exibir("cod_cidade"))%>
              <td class="tb"><%=cidade("descricao")%></td>
            </tr>
            <tr>
            <tr><td class="tb" height="18"><b>ESTADO:</b></td>
              <%set estado = conn.execute ("select * from estado where codigo = "&exibir("cod_estado"))%>
              <td class="tb"><%=estado("descricao")%></td></tr>
            <td height="18"></tr>
              <td class="tb" height="18" ><b>TIPO IMÓVEL:</b></td>
              <%set cidade = conn.execute ("select * from cidade where codigo = "&exibir("cod_cidade"))%>
              <td class="tb">
                <%set tipo_imovel = conn.execute ("select * from tipo_imovel where codigo in ("&exibir("tipo_imovel")&")")%>
                <%do while not tipo_imovel.eof%>
                  <%response.write(tipo_imovel("descricao"))%>&nbsp;
                <%tipo_imovel.movenext
   	        loop%></td>
	    <tr> 
            <td class="tb" height="18"><b>DIFERÊNCIAL:</b></td>
              <td class="tb">
                <%If exibirperfil("estagios_obra_condominio") <> "" then
                set estagios_obra = conn.execute ("select * from estagios_obra where codigo in ("&exibirperfil("estagios_obra_condominio")&")")
	                If not estagios_obra.eof then%>
	                <b>Do imóvel</b>:<br>
	              <%do while not estagios_obra.eof%>             
                    <%=estagios_obra("descricao")%><br>
                  <%estagios_obra.movenext
                  loop
                  End If
                  estagios_obra.close
                  Set estagios_obra = nothing
                  End If%>
                  <%If exibirperfil("estagios_obra_imovel") <> "" then
                  set estagios_obra = conn.execute ("select * from estagios_obra where codigo in ("&exibirperfil("estagios_obra_imovel")&")")
	                If not estagios_obra.eof then%>
	                <br>
	                <b>Do condomínio:</b><br>
	              <%do while not estagios_obra.eof%>             
                    <%=estagios_obra("descricao")%><br>
                  <%estagios_obra.movenext
                  loop
                  End If
                  estagios_obra.close
                  Set estagios_obra = nothing
                  End if%>
              </td>
   	    </tr>
   	    <%if exibir("valor_imovel")<>"" then%>
            <tr>
              <td height="18" class="tb" ><b>VALOR R$:</b></td>
              <td class="tb">
              <%=formatnumber(exibir("valor_imovel"),2)%></td><tr>
            </tr>
            <%end if%>
            <%Set rsIdade = conn.execute("Select * from Tipo_idade_imovel where codigo = "&exibir("cod_idade_imovel")&"")
            If not rsIdade.eof then%>
            <tr>
              <td class="tb" height="18"><b>IDADE DO IMÓVEL:</b></td>
              <td class="tb"><%=rsIdade("descricao")%></td><tr>
            </tr>
          <%End If
            rsIdade.close
            Set rsIdade = nothing%>
            <tr>
              <td height="18" class="tb" ><b>VAGAS DE GARAGEM:</b></td>
              <td class="tb"><%=exibir("garagem")%></td><tr>
            </tr>
            <tr>
              <td height="18" class="tb" ><b>DATA INCLUSÃO:</b></td>
              <td class="tb"><%=exibir("data_inclusao")%></td><tr>
            </tr>
            <td height="18"></tr>
            <tr>
                 
            <table width=100% cellspacing=1 cellpadding=0 border=0 >
               <td height="20" class="tb" ><b>INFRAESTRUTURA:</b></td>      
              <%If exibirperfil("tipo_empreendimento_condominio") <> "" then
              sqlbai = "select * from tipo_empreendimento where codigo in ("&exibirperfil("tipo_empreendimento_condominio")&")"
              'response.write sqlbai
              set cbai=conn.execute(sqlbai)
              If not cbai.eof then%>
              <tr>
                <td class="tb"><b>Do imóvel</b></td>
              </tr>
              <%do while not cbai.eof %>
              <tr>
                <td class="tb"><%=cbai("descricao")%></td>
              </tr>
              <%cbai.movenext%>
              <%loop
              End If
              cbai.close
              Set cbai = nothing
              End If%>
              <%If exibirperfil("tipo_empreendimento_imovel") <> "" then
              sqlbai = "select * from tipo_empreendimento where codigo in ("&exibirperfil("tipo_empreendimento_imovel")&")"
              'response.write sqlbai
              set cbai=conn.execute(sqlbai)
              If not cbai.eof then%>
              <tr>
                <td class="tb">&nbsp;</td>
              </tr>
              <tr>
                <td class="tb"><b>Do condomínio</b></td>
              </tr>
              <%do while not cbai.eof %>
              <tr>
                <td class="tb"><%=cbai("descricao")%></td>
              </tr>
              <%cbai.movenext%>
              <%loop
              End If
              cbai.close
              Set cbai = nothing
              End If%>
            </table>
            <table width=100% cellspacing=2 cellpadding=0 border=0 >
              <tr>
                <td class="tb" height="20" ><b>LAZER:</b></td>
              </tr>
             
              <%If exibirperfil("lazer_condominio") <> "" then
              set lazer=conn.execute("select * from lazer where codigo in ("&exibirperfil("lazer_condominio")&")")
              If not lazer.eof then%>
              <tr>
                <td class="tb"><b>Do imóvel</b></td>
              </tr>
              <%do while not lazer.eof %>
              <tr>
                <td><%=lazer("descricao")%>
              </tr>
              <%lazer.movenext%>
              <%loop
              End If
              lazer.close
              Set lazer = nothing
              End If%>
              <%If exibirperfil("lazer_imovel") <> "" then
              set lazer=conn.execute("select * from lazer where codigo in ("&exibirperfil("lazer_imovel")&")")
              If not lazer.eof then%>
              <tr>
                <td class="tb">&nbsp;</td>
              </tr>
              <tr>
                <td class="tb" height="20"><b>DO CONDOMÍNIO</b></td>
              </tr>
              <%do while not lazer.eof %>
              <tr>
                <td><%=lazer("descricao")%>
              </tr>
              <%lazer.movenext%>
              <%loop
              End If
              lazer.close
              Set lazer = nothing
              End If%>
            </table>
            <table width=100% cellspacing=2 cellpadding=0 border=0 >
              <tr><td class="tb" height="20" ><b>SEGURANÇA:</b></td></tr>
              
              </tr>
              <%If exibirperfil("seguranca_condominio") <> "" then
              set seguranca=conn.execute("select * from seguranca where codigo in ("&exibirperfil("seguranca_condominio")&")")
               If not seguranca.eof then%>
              <tr>
                <td class="tb"><b>Do imóvel</b></td>
              </tr>
              <%do while not seguranca.eof %>
              <tr>
                <td><%=seguranca("descricao")%></td>
              </tr>
              <%seguranca.movenext%>
              <%loop
              End If
              seguranca.close
              Set seguranca = nothing
              End If%>
              <%If exibirperfil("seguranca_imovel") <> "" then
              set seguranca=conn.execute("select * from seguranca where codigo in ("&exibirperfil("seguranca_imovel")&")")
               If not seguranca.eof then%>
              <tr>
                <td class="tb">&nbsp;</td>
              </tr>
              <tr>
                <td class="tb"><b>Do condomínio</b></td>
              </tr>
              <%do while not seguranca.eof %>
              <tr>
                <td><%=seguranca("descricao")%></td>
              </tr>
              <%seguranca.movenext%>
              <%loop
              End If
              seguranca.close
              Set seguranca = nothing
              End If%>
            </table>
            <table width=100% cellspacing=2 cellpadding=0 border=0 bordercolor="#F8F8F8">
              <tr>
                <td class="tb" width=150><b>TAMANHO DO CONJUNTO:</b></td>
                <td>
                  <b>Do imóvel:</b> <%=exibirperfil("metragem_condominio")%> m²
                  <%if exibirperfil("metragem_imovel") <> "" or exibirperfil("metragem_imovel") <> 0 then%>
                  <br>
                  <b>Do condomínio:</b> <%=exibirperfil("metragem_imovel")%> m²
                  <%end if%>
                </td>
              </tr>
            </table>
            <table width=100% cellspacing=2 cellpadding=0 border=0 bordercolor="#F8F8F8">
              <tr>
                <td class="tb" width=100><b>OBSERVAÇÃO:</b></td>
                <td class="tb"><%=ucase(exibirperfil("observacao"))%></td><tr>
              </tr>
            </table>
        <td height="18"></td>
      </tr>
  </td>
</tr>
</table>
</body>
</html>