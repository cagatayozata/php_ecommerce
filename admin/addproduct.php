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

<!-- main-->
<h2>Add Product</h2>
<form method="post" action="">
  <table>
    <tr>
      <td>Product Name:</td>
      <td><input type="text" name="name" /></td>
    </tr>
    <td>Photo Link:</td>
    <td><input type="text" name="photo" /></td>
  </tr>
  <tr>
    <td>Brand :</td>
    <td><input type="text" name="brand"/></td>
  </tr>
  <tr>
    <td>Category ID:</td>
    <td><input type="text" name="category"/></td>
  </tr>
  <tr>
    <td>Category Name:</td>
    <td><input type="text" name="categoryname"/></td>
  </tr>
  <tr>
    <td>Price :</td>
    <td><input type="text" name="price"/></td>
  </tr>
  <tr>
    <td>Descrpition :</td>
    <td><input type="text" name="des"/></td>
  </tr>
  <tr>
    <td colspan="2">
      <input type="submit" name="submit" value="Submit" />
    </td>
  </tr>
</table>
</form>
<br>
<?php

// DB Connection
require_once '../db.php';

// adding new comment
if (isset($_POST['submit'])) {
  extract($_POST) ;
  try {
    $sql="INSERT INTO product (`id`, `name`, `brand`, `category`, `categoryname`, `photo`, `price`, `rating`, `descp`, `promotional`) VALUES (NULL, '$name', '$brand', '$category', '$categoryname', '$photo', '$price', '0', '$des', '0')";
    $stmt = $db->prepare($sql) ;
    $stmt->execute() ;

    echo "Product is added!";
  } catch (Exception $ex) {
    echo "Error!";
    echo $ex;
  }
}

?>
<p><a href="index.php">Back to Admin Panel</a></p><br>

<!-- main -->

<?php

require_once 'footer.php';

?>

</body>
</html>
