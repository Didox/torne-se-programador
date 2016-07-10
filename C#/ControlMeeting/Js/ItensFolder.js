// Vars /////////////////////////////////////////////////////////////////////

var idItem = 0
var idForm = 0
var idItemForm = 0
var idFormGlobal= 0

/////////////////////////////////////////////////////////////////////////////


// Functions ////////////////////////////////////////////////////////////////

function setGroupsItensForm(id, idUserC, idForm){
	if( idUserC != top.idUser && ! userAdmGlobal ){
		alert( "Usuario nao tem permissao para altera grupos para este item" )
		return
	}
	iframe = "<iframe src=\"controls/addGroupsItemForm.aspx?idItemForm=" + id + "&idForm=" + idForm + "\" frameborder=0 width=100% height=100 ></iframe>"
	getLayerAlpha( iframe )
}

function sendMail( idItem, idForm ){
	iframe = "<iframe src=\"controls/SendMail.aspx?idItem="+idItem+"&idForm="+idForm+"&idFolder="+idFolder+"\" frameborder=0 width=100% height=100 ></iframe>"
	getLayerAlpha( iframe )
}

function setAnexosMenu(tb,idItemForm,idForm){
	tb = document.getElementById(tb)
	if( tb ){
		var url = "Ajax/AjaxItensForm.aspx?getFiles=true&idItemForm=" + idItemForm + "&idForm=" + idForm
		var objAjax = new Ajax()
		objAjax.Send(url , "GET", true, callback );
		
		function callback(){
			if( objAjax.Loading() ) top.createLoading()
			if( objAjax.Loadeds() ){
				if( objAjax.GetLength("return") <=0 )
					alert( "erro ao carregar anexos" )
				else{
					tb.innerHTML = objAjax.Get("return",0)
				}
			}
			top.hideLoading();
		}
	}
}

function getFiles(idItemForm,idForm){
	alert( idItemForm )
	alert( idForm )
	var url = "Ajax/AjaxItensForm.aspx?getFiles=true&idItemForm=" + idItemForm + "&idForm=" + idForm
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) top.createLoading()
		if( objAjax.Loadeds() ){
			if( objAjax.GetLength("return") <=0 )
				alert( "erro ao carregar anexos" )
			else{
				return objAjax.Get("return",0)
			}
		}
		top.hideLoading();
	}
}

function forceDownload(file, idItemForm, idForm, url){
	window.open(url+"controls/formServices.aspx?force=true&idItemForm="+idItemForm+"&idForm="+idForm+"&file="+file, null, "height=10,width=10,toolbar=no,scrollbars=no,menubar=no" )
}

function deleteFile(file,idItemForm,idForm){
	if( confirm( "Confirma a exclusao do anexo?" ) ){
		var url = "../Ajax/AjaxItensForm.aspx?file=" + file + "&idItemForm=" + idItemForm + "&idForm=" + idForm
		var objAjax = new Ajax()
		objAjax.Send(url , "GET", true, callback );
		
		function callback(){
			if( objAjax.Loading() ) top.createLoading()
			if( objAjax.Loadeds() ){
				if( objAjax.GetLength("return") <=0 )
					alert( "erro ao excluir anexo" )
				else{
					var tdAnexos = document.getElementById( "tdAnexos" )
					tdAnexos.innerHTML = objAjax.Get("return",0)
				}
			}
			top.hideLoading();
		}
	}
}

function alterItemFolder( idFolderDrag, idFolder, itemDrag, idForm ){
	var url = "Ajax/AjaxItensForm.aspx?idFolderDrag=" + idFolderDrag + "&idFolder=" + idFolder + "&itemDrag=" + itemDrag + "&idForm=" + idForm
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			if( objAjax.GetLength("return") > 0 )
				openItemForm( "tbChild" + idForm, "block" )
			else
				alert( "Erro ao tranferir item" )
		}
		hideLoading()
	}	
}

function alterFormFolder( idForm, idFolder, idFolderAnt ){
	var url = "Ajax/AjaxItensFolder.aspx?idFormDrag=" + idForm + "&idFolder=" + idFolderAnt + "&idFolderAnt=" + idFolder
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			if( objAjax.GetLength("return") > 0 )
				getItens( idFolder )
			else
				alert( "Erro ao tranferir item" )
		}
		hideLoading()
	}	
}	

function removeItemFolder( idForm, idUserC, idFolder ){
	if( idUserC != top.idUser && ! userAdmGlobal ){
		alert( "Usuario nao tem permissao para excluir servico" )
		return
	}
	if( confirm( "Confirma exclusao do servico?" ) ){
		var url = "Ajax/AjaxItensFolder.aspx?removeFormId=" + idForm + "&idFolder=" + idFolder
		var objAjax = new Ajax()
		objAjax.Send(url , "GET", true, callback );
		
		function callback(){
			if( objAjax.Loading() ) createLoading()
			if( objAjax.Loadeds() ){
				if( objAjax.GetLength("return") > 0 )
					getItens( idFolder )
				else
					alert( "erro ao excluir itens pasta" )
			}
			hideLoading()
		}	
	}
}

function AddItemFolder(){
	iframe = "<iframe src=\"controls/GetForms.aspx?idFolder=" + idFolder + "\" frameborder=0 width=100% height=100 ></iframe>"
	getLayerAlpha( iframe )
}

function getLogoFundo(){
	return	"<TABLE bgcolor=\"#F7F5F1\" WIDTH=\"100%\" height=\"100%\" BORDER=\"0\" CELLSPACING=\"0\" CELLPADDING=\"0\">"+
			"<TR>"+
			"<TD height=\"1%\" valign=bottom align=right ><img src=\"imagens/fundoCanto.gif\" ></TD>"+
			"</TR>"+
			"</TABLE>"
}

function getItens( folderId ){	
	var tbLogo = document.getElementById( "tbLogo" )
	
	tbLogo.innerHTML = getLogoFundo()
	idItem = 0
	var url = "Ajax/AjaxItensFolder.aspx?idFolder=" + folderId
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			var tbItens = document.getElementById( "tbItens" )
			var tbody = tbItens.firstChild
			var tbodyNew = document.createElement( "tbody" )
			
			tbItens.removeChild( tbody )
			tbItens.appendChild( tbodyNew )
			
			if( objAjax.GetLength("idItem") == 0 ){
				var tr = document.createElement( "tr" )				
				var td = document.createElement( "td" )
				var tbPreview = document.getElementById( "tbPreview" )
				tbPreview.innerHTML = "";
				td.bgColor = "#ffffff"
				td.align = "center"
				td.background = "imagens/bordaForm.gif"
				td.height=25	
				td.innerHTML = "<b>Nao a itens nesta pasta</b>"
				tr.appendChild( td )
				tbodyNew.appendChild( tr )				
				hideLoading()
				return	
			}
		
			for( i=0; i<objAjax.GetLength("idItem"); i++ ){
				var tr = document.createElement( "tr" )				
				var td2 = document.createElement( "td" )
				var td3 = document.createElement( "td" )
								
				td3.width = "1%"
				td3.nowrap = true
				td3.background = "imagens/bordaForm.gif"
				td3.align = "center"
				td3.id = "tbForm" + objAjax.Get("idItem",i)
				
				td3.innerHTML = "<img onmousedown=\"startDrag('"+ objAjax.Get("idItem",i) +"','"+ objAjax.Get("idUser",i) +"','Form');openItemForm( 'tbChild" + objAjax.Get("idItem",i) + "' );\" src=\"imagens/setaCima.gif\" border=0 style=\"cursor:hand\" >"
				td2.width = "95%"
				td2.background = "imagens/bordaForm.gif"				
				td2.height=25				
				td2.innerText = objAjax.Get("description",i)
				td2.className = "tdForm"
				td2.setAttribute("onmousedown",createMenuForm)
				
				tr.appendChild( td3 )
				tr.appendChild( td2 )
				
				var tr1 = document.createElement( "tr" )				
				var td1 = document.createElement( "td" )
				
				td1.id = "tbChild" + objAjax.Get("idItem",i)
				td1.setAttribute("idForm",objAjax.Get("idItem",i))
				td1.setAttribute("idUser",objAjax.Get("idUser",i))
				td1.style.display = "none"
				td1.colSpan = 3
				td1.innerHTML = ""
				
				tr1.appendChild( td1 )
				
				tbodyNew.appendChild( tr )
				tbodyNew.appendChild( tr1 )	
				
				if( i == 0 ) idOpen = objAjax.Get("idItem",i)
			}
			
			 setTimeout( "openItemForm( 'tbChild" + idOpen + "', 'block' )" , 2 )
		}
	}		
	desabledGuiaContentParan( "block" )
	hideLoading();	
}

function deleteItemForm( itemFormId,idUserC, formId ){
	userOn("deleteItemFormLogin( "+itemFormId+","+idUserC+","+formId+" )" )
}

function deleteItemFormLogin( itemFormId,idUserC, formId ){
	if( idUserC != top.idUser && ! userAdmGlobal ){
		alert( "Usuario nao tem permissao para excluir este item" )
		return
	}
	if( confirm("Confirma exclusao do item?") ){
		var tr = document.getElementById( "tbItem" + itemFormId + "-" + formId )
		var tbody = tr.parentNode
		
		var url = "Ajax/AjaxItensForm.aspx?idRemoveItem=" + itemFormId + "&idForm=" + formId
		var objAjax = new Ajax()
		objAjax.Send(url , "GET", true, callback );
		
		function callback(){
			if( objAjax.Loading() ) createLoading()
			if( objAjax.Loadeds() ){
				if( objAjax.GetLength("return") > 0 ){
					tbody.removeChild( tr )		
					if( idItem == itemFormId ){
						desabledGuiaPrevieParan( "none" )			
					}
				}
				else alert( "erro ao excluir item" )
			}
			setTimeout("hideLoading()", 1000)
		}
	}
}

function  getItemForm( formId, nameId, field, where ){
	if( ! field ) field = ""
	if( ! where ) where = ""
	
	var  obj =  document.getElementById( nameId )	
	var url = "Ajax/AjaxItensForm.aspx?idFolder=" + idFolder + "&idForm=" + formId + "&field=" + field + "&where=" + escape(where)
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			if( objAjax.GetLength("return") > 0 ){
				if( obj ) obj.innerHTML = objAjax.Get("return",0)	
				if( objAjax.Get("countItem",0) > 0 ) selectItemForm( formId )
				else desabledGuiaPrevieParan( "none" )
			}
			else alert( "erro ao carregar Itens" )
		}
		hideLoading()
	}
}

function openItemForm( nameId, displays, field, where ){
	if( ! field ) field = ""
	if( ! where ) where = ""
	userOn("openItemFormLogin(\"" + nameId + "\", \"" + displays + "\",\"" + field + "\", \"" + where + "\")")
}

function openItemFormLogin( nameId, displays, field, where ){
	var item = document.getElementById( nameId )
	var idForm = nameId.replace( "tbChild", "" )
	var form = document.getElementById( "tbForm" + idForm )
	var idUserCreate = item.idUser
	
	if( displays == "block" ){
		if( item ) item.style.display = "block"
		if( form ) form.innerHTML = "<img onmousedown=\"startDrag('"+ idForm +"','" + idUserCreate + "' ,'Form');openItemForm( '" + nameId + "' );\" src=\"imagens/setaBaixo.gif\" border=0 >"
		getItemForm( idForm, nameId, field, where )
		return
	}
	else if( displays == "none" ){
		if( item ) item.style.display = "none"
		if( form ) form.innerHTML = "<img onmousedown=\"startDrag('"+ idForm +"','" + idUserCreate + "','Form');openItemForm( '" + nameId + "' );\" src=\"imagens/setaCima.gif\" border=0 >"
		desabledGuiaPrevieParan( "none" )
		return
	}
			
	if( item.style.display == "none" ){
		if( item ) item.style.display = "block"
		if( form ) form.innerHTML = "<img onmousedown=\"startDrag('"+ idForm +"','" + idUserCreate + "','Form');openItemForm( '" + nameId + "' );\" src=\"imagens/setaBaixo.gif\" border=0 >"
		getItemForm( idForm, nameId, field, where )		
	}
	else{
		if( item ) item.style.display = "none"
		if( form ) form.innerHTML = "<img onmousedown=\"startDrag('"+ idForm +"','" + idUserCreate + "','Form');openItemForm( '" + nameId + "' );\" src=\"imagens/setaCima.gif\" border=0 >"		
		desabledGuiaPrevieParan( "none" )
	}
}

function selectItemForm( idForm ){
	try{
		var form = document.getElementById( "tbForm" + idForm )				
		var tbody = form.parentNode.nextSibling.firstChild.firstChild.firstChild
		var tr = tbody.firstChild.nextSibling
		
		for( i=1; i<tbody.rows.length; i++ ){
			tbody.rows[i].className = ""
			tbody.rows[i].bgColor = "#ffffff"
		}
		
		tr.className = "trItemForm"
		tr.bgColor = "#f6f6f6"
				
		if( idItem == 0 )
			openItem( tr.idItem, idForm )
		else
			openItem( idItem, idForm, true )
	}
	catch( e ){}
}

function openItem( id, formId, active ){
	userOn("openItemLogin(" + id + ", " + formId + ", " + active + ")")
}

function openItemLogin( id, formId, active ){	
	idForm = formId
	idItemForm = id
	
	//desabledGuiaPrevieParan( "block" )
	
	var tr = document.getElementById( "tbItem" + id + "-" + formId )	
	var tbody = tr.parentNode
	
	for( i=1; i<tbody.rows.length; i++ ){
		tbody.rows[i].className = ""
		tbody.rows[i].bgColor = "#ffffff"
	}
			
	tr.className = "trItemForm"
	tr.bgColor = "#F8F5F0"

	if( id != idItem || active ){
		idItem = id
		var url = "Ajax/AjaxItensForm.aspx?idItemGet=" + id + "&idForm=" + formId
		var objAjax = new Ajax()
		objAjax.Send(url , "GET", true, callback );
		
		function callback(){
			if( objAjax.Loading() ) createLoading()
			if( objAjax.Loadeds() ){
				if( objAjax.GetLength("return") > 0 ){
					var tbPreview = document.getElementById( "tbPreview" )
					tbPreview.innerHTML = objAjax.Get("return",0)
					idItem = objAjax.Get("idItem",0)
					idFormGlobal = objAjax.Get("idForm",0)
				}
				else alert( "erro no preview" )
			}
			hideLoading()
		}	
	}
}

/////////////////////////////////////////////////////////////////////////////

// Actions Document /////////////////////////////////////////////////////////
//document.onmousedown = hideLoading
//document.oncontextmenu	= new Function ("return false");
//document.onkeydown = keysFunctions

//if( window.addEventListener ) window.addEventListener( "load", function() { createLoading()	}, false )
//else if( window.attachEvent ) window.attachEvent( "onload", function() { createLoading() } )	
/////////////////////////////////////////////////////////////////////////////