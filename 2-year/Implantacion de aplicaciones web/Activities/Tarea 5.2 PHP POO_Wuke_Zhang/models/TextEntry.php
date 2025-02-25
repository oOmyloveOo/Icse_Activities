<?php
require_once 'Entry.php';

class TextEntry implements Entry {
    private $name;
    private $text;

    public function __construct($name, $text) {
        $this->name = $name;
        $this->text = $text;
    }

    public function modifyName($newName) {
        $this->name = $newName;
    }

    public function modifyText($newText) {
        $this->text = $newText;
    }

    public function show() {
        return "<h1>{$this->name}</h1><p>{$this->text}</p>";
    }
}
?>
