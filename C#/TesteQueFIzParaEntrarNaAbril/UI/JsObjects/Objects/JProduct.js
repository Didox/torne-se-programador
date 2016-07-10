///  Classe de operações do Carrinho
function Product( productId_, description_, category_, price_ )
{
	this.ProductId = productId_
    this.Description = description_
    this.Category = category_
    this.Price = price_
    
    var PAGE = "JsObjects/Ajax/AjaxProduct.aspx"
    
    /// Retorna o carrinho pelo id
    function Product.prototype.Get(){
        var url = PAGE + "?Get=true&ProductId=" + ProductId + "&Description=" + Description + "&Category=" + Category
	    var objAjax = new Ajax()
	    objAjax.Send(url , "GET", true, callback )
    	
	    function callback(){
		    if( objAjax.Loading() ) CreateLoading()
		    if( objAjax.Loadeds() ){
			    if( objAjax.GetLength("return") <=0 )
				    alert( "Erro ao buscar Product" )
			    else{
				    alert("teste")
			    }
		    }
		    HideLoading()
	    }
    }
   
	/// Salva o objeto atual
	function Product.prototype.Save(){ 
	    var url = PAGE + "?Save=true&ProductId=" + ProductId + "&Description=" + Description + "&Category=" + Category + "&Price=" + Price
	    var objAjax = new Ajax()
	    objAjax.Send(url , "GET", true, callback )
    	
	    function callback(){
		    if( objAjax.Loading() ) CreateLoading()
		    if( objAjax.Loadeds() ){
			    if( objAjax.GetLength("return") <=0 )
				    alert( "Erro ao salvar Product" )
			    else{
				    alert("teste")
			    }
		    }
		    HideLoading()
	    }
	}
	
	/// Exclui o objeto atual
	function Product.prototype.Delete(){ 
	    var url = PAGE + "?Del=true&ProductId=" + ProductId_
	    var objAjax = new Ajax()
	    objAjax.Send(url , "GET", true, callback )
    	
	    function callback(){
		    if( objAjax.Loading() ) CreateLoading()
		    if( objAjax.Loadeds() ){
			    if( objAjax.GetLength("return") <=0 )
				    alert( "Erro ao excluir Product" )
			    else{
				    alert("teste")
			    }
		    }
		    HideLoading()
	    }
	}
}