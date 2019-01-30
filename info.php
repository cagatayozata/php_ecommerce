<?php

session_start();

if (empty($_SESSION['user'])){
  header("Location: login.php") ;
}

require_once 'header.php';

function isAdmin() {
  return $_SESSION["user"]["role"] == 2 ;
}

?>

<h2>Personal Information</h2>
<p><b>Name Surname: </b><?php echo $_SESSION["user"]["fullname"]; ?></p>
<p><b>E-mail Address: </b><?php echo $_SESSION["user"]["username"]; ?></p>
<p><b>Registration Date: </b><?php echo $_SESSION["user"]["date"]; ?></p>
<p><b>Cargo Address: </b><?php echo $_SESSION["user"]["address"]; ?></p>

<?php 

require_once 'footer.php';

?>