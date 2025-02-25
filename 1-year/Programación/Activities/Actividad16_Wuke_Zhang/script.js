function EcuaciónSegundoGrado(){
    let Raiz, x1, x2;
    let a = prompt("Introduzca la variable a: ");
    let b = prompt("Introduzca la variable b: ");
    let c = prompt("Introduzca la variable c: ");
    Raiz = Math.sqrt(Math.pow(b,2)-4*a*c);
    x1 = (- b + Raiz)/(2 * a);
    x2 = (- b - Raiz) / (2 * a); 
    console.log("Las soluciones son: ","x1 =", x1, "y", "x2 =", x2);
}

function main(){
    let name = prompt("Enter your name: ");
    console.log("Hola "+name+", ¿cómo estás?");
}

function num(){
    let num1 = parseInt(prompt("Enter the first number: "));
    let num2 = parseInt(prompt("Enter the second number: "));
    if (num1 === num2) {
        console.log("num1 = num2");
    } 
    else if (num1 > num2){
        console.log("The first number:", num1," and The first number is: ", num2);
    }
    else{
        console.log("The first number:", num2," and The second number is: ", num1);
    }
}

function login() {
    let username = "Frodo";
    let password = "amigo";
    let enteredUsername = prompt("Enter username:");
    let enteredPassword = prompt("Enter password:");

    if (enteredUsername === username && enteredPassword === password) {
        console.log("OK!");
    } else {
        console.log("ERROR!");
    }
}

function login2() {
    let usernamesAndPasswords = {
        "Aragorn": "amigo",
        "Gandalf": "amigo",
        "Frodo": "amigo",
        "Legolas": "amigo",
        "Gimli": "amigo"
    };
    
    let enteredUsername = prompt("Enter username: ");
    let enteredPassword = prompt("Enter password: ");

    if (usernamesAndPasswords.hasOwnProperty(enteredUsername) && usernamesAndPasswords[enteredUsername] === enteredPassword) {
        alert("¡OK!");
    } else {
        alert("¡ERROR!");
    }
}

EcuaciónSegundoGrado();

main();

num();

login();

login2();
