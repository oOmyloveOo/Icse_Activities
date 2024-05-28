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
  