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





if (Ti.Platform.osname == 'android'){
  var code = Admob.isGooglePlayServicesAvailable();
  if (code != Admob.SUCCESS) {
      alert("Google Play Services is not installed/updated/available");
  }

  // then create an adMob view
  var adMobView = Admob.createView({
      publisherId:"<<YOUR PUBLISHER ID HERE>>",
      testing:false, // default is false
      //top: 10, //optional
      //left: 0, // optional
      //right: 0, // optional
      bottom: 0, // optional
      adBackgroundColor:"FF8855", // optional
      backgroundColorTop: "738000", //optional - Gradient background color at top
      borderColor: "#000000", // optional - Border color
      textColor: "#000000", // optional - Text color
      urlColor: "#00FF00", // optional - URL color
      linkColor: "#0000FF" //optional -  Link text color
      //primaryTextColor: "blue", // deprecated -- now maps to textColor
      //secondaryTextColor: "green" // deprecated -- now maps to linkColor
      
  });


  //listener for adReceived
  adMobView.addEventListener(Admob.AD_RECEIVED,function(){
     // alert("ad received");
     Ti.API.info("ad received");
  });

  //listener for adNotReceived
  adMobView.addEventListener(Admob.AD_NOT_RECEIVED,function(){
      //alert("ad not received");
       Ti.API.info("ad not received");
  });


  var adRequestBtn = Ti.UI.createButton({
      title:"Request an ad",
      top:"10%",
      height: "10%",
      width: "80%"
  });

  adRequestBtn.addEventListener("click",function(){
      adMobView.requestAd();
  });

  var adRequestBtn2 = Ti.UI.createButton({
      title: "Request a test ad",
      top: "25%",
      height: "10%",
      width: "80%"
  });

  adRequestBtn2.addEventListener("click",function(){
      adMobView.requestTestAd();
  });

  telaInicial.add(adMobView);
}