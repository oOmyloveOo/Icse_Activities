//*1. Recorrer el array y mostrar todos los nombres en un sólo alert separados por un espacio. 
function array1(){
    let cities = ["Moscu", "Oslo", "Tokyo", "Helsinki", "Denver", "Berlin", "Lisboa", "Estocolmo",
    "Nairobi", "Rio", "Bogota"];
    let message = "";
    for (let i = 0; i  < cities.length; i++){
       message += cities[i] + " ";
    }
    alert(message);
}
array1();
//*2. Recorrer el array, empezando por el final, y mostrar todos los nombres en un sólo alert
//*separados por un espacio. 
function array2(){
    let cities = ["Moscu", "Oslo", "Tokyo", "Helsinki", "Denver", "Berlin", "Lisboa", "Estocolmo",
    "Nairobi", "Rio", "Bogota"];
    let message = "";
    for (let i = cities.length - 1; i >= 0 ; i--){
        message += cities[i] + " ";
    }
    alert(message);
}
array2();
//*3. Recorrer el array y mostrar sólo los nombres que empiecen por ‘T’ o por ‘H’. 
function array3(){
    let cities = ["Moscu", "Oslo", "Tokyo", "Helsinki", "Denver", "Berlin", "Lisboa", "Estocolmo",
    "Nairobi", "Rio", "Bogota"];
    let message = [];
    for (let i = 0; i  < cities.length; i++){
        let cityInitial = cities[i];
        if (cityInitial.startsWith('T') || cityInitial.startsWith('H')){
            message.push(cities[i]);
        }
    }
    alert(message);
}
array3();
//*4. Recorrer el array y mostrar los nombres con una longitud de 5 o 6 caracteres. 
function array4(){
    let cities = ["Moscu", "Oslo", "Tokyo", "Helsinki", "Denver", "Berlin", "Lisboa", "Estocolmo",
    "Nairobi", "Rio", "Bogota"];
    let message = [];
    for (let i = 0; i  < cities.length; i++){
        let cityLength = cities[i].length;
        if (cityLength === 5 ||  cityLength === 6){
            message.push(cities[i]);
        }
    }
    alert(message.join(", "));
    }
array4();
 //*5. Recorrer el array y mostrar los nombres invertidos. Ejemplo: Moscu es ucsoM. 
 function array5() {
    let cities = ["Moscu", "Oslo", "Tokyo", "Helsinki", "Denver", "Berlin", "Lisboa", "Estocolmo",
    "Nairobi", "Rio", "Bogota"];
    let message = [];
    for (let i = 0; i < cities.length; i++) {
        message.push(cities[i].split('').reverse().join(''));
    }
    alert(message.join(", "));
}
array5();
//*6. Crear la siguiente matriz (array de arrays), recorrer y mostrar todo el contenido en un
//*sólo alter. 
function array6(){
    let alphabetSoup = [["L", "E", "O", "W", "J", "P", "Y", "H"],
                        ["A", "B", "E", "J", "A", "Ñ", "X", "R"],
                        ["O", "R", "B", "C", "U", "L", "P", "P"],
                        ["N", "T", "T", "X", "J", "E", "E", "E"],
                        ["D", "D", "I", "F", "R", "O", "K", "R"],
                        ["A", "W", "G", "R", "T", "N", "E", "R"],
                        ["Z", "O", "R", "R", "O", "S", "P", "O"],
                        ["Q", "U", "E", "P", "V", "A", "C", "A"]];
    let message = "";
    for (let i = 0; i < alphabetSoup.length; i++){
        message += alphabetSoup[i].join(" ") + "\n";
    }
    alert(message);
}
array6();
