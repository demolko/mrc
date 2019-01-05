<?php
include_once __DIR__ . '/../../config/Database.php';
include_once __DIR__ . '/../../config/utilities.php';

if(isset($_POST['loginBtn'], $_POST['token'])){
	require __DIR__ . '/../../config/config.php';
	$secret = $secret;

	if(validate_token($_POST['token'])) {
            //process the form
            //array to hold errors
		$form_errors = array();

            //validate
		$required_fields = array('username', 'password');
		$form_errors = array_merge($form_errors, check_empty_fields($required_fields));

		if(empty($form_errors)){
                //collect form data
			$user = $_POST['username'];
			$password = $_POST['password'];

			isset($_POST['remember']) ? $remember = $_POST['remember'] : $remember = "";

                //check if user exist in the database
			$sqlQuery = "SELECT * FROM users WHERE name = :username";
			$statement = $db->prepare($sqlQuery);
			$statement->execute(array(':username' => $user));

			if($row = $statement->fetch()){
				$id = $row['user_id'];
				$hashed_password = $row['pass'];
				$username = $row['name'];
                    //$activated = $row['activated'];
				$activated = 1;

				if($activated === "0"){

					if (checkDuplicateEntries('trash', 'user_id', $id, $db)){
                            //activated the account
						$db->exec("UPDATE users SET activated = '1' WHERE id = $id LIMIT 1");

                            //remove info from trash table
						$db->exec("DELETE FROM trash WHERE user_id = $id LIMIT 1");

                            //login the user
						prepLogin($id, $username, $remember);
					}else{
						$result = flashMessage("Please activate your account");
					}
				}else{


					if(password_verify($password, $hashed_password)){
						prepLogin($id, $username, $remember);
					}else{
						$result = flashMessage("Niepoprawne hasło");
					}
				}
			}else{
				$result = flashMessage("Niepoprawny login");
			}
		}else{
			if(count($form_errors) == 1){
				$result = flashMessage("Wysątpił błąd w formularzu.");
			}else{
				$result = flashMessage("Wystąpiły " .count($form_errors). " błędy w formularzu.");
			}
		}
	}else{
		$result = "<script type='text/javascript'>
		alert('To żądanie pochodzi z nieznanego źródła, możliwa próba włamania się.');
		</script>";
	}

}