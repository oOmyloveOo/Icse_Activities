function loop1(){
    let message = prompt("Enter a message");
    let num = prompt("Enter a number");
    for (let i = 0; i < num ; i++){
        console.log(message);
        console.log("");
    }
    return 0;
}



function loop2(){
    while (true) { 
        let message1 =  prompt( "Enter a password");
        console.log(message1);
        if (message1 === "TASIR"){
            break;
        }
    }
}



function loop3(){
    let num = prompt("Enter a number");
    for (let i = 0; i <= num ; i++){
        console.log(i);
    }
}



function loop4(){
    let num = prompt("Enter a number");
    for (let i = num; i >= 0 ; i--){
        console.log(i);
    }
}



function loop5(){
    let num1 = parseInt(prompt("Enter a number"));
    let num2 = parseInt(prompt("Enter another number"));
    for  (let i = num1; i <= num2; i++){
        console.log(i);
    }
}



function loop6(){
    let pin = "1988";
    for (let i = "0"; i <= "9999"; i++) {
        if (pin == i){
            console.log(i);
        }
    }
}



function loop7() {
    let num = prompt("Enter a number");
    if (num <= 1) {
        console.log(num + " no es un número primo.");
        return;
    } 
    let Primo = true;
    for (let i = 2; i <= num / 2; i++) {
        if (num % i === 0) {
            Primo = false; 
        }
    }
    if (Primo) {
        console.log(num + " es un número primo.");
    } else {
        console.log(num + " no es un número primo.");
    }
}



function loop8() {
    while (true){
        let something = prompt("Enter something");
        console.log(something);
        if (something === "salir"){
            break;
        }
    }
}

loop8();





