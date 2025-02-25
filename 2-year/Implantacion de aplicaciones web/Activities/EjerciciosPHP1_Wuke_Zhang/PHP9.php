<?php
/*
DETECTAR EL NAVEGADOR WEB:
Mostrar la dirección IP del usuario y un mensaje positivo si usa Firefox.
*/
$user_ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
echo "Tu dirección IP es: $user_ip<br>";
// Verificar si el navegador es Firefox
if (strpos($user_agent, "Firefox") !== false) {
    echo "¡Genial! Estás usando Firefox. 😊";
} else {
    echo "No estás usando Firefox, pero sigue disfrutando de la página. 😊";
}
?>
