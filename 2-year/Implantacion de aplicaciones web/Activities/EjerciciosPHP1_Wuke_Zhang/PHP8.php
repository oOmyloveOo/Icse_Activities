<?php
/*
PROFUNDIZANDO EN LOS ARRAYS
Hacer un programa que tenga un array de 8 números enteros y resolver lo siguiente con él:
*/
// Recorrerlo y mostrarlo
$vector = array(0, 1, 2, 9, 4, 5, 3, 7);
echo "Recorriendo el vector: ";
foreach ($vector as $e){
    echo $e . " ";
}
// Ordenarlo y mostrarlo
echo "<br>";
sort($vector);
echo "Ordenando el vector: ";
foreach ($vector as $e){
    echo $e . " ";
}
// Mostrar su longitud
echo "<br>";
echo "Longitud del vector: " . count($vector);
// Buscar  un número concreto en el vector
echo "<br>";
echo array_search(3, $vector);
return;
?>