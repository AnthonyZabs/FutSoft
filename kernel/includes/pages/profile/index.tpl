  <div id="main" class="clearfix">
    <?php if($jug != null && $jug != ""){ ?>
    <div id="container">
      <h1 class="entry-title">Perfil del jugador</h1>
      <div id="content" role="main">
        <?php
          $Qj = MYSQL_::Bits("SELECT * FROM jugadores WHERE id = '$jug' ");
          $xlSj  = mysqli_num_rows($Qj);
          if($xlSj > 0){
            while($CInfoj = mysqli_fetch_assoc($Qj)){
              $Qe = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$CInfoj[equip_id]' ");
              $CInfoe = mysqli_fetch_assoc($Qe)
        ?>
        <div id="post-1259">
          <div class="profile-box">
            <h2 class="entry-title"><?php echo $CInfoj["nombre"]; ?></h2>
            <div class="profile-image"><img src="<?php echo $CInfoj["photo"]; ?>"></div>
              <section class="profile-details">
                <table>
                  <tbody>
                    <tr class="odd">
                      <th>N&uacute;mero</th>
                      <td><?php echo $CInfoj["num"]; ?></td>
                    </tr>
                    <tr class="even">
                      <th>Nombre</th>
                      <td><?php echo $CInfoj["nombre"] . ' ' . $CInfoj["ap_pa"] . ' ' . $CInfoj["ap_ma"]; ?></td>
                    </tr>
                    <tr class="odd">
                      <th>Edad</th>
                      <td><?php echo $CInfoj["edad"]; ?></td>
                    </tr>
                    <tr class="odd">
                      <th>Peso</th>
                      <td><?php echo $CInfoj["peso"]; ?></td>
                    </tr>
                    <tr class="odd">
                      <th>Estatura</th>
                      <td><?php echo $CInfoj["estatura"]; ?></td>
                    </tr>
                    <tr class="odd">
                      <th>Equipo</th>
                      <td><?php echo $CInfoe["name"]; ?></td>
                    </tr>
                    <tr class="odd">
                      <th>Capit&aacute;n</th>
                      <td><?php if($CInfoj["capitan"] == 1){ echo "S&iacute;"; }else{ echo "No"; } ?></td>
                    </tr>
                    <tr class="even">
                      <th>Posición</th>
                      <td><?php echo $CInfoj["pos"]; ?></td>
                    </tr>
                    <tr class="even">
                      <th>Goles</th>
                      <td><?php echo $CInfoj["goles"]; ?></td>
                    </tr>
                    <tr class="odd">
                      <th>Faltas</th>
                      <td><?php echo $CInfoj["faltas"]; ?></td>
                    </tr>
                    <tr class="even">
                      <th>Tarj. Amarilla</th>
                      <td><?php echo $CInfoj["tar_am"]; ?></td>
                    </tr>
                    <tr class="odd last">
                      <th>Tarj. Roja</th>
                      <td><?php echo $CInfoj["tar_r"]; ?></td>
                    </tr>
                  </tbody>
                </table>
              </section> 
            <div id="nav-below" class="navigation">
              <div class="clear"></div>
            </div>
          </div>        
        </div><!-- #post-## -->
      <?php } }else{ echo '<script language="javascript">window.location="jugadores"</script>'; } ?>

      </div><!-- #content -->   
    </div>
  <?php }else{ echo "<script language='javascript'>window.location='jugadores'</script>";  } ?>
    <?php include 'kernel/includes/pages/index/sidebar.tpl'; ?> 
    <div id="sponsors">
      <ul class="sponsors"></ul>
    </div>
  </div><!-- #main -->
