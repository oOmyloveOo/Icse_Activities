<?php
/*
RELLENARUN ARRAY
Escribe un programa que añada valores a un array mientras que su longitud sea menor a 50 y después que se muestre la información del array por pantalla
*/
$array = array();
if(count($array) < 50){
    for($i = 0; $i <= 50; $i++){
        array_push($array, rand());
    }
    echo "<pre>";
    print_r($array);
    echo "</pre>";
}
?>