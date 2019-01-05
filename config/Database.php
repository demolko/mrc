<?php
//initialize variables to hold connection parameter
require('config.php' );

$dsn = $driver.":host=".$host."; dbname=".$db_name;

try{
    //create an instance of the PDO class with the required parameters
	$db = new PDO($dsn, $user, $password);

    //set pdo error mode to exception
	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

}catch (PDOException $ex){
    //display error message
	echo "Connection failed ".$ex->getMessage();
}

