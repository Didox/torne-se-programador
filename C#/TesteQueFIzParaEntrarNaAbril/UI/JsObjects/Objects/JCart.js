///  Classe de operações do Carrinho
function Cart( cartId_, user_, product_ )
{
	CartId = cartId_
    RProduct = product_
    RUser = user_
    
    var PAGE = "JsObjects/Ajax/AjaxCart.aspx"
    
    /// Retorna o carrinho
    function Cart.prototype.Get(){
        var url = PAGE + "?Get=true&CartId=" + CartId + "&UserId=" + (RUser != null ? RUser.UserId : null) + "&ProductId=" + (RProduct != null ? RProduct.ProductId : null)
	    var objAjax = new Ajax()
	    objAjax.Send(url , "GET", true, callback )
    	
	    function callback(){	        
		    if( objAjax.Loading() ) CreateLoading()
		    if( objAjax.Loadeds() ){
			    if( objAjax.GetLength("return") <=0 )
				    alert( "Erro ao ao buscar user" )
			    else{
				    alert("teste")
			    }
		    }
		    HideLoading()
	    }
    }
   
	/// Salva o objeto atual
	function Cart.prototype.Save(){ 
	    var url = PAGE + "?Save=true&CartId=" + CartId + "&UserId=" + (RUser != null ? RUser.UserId : null) + "&ProductId=" + (RProduct != null ? RProduct.ProductId : null)
	    var objAjax = new Ajax()
	    objAjax.Send(url , "GET", true, callback )
    	
	    function callback(){
		    if( objAjax.Loading() ) CreateLoading()
		    if( objAjax.Loadeds() ){
			    if( objAjax.GetLength("return") <=0 )
				    alert( "Erro ao salvar user" )
			    else{
				    var tb = document.getElementById("tbItensCart");
				    alert("Item adicionado")
				    tb.innerHTML = objAjax.Get( "return",0 )
				    SearchProducts()
				    var dvItens = document.getElementById("ctl00_cphMenu_Menu1_dvItens")
				    var btnFechar = document.getElementById("ctl00_cphMenu_Menu1_btnFechar")
				    dvItens.style.display = "none"
				    btnFechar.style.display = "block"
			    }
		    }
		    HideLoading()
	    }
	}
	
	/// Exclui o objeto atual
	function Cart.prototype.Delete(){ 
	    var url = PAGE + "?Del=true&CartId=" + CartId + "&UserId=" + (RUser != null ? RUser.UserId : null) + "&ProductId=" + (RProduct != null ? RProduct.ProductId : null)
	    var objAjax = new Ajax()
	    objAjax.Send(url , "GET", true, callback )
    	
	    function callback(){
		    if( objAjax.Loading() ) CreateLoading()
		    if( objAjax.Loadeds() ){
			    if( objAjax.GetLength("return") <=0 )
				    alert( "Erro ao excluir user" )
			    else{
			        var price = document.getElementById("ctl00_cphMenu_Menu1_lblPriceTotal")
			        var priceT = document.getElementById("dvPrice")
			        price.innerHTML = objAjax.Get( "priceTotal",0 )
			        var tr = srcElen.parentNode.parentNode.parentNode			        
				    var tbody = tr.parentNode
				    tbody.removeChild(tr);
				    
				    var dvItens = document.getElementById("ctl00_cphMenu_Menu1_dvItens")
				    var btnFechar = document.getElementById("ctl00_cphMenu_Menu1_btnFechar")
				    
				    var imgD = document.getElementById("imgD")				    
				    if( !imgD ){
				        dvItens.style.display = "block"
				        btnFechar.style.display = "none"
				        priceT.style.display = "none"
				    }
				    
				    var iframe = document.getElementsByTagName("iframe")[0]
				    if(iframe.src.indexOf("CloseCart.aspx") != -1){
				        CreateLoading()
				        document.frames[0].document.location.reload();
				    }
			    }
		    }
		    HideLoading()
	    }
	}
}