<?php

$wartosc1 = $_POST['statuswar'];
$wartosc2 = $_POST['pricewar'];
$wartosc3 = $_POST['descwar'];
$wartosc4 = $_POST['enddateawar'];
$wartosc5 = $_POST['business_id'];

require_once('./../../../functions.php');
connect();

$connection_funnction = connect();

$id_status = "";
$zapytanie_pobierz = @$connection_funnction -> query("SELECT status_id FROM status ORDER BY status_id ASC");
while ($row = $zapytanie_pobierz->fetch_assoc()) 
{
	$id_status = $row['status_id'];
}

$zapytanie_sprawdzajace = @$connection_funnction -> query("SELECT customer_id FROM status where customer_id = ".$wartosc5."");
$actual_date = date("Y-m-d");

if($zapytanie_sprawdzajace->fetch_assoc()){
	$zapytanie = "UPDATE status SET end_date = '".$wartosc4."', amount = '".$wartosc2."', description = '".$wartosc3."', state_status_id = '".$wartosc1."' where customer_id = ".$wartosc5."";
}else{
	$id_status = $id_status +1;
	$zapytanie = "INSERT INTO status (status_id, add_date, end_date, amount, description, state_status_id, customer_id) VALUES (".$id_status.", '".$actual_date."', '".$wartosc4."', ".$wartosc2.", '".$wartosc3."', ".$wartosc1.", ".$wartosc5.")";
}

$idzapytania = @$connection_funnction -> query($zapytanie);

?>