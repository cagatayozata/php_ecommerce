<!DOCTYPE html>
<html>
<head>
  <title>Shopping Site</title>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>

  <div id="main">

    <!-- header - start-->
    <div style="float:left; width: 650px;">
      <a href="index.php"><img src="logo.jpg" alt="" width="300px"/></a>
      <p>lorem ipsum</p>

    </div>
    <div style="float:left; text-align: right;">
      <form action="search.php" method="POST">
        <input type="text" name="searchword" value="">
        <input type="submit" value="search" name="search">
      </form>
    </div>
    <div style="clear:both"></div>
    <hr>
    <?php

    if (!empty($_SESSION["user"])) {
      echo "<b>".$_SESSION["user"]["fullname"]."</b>" ;

      if (isAdmin()) {
        echo " | <a href='./admin/index.php'>Admin Panel</a>" ;
      }
      echo " | <a href='shoppingcart.php'>Shopping Cart</a>" ;
      echo " | <a href='info.php'>Personal Information</a>" ;
      echo " | <a href='preorders.php'>Previous Orders</a>" ;
      echo " | <a href='logout.php'>Logout</a>" ;
    }
    else{
      echo "<a href='addUser.php'>Register</a>" ;
      echo " | <a href='login.php'>Login</a>" ;
    }

    ?>
    <br>
    <hr>
    <!-- header - end-->
