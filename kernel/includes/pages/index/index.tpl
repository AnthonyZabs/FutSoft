  <div id="main" class="clearfix">
    
      <?php 
        $xlSQ2  = MYSQL_::Bits("SELECT * FROM juegos WHERE played = '1' ORDER BY id DESC LIMIT 5");
          $xlS2   = mysqli_num_rows($xlSQ2);
          if($xlS2 > 0){
            $ctn = 0;
      ?>
      <div class="featured-rotator image-rotator">
      <div class="main_image">
        <ul>
          <?php while($CInfo = mysqli_fetch_assoc($xlSQ2)){ 
            $eq1  = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$CInfo[equip1]'");
            $Equip1 = mysqli_fetch_assoc($eq1);

            $eq2  = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$CInfo[equip2]'");
            $Equip2 = mysqli_fetch_assoc($eq2);

            $title = $Equip1['name'] .' '.$CInfo['goals1'].'  -  '. $Equip2['name'] .' '.$CInfo['goals2'] . ' (Jornada '.$CInfo['jornid'].')';

            
          ?>
            <li data-slide="<?php echo $ctn; ?>">
              <a href="<?php echo BN('www') ?>/jornadas">
                <img width="640" height="360" src="<?php echo BN('www') ?>/imagegenerator.php?esc=<?php echo $Equip1['escudo']; ?>" class="attachment-featured-image size-featured-image wp-post-image" alt="" title="<?php echo $title; ?>" />
              </a>
              <div class="desc">
                <div class="block">
                  <h3 class="ellipsis">
                    <a href="<?php echo BN('www') ?>/jornadas">
                      <?php echo $title; ?>
                    </a>
                  </h3>
                  <time>
                    <a href="<?php echo BN('www') ?>/jornadas"><?php echo $CInfo['fech'] . ' (' . $CInfo['hour'] . ')'; ?></a>
                  </time>
                </div>
              </div>
            </li>
          <?php $ctn++; } ?>
        </ul>
      </div>

      <?php
        $xlSQ2  = MYSQL_::Bits("SELECT * FROM juegos WHERE played = '1' ORDER BY id DESC LIMIT 5");
        $xlS2   = mysqli_num_rows($xlSQ2);
          if($xlS2 > 0){ 
            $ctn = 0;
      ?>
      <!-- Miniaturas -->
      <div class="image_thumb">
        <ul>
          <?php while($CInfo = mysqli_fetch_assoc($xlSQ2)){ 
            $eq1  = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$CInfo[equip1]'");
            $Equip1 = mysqli_fetch_assoc($eq1);

            $eq2  = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$CInfo[equip2]'");
            $Equip2 = mysqli_fetch_assoc($eq2);

            $title = $Equip1['name'] .' '.$CInfo['goals1'].'  -  '. $Equip2['name'] .' '.$CInfo['goals2'] . ' (Jornada '.$CInfo['jornid'].')';
          ?>
            <li data-permalink="<?php echo BN('www') ?>/jornadas" data-slide="<?php echo $ctn; ?>">
              <a>
                <img width="50" height="50" src="<?php echo BN('www') ?>/imagegenerator.php?esc=<?php echo $Equip1['escudo']; ?>" height="50" width="60" class="attachment-side-image size-side-image wp-post-image" alt="" title="Granada 3 – Córdoba 1 (Jornada 6-Liga 17/18) Segunda División" />
              </a> 
              <div class="block">
                <h3 class="ellipsis"><?php echo $title; ?></h3>
                <time><a href="<?php echo BN('www') ?>/jornadas"><?php echo $CInfo['fech'] . ' (' . $CInfo['hour'] . ')'; ?></a></time>
              </div>
              <div class="more">
                <a href="<?php echo BN('www') ?>/jornadas">Seguir Leyendo</a>
              </div>
            </li>
          <?php $ctn++; } ?>
        </ul> 
      </div>      
      <?php } ?>
</div>
      <?php } ?>
    

    <script type="text/javascript">
      (function($) {
        $('.image-rotator').rotator({
          'delay' : 4000
        });
      })(jQuery);
    </script>
    <div id="container">
      <div id="content" role="main">
        <ul class="home-widgets content-left">
          <li id="tb_ground-widget" class="widget-container">
            <h3>Estado actual del terreno de Cancha Forjadores</h3>
            <div class="tb_ground_status_display">Excelente</div>
          </li>   
          <?php include 'kernel/includes/pages/index/news.tpl'; ?>   
      </ul>
      <ul class="home-widgets content-right">
        <li id="text-2" class="widget-container widget_text">     
          <div class="textwidget">
            <a class="twitter-timeline" data-height="490" href="https://twitter.com/LIGABancomerMX?ref_src=twsrc%5Etfw">Tweets by LIGABancomerMX</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
          </div>
        </li>   
      </ul>
      <div class="clear"></div>
      <ul class="home-widgets"></ul>
      </div><!-- #content -->
    </div><!-- #container -->

    <?php include 'kernel/includes/pages/index/sidebar.tpl'; ?> 
    
    <div id="sponsors">
      <ul class="sponsors"></ul>
    </div>
  </div><!-- #main -->
