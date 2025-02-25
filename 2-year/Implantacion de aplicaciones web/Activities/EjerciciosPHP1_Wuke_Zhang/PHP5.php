<?php
/* 
CONDICIONALES, BUCLES Y VARIABLES GET:
Generar un programa que muestre en el navegador la tabla de multiplicar de un número pasado por el parámetro GET de la URL.
*/
if(isset($_GET['num'])) { // Verificamos que 'num' esté presente en la URL
    $num = $_GET['num'];

    // Verificamos si el valor es un número
    if(!is_numeric($num)) {
        echo "El valor introducido no es un número" . "<br>";
        echo "Por favor, introduce un número válido en la URL" . "<br>";
    } else {
        // Imprimir la tabla de multiplicar
        for($i = 0; $i <= 10; $i++) {
            $result = $num * $i;
            echo "$num x $i = $result" . "<br>";
        }
    }
} else {
    echo "Por favor, proporciona un número en la URL como parámetro 'num'. Ejemplo: ?num=5" . "<br>";
}
?>
