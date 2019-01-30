<?php

// DB Connection
require_once 'db.php';
session_start() ;

function isAdmin() {
  return $_SESSION["user"]["role"] == 2 ;
}

if(isset($_GET['id'])){
  $categoryid=$_GET['id'];
}

if(isset($_GET['name'])){
  $categoryname= $_GET['name'];
}

?>
<?php

require_once 'header.php';

?>
<h2><?php echo $categoryname; ?> | Products</h2>
<table>
  <tr class="bold"><td>Picture</td><td>Product</td><td>Price</td></tr>
  <?php

  try {

    $sql = "select * from product";
    $stmt = $db->query($sql) ;

    if ( $stmt->rowCount() > 0) {
      foreach ( $stmt as $item) {

        if ($item['category']==$categoryid) {
          echo '<tr>' ;
          echo "<td><img src='{$item['photo']}' width='80px'; ></td>" ;
          echo "<td><a href='product.php?id={$item['id']}'>{$item['name']}</td>" ;
          echo '<td>' . $item['price'] . ' $</td>' ;
          echo '<td>' . $item['stock'] . '</td>' ;
          echo '</tr>' ;
        }

      }
    } else {
      echo '<tr><td>No records yet.</td></tr>' ;
    }
  } catch( Exception $ex) {
    echo '<p>Query error ' . $ex->getMessage() . '</p>' ;
  }

  ?>
</table>

<?php
require_once 'footer.php';
?>
