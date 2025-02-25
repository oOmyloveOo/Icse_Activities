<?php
require_once 'models/Administrator.php';
require_once 'models/Publisher.php';
require_once 'models/TextEntry.php';

// Crear un Administrador
$admin = new Administrator("Carlos", "Pérez", "carlos@example.com", 3);
echo $admin->showMe() . "<br><br>";

// Crear un Publisher
$publisher = new Publisher("Ana", "Gómez", "ana@example.com");

// Agregar entradas con TextEntry
$entry1 = new TextEntry("Mi primer post", "Este es el contenido del post.");
$entry2 = new TextEntry("Mi segundo post", "Aquí hay más información interesante.");
$publisher->addEntry($entry1);
$publisher->addEntry($entry2);

// Mostrar la información del Publisher
echo $publisher->showMe();
?>
