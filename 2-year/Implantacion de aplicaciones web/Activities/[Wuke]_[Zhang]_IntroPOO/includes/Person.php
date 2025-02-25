<?php
class Person {
    // 🔹 Atributos privados
    private $nombre;
    private $apellido;
    private $edad;
    private $email;
    private $telefono;
    private $direccion;
    private $fechaNacimiento;
    private $ciudad;
    private $pais;
    private $genero;

    // 🔹 Constructor
    public function __construct($nombre, $apellido, $edad, $email, $telefono, $direccion, $fechaNacimiento, $ciudad, $pais, $genero) {
        $this->nombre = $nombre;
        $this->apellido = $apellido;
        $this->edad = $edad;
        $this->email = $email;
        $this->telefono = $telefono;
        $this->direccion = $direccion;
        $this->fechaNacimiento = $fechaNacimiento;
        $this->ciudad = $ciudad;
        $this->pais = $pais;
        $this->genero = $genero;
    }

    // 🔹 Métodos Getters
    public function getNombre() { return $this->nombre; }
    public function getApellido() { return $this->apellido; }
    public function getEdad() { return $this->edad; }
    public function getEmail() { return $this->email; }
    public function getTelefono() { return $this->telefono; }
    public function getDireccion() { return $this->direccion; }
    public function getFechaNacimiento() { return $this->fechaNacimiento; }
    public function getCiudad() { return $this->ciudad; }
    public function getPais() { return $this->pais; }
    public function getGenero() { return $this->genero; }

    // 🔹 Método para mostrar los datos
    public function showMe() {
        return "Nombre: {$this->nombre} {$this->apellido}<br>" .
               "Edad: {$this->edad}<br>" .
               "Email: {$this->email}<br>" .
               "Teléfono: {$this->telefono}<br>" .
               "Dirección: {$this->direccion}, {$this->ciudad}, {$this->pais}<br>" .
               "Fecha de nacimiento: {$this->fechaNacimiento}<br>" .
               "Género: {$this->genero}<br>";
    }
}
?>
