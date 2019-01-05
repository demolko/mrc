<?php
require('./layout/creator.php' );
?>

<?php

$wynik = @$connection -> query("SELECT us.user_id, us.name, us.surname, us.phone, us.e_mail, up.position FROM users as us INNER JOIN  user_position as up ON us.user_position_id = up.user_position_id");
$color = 0;

if ($wynik === false){
	echo '<p>Zapytanie nie zostało wykonane poprawnie!</p>';
	$polaczenie -> close();
}
else {
	echo "<div class='main_table_width'>";
	echo '<div class="view_table view_table_title">';
	$temp_array = ['Imię','Nazwisko','Telefon','E-mail','Stanowisko','Akcja'];
	row_table($temp_array);		
	echo '</div>';

	while (($produkt = $wynik -> fetch_assoc()) !== null){
		if($color==0){
			echo '<div class="view_table">';
			$acction_button = '<p class="button_view" onclick="edit_user_in_modal(' . $produkt['user_id'] . ')">Edytuj</p><p class="button_view" onclick="password_user_in_modal(' . $produkt['user_id'] . ')">Hasło</p><p class="button_view" onclick="delete_user(' . $produkt['user_id'] . ',this)">Zakończ</p>';
			$temp_array = [$produkt['name'],$produkt['surname'],$produkt['phone'],$produkt['e_mail'],$produkt['position'],$acction_button];
			row_table($temp_array);
			echo '</div>';
			$color=1;
		}
		else{
			echo '<div class="view_table" style="background-color: #3c4a5414;">';
			$acction_button = '<p class="button_view" onclick="edit_user_in_modal(' . $produkt['user_id'] . ')">Edytuj</p><p class="button_view" onclick="password_user_in_modal(' . $produkt['user_id'] . ')">Hasło</p><p class="button_view" onclick="delete_user(' . $produkt['user_id'] . ',this)">Zakończ</p>';
			$temp_array = [$produkt['name'],$produkt['surname'],$produkt['phone'],$produkt['e_mail'],$produkt['position'],$acction_button];
			row_table($temp_array);
			echo '</div>';
			$color=0;	
		}

	}
	echo "</div>";
}

	$wynik -> close(); // zwolnienie pamięci
	$connection -> close();

	echo "<div id='add_new_user' class='add_button'>Dodaj użytkownika</div>";
	?>

	<?php
	require('./layout/footer.php' );
	?>
