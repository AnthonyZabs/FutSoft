<div id="sidebar">
      <div id="primary" class="widget-area" role="complementary">
        <ul class="xoxo">
          <li id="tag_cloud-2" class="widget-container widget_tag_cloud"><h3 class="widget-title">Goleador</h3>
            <div class="tagcloud" style="padding: 5px;">
              <?php 
              $xlSQ2  = MYSQL_::Bits("SELECT * FROM jugadores");
                $xlS2   = mysqli_num_rows($xlSQ2);
                if($xlS2 > 0){ 
                  $CInfo = mysqli_fetch_assoc($xlSQ2);
                    $eq1  = MYSQL_::Bits("SELECT MAX(goles) as goles FROM jugadores");
                    $Equip1 = mysqli_fetch_assoc($eq1);

                    $xlSQ1  = MYSQL_::Bits("SELECT * FROM jugadores WHERE goles ='$Equip1[goles]' ORDER BY id DESC LIMIT 1");
                    while($Equip2 = mysqli_fetch_assoc($xlSQ1)){

                    $xlSQ3  = MYSQL_::Bits("SELECT * FROM equipos WHERE id ='$Equip2[equip_id]'");
                    $Equip4 = mysqli_fetch_assoc($xlSQ3);
              ?>
              <img src="<?php echo $Equip2[photo]; ?>" height="100" width="100" style="float:left;border:solid 1px gray;"/>
              <div style="margin-left: 110px;height: 105px;">
                <b><?php echo $Equip2['nombre'] .' '.$Equip2['ap_pa'] .' '.$Equip2['ap_ma']; ?></b><br>
                <b>Edad: </b><?php echo $Equip2['edad']; ?><br>
                <b>Equipo: </b><?php echo $Equip4['name']; ?><br>
                <b>Posici&oacute;n: </b><?php echo $Equip2['pos']; ?><br>
                <b>N&uacute;mero: </b><?php echo $Equip2['num']; ?><br>
                <b>Goles: </b><?php echo $Equip2['goles']; ?>
              </div>
              <?php } }else{echo '<center><br><b style="color:red;">No hay Jugadores Registrados.</b><br><br></center>'; } ?>
            </div>
          </li>

          <li id="tag_cloud-2" class="widget-container widget_tag_cloud"><h3 class="widget-title">Equipo con m&aacute;s Victorias</h3>
            <div class="tagcloud" style="padding: 5px;">
              <?php 
              $xlSQ2  = MYSQL_::Bits("SELECT * FROM equipos");
                $xlS2   = mysqli_num_rows($xlSQ2);
                if($xlS2 > 0){ 
                    $eq0  = MYSQL_::Bits("SELECT MAX(vics) as vics FROM equipos LIMIT 1");
                    $Equip2 = mysqli_fetch_assoc($eq0);

                    $xlSQ1  = MYSQL_::Bits("SELECT * FROM equipos WHERE vics ='$Equip2[vics]' ORDER BY id DESC LIMIT 1");
                    
                    while($Equip1 = mysqli_fetch_assoc($xlSQ1)){
              ?>
              <img src="<?php echo $Equip1[escudo]; ?>" height="100" width="100" style="float:left;border:solid 1px gray;"/>
              <div style="margin-left: 110px;height: 105px;">
                <b><?php echo $Equip1['name'];?></b><br>
                <b>Representante: </b><?php echo $Equip1['representante']; ?><br>
                <b>Vacantes: </b><?php echo $Equip1['vacantes']; ?><br>
                <b>Victorias: </b><?php echo $Equip1['vics']; ?>
              </div>
              <?php } }else{echo '<center><br><b style="color:red;">No hay Equipos Registrados.</b><br><br></center>'; } ?>
            </div>
          </li>   

          <li id="tag_cloud-2" class="widget-container widget_tag_cloud"><h3 class="widget-title">Equipo con m&aacute;s Goles</h3>
            <div class="tagcloud" style="padding: 5px;">
              <?php 
              $xlSQ2  = MYSQL_::Bits("SELECT * FROM equipos");
                $xlS2   = mysqli_num_rows($xlSQ2);
                if($xlS2 > 0){ 
                    $eq0  = MYSQL_::Bits("SELECT MAX(gf) as gf FROM equipos LIMIT 1");
                    $Equip2 = mysqli_fetch_assoc($eq0);

                    $xlSQ1  = MYSQL_::Bits("SELECT * FROM equipos WHERE gf ='$Equip2[gf]' ORDER BY id DESC LIMIT 1");
                    
                    while($Equip1 = mysqli_fetch_assoc($xlSQ1)){
              ?>
              <img src="<?php echo $Equip1[escudo]; ?>" height="100" width="100" style="float:left;border:solid 1px gray;"/>
              <div style="margin-left: 110px;height: 105px;">
                <b><?php echo $Equip1['name'];?></b><br>
                <b>Representante: </b><?php echo $Equip1['representante']; ?><br>
                <b>Vacantes: </b><?php echo $Equip1['vacantes']; ?><br>
                <b>Goles: </b><?php echo $Equip1['gf']; ?>
              </div>
              <?php } }else{echo '<center><br><b style="color:red;">No hay Equipos Registrados.</b><br><br></center>'; } ?>
            </div>
          </li>
        </ul>
      </div><!-- #primary .widget-area -->
    </div><!-- #sidebar --> 