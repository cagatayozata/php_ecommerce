<?php

session_start();

if (empty($_SESSION['user'])){
  header("Location: login.php") ;
}

function isAdmin() {
  return $_SESSION["user"]["role"] == 2 ;
}


require_once 'db.php';
require_once 'header.php';

?>
<h2>Previous Orders</h2>
<table>
  <?php
  try {

    $i=0;
    $total=0;

    $sql = "select * from orders";
    $stmt = $db->query($sql) ;

    if ( $stmt->rowCount() > 0) {
        
      foreach ( $stmt as $item) {

        if ($_SESSION['user']['username']==$item['customer_id']) {
          echo '<tr>' ;
          echo '<td><b>Date: </b>' . $item['date'] . '</td>' ;
          echo '<td><b>Product name: </b>' . $item['product_name'] . '</td>' ;
          echo '<td><b>Price: </b>' . $item['amount'] . '</td>' ;
          echo '</tr>' ;
          $i++;
          $total+=$item['amount'];
        }

      }

    } else {
      echo '<tr><td>No records yet.</td></tr>' ;
    }
  } catch( Exception $ex) {
    echo '<p>Query error ' . $ex->getMessage() . '</p>' ;
  }

  if ($total!=0){
    echo "</table><br><b>The number of products: </b>".$i."<br><b>Total value: </b>".$total;
  }
  else{
    echo '</table>No shopping yet.';
  }
  ?>

  <?php

  require_once 'footer.php';

  ?>
