<?php

$wartosc1 = $_POST['loginwar'];
$wartosc2 = $_POST['namewar'];
$wartosc3 = $_POST['surnamewar'];
$wartosc4 = $_POST['phonewar'];
$wartosc5 = $_POST['e_mailwar'];
$wartosc6 = $_POST['positionwar'];
$wartoscid = $_POST['idwar'];

require_once('./../../../../functions.php');
connect();
 
$connection_funnction = connect();

$query_mery = "UPDATE users SET login = '".$wartosc1."', name = '".$wartosc2."', surname = '".$wartosc3."', phone = '".$wartosc4."', e_mail = '".$wartosc5."', user_position_id = '".$wartosc6."' WHERE user_id=".$wartoscid."";

$zapytanie_pobierz = @$connection_funnction -> query($query_mery);

$idzapytania = @$connection_funnction -> query($zapytanie_pobierz);

?>