<?php

session_start() ;

// check if already logged in
if ( !empty($_SESSION["user"])) {
  header("Location: index.php");
  exit ;
}

if ( isset($_POST["addBtn"])) {
  require_once 'db.php';
  extract($_POST) ;
  $add_error = false ;
  try {
    $sql = "insert into users (username, password, fullname, role) values (?,?,?,?)" ;
    $sql="INSERT INTO `users` (`username`, `password`, `fullname`, `address`, `date`, `autologin`, `role`) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, NULL, 0)";
    $stmt = $db->prepare($sql) ;

    // create a new password randomly.
    $hashPassword = password_hash($pass, PASSWORD_BCRYPT) ;
    $stmt->execute([$username, $hashPassword, $fullname,  $cargo]);
  } catch(Exception $ex) {
    echo "<p>DB Error : " . $ex->getMessage() . "</p>" ;
    $add_error = true ;
  }

}

require_once 'header.php';

?>
<h2>Register</h2>
<form action="" method="post">
  <table>
    <tr>
      <td>Fullname :</td>
      <td><input type="text" name="fullname"></td>
    </tr>
    <tr>
      <td>E-mail address :</td>
      <td><input type="text" name="username"></td>
    </tr>
    <tr>
      <td>Password :</td>
      <td><input type="password" name="pass"></td>
    </tr>
    <tr>
      <td>Cargo address :</td>
      <td><input type="text" name="cargo"></td>
    </tr>
    <tr>
    </tr>
    <tr>
      <td colspan="2">
        <input type="submit" name="addBtn" value="Register">
      </td>
    </tr>

  </table>
  <?php
  if ( isset($add_error) ) {
    if ($add_error) {
      echo "<p>Problem was occured during registration</p>" ;
    } else {
      echo "<p><b>Registration is completed successfully</b></p>";
    }
  }
  ?>
  <p><a href="index.php">Go back to homepage</a></p
</form>

<?php

require_once 'footer.php';

?>
