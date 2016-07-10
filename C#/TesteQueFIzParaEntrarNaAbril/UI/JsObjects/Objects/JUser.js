///  Classe de operações do Carrinho
function User( userId_, name_, description_, theme_ )
{
	this.UserId = userId_
    this.Name = name_
    this.Description = description_
    this.Theme = theme_
    
    var PAGE = "JsObjects/Ajax/AjaxUser.aspx"
    
    /// Retorna o carrinho pelo id
    function User.prototype.Get(){
        var url = PAGE + "?Get=true&UserId=" + UserId + "&Name=" + Name
	    var objAjax = new Ajax()
	    objAjax.Send(url , "GET", true, callback )
    	
	    function callback(){
		    if( objAjax.Loading() ) CreateLoading()
		    if( objAjax.Loadeds() ){
			    if( objAjax.GetLength("return") <=0 )
				    alert( "ao buscar user" )
			    else{
				    alert("teste")
			    }
		    }
		    HideLoading()
	    }
    }
   
	/// Salva o objeto atual
	function User.prototype.Save(){ 
	    var url = PAGE + "?Save=true&UserId=" + UserId + "&Name=" + Name + "&Description=" + Description + "&Theme=" + Theme
	    var objAjax = new Ajax()
	    objAjax.Send(url , "GET", true, callback )
    	
	    function callback(){
		    if( objAjax.Loading() ) CreateLoading()
		    if( objAjax.Loadeds() ){
			    if( objAjax.GetLength("return") <=0 )
				    alert( "ao buscar user" )
			    else{
				    alert("teste")
			    }
		    }
		    HideLoading()
	    }
	}
	
	/// Exclui o objeto atual
	function User.prototype.Delete(){ 
	    var url = PAGE + "?Del=true&UserId=" + UserId
	    var objAjax = new Ajax()
	    objAjax.Send(url , "GET", true, callback )
    	
	    function callback(){
		    if( objAjax.Loading() ) CreateLoading()
		    if( objAjax.Loadeds() ){
			    if( objAjax.GetLength("return") <=0 )
				    alert( "ao buscar user" )
			    else{
				    alert("teste")
			    }
		    }
		    HideLoading()
	    }
	}

}