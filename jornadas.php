<?php 
  require 'init.php';
  $zone = "jornadas";
  if($_GET["i"]) //Si hay página por ?pagina=valor, lo asigna
    $tem = $_GET["i"];


  include 'kernel/includes/pages/head.tpl';
  include 'kernel/includes/pages/jornadas/index.tpl';
  include 'kernel/includes/pages/footer.tpl';
?>