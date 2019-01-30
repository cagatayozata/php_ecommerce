<?php

// DB Connection
require_once 'db.php';

session_start() ;

function isAdmin() {
  return $_SESSION["user"]["role"] == 2 ;
}

// Get ID
$id = $_GET["id"] ;
$stmt = $db->prepare("select * from product where id=?");
$stmt->execute([$id]);
$product = $stmt->fetch() ;

try{
    $stmt2 = $db->prepare("select * from rating where proid=?");
    $stmt2->execute([$id]);
    $comments = $stmt2->fetch() ;
    
    if ($comments==null) {
      $sql3="INSERT INTO `rating` (`x5`, `x4`, `x3`, `x2`, `x1`, `proid`) VALUES ('0', '0', '0', '0', '0', '$id')";
      $stmt3 = $db->prepare($sql3) ;
      $stmt3->execute() ;
    }
    
}catch (Exception $exc) {
    echo " hata";
}

// adding new comment
if (isset($_POST['submit'])) {

    extract($_POST) ;
    
    
    // sadece yorum 
    if (isset($newcomment)) {
        if (strlen($newcomment)>1) {
                try {
      $sql="INSERT INTO `comment` (`id`, `product_id`, `name`, `date`, `text`) VALUES (NULL, '$id', '$name', CURRENT_TIMESTAMP, '$newcomment');";
      $stmt1 = $db->prepare($sql) ;
      $stmt1->execute() ;
      
    } catch (Exception $ex) {

    }
        }
      }
      
      if (isset($starnumber)){
          try {
if($starnumber!=0){
                        $yenideger=$comments["x".$starnumber]+1;
      $sql3="UPDATE rating SET x".$starnumber." = ".$yenideger." WHERE proid=".$id;
      $stmt3 = $db->prepare($sql3) ;
      $stmt3->execute() ;
      header("Location: product.php?id=$id") ;
      exit; 
}
          } catch (Exception $exc) {
              echo $exc->getTraceAsString();
          }
            }  
      
    
}

if($comments['x5']==0 &&$comments['x4']==0 &&$comments['x3']==0 &&$comments['x2']==0 &&$comments['x1']==0){
    $ratingpoint=1;
     } else{
     $totalrating= $comments['x5']+$comments['x4']+$comments['x3']+$comments['x2']+$comments['x1'];
    $ratingpoint= (($comments['x5']*5)+($comments['x4']*4)+($comments['x3']*3)+($comments['x2']*2)+($comments['x1']))/$totalrating;

}

        

?>
<?php

require_once 'header.php';

?>

<!-- product picture and detail - start-->
<div class="productpic">
  <img src="<?php echo $product['photo']; ?>" width="100%"; ><br>
</div>

<div class="productdetail">
  <h2><?php echo $product['name']; ?></h2>
  <p><b>Brand: </b><?php echo $product['brand']; ?></p>
  <p><b>Category: </b><?php echo $product['categoryname']; ?></p><br>
  <?php


       for($i=0; $i<intval($ratingpoint); $i++){

    echo' <img src="https://cdn2.iconfinder.com/data/icons/flat-game-ui-buttons-icons-1/512/10-512.png" width=30px; height=30px;">';

  }

  
  
  ?>
  <br><br><p><b><?php echo $product['price']; ?> $</b></p><br>
  <?php

  if (isset($_SESSION['shopcart'][$product['id']])) {
    echo "This product was added to basket!";
  } else{
    echo "<a href='product.php?id={$product['id']}&buy=1'>ADD TO BASKET</a>" ;
  }

  if (isset($_GET['buy'])) {
    $buy=$_GET['buy'];
    if ($buy==1) {
      if (!empty($_SESSION["user"])) {

        echo "<br>Urun satin alindi.";
        $_SESSION["shopcart"][$product['id']] = ["name" => $product['name'] ,  "price" => $product['price'], "id" => $product['id'] ] ;

      }
      else{
        header("Location: login.php");
      }
    }
  }

  ?>
</div>
<div style="clear: both;"></div><br>
<!-- product picture and detail - end-->

<!-- product desc, comments and rating - start-->
<p><b>Product Details</b></p><hr>
<p><?php echo $product['descp']; ?></p>
<br>
<p><b>Comments</b></p><hr>
<form method="post" action="">
  <table>
<?php 

      if (!empty($_SESSION["user"])) {

    echo "<tr>";
     echo " <td><b>Name :</b> {$_SESSION["user"]["fullname"]}</td>";
     echo ' <td><input type="hidden" name="name" value="'.$_SESSION["user"]["fullname"].'"/></td>';
    echo "</tr>";
    
      }
      else{
        
    echo "<tr>";
     echo " <td><b>Name :</b></td>";
     echo ' <td><input type="text" name="name" /></td>';
    echo "</tr>";
      }

?>
    <tr>
        <td><b>Comment :</b></td>
      <td><input type="text" name="newcomment"/></td>
    </tr>
    <tr>
        <td><b>Rating :</b></td>
        <td>
            <select name="starnumber">
                <option value="0">0</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>                
            </select>
        </td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="submit" name="submit" value="Submit" />
      </td>
    </tr>
  </table>
</form>
<?php

try {

  $sql = "select * from comment where product_id=$id";
  $stmt = $db->query($sql) ;

  if ( $stmt->rowCount() > 0) {
    foreach ( $stmt as $comment) {
      echo '<p>' . $comment['name'] . '</p>' ;
      echo '<p>' . $comment['date'] . '</p>' ;
      echo '<p>' . $comment['text'] . '</p><br>' ;
    }
  } else {
    echo '<br><p>No comments</p><br>';
  }
} catch( Exception $ex) {
  echo '<p>Query error ' . $ex->getMessage() . '</p>' ;
}

?>

<!-- product desc, comments and rating - end-->

<?php

require_once 'footer.php';

?>
