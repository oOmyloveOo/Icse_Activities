//1. Crea un programa de consola en Javascript que, dada una temperatura en grados centígrados,//
//la convierta a Fahrenheit y viceversa, teniendo el programa dos entradas: la temperatura sin decimales y una letra (C o F) (8 puntos).//

function convertirTemperatura() {
    let temperature = prompt("Enter the temperature");
    let escale = prompt("Enter the scale (C for Celsius, F for Fahrenheit)");
    //Aunque no hayamos dado el toUpperCase, lo uso por si alguien inserta c o f en vez de C y F//
    if (escale.toUpperCase(escale) === 'C') { 
        let fahrenheit = (temperature * 9/5) + 32;
        console.log("The temperature is: " + parseInt(fahrenheit) + " °F");
        return fahrenheit;
    } else if (escale.toUpperCase(escale) === 'F') {
        let celsius = (temperature - 32) * 5/9;
        console.log("The temperature is: " + parseInt(celsius) + " °C");
        return celsius;
    } else {
        return "The escale only can be 'C' o 'F'.";
    }
}

convertirTemperatura();


//2. Crea un programa que, dados dos textos, digan si son iguales. Se definen dos textos como iguales si coinden sus letras, números y símbolos,// 
//independientemente que sean mayúsculas y minúsculas. Por ejemplo, amigo123 y aMiGo123, son iguales.//

function text(){
    let text1 = prompt("Enter the firts text");
    let text2 = prompt("Enter the second text");
    //es posible toUpperlowcase para pasar los 2 a minusculas por si quieres//
    if (text1.toUpperCase(text1) === text2.toUpperCase(text2)) {
        console.log("The texts are equal.");
        } else{
            console.log("The texts aren't equal.")
        }
}

text();