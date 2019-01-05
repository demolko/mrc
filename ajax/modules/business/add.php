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


require_once('./../../../functions.php');
connect();

$connection_funnction = connect();

$id_business = "";
$zapytanie_pobierz = @$connection_funnction -> query("SELECT customer_id FROM customer ORDER BY customer_id ASC");
while ($row = $zapytanie_pobierz->fetch_assoc()) 
{
	$id_business = $row['customer_id'];
}

$id_business = $id_business +1;

$zapytanie = "INSERT INTO customer (customer_id, name, phone, e_mail, street, city, province, code_post, trade, www, user_id) VALUES (".$id_business.", '".$wartosc1."', ".$wartosc2.", '".$wartosc3."', '".$wartosc4."', '".$wartosc5."', '".$wartosc6."', ".$wartosc7.", '".$wartosc8."', '".$wartosc9."', 1)";
$idzapytania = @$connection_funnction -> query($zapytanie);
?>