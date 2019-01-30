<!DOCTYPE html>
<html>
<head>
  <title>Shopping Site</title>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <link href="../style.css" rel="stylesheet" type="text/css"/>
</head>
<body>

  <div id="main">

    <!-- header - start-->
    <div style="float:left; width: 650px;">
      <a href="index.php"><img src="../logo.jpg" alt="" width="300px"/></a>
      <p>Cep telefonu, bilgisayar, televizyon, kozmetik ve binlerce ürün...</p>

    </div>
    <div style="float:left; text-align: right;">
    </div>
    <div style="clear:both"></div>
    <hr>
    
    <?php

    if (!empty($_SESSION["user"])) {
      echo $_SESSION["user"]["fullname"] ;

      if (isAdmin()) {
        echo " | <a href='index.php'>Admin Panel</a>" ;
      }
      echo " | <a href='../index.php'>Back to Shopping Site</a>" ;
      echo " | <a href='../logout.php'>Logout</a>" ;
    }

    ?>
    <hr>

    <!-- header - end-->
