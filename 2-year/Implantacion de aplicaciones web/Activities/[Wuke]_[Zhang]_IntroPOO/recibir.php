<?php
require_once('includes/db/functions.php');
require_once('Person.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $person = new Person(
        $_POST['nombre'], $_POST['apellido'], $_POST['edad'], 
        $_POST['email'], $_POST['telefono'], $_POST['direccion'], 
        $_POST['fechaNacimiento'], $_POST['ciudad'], $_POST['pais'], $_POST['genero']
    );

    echo $person->showMe();
    savePerson($person);
} else {
    echo "⚠️ Error: No se enviaron datos.";
}
?>
