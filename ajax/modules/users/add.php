<?php

$wartosc1 = $_POST['loginwar'];
$wartosc2 = $_POST['passwordwar'];
$wartosc3 = $_POST['password2war'];
$wartosc4 = $_POST['namewar'];
$wartosc5 = $_POST['surnamewar'];
$wartosc6 = $_POST['phonewar'];
$wartosc7 = $_POST['e_mailwar'];
$wartosc8 = $_POST['positionwar'];

require_once('./../../../functions.php');
connect();
 
$connection_funnction = connect();

$id_user = "";
$zapytanie_pobierz = @$connection_funnction -> query("SELECT user_id FROM users ORDER BY user_id ASC");
while ($row = $zapytanie_pobierz->fetch_assoc()) 
{
	$id_user = $row['user_id'];
}

$id_user = $id_user +1;

$hashed_password = password_hash($wartosc2, PASSWORD_DEFAULT);

$zapytanie = "INSERT INTO users (user_id, login, pass, name, surname, phone, e_mail, user_position_id) VALUES (".$id_user.", '".$wartosc1."', '".$hashed_password."', '".$wartosc4."', '".$wartosc5."', '".$wartosc6."', '".$wartosc7."', '".$wartosc8."')";
$idzapytania = @$connection_funnction -> query($zapytanie);

?>