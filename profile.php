<?php 
  require 'init.php';
  $zone = "plantillas";
  if($_GET["jug"]) //Si hay página por ?pagina=valor, lo asigna
    $jug = $_GET["jug"];


  include 'kernel/includes/pages/head.tpl';
  include 'kernel/includes/pages/profile/index.tpl';
  include 'kernel/includes/pages/footer.tpl';
?>