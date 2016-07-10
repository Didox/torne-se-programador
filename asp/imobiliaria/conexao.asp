<% 
Set Conexao=Server.CreateObject("ADODB.Connection")

'conexao.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\sbsv3_new\database\sbsv3.mdb;" 
'conexao.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\cliente\plena\database\plenaimovel.mdb;"
conexao.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\home\bigsolutions-sbs\dados\plenaimovel.mdb;"


set conn= server.createobject("adodb.connection")
'conn.Open "Driver={SQL SERVER};Server=bigapp01;Database=imobiliaria_plena;Uid=sa;PWD="
conn.Open "Driver={SQL SERVER};Server=200.170.214.123;Database=imobiliaria_plena;Uid=sa;PWD=bigbig"


Function f_email(byVal msg)
	email = msg
end function

function iif(condicao, iifTrue, iifFalse)
	If condicao then
		iif = iifTrue
	Else
		iif = iifFalse
	End if
End function


'Função para mostrar o caminho da página onde o internauta está
Function mostracaminho(cod_pagina)

Set rsT = server.createobject("ADODB.Recordset")
rsT.open "select site_caminho from tab_geral", conexao, 3, 3

If rsT("site_caminho")="S" then
'verificar se o administrador selecionou em Gerenciamento / Configurações da Pagina, a opção
'de mostrar o caminho onde o usuário está

msg_retorno = "<font face=Verdana size=1>Você está em: "
	Set rsPag = server.createobject("ADODB.Recordset")
	rsPag.open "select cod_pai,cod_pagina,titulo_item,item_menu from menu_site where cod_pagina = " & cod_pagina, conexao, 3, 3
		If not rsPag.eof then
			item_menu = rsPag("item_menu")
			If rsPag("cod_pai") = 0 then 'pagina na raiz
				msg_retorno = msg_retorno & " <b>"&rsPag("titulo_item")&"</b>"
			Else 'diretorio
				Set rsPai = server.createobject("ADODB.Recordset")
				rsPai.open "select cod_pagina,titulo_item from menu_site where cod_pagina = " & rsPag("cod_pai"), conexao, 3, 3
					If not rsPai.eof then
						msg_retorno = msg_retorno & "<a href=menu_lista.asp?cod_pagina="&rsPai("cod_pagina")&">" & rsPai("titulo_item")&  "</a> / "
					End If
				rsPai.Close
				Set rsPai=nothing
				msg_retorno = msg_retorno & " <b>"&rsPag("titulo_item")&"</b>"
			End If		
		End IF
	rsPag.Close
	Set rsPag = nothing

If item_menu = "S" then ' apresentar o caminho completo
	msg_retorno = msg_retorno & "</font>"
Else
	msg_retorno = ""
End If

mostracaminho = msg_retorno

End If 'verificação se deve exibir o caminho...
rsT.Close
Set rsT=nothing

End Function


'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
'Função que joga na lixeira os itens deletados.
'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Sub SetDelete( Byval TABELA, ByVal CAMPO, ByVal COD, ByVal NOME, ByVal codUser )
	
	'Update vai na tabela que esta esta apagando o campo e ao inves de apagar o Registro, muda o status da
	'Flg_del para S.	
	sSQl = "Update "& TABELA &" Set flg_del = 'S' "	
	
	If Ucase(TABELA) = "MENU_SITE" then
		Set rs = conexao.execute("Select * from menu_site where cod_pagina = "& COD &"")
		If IsNull(rs("cod_pai")) or rs("cod_pai") <> 0 then
			sSQl = sSQl & ", sub_menu_pos = 0 "	'ajustado por Daniel em 14/07
		ElseIf rs("cod_pai") = 0 then
			sSQl = sSQl & ", menu_pos = 0 " 'ajustado por Daniel em 14/07
		End if
		rs.Close
		Set rs = nothing
	End if
		
	sSQl = sSQl & " WHERE "& CAMPO &"= "& COD &" "
	'response.write sSQl
	'response.end
	conexao.execute(sSQl)
	
	
	'Salva na tabela lixeira, o nome da tabela, o campo chave e o valor do campo chave.	
	sSQlI = "Insert into LIXEIRA (tabela,campo,cod,nome,codUser) VALUES ('"& TABELA &"', '"& CAMPO &"', "& COD &", '"& NOME &"',"& codUser &")  "
	conexao.execute(sSQlI)
	
End Sub

'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
' Função para restaurar o Objeto	
'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Sub SetRestaurar( ByVal codLixo )	
	Set rsL = conexao.execute("Select * from LIXEIRA where cod_lixo = "& codLixo &"")
		If not rsL.EOF then
			sql1 = "Update "&rsL("Tabela")&" SET flg_del = 'N' where "&rsL("campo")&" = "& rsL("cod")&""
			
			
			If trim(rsL("Tabela"))="menu_site" then 'colocar a pagina na ultima posição
			
					Set rsMSite = server.createobject("ADODB.Recordset")
					rsMSite.open "select item_menu,cod_pai from menu_site where cod_pagina = " & rsL("cod"), conexao, 3, 3
					
			
					
					If rsMSite("item_menu")="S" and rsMSite("cod_pai")="0" then 'pagina na raiz, mexer na posição
						Set rsTot = conexao.execute("Select max(menu_pos) as tot_menu from menu_site ")
						If rsTot.eof then
					 		menu_pos = 1
						Else
					 		menu_pos = rsTot("tot_menu") + 1
					 	End If
					sql1 = "Update menu_site SET flg_del = 'N',menu_pos="&menu_pos&" where "&rsL("campo")&" = "& rsL("cod")&""
					End If
					

					If rsMSite("cod_pai")<>"0" then 'subsecao, mexer na posição
					
						Set rsTot = conexao.execute("Select max(sub_menu_pos) as tot_menu from menu_site where cod_pai="&rsMSite("cod_pai"))
						If rsTot.eof then
							sub_menu_pos = 1
						Else
							sub_menu_pos = rsTot("tot_menu") + 1
						End If
					sql1 = "Update menu_site SET flg_del = 'N',sub_menu_pos="&sub_menu_pos&" where "&rsL("campo")&" = "& rsL("cod")&""
					
					End If
					rsMSite.CLose
					Set rsMSite=nothing
				
			End If
			conexao.execute (sql1)
			conexao.execute ("Delete from LIXEIRA where cod_lixo = "& codLixo &"")
		End if
	rsL.Close
	Set rsL = nothing		
End sub

'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
' Função para excluir o objeto da lixeira
'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Sub SetDelLixo( ByVal codLixo )
	
	Set rsL = conexao.execute("Select * from LIXEIRA where cod_lixo = "& codLixo &"")
		vTitulo = rsL("nome")
		If not rsL.EOF then

			If Ucase(rsL("tabela")) = "MENU_SITE" then 'verificações
				Set rsF = server.createobject("ADODB.Recordset")
				rsF.open "select cod_pagina from menu_site where cod_pagina="&rsL("cod")&" or cod_pai="&rsL("cod")&" ", conexao, 3, 3
					'Remove o redirecionamento, caso necessário
					Call RemRedir(rsL("cod"))
					
					'deletar as paginas filho
					while not rsF.eof
						Call DelPagForever(rsF("cod_pagina"))
					rsF.movenext
					WEND
				rsF.Close
				Set rsF=nothing
			End If


			
			'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
			'Aqui eu deleto a tabela principal
			'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=			
			conexao.execute ("Delete from "&rsL("tabela")&" WHERE "&rsL("campo")&" = "&rsL("cod")&"")
			
			
			'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
			'Apaga as tabelas auxiliares da tabela TAB_PROPRIEDADES, são elas.: TAB_REGISTROS, TAB_TITULOS
			'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
			If Ucase(rsL("tabela")) = "TBL_PROPRIEDADES" then
						conexao.execute("drop table [TBL_"&vTitulo&"]")
  				conexao.execute("delete from tbl_titulos where cod_tbl="&rsL("cod")&"")
			End if
			
			'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
			'Apaga as tabelas auxiliares da tabela TAB_FORM_CONFIGURACAO são elas.: tab_form_registros, tab_form_campos, 
			' tab_form_campos_nome, tab_form_combo e ainda apaga a tabela criada para o form.
			'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
			If Ucase(rsL("tabela")) = "TAB_FORM_CONFIGURACAO" then			
			     conexao.execute("delete  from tab_form_registros where cod_form="&rsL("cod")&"")
			     conexao.execute("delete  from tab_form_campos where cod_form="&rsL("cod")&"")
			     conexao.execute("delete  from tab_form_campos_nome where cod_form="&rsL("cod")&"")
			     conexao.execute("delete  from tab_form_combo where cod_form="&rsL("cod")&"")
			     conexao.execute("drop table [FRM_"& vTitulo &"] ")  
			End if
		End if
	rsL.Close
	Set rsL = nothing
	'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	'Aqui eu deleto o registro da tabela lixeira
	'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=			
	conexao.execute ("Delete from LIXEIRA where cod_lixo = "& codLixo &"")
End sub


Sub RemRedir(codigo)
	Set rsP = server.createobject("ADODB.Recordset")
	rsP.open "select redirecionamento_nome from menu_site where cod_pagina="&codigo, conexao, 3, 3
		If not rsP.eof then
			If trim(rsP("redirecionamento_nome"))<>"" then
				    Set pasta = Server.CreateObject("Scripting.FileSystemObject")
      				diretorio = server.mappath("../hotsite/"&rsP("redirecionamento_nome"))
  					    If pasta.FolderExists(diretorio)=true then
							pasta.DeleteFolder(diretorio)
						End If
			End If
		End If
	rsP.Close
	Set rsP   = nothing
	Set pasta = nothing
End Sub

Sub DelPagForever(int_cod_pag)

			'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
			' Apaga os registrso das tabelas auxiliares da tabela MENU_SITE são elas.: institucional_textos, forum_configuracao,
			' forum_msg, modelo2_faq, modelo1_links, modelo1_links_SubCat, MODELO_LINK_CONFIG.
			'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=			

				conexao.execute("delete  from institucional_textos where cod_pagina="&int_cod_pag&"")
				conexao.execute("delete  from forum_configuracao where cod_pagina="&int_cod_pag&"")
				conexao.execute("delete  from forum_msg where cod_pagina="&int_cod_pag&"")
				conexao.execute("delete  from modelo2_faq where cod_pagina="&int_cod_pag&"")				
				conexao.execute("delete  from forum_temas where cod_pagina="&int_cod_pag&"")
				conexao.execute("delete  from NOTICIAS_CONFIG where cod_pagina="&int_cod_pag&"")

				
				'M12
				conexao.execute("Delete * from Calendario where cod_pagina="&int_cod_pag&"")				
				conexao.execute("Update Calendario_config set cod_pagina = 0 where cod_pagina="&int_cod_pag&"")	

				'MENU
				conexao.execute("delete from menu_link_ext where cod_pagina="&int_cod_pag&"")
				conexao.execute("delete  from menu_config where cod_pagina="&int_cod_pag&"")
				
				'M2
				conexao.execute("delete  from faq_config where cod_pagina="&int_cod_pag&"")
				
				'M8				
				conexao.execute("delete  from modelo1_links where cod_pagina="&int_cod_pag&"") 
				
				 Set rsDel = conexao.execute("Select cod_cat from modelo1_links_cat where cod_pagina="& int_cod_pag &"")
				 	While not rsDel.EOF
				 		conexao.execute("delete from modelo1_links_SubCat where cod_cat="&rsDel("cod_cat")&"")
				 	rsDel.MoveNext
				 	Wend	
				 rsDel.Close
				 Set rsDel = nothing
				 
				'Deletando as Categorias 
 				conexao.execute("delete from modelo1_links_cat where cod_pagina="&int_cod_pag&"")
 				
 				'Deletando confugurações avançadas
 				conexao.execute("delete from MODELO_LINK_CONFIG where cod_pagina="&int_cod_pag&"")
 				
 				'M9
 				Set rsSala = conexao.execute("select ID_sala from salas where cod_pagina="&int_cod_pag&"")
				If not rsSala.eof then
					ID_sala = rsSala("ID_sala")
				  	conexao.execute("delete  from salas where ID_sala="&ID_sala&"")
				  	conexao.execute("delete  from apelidos where ID_sala="&ID_sala&"")
				  	conexao.execute("delete  from mensagens where ID_sala="&ID_sala&"")				
				End If
				rsSala.Close
				Set rsSala = nothing
				
				'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
				'deletar o diretorio de upload
				'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
				Set fso = CreateObject("Scripting.FileSystemObject")
					dirforum = server.mappath("../txt/forum/" & int_cod_pag)
					If fso.FolderExists(dirforum)=true then
					  fso.deletefolder dirforum
					End if  
				Set fso = nothing
				
				'deletar a pagina do menu_site
				conexao.execute("delete from menu_site where cod_pagina="&int_cod_pag&"")
End Sub

'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
' Função para dizer o tipo de objeto que esta na lixeira
' Pega o nome da tabela e atravez dela eu retorno o nome do objeto
'-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Function vTipoObj( byVal TABELA )

	Select case Ucase(TABELA)
		case "MENU_SITE"		
			vTipoObj = "Páginas"
		case "TBL_PROPRIEDADES"
			vTipoObj = "Tabelas"
		case "TAB_FORM_CONFIGURACAO"	
			vTipoObj = "Formulários"	
	End Select
End function

set ConexaoCep = server.CreateObject("ADODB.Connection")
ConexaoCep = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\home\bigsolutions-sbs\dados\te_cep.mdb"


Class CapturaCep
'''''''''''''''''''' Propriedades ''''''''''''''''''''''''''''''	
	Private prCep
	Private prEstado
	Private prNome_log
	Private prNome_bairro
	Private prNome_localidade
	
	Private Sub Class_Initialize()		
	End Sub
	
	Private Sub Class_Terminate()
	
		Set ConexaoCep = Nothing
		Set objRS_log = Nothing
		Set objRS_bairro = Nothing

    End Sub
	
	Public Property Let Cep(strCep)
    	prCep = strCep
	End Property
	
	'*************** GET **************
	
	Public Property Get getCep()
    	getCep = prCep
	End Property
	
	Public Property Get getEstado()
    	getEstado = prEstado
	End Property
	
	Public Property Get getNome_log()
    	getNome_log = prNome_log
	End Property
	
	Public Property Get getNome_bairro()
    	getNome_bairro = prNome_bairro
	End Property
	
	Public Property Get getNome_localidade()
    	getNome_localidade = prNome_localidade
	End Property	

''''''''''''''''' Evento  ''''''''''''''''''''''''''''''''		
		
	Public Function retCep()
       On Error Resume Next       		 
		    prCep = replace( replace( prCep , ".","" ) , "-","" ) 
					
			If prCep >= 69900000 And prCep <= 69999999 Then
				prEstado = "AC"
			ElseIf prCep >= 57000000 And prCep <= 57999999 Then
				prEstado = "AL"
			ElseIf prCep >= 68900000 And prCep <= 68999999 Then
				prEstado = "AP"
			ElseIf prCep >= 69000000 And prCep <= 69899999 Then
				prEstado = "AM"
			ElseIf prCep >= 40000000 And prCep <= 48999999 Then
				prEstado = "BA"
			ElseIf prCep >= 60000000 And prCep <= 63999999 Then
				prEstado = "CE"
			ElseIf prCep >= 70000000 And prCep <= 72799999 Then
				prEstado = "DF"
			ElseIf prCep >= 29000000 And prCep <= 29999999 Then
				prEstado = "ES"
			ElseIf prCep >= 69300000 And prCep <= 69399999 Then
				prEstado = "RR"
			ElseIf prCep >= 72800000 And prCep <= 76999999 Then
				prEstado = "GO"
			ElseIf prCep >= 65000000 And prCep <= 65999999 Then
				prEstado = "MA"
			ElseIf prCep >= 78000000 And prCep <= 78899999 Then
				prEstado = "MT"
			ElseIf prCep >= 79000000 And prCep <= 79999999 Then
				prEstado = "MS"
			ElseIf prCep >= 30000000 And prCep <= 39999999 Then
				prEstado = "MG"
			ElseIf prCep >= 66000000 And prCep <= 68899999 Then
				prEstado = "PA"
			ElseIf prCep >= 58000000 And prCep <= 58999999 Then
				prEstado = "PB"
			ElseIf prCep >= 80000000 And prCep <= 87999999 Then
				prEstado = "PR"
			ElseIf prCep >= 50000000 And prCep <= 56999999 Then
				prEstado = "PE"
			ElseIf prCep >= 64000000 And prCep <= 64999999 Then
				prEstado = "PI"
			ElseIf prCep >= 20000000 And prCep <= 28999999 Then
				prEstado = "RJ"
			ElseIf prCep >= 59000000 And prCep <= 59999999 Then
				prEstado = "RN"
			ElseIf prCep >= 90000000 And prCep <= 99999999 Then
				prEstado = "RS"
			ElseIf prCep >= 78900000 And prCep <= 78999999 Then
				prEstado = "RO"
			ElseIf prCep >= 77000000 And prCep <= 77999999 Then
				prEstado = "TO"
			ElseIf prCep >= 88000000 And prCep <= 89999999 Then
				prEstado = "SC"
			ElseIf prCep >= 01000000 And prCep <= 19999999 Then
				prEstado = "SP"
			ElseIf prCep >= 49000000 And prCep <= 49999999 Then
				prEstado = "SE"
			End If
			
			If prEstado <> "" Then				
				
				ComandoSQL = "SELECT * FROM " & prEstado & " WHERE cep = '" & Left(prCep,5) & "-" & Right(prCep,3) & "'"				
			    Set objRS_log = Server.CreateObject("ADODB.Recordset")
				objRS_log.CursorLocation = 2
				objRS_log.CursorType = 1
				objRS_log.LockType = 1
				objRS_log.Open ComandoSQL, ConexaoCep,,, &H0001
				id_log = ""
				If Not objRS_log.EOF Then
				  prNome_localidade = objRS_log("localidade")
				  prNome_bairro = objRS_log("bai_ini")
				  prNome_log = objRS_log("logradouro") & " " & objRS_log("nome")
				Else
				  ComandoSQL = "SELECT * FROM Cidade WHERE cep = '" & Left(prCep,5) & "-" & Right(prCep,3) & "'"
				  Set objRS_bairro = Server.CreateObject("ADODB.Recordset")
				  objRS_bairro.CursorLocation = 2
				  objRS_bairro.CursorType = 1
				  objRS_bairro.LockType = 1
				  objRS_bairro.Open ComandoSQL, ConexaoCep,,, &H0001
				  If Not objRS_bairro.EOF Then
					prNome_localidade = objRS_bairro("nome")
					prNome_bairro = ""
				  End If
				  objRS_bairro.Close
				End If
				objRS_log.Close
				'ConexaoCep.Close
				If prNome_localidade = "" Then
				  prEstado = ""
				  prCep = ""
				  retCep = "<script language='javascript'>alert('Número de cep não encontrado')</script>"
				end if																		
			Else  
				retCep = "<script language='javascript'>alert('Número de cep inválido')</script>"
			End If
		 
	   If Err.Number Then
		  retCep = "<script language='javascript'>alert('Erro ao executar evento retCep n° " & Err.Number & " descricao : " & replace( Err.Description,"'","" )	 & "')< /script>"
	   End If	
    End Function


End Class

%> 

