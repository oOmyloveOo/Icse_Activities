<?php
/*
ARRAYS MULTIDIMENSIONALES
Crea un array con el contenido de la siguiente tabla:
*/
// Voy a hacer un array con objetos, cada objeto será un array asociativo
$table = array(
    "Fruits" => array("Apple", "Orange", "Watermelon", "Strawberry"),
    "Sports" => array("football", "Tennis", "Basketball", "Beisbol"),
    "Languages" => array("Spanish", "English", "French", "Italian")
);
echo "<pre>";
print_r($table);
echo "</pre>";
?>