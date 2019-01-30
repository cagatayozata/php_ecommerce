<?php

session_start() ;
function isAdmin() {
  return $_SESSION["user"]["role"] == 2 ;
}

if (!isAdmin()) {
  header("Location: forbidden.php") ;
}

require_once 'header.php';
?>

<h2>Admin Panel</h2>
<!-- main-->
<a href="addproduct.php">Add Product</a><br>
<a href="promotional.php">Select Promotional Product</a><br><br>
<!-- main -->

<?php
require_once 'footer.php';
?>
