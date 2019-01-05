<?php
require('./layout/creator.php' );
?>

<?php

$wynik = @$connection -> query("SELECT customer_id, name, phone, e_mail, city, trade, www FROM customer");
$color = 0;

if ($wynik === false){
	echo '<p>Zapytanie nie zostało wykonane poprawnie!</p>';
	$polaczenie -> close();
}
else {
	echo "<div class='main_table_width'>";
	echo '<div class="view_table view_table_title">';
	$temp_array = ['Nazwa','Branża','Miasto','Telefon','Poczta','Strona','Akcja'];
	row_table($temp_array);	
	echo '</div>';

	while (($produkt = $wynik -> fetch_assoc()) !== null){
		if($color==0){
			echo '<div class="view_table">';
			$acction_button = '<p class="button_view" onclick="show_business(' . $produkt['customer_id'] . ')">Zobacz</p><p class="button_view" onclick="edit_business_in_modal(' . $produkt['customer_id'] . ')">Edytuj</p>';
			$temp_array = [$produkt['name'],$produkt['trade'],$produkt['city'],$produkt['phone'],$produkt['e_mail'],$produkt['www'],$acction_button];
			row_table($temp_array);	
			echo '</div>';
			$color=1;
		}
		else{
			echo '<div class="view_table" style="background-color: #3c4a5414;">';
			$acction_button = '<p class="button_view" onclick="show_business(' . $produkt['customer_id'] . ')">Zobacz</p><p class="button_view" onclick="edit_business_in_modal(' . $produkt['customer_id'] . ')">Edytuj</p>';
			$temp_array = [$produkt['name'],$produkt['trade'],$produkt['city'],$produkt['phone'],$produkt['e_mail'],$produkt['www'],$acction_button];
			row_table($temp_array);
			echo '</div>';
			$color=0;	
		}

	}
	echo "</div>";
}

	$wynik -> close(); // zwolnienie pamięci
	$connection -> close();

	echo "<div id='add_new_business' class='add_button'>Dodaj biznes</div>";
	?>

	<?php
	require('./layout/footer.php' );
	?>
