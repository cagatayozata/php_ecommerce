<?php

require_once 'auth.php';
require_once './db.php';

$cookie_session_name = session_name() ;  // By default it returns "PHPSESSID"
setcookie( $cookie_session_name, "", 1 , '/') ; // delete Memory(Session) Cookie

// Autologin
setcookie("autologin", "", 1) ; // delete auto login.
$stmt = $db->prepare("update users set autologin = NULL where username = ?") ;
$stmt->execute([$_SESSION["user"]["username"]]) ;

// delete session file from server-side
session_destroy();

header("Location: index.php");
