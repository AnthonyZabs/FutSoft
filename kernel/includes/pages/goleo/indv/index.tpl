  <div id="main" class="clearfix">
<link href="/resources/wp-content/themes/futsoft/css/liga_style.css" rel="stylesheet" type="text/css" media="all, print">
<link href="/resources/wp-content/themes/futsoft/css/lmx.css" rel="stylesheet" type="text/css" media="all, print">
<div class="row">


        <ul class="tables">
            <li>
                
                

<style>
  /*table.tbl_goleos tbody tr:nth-child(n+15){ display: none ; }*/
  table.tbl_goleos{width: 100%}
</style>



<div class="subtitMin pleca plecaBot">
    <h3 style="font-size: 24px;font-weight: bold;">Tabla de Goleo</h3>
</div>
<table class="default tbl_goleos">
  <thead class="head">
    <tr>
        <th>Pos</th>
        <th>Jugador</th>
        <th>Club</th>
        <th>G</th>      
    </tr>
  </thead>
  <tbody>
  <?php
    $Qj = MYSQL_::Bits("SELECT * FROM jugadores ORDER BY goles DESC");
    $xlSj  = mysqli_num_rows($Qj);
    if($xlSj > 0){
      $count = 1;
      while($CInfoj = mysqli_fetch_assoc($Qj)){
        $Qe = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$CInfoj[equip_id]' ");
        $CInfoe = mysqli_fetch_assoc($Qe)
  ?>  
  <tr>
    <td><?php echo $count; ?>º</td>
    <td style="text-align: left">
      <a title="" class="loadershow " href="/profile?jug=<?php echo $CInfoj['id']; ?>" data-original-title="<?php echo $CInfoj['nombre']; ?>">
        <img id="img_goleo" class="img_goleador_tbl" style="width:50px; height: 60px; !important;" src="<?php echo $CInfoj['photo']; ?>" height="30" width="20">        
      </a>
      <a class="empatados loadershow" href="/profile?jug=<?php echo $CInfoj['id']; ?>" data-original-title="" title="">
        <?php echo $CInfoj["nombre"] . ' ' . $CInfoj["ap_pa"] . ' ' . $CInfoj["ap_ma"]; ?>
      </a>      
    </td>
    <td>
      <a class="loadershow" href="/plantillas?eq=<?php echo $CInfoj['equip_id']; ?>" data-original-title="" title=""><?php echo $CInfoe["name"]; ?></a>
    </td>      
    <td class="ganados">
      <a class="loadershow ganados" href="#" data-original-title="" title=""><?php echo $CInfoj['goles']; ?></a>
    </td>          
  </tr>   
  <?php $count++; } }else{ echo '<br><center><b style="color:red;">No se encontraron Jugadores registrados a&uacute;n.</b></center><br>'; } ?> 
  </tbody>
</table>

<dl class="description">
  <dt>G</dt>
  <dd>Goles</dd>
</dl>

            </li>
        </ul>

    </div>
    <div id="sponsors">
      <ul class="sponsors"></ul>
    </div>
  </div><!-- #main -->
