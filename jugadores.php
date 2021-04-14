<?php 
  require 'init.php';
  $zone = "players";
  if($_GET["pagina"]) //Si hay página por ?pagina=valor, lo asigna
    $pagina = $_GET["pagina"];


  include 'kernel/includes/pages/head.tpl';
  include 'kernel/includes/pages/jugadores/index.tpl';
  include 'kernel/includes/pages/footer.tpl';
?>