<?php
require_once('connect.php');
require_once(__DIR__ . '/../Person.php'); // Incluimos la clase Person

function savePerson($person) {
    global $db; // Acceder a la conexión global
    
    $sql = "INSERT INTO users (nombre, apellido, edad, email, telefono, direccion, fechaNacimiento, ciudad, pais, genero) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt = $db->prepare($sql);
    $stmt->bind_param("ssisssssss", 
        $person->getNombre(),
        $person->getApellido(),
        $person->getEdad(),
        $person->getEmail(),
        $person->getTelefono(),
        $person->getDireccion(),
        $person->getFechaNacimiento(),
        $person->getCiudad(),
        $person->getPais(),
        $person->getGenero()
    );

    if ($stmt->execute()) {
        echo "✅ Datos guardados correctamente.";
    } else {
        echo "❌ Error al guardar los datos: " . $stmt->error;
    }

    $stmt->close();
    $db->close();
}
?>
