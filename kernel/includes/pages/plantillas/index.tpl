  <div id="main" class="clearfix">
    
    <div id="container">
      <div class="featured-image"></div>

      <div id="post-1085" class="post-1085 page type-page status-publish hentry">
          <h1 class="entry-title">Plantillas</h1>
          <div id="content" role="main">
            <li id="categories-3" class="widget-container widget_categories"><h3 class="widget-title">Seleccione un Equipo:</h3>    
              <div style="padding:5px;">
                <?php
                $Q = MYSQL_::Bits('SELECT * FROM equipos');
                $xlS  = mysqli_num_rows($Q);
                if($xlS <= 0){
                  echo '<center><b style="color:red;">No hay equipos registrados a&uacute;n.</b></center><br>';
                }
                else{
                  $count = 1;
                  while($CInfo = mysqli_fetch_assoc($Q)){
                ?>
                <a href="/plantillas?eq=<?php echo $CInfo['id']; ?>">
                  <?php if($count == 7){
                    $count = 1;
                    ?><br><?php
                  }?>
                  <img src='<?php echo $CInfo[escudo]; ?>' height="80" width="80" style="position:absolute;pointer-events:none;padding: 10px;z-index: 10000px;"/>
                  <input style="width:16%;height:100px;margin-bottom: 5px;" class="button" name="view" type="submit" value="" />
                </a>
              <?php $count++; } } ?>
              </div>
            </li>

            <?php if($eq != null && $eq != ""){ ?>
              <div class="entry-content">
                <section>
                  <h3>Plantilla del Equipo <?php echo $eq; ?></h3>
                  <div class="tb_players">
                    <ul class="gallery-view">
                      <div class="clearfix">
                        <?php
                          $Qj = MYSQL_::Bits("SELECT * FROM jugadores WHERE equip_id = '$eq' ");
                          $xlSj  = mysqli_num_rows($Qj);
                          if($xlSj > 0){
                            while($CInfoj = mysqli_fetch_assoc($Qj)){
                        ?>
                        <li>
                          <a href="/profile?jug=<?php echo $CInfoj['id']; ?>">
                            <img width="100" height="100" src="<?php echo $CInfoj['photo']; ?>" alt="" title="<?php echo $CInfoj['nombre']; ?>"">
                          </a>
                          <div class="number">
                            <a href="/profile?jug=<?php echo $CInfoj['id']; ?>" title="<?php echo $CInfoj['nombre']; ?>"><?php echo $CInfoj['num']; ?></a>
                          </div>
                          <div class="name">
                            <a href="/profile?jug=<?php echo $CInfoj['id']; ?>" title="<?php echo $CInfoj['nombre']; ?>"><?php echo $CInfoj['nombre']; ?></a>
                          </div>
                        </li>
                      <?php } }else{ echo '<br><center><b style="color:red;">No se encontraron Jugadores en este Equipo.</b></center><br>'; } ?>
                      </div>
                    </ul>
                  </div>
                </section>
              </div><!-- .entry-content -->      
            <?php } ?>
          </div><!-- #post-## -->
        </div>
      </div>
    <?php include 'kernel/includes/pages/index/sidebar.tpl'; ?> 
    <div id="sponsors">
      <ul class="sponsors"></ul>
    </div>
  </div><!-- #main -->
