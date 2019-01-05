<?php

$wartosc1 = $_POST['delete_user'];

require_once('./../../../functions.php');
connect();
 
$connection_funnction = connect();

$id_crm = "";
$zapytanie_pobierz = @$connection_funnction -> query("DELETE FROM users WHERE user_id=".$wartosc1."");

$idzapytania = @$connection_funnction -> query($zapytanie_pobierz);

?>