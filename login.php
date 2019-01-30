<?php

session_start() ;

// check if already logged in
if ( !empty($_SESSION["user"])) {
  header("Location: index.php");
  exit ;
}

// test autologin enabled
if( !empty($_COOKIE["autologin"])) {
  $autologinID =  $_COOKIE["autologin"] ;
  $sql = "select * from users where autologin = ?" ;
  $stmt = $db->prepare($sql) ;
  $stmt->execute([$autologinID]) ;
  if ( $stmt->rowCount() == 1) {
    $_SESSION["user"] = $user ;
    header("Location: index.php") ;
    exit ;
  } else {
    setcookie("autologin", "", 1) ;
  }
}

if ( isset($_POST["loginBtn"])) {
  require_once 'db.php';
  extract($_POST) ;
  $sql = "select * from users where username = ?" ;
  $stmt = $db->prepare($sql);
  $stmt->execute([$username]) ;

  if ( $stmt->rowCount() == 1) {
    $user = $stmt->fetch(PDO::FETCH_ASSOC) ;
    //  var_dump($user) ;
    if (password_verify($password, $user["password"])) {
      //echo "Authenticated" ;
      if ( isset($remember)) {
        $autologin = password_hash(uniqid(), PASSWORD_BCRYPT);
        setcookie("autologin", $autologin, time() + 60*60*24) ;
        $stmt2 = $db->prepare("update users set autologin = ? where username = ?") ;
        $stmt2->execute([$autologin, $user["username"]]) ;
      }
      $_SESSION["user"] = $user;
      header("Location: index.php") ;
      exit ;

    } else {
      // echo "Authentication Failed" ;
      $login_error = true ;
    }
  } else {
    $login_error = true ;
  }

}

// header
require_once 'header.php';

?>

<h2>Login</h2>
<form action="" method="post">
  <table>
    <tr>
      <td>Username :</td>
      <td><input type="text" name="username"></td>
    </tr>
    <tr>
      <td>Password :</td>
      <td><input type="password" name="password"></td>
    </tr>
    <tr>
      <td>Remember :</td>
      <td><input type="checkbox" name="remember"></td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="submit" value="Login" name="loginBtn">
      </td>
    </tr>
  </table>
  <p class="center"><?= isset($login_error) ? "Login Error" : "" ; ?></p>
</form>
<p><a href="index.php">Go back to homepage</a></p>

<?php

// footer
require_once 'footer.php';

?>
