function createTitle(event) {
    if (event.type === "click" || (event.type === "keydown" && (event.key === "Enter" || event.keyCode === 13))) {
        let titleInput = document.getElementById("titleInput");
        if (titleInput.value.trim() !== "") {
            document.getElementById("memeTitle").innerHTML = titleInput.value;
        }
    }
}

function createDescription(event) {
    if (event.type === "click" || (event.type === "keydown" && (event.key === "Enter" || event.keyCode === 13))) {
        let descriptionInput = document.getElementById("descriptionInput");
        if (descriptionInput.value.trim() !== "") {
            document.getElementById("memeDescription").innerHTML = descriptionInput.value;
        }
    }
}

function uploadImage(event) {
    if (event.type === "click" || (event.type === "keydown" && (event.key === "Enter" || event.keyCode === 13))) {
        let imageInput = document.getElementById("imageInput").value;
        if (imageInput !== "" && imageInput === "img/imagenprueba.png") {
            let imgContainer = document.getElementById("imageGenerated");
            let imgElement = document.createElement("img");
            imgElement.src = imageInput;
            imgContainer.innerHTML = "";
            imgContainer.appendChild(imgElement);
        }
    }
}

document.getElementById("saveButton").addEventListener("click", createTitle);
document.getElementById("saveButton").addEventListener("click", createDescription);
document.getElementById("saveButton").addEventListener("click", uploadImage);

document.getElementById("titleInput").addEventListener("keydown", createTitle);
document.getElementById("descriptionInput").addEventListener("keydown", createDescription);
document.getElementById("imageInput").addEventListener("keydown", uploadImage);
