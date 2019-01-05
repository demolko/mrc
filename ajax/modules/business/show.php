<?php
require_once('./../../../functions.php');
connect();

$wartosc1 = $_POST['customer_id'];

$connection_funnction = connect();
$zapytanie_pobierz = @$connection_funnction -> query("SELECT name, phone, e_mail, street, city, province, code_post, trade, www FROM customer WHERE customer_id = ".$wartosc1."");
$status_pobierz = @$connection_funnction -> query("SELECT end_date, amount, description, state_status_id FROM status WHERE customer_id = ".$wartosc1."");
$content ="";

while ($row = $zapytanie_pobierz->fetch_assoc()) 
{
	$content = "".$row['name'].";".$row['phone'].";".$row['e_mail'].";".$row['street'].";".$row['city'].";".$row['province'].";".$row['code_post'].";".$row['trade'].";".$row['www'].";".$wartosc1.";";	
}

while ($row_status = $status_pobierz->fetch_assoc()) 
{
	$content = $content."".$row_status['end_date'].";".$row_status['amount'].";".$row_status['description'].";".$row_status['state_status_id']."";			
}

echo $content;
?>