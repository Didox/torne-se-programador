var ClienteSingleton = {
	instancia: null,

	iniciar: function(){
		function ClienteSgln(){
			this.nome = "";
		}

		if(ClienteSingleton.instancia == null){
			ClienteSingleton.instancia = new ClienteSgln();
		}
	}
}