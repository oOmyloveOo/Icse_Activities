<?php
/*
CONDICIONAL IF Y OPERADORES DE COMPARACIÓN
Modifica el ejercicio anterior para mostrar por pantalla si el cuadrado calculado es un número par o impar:
Utiliza la instrucción if()…else para filtrar. Recuerda que podemos calcular el resto de una división con %. Ej: 4%2 🡪 0 y 5%2 🡪 1.
*/
for ($i=1; $i<=20; $i++){
    if($i%2==0){
        echo "El cuadrado de $i es par <br>";
    }else{
        echo "El cuadrado de $i es impar <br>";
    }
}
?>