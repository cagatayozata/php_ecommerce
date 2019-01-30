<?php
session_start() ;
if (empty($_SESSION["user"])) {
  header("Location: login.php") ;
  exit ;
}

function isAdmin() {
  return $_SESSION["user"]["role"] == 2 ;
}
