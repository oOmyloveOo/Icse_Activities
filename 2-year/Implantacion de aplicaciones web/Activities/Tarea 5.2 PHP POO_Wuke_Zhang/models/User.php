<?php
class User {
    protected $nombre;
    protected $apellido;
    protected $email;

    public function __construct($nombre, $apellido, $email) {
        $this->nombre = $nombre;
        $this->apellido = $apellido;
        $this->email = $email;
    }

    public function showMe() {
        return "Nombre: $this->nombre $this->apellido <br>Email: $this->email";
    }
}
?>
