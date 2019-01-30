<?php

session_start() ;
function isAdmin() {
  return $_SESSION["user"]["role"] == 2 ;
}

if (!isAdmin()) {
  header("Location: forbidden.php") ;
}

// DB Connection
require_once '../db.php';

if (isset($_GET['id'])) {
  $id= $_GET['id'];
  $operation= $_GET['operation'];
  try {
    if ($operation==1){
      $sql3="UPDATE `product` SET `promotional` = '1' WHERE `product`.`id` = $id";
    }
    else{

      $sql3="UPDATE `product` SET `promotional` = '0' WHERE `product`.`id` = $id";
    }
    $stmt3 = $db->prepare($sql3) ;
    $stmt3->execute() ;
  } catch (Exception $ex) {

  }

  header("Location: promotional.php") ;
  exit;

}

require_once 'header.php';

?>
<!-- main-->
<h2>Promotional Products List</h2>
<table>
  <?php

  try {

    $sql = "select * from product";
    $stmt = $db->query($sql) ;

    if ( $stmt->rowCount() > 0) {
      foreach ( $stmt as $item) {
        echo '<tr>' ;
        echo '<td>' . $item['id'] . '</td>' ;
        echo '<td>' . $item['name'] . '</td>' ;
        echo '<td>' . $item['brand'] . '</td>' ;
        echo '<td>' . $item['categoryname'] . '</td>' ;
        echo '<td>' . $item['price'] . ' $</td>' ;
        if ($item['promotional']==0) {

          echo "<td><a href='promotional.php?id={$item['id']}&operation=1'>select as Promotional Product</td>" ;
        }
        else{
          echo "<td><a href='promotional.php?id={$item['id']}&operation=0'>Unselect as Promotional Product</td>" ;
        }

        echo '</tr>' ;
      }
    } else {
      echo '<tr><td>No records yet.</td></tr>' ;
    }
  } catch( Exception $ex) {
    echo '<p>Query error ' . $ex->getMessage() . '</p>' ;
  }

  ?>
</table>
<br><a href="index.php">Back to Admin Panel</a><br><br>

<!-- main -->

<?php

require_once 'footer.php';

?>

</body>
</html>
