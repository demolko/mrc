<?php current_URL(); ?>

<div class="side-bar">

	<div class="collapse-btn menu-btn btn">
		<i class="fas fa-arrow-right"></i>
	</div>

	<div class="vault-controls-menu">

		<a href="http://localhost/miro/mrc/kokpit.php">
			<?php echo '<div class="menu-btn btn '. change_button_menu_state('kokpit') .'">'; ?>
				<i class="fas fa-home"></i>
			</div>
		</a>

		<div class="vault-menu-group">

			<div class="menu-btn btn">
				<i class="fas fa-lock"></i>
			</div>

			<div class="menu-btn btn">
				<i class="fas fa-sticky-note"></i>
			</div>

			<a href="http://localhost/miro/mrc/baza_kontaktow.php" >
				<?php echo '<div class="menu-btn btn '. change_button_menu_state('baza_kontaktow') .'">'; ?>
					<i class="fas fa-address-book"></i>
				</div>
			</a>

		</div>

		<div class="vault-menu-group">

			<div class="menu-btn btn">
				<i class="fas fa-credit-card"></i>
			</div>

			<div class="menu-btn btn">
				<i class="fas fa-building"></i>
			</div>

		</div>

		<div class="vault-menu-group">

			<div class="menu-btn btn">
				<i class="fas fa-globe"></i>
			</div>

			<div class="menu-btn btn">
				<i class="fas fa-balance-scale"></i>
			</div>

		</div>

	</div>

	<div class="vault-settings-menu">

		<div class="menu-btn btn">
			<i class="fas fa-shield-alt"></i>
		</div>
		
		<a href="http://localhost/miro/mrc/uzytkownicy.php">
			<?php echo '<div class="menu-btn btn '. change_button_menu_state('uzytkownicy') .'">'; ?>
				<i class="fas fa-users"></i>
			</div>
		</a>

		<?php echo '<div class="menu-btn btn '. change_button_menu_state('noname') .'">'; ?>
			<i class="fas fa-life-ring"></i>
		</div>

		<div class="menu-btn btn">
			<i class="fas fa-cog"></i>
		</div>

		<div class="menu-btn btn">
			<i class="fas fa-ellipsis-h"></i>
		</div>

	</div>

</div>