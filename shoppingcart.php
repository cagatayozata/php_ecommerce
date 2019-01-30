<?php
session_start();

if (empty($_SESSION['user'])){
  header("Location: login.php") ;
}

require_once 'db.php';
function isAdmin() {
  return $_SESSION["user"]["role"] == 2 ;
}

require_once 'header.php';
?>
<h2>Shopping Cart</h2>
<?php

if (isset($_POST['buy'])){

  //db ekle urunelri

  foreach( $_SESSION["shopcart"] as $id => $item) {

    $sql = "INSERT INTO orders (order_id, customer_id, product_id, product_name, amount, date) VALUES (NULL, ?, ?, ?, ?, CURRENT_TIMESTAMP)" ;
    $stmt = $db->prepare($sql) ;
    $stmt->execute([$_SESSION["user"]['username'] , $item['id'], $item["name"],  $item["price"]]);

  }

  // shooping cart session temizle
  unset($_SESSION['shopcart']);
  echo 'Operation can be done.<br><a href="index.php">Back to homepage</a>';
  require_once 'footer.php';
  exit();

}

// display all data withing shoppingcart
if ( isset($_SESSION["shopcart"])) {
  $total=0;

  foreach( $_SESSION["shopcart"] as $id => $item) {
    print "<b>Product name: </b>{$item["name"]} ";
    print "<b>Price : </b>{$item["price"]}</p>";
    $total+= $item['price'];
  }

  echo "<br><p><b>Total product :</b> " . count($_SESSION["shopcart"]) . "</p>";
  echo "<b>Total price= </b>".$total."<br><br>";

  echo '<form action="" method="post"><input type="submit" name="buy" value="COMPLETE"></form>';
}
else {
  echo "<p>No products yet</p>";
}

print "<p><a href='index.php'>Back to Main</a></p>";

require_once 'footer.php';

?>
