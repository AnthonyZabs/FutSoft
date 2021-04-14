<?php 
  require 'init.php';
  $zone = "inicio";
  if($_GET["pagina"]) //Si hay página por ?pagina=valor, lo asigna
    $pagina = $_GET["pagina"];


  include 'kernel/includes/pages/head.tpl';
  include 'kernel/includes/pages/index/index.tpl';
  include 'kernel/includes/pages/footer.tpl';
?>