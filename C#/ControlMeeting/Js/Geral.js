// Vars /////////////////////////////////////////////////////////////////////
var logIn = 0
var div = null
var fIn = null, dOut = null
var enabledLoading = false
var exceptionsGlobal = false
var conteudo = null
var typeLog = null
var vSituaAss = null
var events = null
var idFolder = 50
var collPage = null
var lLeft = null
var lTop = null
var x = null
var Y = null
var idFolderDrag = 0
var itemDrag = null
var typeDrag = null
var isFolder = null
var isDelete = null
var idParent = null
var alterLocation = null
var classFolderOld = null
var eventTbOld = null
var isRoot = null

/////////////////////////////////////////////////////////////////////////////


// Functions ////////////////////////////////////////////////////////////////

function startDrag(item, idUserC, type){
	idUserCreateGlobal = idUserC
	
	itemDrag = item
	typeDrag = type
	
    document.onmouseup = removeLayerMoveAll
	document.onmousemove = moveResizeAll
	
    collPage = document.createElement( "div" )	
	collPage.style.position = "absolute"
	collPage.style.cursor = "move"
	collPage.onmousedown = setMove
	collPage.style.width = 150
	collPage.style.height = 25
	
	collPage.style.left = ( document.body.scrollLeft + event.clientX )
	collPage.style.top = ( document.body.scrollTop + event.clientY )
		
	collPage.style.filter = "alpha(opacity=0)"	
	
	var htm = null
	if(  type == "Pasta" ){		
		htm = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.innerHTML
	}
	else if( type == "Item" ){
		var rowTitle = event.srcElement.parentNode.parentNode.parentNode.firstChild.innerHTML
		var row = event.srcElement.parentNode.parentNode.innerHTML
		var table = "<table BORDER=\"0\" bgcolor=\"#F8F5F0\" width=\"100%\" CELLSPACING=\"2\" CELLPADDING=\"3\" >"
		var fTable = "</table>"	
		
		htm = table + rowTitle + "</tr><tr bgcolor=\"#ffffff\">" + row + fTable
		
		collPage.style.width = 750
	}
	else{
		var rowTitle = event.srcElement.parentNode.parentNode.innerHTML
		var table = "<table BORDER=\"0\" bgcolor=\"#F8F5F0\" width=\"100%\" CELLSPACING=\"2\" CELLPADDING=\"3\" >"
		var fTable = "</table>"	
		
		htm = table + rowTitle + fTable
		
		collPage.style.width = 750
	}
	
	collPage.innerHTML = "<table bgcolor=\"#F8F5F0\" border=1 bordercolor=\"#ECEBEB\" cellpadding=0 cellspacing=0 width=\"100%\" height=\"100%\" ><tr><td bgcolor=\"red\" align=center width=\"20\"><font color=#ffffff>N</font></td><td nowrap=true >" + htm + "</td></tr></table>"
	
	document.body.appendChild( collPage )
}

function removeLayerMoveAll(){
	userOn("removeLayerMoveAllLogin()",1)
}

function disposeCollPage(){
	if( collPage ){	
		document.body.removeChild( collPage )
		collPage = null
		document.onmouseup = null
		document.onmousemove = null
	}
}

function removeLayerMoveAllLogin(){
	if( collPage ){		
		if( alterLocation && collPage.style.filter != "alpha(opacity=0)" ){
			if( ! isDelete ){
				if( typeDrag == "Pasta" ){
					if( isRoot ) alterLocationFolder( 0, itemDrag )
					else alterLocationFolder( idFolderDrag, itemDrag )
				}
				else if( typeDrag == "Item" )
					alterItemFolder( idFolderDrag, idFolder, itemDrag, idForm )				
				else
					alterFormFolder( itemDrag, idFolder, idFolderDrag )
			}
			else{
				if( typeDrag == "Pasta" )
					deleteFolderDrag()
				else if( typeDrag == "Item" )
					deleteItemForm( itemDrag, idUser, idForm )
				else
					removeItemFolder( itemDrag, idUser,idFolder )
			}
		}		
	}
	
	if( eventTbOld ){
		eventTbOld.className = classFolderOld
		eventTbOld = null
		classFolderOld = null
	}
	
	disposeCollPage()
}

function moveResizeAll(){
	if( collPage )
	{
		collPage.style.filter = "alpha(opacity=70)"	
		collPage.style.pixelLeft = lLeft + event.clientX - x
		collPage.style.pixelTop = lTop + event.clientY - Y
		isFolder = event.srcElement.isFolder
		isRoot = event.srcElement.isRoot
		isDelete = event.srcElement.isDelete
		idFolderDrag = event.srcElement.idFolder
		idParent = 0
		
		if( typeDrag != "Item" ){
			
			idParent = event.srcElement.idParent
			var parentParent1 = null
			var parentParent2 = null
			var parentParent3 = null
			var parentParent4 = null
			var parentParent5 = null
			var parentParent6 = null
			var parentParent7 = null
			var parentParent8 = null
			
			var parentParent1 = getParentFolderId( idParent )
			if( parentParent1 != null ){				
				parentParent2 = getParentFolderId( parentParent1 )
				if( parentParent2 != null ){
					parentParent3 = getParentFolderId( parentParent2 )
					if( parentParent3 != null ){
						parentParent4 = getParentFolderId( parentParent3 )
						if( parentParent4 != null ){
							parentParent5 = getParentFolderId( parentParent4 )
							if( parentParent5 != null ){
								parentParent6 = getParentFolderId( parentParent5 )
								if( parentParent6 != null ){
									parentParent7 = getParentFolderId( parentParent7 )
									if( parentParent6 != "" ){
										parentParent7 = getParentFolderId( parentParent6 )
										if( parentParent7 != null ){
											parentParent8 = getParentFolderId( parentParent8 )
										}
									}
								}
							}
						}
					}
				}
			}
		}
		if( idUserCreateGlobal != top.idUser && ! userAdmGlobal ){
			collPage.firstChild.firstChild.firstChild.firstChild.bgColor="Red"
			collPage.firstChild.firstChild.firstChild.firstChild.firstChild.innerHTML="NP"
			alterLocation = false
		
			if( eventTbOld ){
				if( eventTbOld.className == "tab_fio2" ) 
					eventTbOld.className = classFolderOld					 
			}
		}
		else if( isFolder && idFolderDrag != itemDrag 
			&& idParent != itemDrag  
			&& parentParent1 != itemDrag 
			&& parentParent2 != itemDrag  
			&& parentParent3 != itemDrag 
			&& parentParent4 != itemDrag
			&& parentParent4 != itemDrag
			&& parentParent5 != itemDrag
			&& parentParent6 != itemDrag
			&& parentParent7 != itemDrag
			&& parentParent8 != itemDrag ){
						
				collPage.firstChild.firstChild.firstChild.firstChild.bgColor="Green"
				collPage.firstChild.firstChild.firstChild.firstChild.firstChild.innerHTML="S"
				alterLocation = true
				
				if( eventTbOld ) eventTbOld.className = classFolderOld
				if( event.srcElement.className != "tab_fio2" ) 
					classFolderOld = event.srcElement.className
				event.srcElement.className = "tab_fio2"
				
				eventTbOld = event.srcElement
		}
		else if( isRoot && getParentFolderId( itemDrag ) && getParentFolderId( itemDrag ) != 0 ){
				collPage.firstChild.firstChild.firstChild.firstChild.bgColor="Green"
				collPage.firstChild.firstChild.firstChild.firstChild.firstChild.innerHTML="R"
				alterLocation = true
				
				if( eventTbOld ) eventTbOld.className = classFolderOld
				if( event.srcElement.className != "tab_fio2" ) 
					classFolderOld = event.srcElement.className
				event.srcElement.className = "tab_fio2"
				
				eventTbOld = event.srcElement
		}
		else if( isDelete ){
				collPage.firstChild.firstChild.firstChild.firstChild.bgColor="Green"
				collPage.firstChild.firstChild.firstChild.firstChild.firstChild.innerHTML="E"
				alterLocation = true
			
				if( eventTbOld ) eventTbOld.className = classFolderOld
				if( event.srcElement.className != "tab_fio2" ) 
					classFolderOld = event.srcElement.className
				event.srcElement.className = "tab_fio2"
				
				eventTbOld = event.srcElement
		}		
		else{
				collPage.firstChild.firstChild.firstChild.firstChild.bgColor="Red"
				collPage.firstChild.firstChild.firstChild.firstChild.firstChild.innerHTML="N"
				alterLocation = false
			
				if( eventTbOld ){
					if( eventTbOld.className == "tab_fio2" ) 
						eventTbOld.className = classFolderOld					 
				}
		}
		
	}
	return false
}

function setCol( object ){
	document.onmouseup = removeLayerMove
	document.onmousemove = moveResize
	
	collPage = document.createElement( "div" )	
	collPage.style.position = "absolute"
	collPage.style.cursor = "move"
	collPage.onmousedown = setMove
	collPage.style.width = object.firstChild.offsetWidth
	collPage.style.height = object.firstChild.offsetHeight
	
	collPage.style.left = ( document.body.scrollLeft + event.clientX )
		
	collPage.style.filter = "alpha(opacity=60)"	
	collPage.innerHTML = "<table bgcolor=\"#DEDEDD\" border=0 cellpadding=0 cellspacing=0 width=\"100%\" height=\"100%\" ><tr><td></td></tr></table>"
	
	document.body.appendChild( collPage )
	
}

function setMove()
{
	if( collPage )
	{
		lLeft = collPage.style.pixelLeft
		lTop  = collPage.style.pixelTop
		x = event.clientX
		Y = event.clientY
	}
}

function removeLayerMove(){
	if( collPage ){
		var tbColFolders = document.getElementById( "tbColFolders" )
		var lyMenu = document.getElementById( "lyMenu" )
		var width = collPage.offsetLeft
		
		tbColFolders.width = width
		lyMenu.style.width = ( width - 10 )
	
		document.body.removeChild( collPage )
		collPage = null
		document.onmouseup = null
		document.onmousemove = null
	}
}

function moveResize(){
	if( collPage )
	{
		var left = lLeft + event.clientX - x
		if( left > 200 && left < 500 ){
			collPage.style.pixelLeft = left
			collPage.style.pixelTop = 58
		}
	}
	return false
}

function desabledGuiaContent(){
	var tbMaisMenosContent = document.getElementById( "tbMaisMenosContent" )	
	var tbContent = document.getElementById( "tbContent" )	
	var tbPreview = document.getElementById( "tbPreview" )
	var tbMainContent = document.getElementById( "tbMainContent" )	
	var tbContentGeral = document.getElementById( "tbContentGeral" )		
	tbContentGeral.height = "100%"
	
	if( tbContent.style.display == "block" ){
		tbContent.style.display = "none"
		tbMaisMenosContent.innerHTML = "<a class=\"aWhite\" href=\"javascript:desabledGuiaContent()\"><img src=\"imagens/setaFechada.gif\" border=0> </a>"
		tbMainContent.height = "1%"
	}
	else{
		tbContent.style.display = "block"
		tbMaisMenosContent.innerHTML = "<a class=\"aWhite\" href=\"javascript:desabledGuiaContent()\"><img src=\"imagens/setaAberta.gif\" border=0></a>"	
		tbMainContent.height = "50%"
	}	
	
	if( tbContent.style.display == "none" && tbPreview.style.display == "none" )
		tbContentGeral.height = "1%"
}

function desabledGuiaContentParan( paran ){
	var tbMaisMenosContent = document.getElementById( "tbMaisMenosContent" )	
	var tbContent = document.getElementById( "tbContent" )	
	var tbPreview = document.getElementById( "tbPreview" )
	var tbMainContent = document.getElementById( "tbMainContent" )	
	var tbContentGeral = document.getElementById( "tbContentGeral" )		
	tbContentGeral.height = "100%"
	
	if( paran == "none" ){
		tbContent.style.display = "none"
		tbMaisMenosContent.innerHTML = "<a class=\"aWhite\" href=\"javascript:desabledGuiaContent()\"><img src=\"imagens/setaFechada.gif\" border=0> </a>"
		tbMainContent.height = "1%"
	}
	else{
		tbContent.style.display = "block"
		tbMaisMenosContent.innerHTML = "<a class=\"aWhite\" href=\"javascript:desabledGuiaContent()\"><img src=\"imagens/setaAberta.gif\" border=0></a>"	
		tbMainContent.height = "50%"
	}	
	
	if( tbContent.style.display == "none" && tbPreview.style.display == "none" )
		tbContentGeral.height = "1%"
}

function desabledGuiaPrevieParan( paran ){
	var tbMaisMenosPreview = document.getElementById( "tbMaisMenosPreview" )
	var tbPreview = document.getElementById( "tbPreview" )	
	var tbContent = document.getElementById( "tbContent" )		
	var tbMainPreview = document.getElementById( "tbMainPreview" )	
	var tbContentGeral = document.getElementById( "tbContentGeral" )		
	tbContentGeral.height = "100%"	
		
	if( paran == "none" ){
		tbPreview.style.display = "none"
		tbPreview.innerHTML = ""
		tbMaisMenosPreview.innerHTML = "<a class=\"aWhite\" href=\"javascript:desabledGuiaPreview()\"><img src=\"imagens/setaFechada.gif\" border=0></a>"
		tbMainPreview.height = "1%"
		
		idItem = 0
	}
	else{
		tbPreview.style.display= "block"
		tbMaisMenosPreview.innerHTML = "<a class=\"aWhite\" href=\"javascript:desabledGuiaPreview()\"><img src=\"imagens/setaAberta.gif\" border=0> </a>"	
		tbMainPreview.height = "50%"
	}	
	
	if( tbContent.style.display == "none" && tbPreview.style.display == "none" )
		tbContentGeral.height = "1%"		
}

function desabledGuiaPreview(){
	var tbMaisMenosPreview = document.getElementById( "tbMaisMenosPreview" )
	var tbPreview = document.getElementById( "tbPreview" )	
	var tbContent = document.getElementById( "tbContent" )		
	var tbMainPreview = document.getElementById( "tbMainPreview" )	
	var tbContentGeral = document.getElementById( "tbContentGeral" )		
	tbContentGeral.height = "100%"	
		
	if( tbPreview.style.display == "block" ){
		tbPreview.style.display = "none"
		tbMaisMenosPreview.innerHTML = "<a class=\"aWhite\" href=\"javascript:desabledGuiaPreview()\"><img src=\"imagens/setaFechada.gif\" border=0></a>"
		tbMainPreview.height = "1%"
	}
	else{
		tbPreview.style.display= "block"
		tbMaisMenosPreview.innerHTML = "<a class=\"aWhite\" href=\"javascript:desabledGuiaPreview()\"><img src=\"imagens/setaAberta.gif\" border=0> </a>"	
		tbMainPreview.height = "50%"
	}	
	
	if( tbContent.style.display == "none" && tbPreview.style.display == "none" )
		tbContentGeral.height = "1%"
}

function createIframeDiv(){
	var divFrames = document.getElementById( "iframeAssDiv" )
	if( ! divFrames ){
		var divFrame = document.createElement( "iframe" )
		divFrame.style.position = "absolute"
		divFrame.id = "iframeAssDiv"
		divFrame.frameborder = 0
		divFrame.style.width = document.body.offsetWidth - 21
		divFrame.style.height = document.getElementById( "tbGeral" ).offsetHeight
		divFrame.style.left = 0
		divFrame.style.top = 0
		divFrame.style.filter = "alpha(opacity=0)"
		document.body.appendChild( divFrame )
	}
}

function closeIframeDiv(){
	var divFrame = document.getElementById( "iframeAssDiv" )
	if( divFrame ){
		document.body.removeChild( divFrame )	
		delete divFrame
	}
}

function closePreview(){
	var divs = document.getElementById( "DivPreview" )
	if( divs ){
		document.body.removeChild( divs )	
		delete divs
	}
	closeIframeDiv()	
}

function openPreview(){
	var obj = document.getElementById( "tbPreview" )
	if( obj.innerHTML == "" ) return
	
	createIframeDiv()
	var divAss = document.createElement( "div" )
	divAss.id = "DivPreview"
	divAss.style.position = "absolute"
	divAss.style.border = "1px solid #c0c0c0"
	divAss.style.width = document.body.offsetWidth - 21
	divAss.style.height = document.getElementById( "tbGeral" ).offsetHeight
	divAss.style.left = 0
	divAss.style.top = 0
	
	var table = "<TABLE WIDTH=\"100%\" height=\"" + document.body.offsetHeight + "\" border=0 CELLSPACING=\"0\" CELLPADDING=\"0\">"

	table += "<TR>"
	table += "<TD colspan=3 height=\"20\" align=center bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\" >"	
	table += "&nbsp;</TD>"
	table += "</TR>"
	table += "<TR>"
	table += "<TD width=30% bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\">&nbsp;</td>"	
	table += "<TD width=40% height=\"" + ( document.body.offsetHeight - 50 ) + "\" align=\"center\" valign=\"top\" bgcolor=\"#ffffff\">"	
	table += "<TABLE WIDTH=\"" + ( document.body.offsetWidth - 100 ) + "\" bgcolor=\"#ffffff\" height=\"100%\" BORDER=\"2\" bordercolor=\"#000000\" CELLSPACING=\"2\" CELLPADDING=\"2\" >"
	table += "	<TR>"
	table += "		<TD height=\"25\" align=center >"
	table += "			<table><tr><td><a class=\"aBlack\" href=\"javascript:closePreview()\"> <img src=\"imagens/fechar.gif\" border=0 ></a></td><td><a class=\"aBlack\" href=\"javascript:closePreview()\">Fechar</a></td><td>&nbsp;&nbsp;&nbsp;<a class=\"aBlack\" href=\"javascript:self.print()\"><img src=\"imagens/print.gif\" border=0 ></a></td><td> <a class=\"aBlack\" href=\"javascript:self.print()\">Imprimir</a></td></tr></table>"	
	table += "		</TD>"
	table += "	</TR>"
	table += "	<TR>"
	table += "		<TD valign=\"top\" >"
	table += "			<div style=\"OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%\">"
	table += "			<TABLE ondblclick=\"closePreview()\" bgcolor=\"#ffffff\" WIDTH=\"100%\" height=\"100%\" align=\"center\" BORDER=\"0\" CELLSPACING=\"0\" CELLPADDING=\"0\" >"
	table += "				<TR>"
	table += "					<TD align=\"left\" valign=\"top\">"
	table += "						" + obj.innerHTML
	table += "					</TD>"
	table += "				</TR>"
	table += "			</TABLE>"
	table += "			</div>"
	table += "		</TD>"
	table += "	</TR>"
	table += "</TABLE>"	
	table += "</TD>"	
	table += "<TD width=30% bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\">&nbsp;</TD>"	
	table += "</TR>"
	table += "<TR>"
	table += "<TD colspan=3 height=\"20\"  bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\"  >&nbsp;</TD>"
	table += "</TR>"
	table += "</TABLE>"
	
	divAss.innerHTML = table
	document.body.appendChild( divAss )
}


function closeLayerAlpha(){
	var divs = document.getElementById( "LayerAlpha" )
	if( divs ){
		document.body.removeChild( divs )	
		delete divs
	}
	closeIframeDiv()
}

function resize()
{
	var divAss = document.getElementById( "LayerAlpha" )
	if( divAss ){
		divAss.style.width = document.getElementById( "tbGeral" ).offsetWidth + 5
		divAss.style.height = document.getElementById( "tbGeral" ).offsetHeight + 5
	}
}

function getLayerAlpha( URL, login ){	
	closeLayerAlpha()	
	createIframeDiv()
	var divAss = document.createElement( "div" )
	divAss.id = "LayerAlpha"
	divAss.style.position = "absolute"
	divAss.style.border = "1px solid #c0c0c0"
	divAss.style.width = document.getElementById( "tbGeral" ).offsetWidth + 5
	divAss.style.height = document.getElementById( "tbGeral" ).offsetHeight + 5
	divAss.style.left = 0
	divAss.style.top = 0
	
	var table = "<TABLE WIDTH=\"100%\" height=\"100%\" border=0 CELLSPACING=\"0\" CELLPADDING=\"0\">"
	table += "<TR>"
	table += "<TD colspan=3 height=50% align=center bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\"  >&nbsp;</TD>"
	table += "</TR>"
	table += "<TR>"
	table += "<Td width=30% bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\">&nbsp;</td>"	
	table += "<TD width=10% height=\"10%\" align=\"center\" valign=\"top\" bgcolor=\"#ffffff\">"
	
	table += "<TABLE bgcolor=\"#ffffff\" BORDER=\"2\" bordercolor=\"#000000\" CELLSPACING=\"2\" CELLPADDING=\"2\" >"
	if( !login ){
		table += "	<TR>"
		table += "		<TD height=\"25\" align=center >"
		table += "			<table><tr><td><a class=\"aBlack\" href=\"javascript:closeLayerAlpha()\"> <img src=\"imagens/fechar.gif\" border=0 ></a></td><td><a class=\"aBlack\" href=\"javascript:closeLayerAlpha()\"> Fechar</a></td></tr></table>"
		table += "		</TD>"
		table += "	</TR>"
	}
	table += "	<TR>"
	table += "		<TD valign=\"top\" align=center >"
	table += "			<TABLE bgcolor=\"#ffffff\" WIDTH=\100%\" height=\"100%\" align=\"center\" BORDER=\"0\" CELLSPACING=\"0\" CELLPADDING=\"0\" >"
	table += "				<TR>"
	table += "					<TD align=\"center\" valign=\"top\">"
	table += "						" + URL
	table += "					</TD>"
	table += "				</TR>"
	table += "			</TABLE>"
	table += "		</TD>"
	table += "	</TR>"
	table += "</TABLE>"
	
	table += "</TD>"	
	table += "<TD width=30% bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\">&nbsp;</TD>"	
	table += "</TR>"
	table += "<TR>"
	table += "<TD colspan=3 height=50% bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\"  >&nbsp;</TD>"
	table += "</TR>"
	table += "</TABLE>"
	
	divAss.innerHTML = table
	document.body.appendChild( divAss )
	
	createLoading()
}

function loading(){	
	createLoading()
}

function showLoading(){
	if( enabledLoading ){
		if( div ){
			if( div.filters.alpha.opacity < 100 ){		
				div.filters.alpha.opacity += 30;
				window.setTimeout("showLoading()", 100);
			}
			else
				enabledLoading = false
		}
	}
}

function hideLoading(){
	enabledLoading = false	
	if( div ){
		if( browserType == "ie" ){
			if( div.filters.alpha.opacity > 1 ){			
				div.filters.alpha.opacity -= 30;
				window.setTimeout("hideLoading()", 100);
			}
			else{
				document.body.removeChild( div )
				div	= null
			}
		}
		else{
			document.body.removeChild( div )
			div	= null
		}
	}
}

function createLoading(){
	if( div ) {
		document.body.removeChild( div )	
		div = null
	}
	
	div = document.createElement( "div" )	
	div.style.position = "absolute"
	div.style.width = 150
	//div.style.left = ( document.body.offsetWidth/2 ) - 130
	//div.style.top = ( document.body.offsetHeight/2 ) - 30
	div.style.top = 30
	div.style.left = ( document.body.offsetWidth ) - 180
	
	div.style.filter = "alpha(opacity=100)"	
	div.innerHTML = "<center><img src='imagens/loading.gif' align='absmiddle'></center>"
	document.body.appendChild( div )
	enabledLoading = true
	showLoading()
}

function addLoadingIframe(){
	var elen = document.getElementsByTagName( "iframe");	
	if( elen.length > 0 ) createLoading()
	else hideLoading()		
}

function createMenuFolder( paran ){
	if( paran == 1 ) unSelectAntAll()
	
	if( event.button == 2 ){
		var divMenu = document.getElementById( "divMenuFolder" )			
		var pos		= document.body.scrollTop + event.clientY;
		var posL	= document.body.scrollLeft + event.clientX;
		var table	= document.createElement( "table" )	
		var tbody	= document.createElement( "tbody" )	
		var tr		= document.createElement( "tr" )	
		var td		= document.createElement( "td" )	
		
		table.appendChild( tbody )
		tbody.appendChild( tr )
		tr.appendChild( td )
		
		table.width = "100%"
		table.CELLSPACING="2"
		table.CELLPADDING="2"
		table.border = 1
								
		td.align = "center"		
		td.valign = "top"
	
		var htm =	"<TABLE  BORDER=\"0\" height=\"35\" width=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\">"+
					"	<TR>"+
					"		<TD valign=top >"+
					"			<TABLE  BORDER=\"1\" bordercolor=\"#ffffff\" width=\"100%\" bgcolor=\"#f6f6f6\" CELLSPACING=\"2\" CELLPADDING=\"0\">";


		if( paran == 1 ){
						
			htm +=	"<TR  >"+
					"	<TD>"+
					"		<img src=\"imagens/NewDir.gif\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:newDirAjax()\">Adicionar pasta</>"+
					"	</TD>"+
					"</TR>"+
					"<TR  >"+
					"	<TD>"+
					"		<img src=\"imagens/refresh.gif\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:reloadRoot()\">Atualizar pastas</>"+
					"	</TD>"+
					"</TR>";
							
		}
		else if( paran == 2 ){
			var shtm = "<TR>"+
					"	<TD>"+
					"		<img src=\"imagens/OpenDir.jpg\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:OpenDir(1)\">Abrir Pasta</a>"+
					"	</TD>"+
					"</TR>";
											
			var imgStatusFolder = event.srcElement.parentNode.parentNode.firstChild.firstChild.firstChild
			if( imgStatusFolder.src.indexOf("dirAberto") != -1 ){
				shtm = "<TR>"+
					"	<TD>"+
					"		<img src=\"imagens/closeDirForm.jpg\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:CloseDir()\">Fechar Pasta</a>"+
					"	</TD>"+
					"</TR>";
			}
					
			htm +=	shtm + 
					"<TR>"+
					"	<TD>"+
					"		<img src=\"imagens/NewDir.gif\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:newDirAjax()\">Nova Pasta</a>"+
					"	</TD>"+
					"</TR>"+					
					"<TR>"+
					"	<TD>"+
					"		<img src=\"imagens/renameFolder.gif\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:FolderAlter()\">Renomear</a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"		<img src=\"imagens/groups.gif\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:setGroupsFolder()\">Adicionar Grupos</a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"		<img src=\"imagens/delete.gif\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:deleteFolder()\">Excluir pasta</a>"+
					"	</TD>"+
					"</TR>";
		}
				
		htm +=	"			</TABLE>";		
				"		</TD>"+	
				"	</TR>"+
				"</TABLE>";	
						
		td.innerHTML = htm
											
		removeMenuTimer()
		divMenu = document.createElement( "div" )
		
		divMenu.style.position = "absolute"
		divMenu.style.border = "1px solid #c0c0c0"
		divMenu.style.width = 150
		divMenu.style.left = posL
		divMenu.style.top = pos
		divMenu.style.background = "#ffffff"
		divMenu.style.filter = "alpha(opacity=90)"	
		divMenu.innerHTML = "";
		divMenu.appendChild( table )
		divMenu.id = "divMenu"
				
		document.body.appendChild( divMenu )		
	}
}

function createMenuForm(){
	createMenu( 2 )
}

function createMenuItem(){
	createMenu( 3 )
}

function createMenu( flg ){
	if( idFolder == 0 ) return
	if( event.button == 2 ){
		var divMenu = document.getElementById( "divMenu" )			
		var pos		= document.body.scrollTop + event.clientY;
		var posL	= document.body.scrollLeft + event.clientX;
		var table	= document.createElement( "table" )	
		var tbody	= document.createElement( "tbody" )	
		var tr		= document.createElement( "tr" )	
		var td		= document.createElement( "td" )	
		
		table.appendChild( tbody )
		tbody.appendChild( tr )
		tr.appendChild( td )
		
		table.width = "100%"
		table.height = "20"
		table.CELLSPACING="2"
		table.CELLPADDING="2"
		table.border = 1
								
		td.align = "center"		
		td.valign = "top"
				
		var htm =	"<TABLE  BORDER=\"0\" height=\"20\" width=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\">"+
					"	<TR>"+
					"		<TD valign=top >"+
					"			<TABLE  BORDER=\"1\" bordercolor=\"#ffffff\" width=\"100%\" bgcolor=\"#f6f6f6\" CELLSPACING=\"2\" CELLPADDING=\"0\">";
		
		if( flg == 1 ){		
			var obj = document.getElementById( "tbPreview" )
			if( obj.innerHTML == "" ) return
		
			htm +=	"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/lupa.jpg\" >"+
					"	</TD>"+
					"	<TD>"+
					"	 	<a href=\"javascript:openPreview()\" > Visualizar </a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/sendMail.gif\" >"+
					"	</TD>"+
					"	<TD>"+
					"	 	<a href=\"javascript:sendMail("+idItem+","+idFormGlobal+")\" > Enviar por e-mail </a>"+
					"	</TD>"+
					"</TR>";
		}
		else if( flg == 2 ){
			if( event.srcElement.tagName == "A" ) return
			var name = event.srcElement.innerText
			var img = event.srcElement.parentNode.firstChild.firstChild.src			
			var idChild = event.srcElement.parentNode.nextSibling.firstChild.id
			var idUserCreate = event.srcElement.parentNode.nextSibling.firstChild.idUser
			var folder = "setaCima.gif"
			var idForm = idChild.replace( "tbChild","" )
			
			if( img.indexOf( "setaCima.gif" ) != -1 ) folder = "setaBaixo.gif"
							
			htm +=	"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/" + folder + "\" >"+
					"	</TD>"+
					"	<TD nowrap >"+
					"	 	<a href=\"javascript:openItemForm( '" + idChild + "' )\" > " + ( img.indexOf( "setaCima.gif" ) != -1 ? "Abrir" : "Fechar" ) + " </a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/novoItem.jpg\" >"+
					"	</TD>"+
					"	<TD nowrap >"+
					"	 	<a href=\"javascript:AddService( " + idForm + " )\" > Adicionar " + name + " </a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/ver.jpg\" >"+
					"	</TD>"+
					"	<TD nowrap >"+
					"	 	<a href=\"javascript:SearchServices(" + idForm + ")\" > Procurar em " + name + " </a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/delete.gif\" >"+
					"	</TD>"+
					"	<TD nowrap >"+
					"	 	<a href=\"javascript:removeItemFolder( " + idForm + ", " + idUserCreate + ", " + idFolder + " )\" > Remover </a>"+
					"	</TD>"+
					"</TR>"					
		}
		else if( flg == 3 ){			
			var id = event.srcElement.parentNode.idItem			
			var idForm = event.srcElement.parentNode.parentNode.parentNode.parentNode.idForm
			idUserCreate = event.srcElement.parentNode.idUser
			exceptionsGlobal = event.srcElement.parentNode.exceptions
			htm +=	"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/lupa.jpg\" >"+
					"	</TD>"+
					"	<TD nowrap >"+
					"	 	<a href=\"javascript:openPreview()\" > Visualizar</a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/novoItem.jpg\" >"+
					"	</TD>"+
					"	<TD nowrap >"+
					"	 	<a href=\"javascript:AddService( " + idForm + " )\" > Adicionar </a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/EditarItem.jpg\" >"+
					"	</TD>"+
					"	<TD nowrap >"+
					"	 	<a href=\"javascript:EditService( " + id + ", " + idUserCreate + " , " + idForm + " )\" > Alterar </a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/delete.gif\" border=0 >"+
					"	</TD>"+
					"	<TD nowrap >"+
					"	 	<a href=\"javascript:deleteItemForm( " + id + ", " + idUserCreate + ", " + idForm + " )\" > Remover </a>"+
					"	</TD>"+
					"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/addComent.gif\" >"+
					"	</TD>"+
					"	<TD nowrap >"+
					"	 	<a href=\"javascript:newReview( "+id+","+idForm+" )\" > Adicionar Comentario </a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/sendMail.gif\" >"+
					"	</TD>"+
					"	<TD>"+
					"	 	<a href=\"javascript:sendMail("+id+","+idForm+")\" > Enviar por e-mail </a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"		<img src=\"imagens/groups.gif\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:setGroupsItensForm(" + id + ", " + idUserCreate + ", " + idForm + ")\">Adicionar Grupos</a>"+
					"	</TD>"+
					"</TR>"+
					"</TR>"
		}
		else if( flg == 4 ){			
			var id = event.srcElement.parentNode.idItem			
			var idForm = event.srcElement.parentNode.parentNode.parentNode.parentNode.idForm
			htm +=	"<TR>"+
					"	<TD>"+
					"	 	<img src=\"imagens/novoItem.jpg\" >"+
					"	</TD>"+
					"	<TD nowrap >"+
					"	 	<a href=\"javascript:AddService( " + idForm + " )\" > Adicionar </a>"+
					"	</TD>"+
					"</TR>";					
		}
		else if( flg == 5 ){	
			posL = document.getElementById( "tbGeral" ).offsetWidth-150		
			var id = event.srcElement.parentNode.idItem			
			var idForm = event.srcElement.parentNode.parentNode.parentNode.parentNode.idForm
				
			if( ! id ){				
				id = event.srcElement.parentNode.parentNode.idItem			
				idForm = event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode.idForm				
			}
			else
				if( event.srcElement.innerHTML.indexOf("anexo.gif") == -1 ) return;
			
			htm +=	"<TR>"+
					"	<TD>"+
					"	 	<b>Anexos</b>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"	 	<table width=10><tr><td id=\"tbAnexosMenu\"></td></tr></table>"+
					"	</TD>"+
					"</TR>";
			
			setTimeout( "setAnexosMenu(\"tbAnexosMenu\", "+id+", "+idForm+")", 500 )				
		}
		else{			
			htm +=	"<TR style=\"cursor:hand\" onclick=\"AddItemFolder()\">"+
					"	<TD>"+
					"	 	<img src=\"imagens/novoForm.gif\" >"+
					"	</TD>"+
					"	<TD nowrap=true >"+
					"		Adicionar formulario"+
					"	</TD>"+
					"</TR>";
		}
		
		htm +=	"			</TABLE>"+	
				"		</TD>"+
				"	</TR>"+
				"</TABLE>";
		
		td.innerHTML = htm
									
		removeMenuTimer()		
		divMenu = document.createElement( "div" )
		
		divMenu.style.position = "absolute"
		divMenu.style.border = "1px solid #c0c0c0"
		divMenu.style.width = 150
		divMenu.style.height = 20
		divMenu.style.left = posL
		divMenu.style.top = pos
		divMenu.style.background = "#ffffff"
		divMenu.style.filter = "alpha(opacity=90)"	
		divMenu.innerHTML = "";
		divMenu.appendChild( table )
		divMenu.id = "divMenu"
				
		document.body.appendChild( divMenu )		
	}
}

function removeMenu(){
	if( event.button == 0 )
		setTimeout( "removeMenuTimer()",30 )
}

function removeMenuTimer(){
	var divMenu = document.getElementById( "divMenu" )	
	if( divMenu ) document.body.removeChild( divMenu )
	
	var divMenuFolder = document.getElementById( "divMenuFolder" )
	if( divMenuFolder ) document.body.removeChild( divMenuFolder )	
}

/////////////////////////////////////////////////////////////////////////////

// Actions Document /////////////////////////////////////////////////////////
//document.onmousedown = hideLoading
document.oncontextmenu	= new Function ("return false");
document.onclick		= removeMenu;
window.onresize			= resize;


if( window.addEventListener ) window.addEventListener( "load", function() { login() }, false )
else if( window.attachEvent ) window.attachEvent( "onload", function() { login() } )	
/////////////////////////////////////////////////////////////////////////////