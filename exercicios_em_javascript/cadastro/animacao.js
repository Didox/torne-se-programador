var currentColor = 'red'
function changeColor(color){
  setTimeout(function(){
    document.getElementById("produtos").style = 'background-color:' + color;
    currentColor = color;
    if(currentColor == 'red')
    {
    	color = '#ccc';
    }
    else{
    	color = 'red';
    }
    currentColor = color
    changeColor(color);
  }, 1000)
}

changeColor('#ccc')

index = 0;

function move(index){
  setTimeout(function(){
    document.getElementById("produtos").style = 'position:absolute;left:400px; top:' + index + 'px;';
    move(index + 1);
  }, 1000)
}
move(index);