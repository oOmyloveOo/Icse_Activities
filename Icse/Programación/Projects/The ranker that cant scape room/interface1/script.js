function showNext(currentContentId, nextContentId) {
  var currentContent = document.getElementById(currentContentId);
  var nextContent = document.getElementById(nextContentId);
  currentContent.style.display = "none";
  nextContent.style.display = "block";
}

function showPrev(currentContentId, prevContentId) {
  var currentContent = document.getElementById(currentContentId);
  var prevContent = document.getElementById(prevContentId);
  currentContent.style.display = "none";
  prevContent.style.display = "block";
}
function showPlay() {
  
}
let state=0;
let textField = document.getElementById("texto");

function updateText(){
  switch (state){
    case 0: textField.innerHTML= "Yo, Jhosefer Franz solía ser un tranquilo profesor de informática en una pequeña ciudad. Sin embargo, detrás de"
    +"mi apariencia ordinaria, ardía una pasión por el misterio y la aventura. Pasaba horas perdido en libros antiguos y"
    +"leyendas olvidadas, soñando con descubrir secretos ocultos en el mundo.";
    state=1;
    break;
    case 1: ;
    case 2: ;
  }
}