<style type="text/css">
div.cdv{margin:0 1em;padding-top:1px;border:1px solid #aabaf2;border-top:0;background:#e9ebf2;-moz-border-radius:0 0 4px 4px;-webkit-border-radius:0 0 4px 4px;-khtml-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px;-moz-box-shadow:inset 0 0 8em #bdcbfc;-webkit-box-shadow:inset 0 0 8em #bdcbfc;box-shadow:inset 0 0 8em #bdcbfc}div.cdv div.cdvm{margin:1em 2em}div.cdv a{color:#014488;text-decoration:underline}div.cdv h1,div.cdv h2,div.cdv h3,div.cdv h4{text-align:left;text-transform:uppercase;font-family:'Oswald',sans-serif;letter-spacing:.02em;color:#222;line-height:1.2em;margin:.5em 0;padding:0;background:transparent;border:0;position:static;display:block;-moz-box-shadow:0 0 0 transparent;-webkit-box-shadow:0 0 0 transparent;box-shadow:0 0 0 transparent}div.cdv h1{font-size:2.6em}div.cdv h2{font-size:2.2em}div.cdv h3{font-size:1.8em}div.cdv h4{font-size:1.4em}div.cdv p{text-indent:0}div.cdv button{font-size:.95em;padding:.5em .8em}div.cdv input{font-size:.95em;padding:.2em .5em}div.cdv kbd{font-size:1em;padding:0;color:#000;background:transparent;border:0}.cdvt{margin:0;line-height:1.8em}.cdvt span{display:inline-block;text-indent:0;line-height:1.8em;padding:0 2em;color:#222;background:#ccc;text-shadow:1px 1px 1px rgba(255,255,255,0.8);border:1px solid #aaa;border-bottom:0;-moz-border-radius:4px 4px 0 0;-webkit-border-radius:4px 4px 0 0;-khtml-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0}
.egt th {
color:white;
padding: .2em .8em;
border: 1px solid rgba(255, 255, 255, 0.25);
background: rgb(51, 51, 51);
text-align: center;.egt td {
padding: .2em .8em;
border: 1px solid rgba(249, 249, 249, 0.54);
background: rgba(204, 204, 204, 0.92);
text-align: left;.egt .nbk{background:transparent;border:0}
</style>

  <div id="main" class="clearfix">
    <?php if($tem == null || $tem == ""){ ?>
    <div id="container">
      <div class="featured-image"></div>      
      <div id="post-341" class="post-341 page type-page status-publish hentry">
        <h1 class="entry-title">Temporadas</h1>
        <div id="content" role="main">
          Seleccione una Temporada:<br>
          <div class="entry-content">
              <?php
                $Q = MYSQL_::Bits('SELECT * FROM temporadas');

                $xlS  = mysqli_num_rows($Q);
                if($xlS <= 0){
                  echo '<center><b style="color:red;">No hay temporadas generadas a&uacute;n.</b></center><br>';
                }
                else{
                  while($CInfo = mysqli_fetch_assoc($Q)){
              ?>
              <a href="<?php echo BN('www') ?>/jornadas?i=<?php echo $CInfo[id]; ?>" class="big-button biggreen"><?php echo $CInfo["name"]; ?></a>
              <?php } }?>         
          </div><!-- .entry-content -->         
        </div><!-- #post-## -->
      </div>
    </div>

    <?php include 'kernel/includes/pages/index/sidebar.tpl'; ?> 
    <?php }else{ 
      $xlSQ2  = MYSQL_::Bits("SELECT * FROM temporadas WHERE id = '$tem'");
      $xlS2   = mysqli_num_rows($xlSQ2);
      if($xlS2 > 0){ 
        $Inf1 = mysqli_fetch_assoc($xlSQ2);
        $xlSQ3  = MYSQL_::Bits("SELECT * FROM jornadas WHERE temporada = '$Inf1[name]'");
        $xlS3   = mysqli_num_rows($xlSQ3);
        if($xlS3 > 0){ 
          while($Inf2 = mysqli_fetch_assoc($xlSQ3)){
    ?>      
      <br><center><h4><b>Jornada <?php echo $Inf2["num"]; ?></b></h4></center>
      <div class="cdv">
        <div class="cdvms">
      <table class="egt">
        <tbody><tr>
          <th scope="row">Fecha & Horario</th>
          <th>Equipo Local</th>
          <th>Goles</th>
          <th>Equipo Visitante</th>
          <th>Goles</th>
          <th>Arbitro</th>
          <th>Informaci&oacute;n</th>
        </tr>
        <?php 
        $xlSQ4  = MYSQL_::Bits("SELECT * FROM juegos WHERE fkjornid = '$Inf2[id]'");
        while($Inf3 = mysqli_fetch_assoc($xlSQ4)){
          $xlSQ5  = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$Inf3[equip1]'");
          $E1 = mysqli_fetch_assoc($xlSQ5);
          $xlSQ6  = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$Inf3[equip2]'");
          $E2 = mysqli_fetch_assoc($xlSQ6);
        ?>
        <tr>
          <th><?php echo $Inf3["fech"] . ' (' .$Inf3["hour"]. ')' ?></th>
          <td><center><img src="<?php echo $E1["escudo"]; ?>" height="30" width="30"/><br><?php echo $E1["name"]; ?></center></td>
          <td><center><?php echo $Inf3["goals1"]; ?></center></td>
          <td><center><img src="<?php echo $E2["escudo"]; ?>" height="30" width="30"/><br><?php echo $E2["name"]; ?></center></td>
          <td><center><?php echo $Inf3["goals2"]; ?></center></td>
          <td><center><?php echo $Inf3["arb"]; ?></center></td>
          <td><div style="max-height: 70px;min-height: 50px;overflow: auto;"><?php echo $Inf3["comments"]; ?></div></td>
        </tr>
        <?php } ?>
      </tbody></table>
          <div style="clear: both"></div>
        </div>
      </div><br>
    <?php } }else{ echo '<br><center><b style="color:red;">No se encontraron Jornadas para esa Temporada.</b></center><br>'; } }else{ echo '<script language="javascript">window.location="jornadas"</script>'; } ?>

    <?php } ?>

    <div id="sponsors">
      <ul class="sponsors"></ul>
    </div>
  </div><!-- #main -->
