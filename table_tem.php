<?php 
  require 'init.php';
  $zone = "stats";
  if($_GET["i"]) //Si hay página por ?pagina=valor, lo asigna
    $tem = $_GET["i"];


  include 'kernel/includes/pages/head.tpl';
  include 'kernel/includes/pages/tabla/temp/index.tpl';
  include 'kernel/includes/pages/footer.tpl';
?>