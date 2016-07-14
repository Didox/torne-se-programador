////////// código blocante //////////////

// exemplo programação funcional
function resolveProblema(){
  
}

function resolveProblema2(){
  
}

function resolveProblema3(){
  
}

var retorno = resolveProblema();
var retorno2 = resolveProblema2();
var retorno3 = resolveProblema3();


// exemplo programação orientado a objetos
function Problema(){
  this.resolveProblema = function(){
    
  }

  this.resolveProblema2 = function(){
    
  }

  this.resolveProblema3 = function(){
    
  }
}

var problema = new Problema();
var retorno = problema.resolveProblema();
var retorno2 = problema.resolveProblema2();
var retorno2 = problema.resolveProblema3();

////////// exemplo programação assincrona ////
////////// código não blocante //////////////

// exemplo programação funcional assincrona
function resolveProblema(callback){
  
}

function resolveProblema2(callback){
  
}

function resolveProblema3(callback){
  
}

resolveProblema(function(){

});
resolveProblema2(function(){
  
});
resolveProblema3(function(){
  
});


// exemplo programação orientado a objetos assincrona
function Problema(){
  this.resolveProblema = function(callback){
    
  }

  this.resolveProblema2 = function(callback){
    
  }

  this.resolveProblema3 = function(callback){
    
  }
}

var problema = new Problema();
problema.resolveProblema(function(){
  
});
problema.resolveProblema2(function(){
  
});
problema.resolveProblema3(function(){
  
});


