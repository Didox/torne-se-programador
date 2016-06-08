Titanium.UI.setBackgroundColor('#000');

var telaInicial = Titanium.UI.createWindow({  
    title:'Tab 3',
    backgroundColor:'#fff'
});

var webview = Titanium.UI.createWebView({url:'html/index.html'});
telaInicial.add(webview);

var utils = {};
utils.networkOffAlert = function(){
  if(!Titanium.Network.online){
    webview.evalJS("conectado = false");
    Ti.UI.createAlertDialog({
      message: 'Você está sem conexão de internet',
      ok: 'Ok',
      title: 'Sem conexão'
    }).show();
    return;
  }
  webview.evalJS("conectado = true");
};

var telaGlobal = null;

utils.abrirNovaJanela = function(url){
  telaGlobal = Titanium.UI.createWindow({  
    title:'Nova janela',
    backgroundColor:'#fff'
  });

  var webviewNovo = Titanium.UI.createWebView({url: url});
  telaGlobal.add(webviewNovo);
  telaGlobal.open();
}

utils.fecharJanelaGlobal = function(){
  telaGlobal.close();
}

utils.confirmTitanium = function(mensagem, strCallback){
  var dialog = Ti.UI.createAlertDialog({
    buttonNames: ['Sim', 'Não'],
    message: mensagem,
    title: 'Meu primeiro app'
  });
  dialog.addEventListener('click', function(e){
    if (e.index === 0){
      webview.evalJS(strCallback);
    }
  });
  dialog.show();
}

Ti.App.addEventListener('networkOffAlert', function(e) {
  try{
    utils.networkOffAlert();
  }
  catch(e){
    alert(e.message);
  }
});

Ti.App.addEventListener('confirmTitanium', function(e) {
  try{
    utils.confirmTitanium(e.mensagem, e.strCallback);
  }
  catch(e){
    alert(e.message);
  }
});

Ti.App.addEventListener('abrirNovaJanela', function(e) {
  try{
    utils.abrirNovaJanela(e.url);
  }
  catch(e){
    alert(e.message);
  }
});

Ti.App.addEventListener('fecharJanelaGlobal', function() {
  try{
    utils.fecharJanelaGlobal();
  }
  catch(e){
    alert(e.message);
  }
});


telaInicial.open()