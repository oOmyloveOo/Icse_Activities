<?php
interface Entry {
    public function modifyName($newName);
    public function modifyText($newText);
    public function show();
}
?>
