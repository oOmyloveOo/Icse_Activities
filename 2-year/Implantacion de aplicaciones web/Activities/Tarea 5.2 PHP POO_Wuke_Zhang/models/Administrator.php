<?php
require_once 'User.php';

class Administrator extends User {
    private $level;

    public function __construct($nombre, $apellido, $email, $level) {
        parent::__construct($nombre, $apellido, $email);
        $this->level = $level;
    }

    public function showMe() {
        return parent::showMe() . "<br>Nivel de administrador: " . $this->level;
    }
}
?>
