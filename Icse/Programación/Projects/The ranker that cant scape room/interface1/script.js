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