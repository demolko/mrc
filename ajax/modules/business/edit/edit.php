<?php

$wartosc1 = $_POST['nazwawar'];
$wartosc2 = $_POST['telefonwar'];
$wartosc3 = $_POST['e_mailwar'];
$wartosc4 = $_POST['ulicawar'];
$wartosc5 = $_POST['miastowar'];
$wartosc6 = $_POST['wojewodztwowar'];
$wartosc7 = $_POST['kod_pocztowywar'];
$wartosc8 = $_POST['branzawar'];
$wartosc9 = $_POST['www'];
$wartoscid = $_POST['business_id'];


require_once('./../../../../functions.php');
connect();

$connection_funnction = connect();

$query_mery = "UPDATE customer SET name = '".$wartosc1."', phone = '".$wartosc2."', e_mail = '".$wartosc3."', street = '".$wartosc4."', city = '".$wartosc5."', province = '".$wartosc6."', code_post = '".$wartosc7."', trade = '".$wartosc8."', www = '".$wartosc9."' WHERE customer_id=".$wartoscid."";

$zapytanie_pobierz = @$connection_funnction -> query($query_mery);

$idzapytania = @$connection_funnction -> query($zapytanie_pobierz);

?>

