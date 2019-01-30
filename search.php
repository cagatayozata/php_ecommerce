<?php

session_start();
function isAdmin() {
  return $_SESSION["user"]["role"] == 2 ;
}

if (isset($_POST)) {

  extract($_POST);

}


require_once 'db.php';
require_once 'header.php';
$found=false;
$ara=true;

if (isset($_GET['word'])) {
  $searchword= $_GET['word'];
}

if(isset($_GET['page'])){
  $page= $_GET['page'];

}
else {
  $page=0;
}

if ($ara) {
  try {

    $sql = "select * from product";
    $stmt = $db->query($sql) ;
    define('itemnumber', 5);

    $count=0;
    $page_count_first=($page*itemnumber);
    $page_count_last=(($page*itemnumber)-1)+itemnumber;

    ($page*itemnumber)-1;
    echo "<h2>Search</h2>";
    if ( $stmt->rowCount() > 0) {
      echo '<table>';
      foreach ( $stmt as $item) {

        if (strstr(strtoupper($item['name']), strtoupper($searchword)) || strstr(strtoupper($item['descp']), strtoupper($searchword))) {
          if ($count>=$page_count_first && $count<=$page_count_last) {
            echo '<tr>' ;
            echo "<td><a href='product.php?id={$item['id']}'>{$item['name']}</td>" ;
            echo '<td>' . $item['price'] . '</td>' ;
            echo '</tr>' ;

          }
          $count++;
          $found=true;
        }

      }
      echo "</table>";

      if ($count>itemnumber) {
        echo "<br>Page&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ";
        for ($index = 0; $index < ceil($count/5); $index++) {
          echo '<a href="search.php?word='.$searchword.'&page='.$index.'" >'.($index+1).'</a>&nbsp;&nbsp;&nbsp;&nbsp;';
        }
      }

    } else {
      echo '<tr><td>No records yet.</td></tr>' ;
    }
  } catch( Exception $ex) {
    echo '<p>Query error ' . $ex->getMessage() . '</p>' ;
  }
}

if (!$found) {
  echo "No matches found";
}
require_once 'footer.php';
