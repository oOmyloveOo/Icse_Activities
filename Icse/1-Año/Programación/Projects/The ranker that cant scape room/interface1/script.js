// Función para mostrar el siguiente contenedor y ocultar el actual
function showNextOnClick(nextButton) {
    // Encontrar el contenedor padre del botón
    const container = nextButton.closest('.container');
    
    // Ocultar el contenedor actual
    container.classList.add('hidden');
    
    // Encontrar el siguiente contenedor
    const nextContainer = container.nextElementSibling;
    
    // Si existe un siguiente contenedor, mostrarlo
    if (nextContainer) {
      nextContainer.classList.remove('hidden');
    } else {
      // Si no hay un siguiente contenedor, volver al primer contenedor
      document.querySelector('.container').classList.remove('hidden');
    }
  }
  
  // Obtener todos los botones con la clase 'nextButton'
  const nextButtons = document.querySelectorAll('.nextButton');
  
  // Agregar un event listener a cada botón 'Next'
  nextButtons.forEach(button => {
    button.addEventListener('click', () => {
      showNextOnClick(button);
    });
  });


function Return(){
    
}
