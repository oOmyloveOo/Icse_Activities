function addClickEventToBoxes() {
    const boxes = document.querySelectorAll('.box');
    boxes.forEach(box => {
        box.addEventListener('click', function(event) {
            const clickedBox = event.currentTarget;
            if (clickedBox.classList.contains('white')){
                clickedBox.classList.remove('white');
            }
            else{
                clickedBox.classList.add('white');
            }
        });
    });
}
addClickEventToBoxes();

function playSound() {
    let audios = document.querySelectorAll('audio');
    document.querySelectorAll('.box').forEach(function(box) {
        let isPlaying = false; 
        box.addEventListener('click', function() {
            if (!isPlaying) {
                const randomAudio = audios[parseInt(Math.random() * audios.length)];
                randomAudio.play();
                isPlaying = true;
            } else {
                audios.forEach(audio => audio.pause());
                isPlaying = false;
            }
        });
    });
}
playSound();


