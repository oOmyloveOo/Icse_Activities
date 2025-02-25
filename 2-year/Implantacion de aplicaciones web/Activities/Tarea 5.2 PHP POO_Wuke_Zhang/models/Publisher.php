<?php
require_once 'User.php';
require_once 'TextEntry.php';

class Publisher extends User {
    private $entries = [];

    public function addEntry(TextEntry $entry) {
        $this->entries[] = $entry;
    }

    public function showMe() {
        $info = parent::showMe();
        $info .= "<br><strong>Entradas publicadas:</strong><br>";

        foreach ($this->entries as $entry) {
            $info .= $entry->show() . "<br>";
        }

        return $info;
    }
}
?>
