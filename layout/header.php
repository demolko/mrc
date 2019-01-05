
<div class="main-content">
	<!-- Top bar -->
	<div class="top-bar">

		<div>
			<img class='logo' src="img/logo_mrc.png">
		</div>

		<div class="vault-search">
			<!--<form>-->
				<input id="search_field" type="search" class="search-input search_field" placeholder="Szukaj Klienta ...">
				<i class="fas fa-search search-icon"></i> 
				<!--</form>-->
			</div>

			<div class="user-settings dus">
				<div class="user-image">
					<i class="fas fa-user-circle"></i>
				</div>
				<ul class="user-info">
					<li class="user-email"><?php echo get_user_e_mail($_SESSION['id']); ?></li>
					<li class="user-type"><?php echo get_user_name($_SESSION['id']); ?></li>
				</ul>
				<div class="user-arrow-btn">
					<i class="fas fa-caret-down"></i>
				</div>
			</div>
		</div>

		<!-- End of top bar -->
		<div class="dropdown_user_settings dus">
			<a href="http://localhost/miro/mrc/modules/login/logout.php">Wyloguj</a>
		</div>
		<!-- Vault items controls-->
		<div class="vault-items-controls">

			<h2></h2>

			<div class="vault-items-controls-btn btn">
				<i class="fas fa-caret-up"></i>
			</div>

			<div class="vault-items-controls-btn btn">
				<i class="fas fa-search-minus"></i>
			</div>

			<div class="vault-items-controls-group">

				<div class="vault-items-controls-btn btn current">
					<i class="fas fa-th-large"></i>
				</div>

				<div class="vault-items-controls-btn btn">
					<i class="fas fa-list"></i>
				</div>

			</div>

			<div class="vault-items-controls-btn btn">
				<i class="fas fa-sort"></i>
			</div>


		</div>
		<!-- End of vault items controls-->
		<div>