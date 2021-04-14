
          <li id="recent-posts-3" class="widget-container widget_recent_entries"> 
            <h3 class="widget-title">Últimas noticias</h3>    
            <ul>
              <?php 
              $xlSQ2  = MYSQL_::Bits("SELECT * FROM juegos WHERE played = '1' ORDER BY id DESC LIMIT 10");
                $xlS2   = mysqli_num_rows($xlSQ2);
                if($xlS2 > 0){
                  while($CInfo = mysqli_fetch_assoc($xlSQ2)){ 
                    $eq1  = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$CInfo[equip1]'");
                    $Equip1 = mysqli_fetch_assoc($eq1);

                    $eq2  = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$CInfo[equip2]'");
                    $Equip2 = mysqli_fetch_assoc($eq2);

                    $title = $Equip1['name'] .' '.$CInfo['goals1'].'  -  '. $Equip2['name'] .' '.$CInfo['goals2'] . ' (Jornada '.$CInfo['jornid'].')';
                  ?>
                  <li>
                    <a href="<?php echo BN('www') ?>/jornadas">
                      <?php echo $title; ?>
                    </a>
                  </li>
                <?php } }else{echo '<center><br><b style="color:red;">No hay noticias.</b><br><br></center>'; } ?>
            </ul>
        </li>   
      