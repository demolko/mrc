<?php
require('./layout/creator.php' );
?>

<div class="vault-items-container">

	<a href='baza_kontaktow.php'>
		<div class="vault-item password-item">
			<div class="kokpit_vault-item-thumbnail">
				<i class="fas fa-building"></i>
			</div>
			<div class="vault-item-info">
				<h3 class="vault-item-name">Baza firm</h3>
			</div>
		</div>
	</a>

	<a href='uzytkownicy.php'>
		<div class="vault-item password-item">
			<div class="kokpit_vault-item-thumbnail">
				<i class="fas fa-address-book"></i>
			</div>
			<div class="vault-item-info">
				<h3 class="vault-item-name">Użytkownicy</h3>
			</div>
		</div>
	</a>
</div>

<?php
require('./layout/footer.php' );
?>