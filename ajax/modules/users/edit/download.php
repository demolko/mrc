<?php
require_once('./../../../../functions.php');
connect();

$wartosc1 = $_POST['user_id'];

$connection_funnction = connect();
$zapytanie_pobierz = @$connection_funnction -> query("SELECT login, pass, name, surname, phone, e_mail, user_position_id FROM users WHERE user_id = ".$wartosc1."");
$content ="";

while ($row = $zapytanie_pobierz->fetch_assoc()) 
{
	$content = "".$row['login'].";".$row['pass'].";".$row['name'].";".$row['surname'].";".$row['phone'].";".$row['e_mail'].";".$row['user_position_id'].";".$wartosc1."";	
}

echo $content;
?>