<?php

$wartosc1 = $_POST['passwordwar'];
$wartoscid = $_POST['idwar'];

require_once('./../../../../functions.php');
connect();
 
$connection_funnction = connect();

$hashed_password = password_hash($wartosc1, PASSWORD_DEFAULT);

$query_mery = "UPDATE users SET pass = '".$hashed_password."' WHERE user_id=".$wartoscid."";

$zapytanie_pobierz = @$connection_funnction -> query($query_mery);

$idzapytania = @$connection_funnction -> query($zapytanie_pobierz);

?>