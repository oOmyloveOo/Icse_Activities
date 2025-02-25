function showNextOnClick(nextButton) {
    let container = nextButton.closest('.container');
    container.classList.add('hidden');
    let nextContainer = container.nextElementSibling;
    if (nextContainer) {
      nextContainer.classList.remove('hidden');
    } else {
      document.querySelector('.container').classList.remove('hidden');
    }
  }
  let nextButtons = document.querySelectorAll('.nextButton');
  nextButtons.forEach(button => {
    button.addEventListener('click', () => {
      showNextOnClick(button);
    });
  });

  function Return(returnButton) {
    let container = returnButton.closest('.container');
    container.classList.add('hidden');
    let previousContainer = container.previousElementSibling;
    if (previousContainer) {
      previousContainer.classList.remove('hidden');
    } else {
      let containers = document.querySelectorAll('.container');
      containers[containers.length - 1].classList.remove('hidden');
    }
  }
  let returnButtons = document.querySelectorAll('.returnButton');
  returnButtons.forEach(button => {
    button.addEventListener('click', () => {
      Return(button);
    });
  });
  
  document.addEventListener("DOMContentLoaded", function() {
    const contentContainers = document.querySelectorAll(".content");
    fetch("info.xml")
      .then(response => response.text())
      .then(xml => {
        const parser = new DOMParser();
        const xmlDoc = parser.parseFromString(xml, "text/xml");
        const textos = xmlDoc.querySelector("textos");
        const textosArray = Array.from(textos.children);
        textosArray.forEach((texto, index) => {
          const paragraph = contentContainers[index].querySelector("p");
          if (paragraph) {
            paragraph.textContent = texto.textContent;
          }
        });
      })
      .catch(error => {
        console.error("Error al cargar el archivo XML:", error);
      });
  });
  
  
  