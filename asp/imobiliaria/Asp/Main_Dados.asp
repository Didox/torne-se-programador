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
              <td class="tb"><B>PAINEL DE CONTROLE PARÂMENTROS</B></td>
            </tr>
          </table>  
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr height=10><td></td></tr>
            <tr> 
              <td class="tb"><div align=justify>
              Para sua maior comodidade o <b>Imobi Online</b>, disponibiliza para seu escritório e advogados o cadastro de dados fundamentais para o funcionamento do sistema como : Bairros, Estados e Tipo de Pagamentos, etc. Os dados cadastrados são de responsabilidade do cliente, por isso não nos responsabilizamos por palavras ou termos de baixo escalão cadastrados individamente. 
              </td>
            </tr>
          </table> 
          <br>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr height=10><td></td></tr>
            <tr>
              <td valign=top>
                <table width=100% border=0 cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Estagios_Obra.asp" title="Cadastrar, Alterar, Excluir e Imprimir">ESTÁGIO DA OBRA</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Forma_Pagamento.asp" title="Cadastrar, Alterar, Excluir e Imprimir">FORMAS DE PAGAMENTOS</B></a></td>
                  </tr>
                  <tr>
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<b><a href="Main_Funcao.asp"><b>FUNÇÕES</b></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Estado.asp" title="Cadastrar, Alterar, Excluir e Imprimir">GERENCIAR ESTADOS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Cidade.asp" title="Cadastrar, Alterar, Excluir e Imprimir">GERENCIAR CIDADES</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Bairro.asp" title="Cadastrar, Alterar, Excluir e Imprimir">GERENCIAR BAIRROS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Indice.asp" title="Cadastrar, Alterar, Excluir e Imprimir">INDICES</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Setor.asp" title="Cadastrar, Alterar, Excluir e Imprimir">SETORES</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Tipo_acompanhamento.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE ACOMPANHAMENTOS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Bancos.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE BANCOS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Tipo_Bens.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE BENS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Tipo_conta.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE CONTAS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Tipo_Comodo.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE COMODOS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Equipe.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE EQUIPES</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Tipo_Despesa.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE DESPESAS EXTRAS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_escolaridade.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE ESCOLARIDADE</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_estado_civil.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE ESTADO CIVIL</B></a></td>
                  </tr>
                 </table>
                </td>
                <td valign=top>
                <table width=100% border=0 cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Tipo_imoveis.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE IMÓVEIS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Tipo_imovel_cliente.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE IMÓVEIS CLIENTE</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Opcao.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE OPÇÃO DE CONTATOS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Localizacao.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE LOCALIZAÇÕES</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Situacao.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE SITUAÇÃO</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Tipo_Moeda.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE MOEDA</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Proposta.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE PROPOSTA</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Servicos.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE SERVIÇOS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Tipo_Plano.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE PLANOS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Metragem.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPO DE ÁREA UTIL</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Motivo_Recisao.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE RECISÕES</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Unidade_Metrica.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE UNIDADES MÉTRICAS</B></a></td>
                  </tr>
                  <tr> 
                    <td width=10><img src="../img/seta_dados.gif"></td>
                    <td>&nbsp;<B><a href="Main_Veiculo_Comunicacao.asp" title="Cadastrar, Alterar, Excluir e Imprimir">TIPOS DE VEÍCULOS DE COMUNICAÇÃO</B></a></td>
                  </tr>
               </table>
              </td>
            </tr>
          </table>  
          <br><br>                    
    </td>
  </tr>
</table>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table> 
</body>
</html>

