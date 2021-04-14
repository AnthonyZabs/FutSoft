  <link rel='stylesheet' id='gti-style-css'  href='<?php echo BN("www") ?>/resources/wp-content/plugins/AZGlossaryIndex/styles/green.css?ver=4.9.3' type='text/css' media='all' /> 
  <div id="main" class="clearfix">
    <div id="container">
      <div class="featured-image"></div>      
        <div id="post-355" class="post-355 page type-page status-publish hentry">
          <h1 class="entry-title">Jugadores</h1>
          <div id="content" role="main">
            <div class="entry-content">
                <h2></h2>
                <div id="gticontainer">
                  <div class="gti_clear"></div>
                  <div id="gti_letterindex">
                    <ul>
                      <li><a href="#gti_A">A</a></li>
                      <li><a href="#gti_B">B</a></li>
                      <li><a href="#gti_C">C</a></li>
                      <li><a href="#gti_D">D</a></li>
                      <li><a href="#gti_E">E</a></li>
                      <li><a href="#gti_F">F</a></li>
                      <li><a href="#gti_G">G</a></li>
                      <li><a href="#gti_H">H</a></li>
                      <li><a href="#gti_I">I</a></li>
                      <li><a href="#gti_J">J</a></li>
                      <li><a href="#gti_K">K</a></li>
                      <li><a href="#gti_L">L</a></li>
                      <li><a href="#gti_M">M</a></li>
                      <li><a href="#gti_N">N</a></li>
                      <li><a href="#gti_Ñ">Ñ</a></li>
                      <li><a href="#gti_Ó">O</a></li>
                      <li><a href="#gti_P">P</a></li>
                      <li><a href="#gti_Q">Q</a></li>
                      <li><a href="#gti_R">R</a></li>
                      <li><a href="#gti_S">S</a></li>
                      <li><a href="#gti_S">T</a></li>
                      <li><a href="#gti_U">U</a></li>
                      <li><a href="#gti_V">V</a></li>
                      <li><a href="#gti_V">W</a></li>
                      <li><a href="#gti_X">X</a></li>
                      <li><a href="#gti_Y">Y</a></li>
                      <li><a href="#gti_Z">Z</a></li>
                    </ul><div class="gti_clear"></div>
                  </div>
                  <div class="tagindex">
                    <div id="gti_div_A">
                      <div class="blockletter" id="gti_A">A</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'A%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_B">
                      <div class="blockletter" id="gti_B">B</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'B%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_C">
                      <div class="blockletter" id="gti_C">C</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'C%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_D">
                      <div class="blockletter" id="gti_D">D</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'D%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_E">
                      <div class="blockletter" id="gti_E">E</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'E%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_F">
                      <div class="blockletter" id="gti_F">F</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'F%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_G">
                      <div class="blockletter" id="gti_G">G</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'G%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_H">
                      <div class="blockletter" id="gti_H">H</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'H%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_I">
                      <div class="blockletter" id="gti_I">I</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'I%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_J">
                      <div class="blockletter" id="gti_J">J</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'J%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_K">
                      <div class="blockletter" id="gti_K">K</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'K%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_L">
                      <div class="blockletter" id="gti_L">L</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'L%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_M">
                      <div class="blockletter" id="gti_M">M</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'M%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_N">
                      <div class="blockletter" id="gti_N">N</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'N%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_Ñ">
                      <div class="blockletter" id="gti_Ñ">Ñ</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'Ñ%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_O">
                      <div class="blockletter" id="gti_O">O</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'O%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_P">
                      <div class="blockletter" id="gti_P">P</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'P%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_Q">
                      <div class="blockletter" id="gti_Q">Q</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'Q%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_R">
                      <div class="blockletter" id="gti_R">R</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'R%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_S">
                      <div class="blockletter" id="gti_S">S</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'S%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_T">
                      <div class="blockletter" id="gti_T">T</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'T%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_U">
                      <div class="blockletter" id="gti_U">U</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'U%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_V">
                      <div class="blockletter" id="gti_V">V</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'V%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_W">
                      <div class="blockletter" id="gti_W">W</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'W%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_X">
                      <div class="blockletter" id="gti_X">X</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'X%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_Y">
                      <div class="blockletter" id="gti_Y">Y</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'Y%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>
                    <div id="gti_div_Z">
                      <div class="blockletter" id="gti_Z">Z</div>
                      <ul>
                        <?php
                          $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE 'Z%' ");
                          $xlS  = mysqli_num_rows($Q);
                          if($xlS > 0){
                            while($CInfo = mysqli_fetch_assoc($Q)){
                        ?>
                          <li style="width:100%;"><a href="/profile?jug=<?php echo $CInfo["id"]; ?>"><?php echo $CInfo["nombre"]; ?></a></li>
                        <?php } } ?>
                      </ul>
                      <div class="gti_clear"></div>
                    </div>

                  </div>
                </div>
            </div><!-- .entry-content -->
          </div><!-- #post-## -->
      </div>
    </div>

    <?php include 'kernel/includes/pages/index/sidebar.tpl'; ?> 


    <div id="sponsors">
      <ul class="sponsors"></ul>
    </div>
  </div><!-- #main -->
