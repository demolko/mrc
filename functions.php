<?php
$current_URL = "";

function connect()
{
	require('config/config.php' );

		// połączenie z serwerem i bazą danych
	$connection = new mysqli($host, $user, $password, $db_name);
	if ($connection->connect_error) {
		    // w przypadku błędu (od wersji PHP 5.3), wyświetli się odpowiedni komunikat
		die('Connect Error ('.$connection->connect_errno.') '. $connection->connect_error);
		    // w przypadku błędu (do wersji PHP 5.3), wyświetli się odpowiedni komunikat
		if (mysqli_connect_error()) {
			die('Connect Error (' . mysqli_connect_errno() . ') '
				. mysqli_connect_error());
		}
	}
	else{
		$connection -> query ('SET NAMES utf8');
		return $connection;
	}
}

function get_user_e_mail($user_id){
	$connection_funnction = connect();

	$name_query = @$connection_funnction -> query("SELECT e_mail FROM users where user_id = ".$user_id);

	if ($name_query === false){
		echo '<p>Zapytanie nie zostało wykonane poprawnie!</p>';
		$polaczenie -> close();
	}
	else {
		while (($name_fetch = $name_query -> fetch_assoc()) !== null){
			return $name_fetch['e_mail'];
		}
	}
}

function get_user_name($user_id){
	$connection_funnction = connect();

	$name_query = @$connection_funnction -> query("SELECT name, surname FROM users where user_id = ".$user_id);

	if ($name_query === false){
		echo '<p>Zapytanie nie zostało wykonane poprawnie!</p>';
		$polaczenie -> close();
	}
	else {
		while (($name_fetch = $name_query -> fetch_assoc()) !== null){
			return $name_fetch['name']." ".$name_fetch['surname'];
		}
	}	
}

function current_URL(){
	global $current_URL; 
	$current_URL = $_SERVER['REQUEST_URI'];
}

function change_button_menu_state($find_string){
	global $current_URL;
	if(strpos($current_URL,$find_string)){
		return "current";
	}  
}

function row_table($item_array){
	$sizeofarray = sizeof($item_array);
	$content = "";
	$summary_padding = 100 - $sizeofarray;
	$padding = floor($summary_padding / $sizeofarray);
	$complement_padding = $summary_padding - ($padding*$sizeofarray);

	for($i = 0; $i < $sizeofarray; $i++){
		if($i<$complement_padding){
			$content = $content.'<p class="view_table_row" style="width: '.($padding+1).'%;">'.$item_array[$i]."</p>";
		}
		else{
			$content = $content.'<p class="view_table_row" style="width: '.$padding.'%;">'.$item_array[$i]."</p>";
		}
	}
	
	echo $content;
}


?>
