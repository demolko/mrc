<?php
require_once('./../../../functions.php');
connect();

$connection_funnction = connect();
$zapytanie_pobierz = @$connection_funnction -> query("SELECT orders_crm_id, subject, priority FROM orders_crm");
$content ="";
$color = 0;
echo "<div style='max-width: 80%; padding-left: 10px; padding-bottom: 10px;'>";
while ($row = $zapytanie_pobierz->fetch_assoc()) 
{
	if($row['priority']=='end') continue;

	if($color==0){
		echo '<div style="width: 100%; height: 20px; padding: 3px 0px;">';
		echo '<p style="width: 10%; float: left; margin: 0px; margin-top: 4px; padding-left: 1%;">' . $row['orders_crm_id'] . '</p>';
		echo '<p style="width: 50%; float: left; margin: 0px; margin-top: 4px; padding-left: 1%;">' . $row['subject'] . '</p>';
		echo '<p class="end_task_crm_button" onclick="end_task_in_modal(' . $row['orders_crm_id'] . ',this)">Zakończ</p>';
		echo '</div>';
		$color=1;
	}
	else{
		echo '<div style="background-color: #3c4a5414; width: 100%; height: 20px; padding: 3px 0px;">';
		echo '<p style="width: 10%; float: left; margin: 0px; margin-top: 4px; padding-left: 1%;">' . $row['orders_crm_id'] . '</p>';
		echo '<p style="width: 50%; float: left; margin: 0px; margin-top: 4px; padding-left: 1%;">' . $row['subject'] . '</p>';
		echo '<p class="end_task_crm_button" onclick="end_task_in_modal(' . $row['orders_crm_id'] . ',this)">Zakończ</p>';
		echo '</div>';
		$color=0;	
	}
}
echo "</div>";
?>