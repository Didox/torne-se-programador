// Vars /////////////////////////////////////////////////////////////////////

var div = null
var enabledLoading = false
var srcElen = null

/////////////////////////////////////////////////////////////////////////////

// Functions ////////////////////////////////////////////////////////////////

function Reload(){
    if(!div)
        document.frames[0].document.location.reload();
    else{
        HideLoading();
        top.setTimeout('top.Reload()', 10)
    }
}

function Reload2(){
    if(!div)
        document.frames[2].document.location.reload();
    else{
        HideLoading();
        top.setTimeout('top.Reload2()', 10)
    }
}

function DelCard(id){
    if(confirm("Confirma a retirada do item em seu carrinho?")){
        srcElen = event.srcElement; 
        new Cart(id, null,null).Delete();    
    }
}

function AddCart(userId, productId){
    p = new Product(productId, null, null, null)
    u = new User(userId, null, null, null)
    new Cart(null, u, p).Save();
}

function Fechar(){
    CreateLoading()
    document.getElementsByTagName("iframe")[0].src = "Controls/CloseCart.aspx";
}

function Valida(){
    var txtUser = document.getElementById("ctl00_cphMenu_Menu1_txtUser")
    if(txtUser.value == ""){
        alert('Digite o nome do usuário')
        txtUser.focus()
        return false
    }
    else return true
}

function SingUp(){
    iframe = "<iframe src=\"controls/User.aspx\" frameborder=0 width=400 height=250 ></iframe>"
	new Document().GetLayerAlpha( iframe )
	//top.setTimeout('top.Reload2()', 10)
} 

function SearchProducts(){
    var description = document.getElementById("txtSearch").value
    var category = document.getElementById("ddlCategory").value
    CreateLoading();
    document.getElementsByTagName("iframe")[0].src = "Controls/SearchProducts.aspx?description="+description+"&category="+category;
}

function CreateLoading(){
    if( div ) {
	    document.body.removeChild( div )	
	    div = null
    }
	
    div = document.createElement( "div" )	
    div.id = "dLoading"
    div.style.position = "absolute"        
    div.style.left = ( document.body.offsetWidth/2 )
    div.style.top = ( document.body.offsetHeight/2 ) - 100
	
    div.style.filter = "alpha(opacity=100)"	
    div.innerHTML = "<table><tr><td class=\"loading\"></td></tr></table>"
    document.body.appendChild( div )
    enabledLoading = true
    ShowLoading()
}

function ShowLoading(){
    if( enabledLoading ){
	    if( div ){
		    if( div.filters.alpha.opacity < 100 ){		
			    div.filters.alpha.opacity += 30;
			    window.setTimeout("ShowLoading()", 100);
		    }
		    else enabledLoading = false
	    }
    }
}

function HideLoading(){
    enabledLoading = false
    if( div ){	        
	    if( div.filters.alpha.opacity > 1 ){			
		    div.filters.alpha.opacity -= 30;			    
		    window.setTimeout("HideLoading()", 100);
	    }
	    else{
		    document.body.removeChild( div )
		    div	= null
	    }
    }
}

/////////////////////////////////////////////////////////////////////////////

// Actions Document /////////////////////////////////////////////////////////
document.oncontextmenu	= new Function ("return false");
/////////////////////////////////////////////////////////////////////////////