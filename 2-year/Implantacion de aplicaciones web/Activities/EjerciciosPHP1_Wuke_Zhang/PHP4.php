<?php
/*
BUCLE DO WHILE Y OPERADORES DE ASIGNACIÓN:
Escribe un programa que calcule los 20 primeros números de la sucesión de Fibonacci. Utiliza el bucle DO WHILE.
*/

$num1 = 0; 
$num2 = 1;  
$i = 1;     
do {
    $var3 = $num1 + $num2;  
    echo "El número $i de Fibonacci es: $var3 <br>";
    $num1 = $num2;  
    $num2 = $var3;  
    $i++; 
} while ($i <= 20);  
?>
