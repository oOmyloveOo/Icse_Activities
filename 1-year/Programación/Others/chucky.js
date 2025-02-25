function loop() {
    let message1 = "Chucky paga la deuda";
    let message2;
    alert(message1);
    while (true) {
        message2 = prompt("¿Esta pagada?");
        if (message2 === "si") {
            break; 
        }
        alert(message1);
    }
    alert("¡Gracias por confirmar que pagó moroso!");
}
loop();