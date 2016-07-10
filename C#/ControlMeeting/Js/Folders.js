// Vars /////////////////////////////////////////////////////////////////////
var events = null
var txtId = null
var idFolder = 0
var idParent = 0
var enableDel = true
var contentFieldFolder = null
var tdAlter = null
/////////////////////////////////////////////////////////////////////////////


// Functions ////////////////////////////////////////////////////////////////

function setGroupsFolder(){
	if( ! activeUser() ) return;
	else{
		iframe = "<iframe src=\"controls/addGroupsFolder.aspx?idFolder=" + idFolder + "\" frameborder=0 width=100% height=100 ></iframe>"
		getLayerAlpha( iframe )
	}
}

function alterLocationFolder( idFolderNew, idFolderChild  ){
	userOn("alterLocationFolderLogin(" + idFolderNew + ", " + idFolderChild + ")")
}

function alterLocationFolderLogin( idFolderNew, idFolderChild  ){
	var url = "Ajax/AjaxFolder.aspx?idFolderNew=" + idFolderNew + "&idFolderChild=" + idFolderChild
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			if( objAjax.GetLength("return") <=0 )
				alert( "erro ao alterar localizacao da pasta" )
			else{
				var dir = document.getElementById( idFolderChild )
				var folder = dir.parentNode.parentNode.parentNode.parentNode
				var deletes = dir.parentNode.parentNode.parentNode.parentNode.parentNode
				deletes.removeChild( folder )
								
				if( idFolderNew != 0 ){
					alterImg( idFolderNew )
					reloadFolder( idFolderNew );
				}
				else reloadRoot();
			}
		}
		hideLoading();
	}
}

function loginUser( idUserL ){
	if( idUserL != idUser ){
		reloadRoot()
		desabledGuiaContentParan( "none" )
		desabledGuiaPrevieParan( "none" )
		
		var tbItens = document.getElementById( "tbItens" )
		var tbody = tbItens.firstChild
		var tbodyNew = document.createElement( "tbody" )				
		tbItens.removeChild( tbody )
		tbItens.appendChild( tbodyNew )
		
		var tbPreview = document.getElementById( "tbPreview" )
		tbPreview.innerHTML = ""		
		
		idUser = idUserL
	}
	
	closeLayerAlpha()	
}

function reloadRoot(){
	var url = "Ajax/AjaxFolder.aspx?root=true"
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			if( objAjax.GetLength("return") <=0 )
				alert( "erro ao carregar root" )
			else{
				var root = document.getElementById( "Root" )
				root.innerHTML = objAjax.Get( "return",0 )
			}
		}
		hideLoading();
	}
}

function reloadFolder( idFolderR ){
	var tbSele	 = null
	var tBory	 = null
	var tbImage  = null
	var td		 = null
	var trId	 = null	
	var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )
	var txtIdFolder =  document.getElementById( "txtIdFolder" )

	tbSele = document.getElementById( idFolderR )	
	
	try{	
		tBory = tbSele.parentNode
	}
	catch( e ){ return false; }
	
	tbImage = tbSele.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild
	td = tbSele.firstChild.firstChild.firstChild.firstChild.firstChild
	trId = tbSele
	idParent = trId.id
	
	// remove o diretório se já foi aberto //
	var tbody = tBory.parentNode
	if( tbody.rows.length == 2  ){	
		if( tbody.rows[1].style.display == "none" ){
			var trRemove = tbody.rows[1]
			var tbodyRemove = trRemove.parentNode
			tbodyRemove.removeChild( trRemove )
		}
		else{	
			var trRemove = tbody.rows[1]
			var tbodyRemove = trRemove.parentNode
			tbodyRemove.removeChild( trRemove )
					
			tbImage.src = "imagens/dirAberto.gif"	
			txtIdFolder.value = trId.id	
			td.setAttribute("onclick",CloseDir)	
			
			var url = "Ajax/AjaxFolder.aspx?idParent=" + idParent
			var objAjax = new Ajax()
			objAjax.Send(url , "GET", true, callback );
			
			function callback(){
				if( objAjax.Loading() ) createLoading()
				if( objAjax.Loadeds() ){
					var count = objAjax.GetLength("idFolder")
					var row = document.createElement( "tr" )	
					var cel = document.createElement( "td" )
					var table = "<TABLE BORDER=\"0\" width=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\">";			
				
					for( i=0; i<count; i++ ){
						var idFolder = objAjax.Get( "idFolder", i )
						var idUserCreate = objAjax.Get( "idUser", i )
						var idParent = objAjax.Get( "idParent", i )
						var name = objAjax.Get( "name", i )				
						
						var events = ""
						var hand = ""
						var dir = "dirFechadoSemMais.gif"
						
						if( objAjax.Get( "countChild", i ) > 0 ){
							events = "onclick=\"javascript:OpenDir()\""
							hand = "style=\"cursor:hand\""
							dir = "dirFechado.gif"
						}
						
						table += getHtmFolder( idFolder, hand, events, dir, idParent, name, idUserCreate )
					}
					
					table +="</TABLE>";
					
					
					cel.innerHTML = table
					row.appendChild( cel )	
					tBory.appendChild( row )
								
					hideLoading();
				}
			}
		}
	}
	// remove o diretório se já foi aberto //
}

function getHtmFolder( idFolder, hand, events, dir, idParent, name, idUserCreate ){
	var htm	= " <TR >"+
			"	<td width=\"10\" >&nbsp;</td>"+	
			"	<td nowrap >"+
			"		<TABLE BORDER=\"0\" width=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\">"+
			"			<TR id=" + idFolder + " idParent=" + idParent + " idUser=" + idUserCreate + ">"+
			"				<td nowrap >"+
			"					<TABLE  BORDER=\"0\" CELLSPACING=\"2\" CELLPADDING=\"0\">"+
			"						<TR >"+
			"							<TD " + hand + events + " ><img onmousedown=\"startDrag('"+ idFolder +"', '" + idUserCreate +  "', 'Pasta')\" border=0 src=\"imagens/" + dir + "\"></TD>"+
			"							<TD style=\"cursor:hand\" onmouseout=\"outCassFolder()\" onmouseover=\"overClassFolder()\" nowrap idParent=" + idParent + " isFolder=\"true\" idFolder=" + idFolder + " idUser=" + idUserCreate + " onmousedown=\"FolderSelect()\" ondblclick=\"FolderAlter()\" > " + name + "</TD>"+
			"						</TR>"+
			"					</TABLE>"+
			"				</td>"+
			"			</TR>"+
			"		</TABLE>"+
			"	</td>"+							
			" </TR>";	
			
	return htm
}

function newDirAjax(){
	userOn("newDirAjaxLogin()")
}

function newDirAjaxLogin(){	
	if( activeUser() ){
		var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )
		idParent = txtIdFolderOpen.value	
		
		var url = "Ajax/AjaxFolder.aspx?addNew=true&idParent=" + idParent
		var objAjax = new Ajax()
		objAjax.Send(url , "GET", true, callback );
		
		function callback(){
			if( objAjax.Loading() ) createLoading()
			if( objAjax.Loadeds() ){
				if( objAjax.GetLength("return") <=0 )
					alert( "erro ao criar novo" )
				else{
					idFolder = objAjax.Get("return",0)
					idUserCreateGlobal = objAjax.Get("idUser", 0)
					idParent = objAjax.Get("idParent",0)
					var img = document.getElementById( txtIdFolderOpen.value )
					var tbody = img.parentNode
					if( tbody.rows.length == 2 ){		
						tbody.rows[1].style.display = "block"
						NewDir()
					}
					else newFolder()
				}
			}
			hideLoading();
		}
	}
}


function newFolder(){
	OpenDir( "new" )
}

function getParentFolderId( idFolderP ){		
	idFolderP = parseInt( idFolderP )
	var tbParent = document.getElementById( idFolderP )
	if( tbParent ){
		if( tbParent.idParent != "" )
			return tbParent.idParent
	}
	else return null
}

function NewDir(){	
	enableDel = false	
	var txtIdFolder = document.getElementById( "txtIdFolder" )
	var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )
	
	var tbody = null
	var row = null
	var cel = null
	
	if( txtIdFolderOpen.value == 0 ){
		img = document.getElementById( txtIdFolder.value )		
		
		if( txtIdFolder.value == 0 ){
			tbody = img.firstChild.firstChild.firstChild
			row = document.createElement( "tr" )
			cel = document.createElement( "td" )
		}
		else{
			tbody = img.firstChild.nextSibling.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling.firstChild.firstChild	
			row = document.createElement( "tr" )
			cel = document.createElement( "td" )	
		}
		
		cel.innerHTML =  "<TABLE BORDER=\"0\" width=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\">"+
					"	<tbody >"+
					"		<TR id=" + idFolder + " idUser=" + idUserCreateGlobal + " idParent=" + idParent + ">"+
					"			<td nowrap >"+
					"				<TABLE  BORDER=\"0\" CELLSPACING=\"2\" CELLPADDING=\"0\">"+
					"					<tbody >"+
					"						<TR >"+
					"							<TD style=\"cursor:hand\" onclick=\"javascript:OpenDir(1)\" ><img onmousedown=\"startDrag('"+ idFolder +"','" + idUserCreateGlobal + "', 'Pasta')\" border=0 src=\"imagens/dirFechadoSemMais.gif\"></TD>"+
					"							<TD nowrap onmouseout=\"outCassFolder()\" onmouseover=\"overClassFolder()\" idParent=" + idParent + " isFolder=\"true\" idFolder=" + idFolder + " idUser=" + idUserCreateGlobal + " onmousedown=\"FolderSelect()\" ondblclick=\"FolderAlter()\" ><input type=\"text\" id=\"txt" + idFolder + "\" >"+
					"							</TD>"+
					"						</TR>"+
					"					</tbody>"+
					"				</TABLE>";
					"			</td>"+
					"		</TR>"+
					"	</tbody>"+
					"</TABLE>";
		
		row.appendChild( cel )
		tbody.appendChild( row )
	}
	else{		
		try{
			
			alterImgTable( "dirAberto.gif", txtIdFolderOpen.value )
			
			img = document.getElementById( txtIdFolderOpen.value )
			img = img.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling
						
			try{
				tbody = img.parentNode.parentNode.parentNode.parentNode.parentNode.nextSibling.firstChild.firstChild.firstChild
			}
			catch( e ){	
				tbody = img.parentNode.parentNode.parentNode.parentNode.nextSibling.firstChild.firstChild.firstChild
			}
			
			row = document.createElement( "tr" )
			cel0 = document.createElement( "td" )					
			cel = document.createElement( "td" )
			
			cel.innerHTML =	"<TABLE BORDER=\"0\" width=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\">"+
							"	<TR id=" + idFolder + " idUser=" + idUserCreateGlobal + " idParent=" + idParent + ">"+
							"		<td nowrap >"+
							"			<TABLE  BORDER=\"0\" CELLSPACING=\"2\" CELLPADDING=\"0\">"+
							"					<TR >"+
							"						<TD style=\"cursor:hand\" onclick=\"javascript:OpenDir(1)\" ><img onmousedown=\"startDrag('"+ idFolder +"','"+ idUserCreateGlobal +"', 'Pasta')\" border=0 src=\"imagens/dirFechadoSemMais.gif\"></TD>"+
							"						<TD nowrap onmouseout=\"outCassFolder()\" onmouseover=\"overClassFolder()\" idParent=" + idParent + " isFolder=\"true\" idFolder=" + idFolder + " idUser=" + idUserCreateGlobal + "  onmousedown=\"FolderSelect()\" ondblclick=\"FolderAlter()\" ><input type=\"text\" id=\"txt" + idFolder + "\" ></TD>"+
							"					</TR>"+
							"			</TABLE>";
							"		</td>"+
							"	</TR>"+
							"</TABLE>";
							
			row.appendChild( cel0 )
			row.appendChild( cel )
			tbody.appendChild( row )
		}
		catch( e ){				
			img = document.getElementById( txtIdFolderOpen.value )
			tbory = img.parentNode
					
			alterImgTable( "dirAberto.gif", txtIdFolderOpen.value )
									
			var row = document.createElement( "tr" )	
			var cel = document.createElement( "td" )
			
			cel.height = "15"				
			cel.innerHTML = "<TABLE BORDER=\"0\" width=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\">"+
							"	<TR >"+
							"		<td width=\"10\" >&nbsp;"+				
							"		</td>"+	
							"		<td nowrap >"+
							"			<TABLE BORDER=\"0\" width=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\">"+
							"				<tbody >"+
							"					<TR id=" + idFolder + " idUser=" + idUserCreateGlobal + " idParent=" + idParent + ">"+
							"						<td nowrap >"+
							"							<TABLE  BORDER=\"0\" CELLSPACING=\"2\" CELLPADDING=\"0\">"+
							"								<tbody >"+
							"									<TR >"+
							"										<TD style=\"cursor:hand\" onclick=\"javascript:OpenDir(1)\" ><img border=0 onmousedown=\"startDrag('"+ idFolder +"','" + idUserCreateGlobal + "', 'Pasta')\" src=\"imagens/dirFechadoSemMais.gif\"></TD>"+
							"										<TD nowrap onmouseout=\"outCassFolder()\" onmouseover=\"overClassFolder()\" idParent=" + idParent + " isFolder=\"true\" idFolder=" + idFolder + " idUser=" + idUserCreateGlobal + " onmousedown=\"FolderSelect()\" ondblclick=\"FolderAlter()\" ><input type=\"text\" id=\"txt" + idFolder + "\" ></TD>"+
							"									</TR>"+
							"								</tbody>"+
							"							</TABLE>";
							"						</td>"+
							"					</TR>"+
							"				</tbody>"+
							"			</TABLE>";
							"		</td>"+
							"	</TR>"+
							"</TABLE>";
			
			row.appendChild( cel )	
			tbory.appendChild( row )	
		}
	}	
	
	txtId = document.getElementById( "txt" + idFolder )	
	txtId.setAttribute("onblur",AlterFolderNew)	
	txtId.setAttribute("onkeydown",AlterFolderKeyNew)
	
	setTimeout( "SetFocus()", 400 )
}

function SetFocus(){
	try{
		txtId.focus()
	}catch(e){}
}

function FolderSelect(){
	try{
		if( event.button == 2 )	createMenuFolder(2)
			
		unSelectAnt()
		var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )	
		alterImg( txtIdFolderOpen.value )
		var img = document.getElementById( txtIdFolderOpen.value )				
		var id = null
		var td = null
		
		try{
			if( event.srcElement ){
				id = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.id
				td = event.srcElement
			}
			else{
				id = txtIdFolderOpen.value		
				td = document.getElementById( txtIdFolderOpen.value )
				td = td.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling
			}
		}
		catch( e ){
			id = txtIdFolderOpen.value		
			td = document.getElementById( txtIdFolderOpen.value )
			td = td.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling
		}
			
		if( id != null && id != "" ){
			userOn("getItens( " + id + " )")
			desabledGuiaPrevieParan( "none" )
			
			txtIdFolderOpen.value = id			
			idFolder = id
		}
			 
		td.className = "folderSelect"
	}
	catch( e ){}
}

function outCassFolder(){
	if( event.srcElement.className != "folderSelect" ){
		event.srcElement.className = ""
	}
}

function overClassFolder(){
	if( event.srcElement.className != "folderSelect" ){
		event.srcElement.className = "tab_fio"
	}
}

function cancelFolder( id ){
	var dir = document.getElementById( id )
	var folder = dir.parentNode.parentNode.parentNode.parentNode
	var deletes = dir.parentNode.parentNode.parentNode.parentNode.parentNode
	deletes.removeChild( folder )
		
	try{
		deleteFolderAjax( id, deletes.parentNode.parentNode.parentNode.previousSibling.id )
	}
	catch( e ){
		deleteFolderAjax( id, 1 )
	}
}

function deleteFolder(){
	userOn("deleteFolderLogin()")
}

function activeUser(){
	try{
		var tbSele = null
		var id = null
		var td = null
		var tr = null
		
		try{
			if( event.srcElemen ){
				id = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.id	
				td = event.srcElement
				tr = event.srcElement.parentNode
			}
			else{				
				var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )				
				tbSele = document.getElementById( txtIdFolderOpen.value )
				id = tbSele.id	
				td = tbSele.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling
				tr = tbSele.firstChild.firstChild.firstChild.firstChild
				
				unSelectAnt()
			}
		}
		catch( e ){
			var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )				
			tbSele = document.getElementById( txtIdFolderOpen.value )
			id = tbSele.id	
			td = tbSele.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling
			tr = tbSele.firstChild.firstChild.firstChild.firstChild
			
			unSelectAnt()
		}
	
		idUserCreateGlobal = tr.firstChild.nextSibling.idUser
		if( idUserCreateGlobal != top.idUser && ! userAdmGlobal  ){
			alert('Seu usuario nao tem permissao para esta pasta');
			return false
		}
	}catch(e){return true}
	
	return true;
}

function deleteFolderLogin(){
	var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )	
	if( txtIdFolderOpen.value == 0 ) {
		alert( "Selecione uma pasta" )	
		return
	}
	
	if( ! activeUser() ) return;
	
	if( confirm( "Confirma exclusao da pasta selecionada?" ) ){
		var dir = document.getElementById( txtIdFolderOpen.value )
		var folder = dir.parentNode.parentNode.parentNode.parentNode
		var deletes = dir.parentNode.parentNode.parentNode.parentNode.parentNode
		deletes.removeChild( folder )
		
		desabledGuiaContentParan( "none" )
		desabledGuiaPrevieParan( "none" )
		
		try{
			deleteFolderAjax( txtIdFolderOpen.value, deletes.parentNode.parentNode.parentNode.previousSibling.id )
		}
		catch( e ){
			deleteFolderAjax( txtIdFolderOpen.value, 1 )
		}
		
		txtIdFolderOpen.value = 0
	}
}

function deleteFolderDrag(){
	
	if( confirm( "Confirma exclusao da pasta?" ) ){
		var dir = document.getElementById( itemDrag )
		var folder = dir.parentNode.parentNode.parentNode.parentNode
		var deletes = dir.parentNode.parentNode.parentNode.parentNode.parentNode
		deletes.removeChild( folder )
		
		try{
			deleteFolderAjax( itemDrag, deletes.parentNode.parentNode.parentNode.previousSibling.id )
		}
		catch( e ){
			deleteFolderAjax( itemDrag, 1 )
		}
		
		if( itemDrag == idFolder ){
			desabledGuiaContentParan( "none" )
			desabledGuiaPrevieParan( "none" )
			var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )	
			txtIdFolderOpen.value = 0
		}
	}
}

function keysFunctions(){
	if( event.keyCode == 27 ){
		closePreview();
		if( logIn != 0 )
			closeLayerAlpha();
	}
	
	if( enableDel ){
		switch( event.keyCode ){
			case 46:
				deleteFolder();
				break;
			case 113:
				FolderAlter();
				break;
		}
	}
}

function alterImgTable( imagem, id ){
	try{					
		var img = document.getElementById( id )
		tbImage = img.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild			
		tbImage.src = "imagens/" + imagem
		var td = tbImage.parentNode
		
		if( imagem == "dirAberto.gif" ) td.setAttribute("onclick",CloseDir)
		else if( imagem == "dirFechado.gif" ) td.setAttribute("onclick",OpenDir)
	}
	catch( e ){}
}

function alterImg( id ){
	if( id == 0 || id == "" ) return 
	
	var url = "Ajax/AjaxFolder.aspx?count=true&idFolder=" + id
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			if( objAjax.GetLength("countChild") > 0 ){
				if( objAjax.Get( "countChild",0 ) <= 0 ){
					alterImgTable( "dirFechadoSemMais.gif", id )
				}
				else{
					try{
						var img = document.getElementById( id )
						img = img.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild	

						if( img.tagName.toLowerCase() == "img" ){
							if( img.src.indexOf("dirFechadoSemMais.gif") != -1 )
								alterImgTable( "dirFechado.gif", id )
						}
					}
					catch(e){}
				}
			}
		}
		hideLoading();
	}

}

function AlterFolderKeyNew(){
	var id = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.id	
	if( event.keyCode == 13 ){
		var txtId = document.getElementById( "txt" + id )
		var td = txtId.parentNode
		
		if( txtId.value != "" )
			td.innerText = txtId.value	
		else
			td.innerText = "Nova Pasta " + id
		
		unSelectAnt()
		alterFolderAjax( id, td.innerText )		
	}
	else if( event.keyCode == 27 ){
		cancelFolder( idFolder )
	}
}

function FolderAlter(){	
	var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )	
	if( txtIdFolderOpen.value == 0 ) {
		alert( "Selecione uma pasta" )	
		return
	}
	else if( ! activeUser() ) return;
	
	enableDel = false
	var tbSele = null
	var id = null
	var td = null
	var tr = null
	
	try{
		if( event.srcElemen ){
			id = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.id	
			td = event.srcElement
			tr = event.srcElement.parentNode
		}
		else{
			tbSele = document.getElementById( idFolder )
			id = tbSele.id	
			td = tbSele.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling
			tr = tbSele.firstChild.firstChild.firstChild.firstChild
			
			unSelectAnt()
		}
	}
	catch( e ){
		tbSele = document.getElementById( idFolder )
		id = tbSele.id	
		td = tbSele.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling
		tr = tbSele.firstChild.firstChild.firstChild.firstChild
		
		unSelectAnt()
	}
	
	var tdNew = document.createElement( "td" )		
	contentFieldFolder = td.innerText
	tdNew.innerHTML = "<input type=\"text\" id=\"txt" + id + "\" value=\"" + contentFieldFolder + "\" >"
	tdNew.setAttribute("ondblclick",FolderAlter)
	tdNew.setAttribute("onmousedown",FolderSelect)	
	tdNew.setAttribute("isFolder","true")
	tdNew.setAttribute("idParent",idParent)	
	tdNew.setAttribute("idFolder",idFolder)	
	tdNew.setAttribute("idUser",idUserCreateGlobal)	
	tdNew.setAttribute("onmouseout",outCassFolder)	
	tdNew.setAttribute("onmouseover",overClassFolder)
	tdNew.nowrap = true
	
	tr.appendChild( tdNew )	
	tr.removeChild( td )
	
	tdAlter = tdNew
	
	txtId = document.getElementById( "txt" + id )
	if( txtId.value == "New Folder" ) txtId.value = ""	
	txtId.setAttribute("onblur",AlterFolder)	
	txtId.setAttribute("onkeydown",AlterFolderKey)
	
	setTimeout( "SetFocus()", 400 )
}

function cancelAlter(){
	if( tdAlter && tdAlter.tagName == "TD" ){
		var tr = tdAlter.parentNode
		var tdNew = document.createElement( "td" )		
		
		tdNew.innerHTML = contentFieldFolder
		tdNew.setAttribute("ondblclick",FolderAlter)
		tdNew.setAttribute("onmousedown",FolderSelect)	
		tdNew.nowrap = true
		
		tr.appendChild( tdNew )	
		tr.removeChild( tdAlter )
		
		enableDel = true
		FolderSelect()
	}
}

function AlterFolderNew(){
	var id = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.id
	var txtId = document.getElementById( "txt" + id )	
	var td = txtId.parentNode
	
	if( txtId.value != "" )
		td.innerText = txtId.value	
	else
		td.innerText = "Nova Pasta " + id
		
	unSelectAnt()
	alterFolderAjax( id, td.innerText )
}

function AlterFolderKey(){
	var id = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.id
	
	if( event.keyCode == 13 ){
		var txtId = document.getElementById( "txt" + id )
		var td = txtId.parentNode
		
		if( txtId.value != "" )
			td.innerText = txtId.value	
		else
			td.innerText = "Nova Pasta " + id
			
		unSelectAnt()
		alterFolderAjax( id, td.innerText )
		
		td.className = "folderSelect"
		getItens( id )
		desabledGuiaPrevieParan( "none" )
	}
	else if( event.keyCode == 27 ) cancelAlter()
}

function AlterFolder(){
	var id = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.id
	var txtId = document.getElementById( "txt" + id )	
	var td = txtId.parentNode
	
	if( txtId.value != "" )
		td.innerText = txtId.value	
	else
		td.innerText = "Nova Pasta " + id
	
	unSelectAnt()
	alterFolderAjax( id, td.innerText )			
	td.className = "folderSelect"
	getItens( id )
	desabledGuiaPrevieParan( "none" )
}

function alterFolderAjax( idFolder, Name ){

	var url = "Ajax/AjaxFolder.aspx?alter=true&idFolder=" + idFolder + "&Name=" + escape( Name )
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			if( objAjax.GetLength("return") <=0 )
				alert( "erro ao alterar" )
			else{				
				var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )												
				txtIdFolderOpen.value = idFolder
				FolderSelect()
			}
		}		
		hideLoading();
		enableDel = true;
	}
}

function unSelectAnt(){	
	try{
		var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )
		var img = document.getElementById( txtIdFolderOpen.value )
		var tdAnt = null	
		if( txtIdFolderOpen.value == 0 )
			tdAnt = img.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling
		else
			tdAnt = img.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling
		if( tdAnt ) tdAnt.className = "folderNotSelect"
	}
	catch( e ){}
}

function unSelectAntAll(){	
	try{
		var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )
		var txtIdFolder = document.getElementById( "txtIdFolder" )		
		var img = document.getElementById( txtIdFolderOpen.value )
		var tdAnt = null	
		
		if( txtIdFolderOpen.value == 0 )
			tdAnt = img.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling
		else
			tdAnt = img.firstChild.firstChild.firstChild.firstChild.firstChild.nextSibling
		if( tdAnt ) tdAnt.className = "folderNotSelect"
		
		txtIdFolderOpen.value = 0
		txtIdFolder.value = 0
	}
	catch( e ){}
}

function deleteFolderAjax( idFolder, id ){
	var url = "Ajax/AjaxFolder.aspx?delete=true&idFolder=" + idFolder
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			if( objAjax.GetLength("return") <=0 )
				alert( "erro ao deletar" )
			else
				alterImg( id )		
		}
		hideLoading();
	}

}

function CloseDir( dirId ){
	/////////////////////////////////////////////////////////////////
	unSelectAnt()	
	/////////////////// desmarcando pasta anterior /////////////////
	var tdMain = null
	var tbImage = null
	var dirAnterior = null
	var tdNew = null
	var id = null
	var tr = null
		
	if( event ){
		try{
			dirAnterior = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.previousSibling.parentNode
		}
		catch( err ){
			dirAnterior = 0
		}
			
		tdMain = event.srcElement.parentNode	
		tbImage = event.srcElement
		tdNew = event.srcElement.parentNode.nextSibling		
		id = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.id		
		try{	
			tbody = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode		
			tr = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.nextSibling			
		}
		catch( err ){
			tbody = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode
			tr = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.nextSibling
		}
	}
	else{
		tdMain = document.getElementById( idFolder )
		tdMain = tdMain.firstChild.firstChild.firstChild.firstChild.firstChild
		tbImage = tdMain.firstChild
		tdNew = tdMain.nextSibling	
		id = tdMain.parentNode.parentNode.parentNode.parentNode.parentNode.id		
		tr = tdMain.parentNode.parentNode.parentNode.parentNode.parentNode.nextSibling
		
		try{
			var dirAnterior = tbMain.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.previousSibling.parentNode
		}
		catch( err ){
			var dirAnterior = 0
		}
	}
	
	tbImage.src = "imagens/dirFechado.gif"
	
	var txtIdFolder = document.getElementById( "txtIdFolder" )
	if( dirAnterior != 0 )
		txtIdFolder.value = dirAnterior.id
	else
		txtIdFolder.value = 0
			
	tr.style.display = "none"
	tdMain.setAttribute("onclick",OpenDir)
			
	/////////////////// marcando pasta atual ///////////////////////////
	var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )
	tdNew.className = "folderSelect"	
	if( id != "" ){
		txtIdFolderOpen.value = id
		idFolder = id
	}
		
	getItens( id )
	desabledGuiaPrevieParan( "none" )
}


function OpenDir( flg ){	
	
	var txtIdFolder = document.getElementById( "txtIdFolder" )
	var txtIdFolderOpen = document.getElementById( "txtIdFolderOpen" )
	var tbSele	 = null
	var tBory	 = null
	var tbImage  = null
	var td		 = null
	var trId	 = null
	
	if( flg == "new" && txtIdFolderOpen.value == 0 ){
		NewDir()
		return
	}
	
	try{
		if( event.srcElement ){
			tBory = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode	
			tbImage = event.srcElement	
			td = event.srcElement.parentNode
			trId = tbImage.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode	
			idParent = trId.id	
		}
		else{		
			tbSele = document.getElementById( txtIdFolderOpen.value )		
			tBory = tbSele.parentNode
			tbImage = tbSele.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild
			td = tbSele.firstChild.firstChild.firstChild.firstChild.firstChild
			trId = tbSele
			idParent = trId.id
		}
	}
	catch( e ){
		tbSele = document.getElementById( txtIdFolderOpen.value )		
		tBory = tbSele.parentNode
		tbImage = tbSele.firstChild.firstChild.firstChild.firstChild.firstChild.firstChild
		td = tbSele.firstChild.firstChild.firstChild.firstChild.firstChild
		trId = tbSele
		idParent = trId.id	
	}
	
	// abre o diretório se já foi aberto //
	var tbody = tBory.parentNode
	if( tbody.rows.length == 2  ){			
		if( tbody.rows[1].style.display == "none" ){
			tbody.rows[1].style.display = "block"
			alterImgTable( "dirAberto.gif", trId.id )
			txtIdFolder.value = trId.id 	
			hideLoading();
			return
		}
	}
	// abre o diretório se já foi aberto //		
	
	tbImage.src = "imagens/dirAberto.gif"	
	txtIdFolder.value = trId.id	
	td.setAttribute("onclick",CloseDir)	
	
	var url = "Ajax/AjaxFolder.aspx?idParent=" + idParent
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			var count = objAjax.GetLength("idFolder")
			
			var row = document.createElement( "tr" )	
			var cel = document.createElement( "td" )
			var table = "<TABLE BORDER=\"0\" width=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\">";			
		
			for( i=0; i<count; i++ ){
				var idFolder = objAjax.Get( "idFolder", i )
				var idUserC = objAjax.Get( "idUser", i )
				var idParent = objAjax.Get( "idParent", i )
				var name = objAjax.Get( "name", i )				
				
				var events = ""
				var hand = ""
				var dir = "dirFechadoSemMais.gif"
				
				if( objAjax.Get( "countChild", i ) > 0 ){
					events = "onclick=\"javascript:OpenDir()\""
					hand = "style=\"cursor:hand\""
					dir = "dirFechado.gif"
				} 
				
				table += getHtmFolder( idFolder, hand, events, dir, idParent, name, idUserC )
			}
			
			table +="</TABLE>";
			
			
			cel.innerHTML = table
			row.appendChild( cel )	
			tBory.appendChild( row )
						
			hideLoading();
			
			if( flg == "new" ) {
				FolderAlter()
			}
		}
	}
}


/////////////////////////////////////////////////////////////////////////////

// Actions Document /////////////////////////////////////////////////////////
//document.onmousedown = hideLoading
//document.oncontextmenu	= new Function ("return false");
document.onkeydown = keysFunctions

//if( window.addEventListener ) window.addEventListener( "load", function() { createLoading()	}, false )
//else if( window.attachEvent ) window.attachEvent( "onload", function() { createLoading() } )	
/////////////////////////////////////////////////////////////////////////////