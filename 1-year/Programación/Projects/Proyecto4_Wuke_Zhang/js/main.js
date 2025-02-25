function setMarcked(element) {
    if (hasClass(element, "transparent")){
        element.classList.remove("transparent");
    }
    else{
        element.classList.add("transparent");
    }
}

function hasClass(element, classname) {
    return (' ' + element.className + ' ').indexOf(' ' + classname + ' ') > -1;
}