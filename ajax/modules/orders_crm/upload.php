<?php

$wartosc1 = $_POST['tematwar'];
$wartosc2 = $_POST['opiswar'];
$wartosc3 = $_POST['prioritywar'];

require_once('./../../../functions.php');
connect();

$connection_funnction = connect();

$id_crm = "";
$zapytanie_pobierz = @$connection_funnction -> query("SELECT orders_crm_id FROM orders_crm");
while ($row = $zapytanie_pobierz->fetch_assoc()) 
{
	$id_crm = $row['orders_crm_id'];
}

$id_crm = $id_crm +1;

$zapytanie = "INSERT INTO orders_crm (orders_crm_id, subject, contents, priority, add_date, end_date) VALUES (".$id_crm.", '".$wartosc1."', '".$wartosc2."', '".$wartosc3."', '2018-08-04', '0000-00-00')";
$idzapytania = @$connection_funnction -> query($zapytanie);

?>