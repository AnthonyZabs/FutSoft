<?php 
  require 'init.php';
  $zone = "plantillas";
  if($_GET["eq"]) //Si hay página por ?pagina=valor, lo asigna
    $eq = $_GET["eq"];


  include 'kernel/includes/pages/head.tpl';
  include 'kernel/includes/pages/plantillas/index.tpl';
  include 'kernel/includes/pages/footer.tpl';
?>