<?php

$wartosc1 = $_POST['end_task'];

require_once('./../../../functions.php');
connect();

$connection_funnction = connect();

$id_crm = "";
$zapytanie_pobierz = @$connection_funnction -> query("UPDATE orders_crm SET priority='end' WHERE orders_crm_id=".$wartosc1."");

$idzapytania = @$connection_funnction -> query($zapytanie_pobierz);

?>