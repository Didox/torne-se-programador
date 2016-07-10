// Vars /////////////////////////////////////////////////////////////////////
var idUser = 0
var idUserCreateGlobal = 0
var userAdmGlobal = false

/////////////////////////////////////////////////////////////////////////////


// Functions ////////////////////////////////////////////////////////////////

function activeAdmin( active ){
	userAdmGlobal = active
	if( active ){
		document.getElementById("tbCreateForm").style.display = "block"
		document.getElementById("tbCreateGroups").style.display = "block"
		document.getElementById("tbCreateUsers").style.display = "block"
	}
	else{
		document.getElementById("tbCreateForm").style.display = "none"
		document.getElementById("tbCreateGroups").style.display = "none"
		document.getElementById("tbCreateUsers").style.display = "none"
	}
}

function login(){		
	document.getElementById("nameUser").innerHTML = "";
	iframe = "<iframe src=\"controls/login.aspx\" id=\"login\" frameborder=0 width=100% height=100 ></iframe>"
	getLayerAlpha( iframe, true )
	top.logIn = 0
}

function createGroups(){
	iframe = "<iframe src=\"controls/Groups.aspx\" frameborder=0 width=100% height=100 ></iframe>"
	getLayerAlpha( iframe, false )
}

function createUsers(){
	iframe = "<iframe src=\"controls/Adm.aspx\" frameborder=0 width=100% height=100 ></iframe>"
	getLayerAlpha( iframe, false )
}

function validateLogin(){
	var txtSenha = document.getElementById( "txtSenha" )
	var txtUsuario = document.getElementById( "txtUsuario" )
	var txtSenhaDesable = document.getElementById( "txtSenhaDesable" )
	
	if( txtUsuario.value == " Digite o usuario" ){
		txtUsuario.value = ""
		return isValidForm( 'Form1' , true , '#ffffff' , '#F8FBC5' )	
	}
	else if( txtSenha.value == "" ){					
		txtSenha.style.display = "block"
		isValidForm( 'Form1' , true , '#ffffff' , '#F8FBC5' )		
		txtSenha.style.display = "block"
		txtSenhaDesable.style.display = "none"	
		txtSenha.focus()
		return false
	}
	
	return true;
}

function desableLogin( obj ){
	if( obj.value=='' ) obj.value=' Digite o usuario';
}

function enableLogin( obj ){
	if( obj.value == ' Digite o usuario' ) obj.value='';
}

function getSenhaEnable( obj ){
	obj.style.display="none"
	var txtSenha = document.getElementById( "txtSenha" )
	txtSenha.style.display='block'
	txtSenha.focus();
}

function getSenhaDisable( obj ){
	if( obj.value == "" ){
		obj.style.display="none"
		obj.value = ""
		var txtSenha = document.getElementById( "txtSenhaDesable" )
		txtSenha.style.display="block"
	}
}


function userOn( exec ){
	var url = "Ajax/AjaxUser.aspx"
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			if( objAjax.GetLength("return") <=0 )
				alert( "erro ao verificar usuario" )
			else{
				if( parseInt(objAjax.Get("return",0)) == 0 ){
					alert( "Sessao expirou" )
					top.login()
					disposeCollPage()
				}
				else{
					if( exec ) eval( exec )
				}
			}
		}
		hideLoading();
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