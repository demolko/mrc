<?php
require_once('./../../../functions.php');
connect();

$wartosc1 = $_POST['search'];
 
$connection_funnction = connect();
$zapytanie_pobierz = @$connection_funnction -> query("SELECT name, phone, e_mail, city FROM customer WHERE name LIKE '%".$wartosc1."%'");
$content ="";

while ($row = $zapytanie_pobierz->fetch_assoc()) 
{
	$content = $content."".$row['name'].";".$row['phone'].";".$row['e_mail'].";".$row['city'].";";		
}
$content = $content."end";
echo $content;
?>