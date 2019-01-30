<?php

$dsn = 'mysql:host=localhost;dbname=test;charset=utf8mb4';
$user = 'std' ;
$pass = '' ;

// Connect to DB
try {
  $db = new PDO( $dsn, $user, $pass);
  $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  //print "<p>DB Connected</p>" ;
} catch( Exception $ex) {
  echo "<p>DB Connection Error</p>" ;
  exit;
}
