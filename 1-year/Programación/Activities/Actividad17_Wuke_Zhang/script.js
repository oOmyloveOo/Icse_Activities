function calculator(){
    let num1 = parseInt(prompt("Enter the firts number"));
    let num2 = parseInt(prompt("Enter the second number"));
    let operator = parseInt(prompt("Indique la operación: \n1-SUMA \n2-RESTA \n3-MULTIPLICACIÓN \n4-DIVISIÓN"));
    switch(operator){
        case 1:
            console.log(num1 + num2);
            break;
        case 2:
            console.log(num1 - num2);
            break;
        case 3:
            console.log(num1 * num2);
            break;
        case 4:
            console.log(num1 / num2);
            break;
    }
    return 0;
}

calculator();