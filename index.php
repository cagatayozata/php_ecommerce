<?php

// DB Connection
require_once 'db.php';
session_start() ;

function isAdmin() {
  return $_SESSION["user"]["role"] == 2 ;
}


?>
<?php

require_once 'header.php';

?>
<h2>Homepage</h2>
<div style="float:left; ">
  <b>Categories</b><br>
  <?php

  try {

    $sql = "select DISTINCT category,categoryname from product";
    $stmt = $db->query($sql) ;

    if ( $stmt->rowCount() > 0) {
      foreach ( $stmt as $item) {

        echo '<tr>' ;
        echo "<td><a href='category.php?id={$item['category']}&name={$item['categoryname']}'>{$item['categoryname']}</a><br></td>" ;
        echo '</tr>' ;

      }
    } else {
      echo '<tr><td>No records yet.</td></tr>' ;
    }
  } catch( Exception $ex) {
    echo '<p>Query error ' . $ex->getMessage() . '</p>' ;
  }
  ?>
</div>
<div style="float:left; margin-left: 50px;  width: 500px;">
  <b>Promotional Products</b><br>
  <div class="slideshow-container">
    <?php

    try {

      $sql = "select * from product";
      $stmt = $db->query($sql) ;

      if ( $stmt->rowCount() > 0) {
        foreach ( $stmt as $item) {

          if ($item['promotional']==1) {

            echo '<div class="mySlides fade">';
            echo '<div class="text">'.$item['name'].'</div>';
            echo "<a href='product.php?id=".$item['id']."'><img src='{$item['photo']}' style='width:100%'></a>";
            echo '</div>';

          }

        }
      } else {
        echo '<tr><td>No records yet.</td></tr>' ;
      }
    } catch( Exception $ex) {
      echo '<p>Query error ' . $ex->getMessage() . '</p>' ;
    }

    ?>
  </div>

  <br>
  <div style="text-align:center">
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
  </div>
</div>
<br>
<div style="clear:both"></div>
<script>
var slideIndex = 0;
showSlides();
function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex> slides.length) {slideIndex = 1}
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Bu alandan resimlerin geçiş süresini değiştirebilirsiniz.
}
</script>
<?php
require_once 'footer.php';
?>
