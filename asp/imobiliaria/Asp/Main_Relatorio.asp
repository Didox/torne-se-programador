<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pesquisa=replace(trim(request("pesquisa")),"'","")
%>
<html>
<head>
<title>:::::Imobi....:::</title>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>"name="form1">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_14.gif"></td>
              <td class="tb"><B>PAINEL DE CONTROLE RELATÓRIOS</B></td>
            </tr>
          </table>  
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr height=10><td></td></tr>
            <tr> 
              <td class="tb"><div align=justify>
              </td>
            </tr>
          </table> 
          <br>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr height=10><td></td></tr>
            <tr> 
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="Relatorio_administrador_dados.asp" title="Consultar e Imprimir">RELATÓRIO ADMINISTRADORES</B></a></td>
            </tr>
            <tr> 
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="Relatorio_cliente_dados.asp" title="Consultar e Imprimir">RELATÓRIO CLIENTES</B></a></td>
            </tr>
            <tr>
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="relatorio_conta_dados.asp" title="Consultar e Imprimir">RELATÓRIO CONTAS</B></a></td>
            </tr>
            <tr>
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="relatorio_contrato_dados.asp" title="Consultar e Imprimir">RELATÓRIO CONTRATOS</B></a></td>
            </tr>
            <tr>
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="relatorio_corretor_dados.asp" title="Consultar e Imprimir">RELATÓRIO CORRETORES</B></a></td>
            </tr>
            <tr> 
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="relatorio_fiador_dados.asp" title="Consultar e Imprimir">RELATÓRIO FIADORES</B></a></td>
            </tr>
            <tr> 
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="Relatorio_Funcionarios_dados.asp" title="Consultar e Imprimir">RELATÓRIO FUNCIONÁRIOS</B></a></td>
            </tr>
            <tr> 
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="relatorio_imoveis_dados.asp" title="Consultar e Imprimir">RELATÓRIO IMÓVEIS</B></a></td>
            </tr>
            <tr> 
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="Relatorio_reserva_dados.asp" title="Consultar e Imprimir">RELATÓRIO RESERVAS</B></a></td>
            </tr>
            <tr> 
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="relatorio_unidades_dados.asp" title="Consultar e Imprimir">RELATÓRIO UNIDADES</B></a></td>
            </tr>
            <tr> 
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="Relatorio_visita_dados.asp" title="Consultar e Imprimir">RELATÓRIO INTERRESADOS</B></a></td>
            </tr>
            <tr> 
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="Relatorio_comissao_corretor_dados.asp" title="Consultar e Imprimir">RELATÓRIO COMISSÃO POR CORRETORES</B></a></td>
            </tr>
            <tr> 
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="Relatorio_Servico_dados.asp" title="Consultar e Imprimir">RELATÓRIO PRODUTIVIDADE</B></a></td>
            </tr>
            <tr> 
              <td width=10><img src="../img/seta_dados.gif"></td>
              <td>&nbsp;<B><a href="Relatorio_Interessados_Corretor_Dados.asp" title="Consultar e Imprimir">RELATÓRIO INTERESSADOS</B></a></td>
            </tr>
          </table>  
    </td>
  </tr>
</table>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
</body>
</html>

