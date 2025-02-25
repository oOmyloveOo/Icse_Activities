function createTitle(event) {
    if (event.type === "click" || (event.type === "keypress" && event.key === "Enter")) {
        let inputText1 = document.getElementById("textInput1");
        let title = document.getElementById("myTitle").innerHTML = inputText1.value;
    }
}
document.getElementById("myButton1").onclick = createTitle;
document.getElementById("textInput1").addEventListener("keypress", createTitle);

function createSubtitle(event) {
    if (event.type === "click" || (event.type === "keypress" && event.key === "Enter")) {
        let inputText2 = document.getElementById("textInput2");
        let subtitle = document.getElementById("mySubtitle").innerHTML = inputText2.value;
    }
}
document.getElementById("myButton2").onclick = createSubtitle;
document.getElementById("textInput2").addEventListener("keypress", createSubtitle);
