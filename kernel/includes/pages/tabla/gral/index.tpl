  <div id="main" class="clearfix">
<link href="/resources/wp-content/themes/futsoft/css/liga_style.css" rel="stylesheet" type="text/css" media="all, print">
<link href="/resources/wp-content/themes/futsoft/css/lmx.css" rel="stylesheet" type="text/css" media="all, print">
<div class="row tGCT">
            <div class="subtitMin pleca plecaBot">
                <h3 style="font-size: 24px;font-weight: bold;">Tabla General</h3>
            </div>
            <table class="default tbl_grals">
                <thead>
                <tr class="head">
                    <th>Pos</th>
                    <th>Club</th>
                    <th>JJ</th>
                    <th>JG</th>
                    <th>JP</th>
                    <th>JE</th>
                    <th>GF</th>
                    <th>GC</th>
                    <th>Dif</th>
                    <th>Pts</th>
                </tr>
                </thead>
                <tbody>
                <?php
                $Q = MYSQL_::Bits('SELECT * FROM equipos ORDER BY gf * 3 DESC');
                $xlS  = mysqli_num_rows($Q);
                if($xlS <= 0){
                  echo '<center><b style="color:red;">No hay equipos registrados a&uacute;n.</b></center><br>';
                }
                else{
                  $count = 1;
                  while($CInfo = mysqli_fetch_assoc($Q)){
                ?>
                <tr>
                    <td><?php echo $count; ?></td>
                    <td style="text-align: left !important; width: 18%;">
                        <a class="loadershow tpts" href="/plantillas?eq=<?php echo $CInfo['id']; ?>" data-original-title="" title="">
                            <img src="<?php echo $CInfo["escudo"]; ?> " height="35" width="35" alt="<?php echo $CInfo["name"]; ?>">
                            <br><?php echo $CInfo["name"]; ?>                            
                        </a>
                    </td>
                    
                    <td><a class="tpts loadershow" href="#" data-original-title="" title=""> <?php echo $CInfo["jj"]; ?></a></td>
                    
                    <td><a class="ganados loadershow" href="#" data-original-title="" title=""> <?php echo $CInfo["vics"]; ?></a></td>
                    
                    <td><a class="perdidos loadershow" href="#" data-original-title="" title=""> <?php echo $CInfo["ders"]; ?></a></td>
                    
                    <td><a class="empatados loadershow" href="#" data-original-title="" title=""> <?php echo $CInfo["emps"]; ?></a></td>
                    
                    <td><a class="loadershow" href="#" data-original-title="" title=""> <?php echo $CInfo["gf"]; ?></a></td>
                    
                    <td><a class="loadershow" href="#" data-original-title="" title=""> <?php echo $CInfo["gc"]; ?></a></td>

                    <td><?php echo $CInfo["gf"] - $CInfo["gc"]; ?></td>

                    <td class="tpts bgtpts"><?php echo $CInfo["gf"] * 3; ?></td>                    
                </tr>
                <?php $count++; } }?>
                </tbody>
            </table>
            <dl class="description">
                <dt>JJ</dt>
                <dd>Juegos Jugados</dd>
                <dt>JG</dt>
                <dd>Juegos Ganados</dd>
                <dt>JP</dt>
                <dd>Juegos Perdidos</dd>
                <dt>JE</dt>
                <dd>Juegos Empatados</dd>
                <dt>GF</dt>
                <dd>Goles a Favor</dd>
                <dt>GC</dt>
                <dd>Goles en Contra</dd>
                <dt>Dif</dt>
                <dd>Diferencia de Goles</dd>
                <dt>Pts</dt>
                <dd>Puntos</dd>
            </dl>

        </div>

    <div id="sponsors">
      <ul class="sponsors"></ul>
    </div>
  </div><!-- #main -->
