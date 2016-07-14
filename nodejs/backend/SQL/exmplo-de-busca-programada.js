var teste = [  
   {  
      "nome":"Danilo",
      "sobrenome":"santos",
      "cpf":"7675676",
      "telefone":"6765765",
      "endereco":"teste"
   },
   {  
      "nome":"Fernando",
      "sobrenome":"santos",
      "cpf":"7675676",
      "telefone":"6765765",
      "endereco":"teste"
   },
   {  
      "nome":"Sara",
      "sobrenome":"santos",
      "cpf":"7675676",
      "telefone":"6765765",
      "endereco":"teste"
   }
]



var dado = null;
for(i=0;i<teste.length;i++){
   if(teste[i].nome.toLowerCase().substring(teste[i].nome.length - 1, teste[i].nome.length) == "o"){
      dado = teste[i];
   }
}

console.log(dado);