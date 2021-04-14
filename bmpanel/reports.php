<?php

	$Current  =	 'Reportes';
	require '../init.php';
	include 'apis/xl_blok.php';
	include 'apis/xl_head.php';
	include 'apis/xl_user.php';

	if($_GET["t"])
    	$temp = $_GET["t"];
	if($_GET["j"])
    	$jorn = $_GET["j"];
    if($_GET["m"])
    	$idmatch = $_GET["m"];
    if($_GET["type"])
    	$type = $_GET["type"];
    if($_GET["eq"])
    	$equip = $_GET["eq"];


?>
		<h4 class="alert_info">Desde este apartado podr&aacute; dar seguimiento a los Juegos Activos y Generar Reportes Estad&iacute;sticos.</h4>
		<article class="module width_full">
			<header><h3>Selecicone el Temporada y Jornada:</h3></header>
			<div class="module_content">
				<form method="POST">
					<fieldset>
						<b>Seleccione la Temporada:</b>
						<select style="width: 20%;border-radius: 5px;" name="idtemp">
							<option value="no">Seleccionar temporada:</option>
							<?php 
			         			$usRN = MYSQL_::Bits("SELECT * FROM temporadas ORDER BY id DESC");
			         			while($usR = mysqli_fetch_assoc($usRN))
			         			{
			         		?>
								<option value="<?php echo $usR['name'] ?>"><?php echo $usR['name'] ?></option>
							<?php
			         			}
			         		?>
						</select>
						<b>N&uacute;mero de Jornada:</b>
						<select style="width: 5%;border-radius: 5px;" name="numj" onchange="contar(this)">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
						</select>
						<input type="submit" name="search_match_r" value="Buscar">					
					</fieldset>
				</form>
			</div>
		</article>

		<?php if($temp != null AND $jorn != null AND $idmatch != null){ 
			$xlSQ3 	=	MYSQL_::Bits("SELECT * FROM juegos WHERE id = '$idmatch'");
			$xlS2 	=	mysqli_num_rows($xlSQ3);
			if($xlS2 > 0){
				// Info del Juego
				$CInfos = mysqli_fetch_assoc($xlSQ3);
				// Info de los Equipos
				$InfEq1  =	MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$CInfos[equip1]'");
				$Eq1Info = mysqli_fetch_assoc($InfEq1);
				$InfEq2	 =	MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$CInfos[equip2]'");
				$Eq2Info = mysqli_fetch_assoc($InfEq2);
		?>
		<article class="module width_full">
			<header><h3>Selecicone el tipo de Reporte:<b style="color:blue;"> <?php echo $Eq1Info["name"] .' VS '. $Eq2Info["name"]; ?> </b></h3></header>
			<div class="module_content">
				<div style="padding:5px;min-height: 100px;">
					<form action="" method="POST">
		                <input style="margin-left:150px;width:16%;height:100px;margin-bottom: 5px;float:left;margin-right: 20px;" class="button" name="match_goals" type="submit" value="Goles" />
		                <input type="text" name="tempo" value="<?php echo $temp; ?>" style="display: none;">
		                <input type="text" name="jorna" value="<?php echo $jorn; ?>" style="display: none;">
		                <input type="text" name="matchid" value="<?php echo $idmatch; ?>" style="display: none;">
		                <input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
		            </form>
		            <form action="" method="POST">
		                <input style="width:16%;height:100px;margin-bottom: 5px;float:left;margin-right: 20px;" class="button" name="match_faltas" type="submit" value="Faltas" />
		                <input type="text" name="tempo" value="<?php echo $temp; ?>" style="display: none;">
		                <input type="text" name="jorna" value="<?php echo $jorn; ?>" style="display: none;">
		                <input type="text" name="matchid" value="<?php echo $idmatch; ?>" style="display: none;">
		                <input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
		            </form>
		            <form action="" method="POST">
		                <input style="width:16%;height:100px;margin-bottom: 5px;float:left;margin-right: 20px;" class="button" name="match_comments" type="submit" value="Comentarios" />
		                <input type="text" name="tempo" value="<?php echo $temp; ?>" style="display: none;">
		                <input type="text" name="jorna" value="<?php echo $jorn; ?>" style="display: none;">
		                <input type="text" name="matchid" value="<?php echo $idmatch; ?>" style="display: none;">
		                <input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
		            </form>
		            <form action="" method="POST">
		                <input style="width:16%;height:100px;margin-bottom: 5px;float:left;margin-right: 20px;" class="button" name="match_end" type="submit" value="Finalizar Juego" />
		                <input type="text" name="tempo" value="<?php echo $temp; ?>" style="display: none;">
		                <input type="text" name="jorna" value="<?php echo $jorn; ?>" style="display: none;">
		                <input type="text" name="matchid" value="<?php echo $idmatch; ?>" style="display: none;">
		                <input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
		            </form>
		            <?php if($temp != null AND $jorn != null AND $idmatch != null AND $type != null){ ?>
		            	<div style="margin-top: 120px;margin-bottom: 40px;">
			            	<?php if($type == "goals"){ ?>
			            		<b style="float:left;margin-left: 20px;">Gol para: </b><br>
			            		<form action="" method="POST">
			            			<input style="width:16%;height:100px;margin-bottom: 5px;float:left;margin-right: 20px;" class="button"  type="submit" name="match_goals_eq" value="<?php echo $Eq1Info["name"]; ?>" />
			            			<input type="text" name="equipo" value="<?php echo $Eq1Info["id"]; ?>" style="display: none;">
			            			<input type="text" name="tempo" value="<?php echo $temp; ?>" style="display: none;">
		                			<input type="text" name="jorna" value="<?php echo $jorn; ?>" style="display: none;">
		                			<input type="text" name="matchid" value="<?php echo $idmatch; ?>" style="display: none;">
			            			<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
			            		</form>
			            		<form action="" method="POST">
			            			<input style="width:16%;height:100px;margin-bottom: 5px;float:left;margin-right: 20px;" class="button" type="submit" name="match_goals_eq" value="<?php echo $Eq2Info["name"]; ?>" />
			            			<input type="text" name="equipo" value="<?php echo $Eq2Info["id"]; ?>" style="display: none;">
			            			<input type="text" name="tempo" value="<?php echo $temp; ?>" style="display: none;">
					                <input type="text" name="jorna" value="<?php echo $jorn; ?>" style="display: none;">
					                <input type="text" name="matchid" value="<?php echo $idmatch; ?>" style="display: none;">
			            			<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
			            		</form>
			            		<?php if($temp != null AND $jorn != null AND $idmatch != null AND $type != null AND $equip != null){ ?>
			            			<b style="float:left;margin-left: 20px;margin-top: -15px;">Minuto & Jugador: </b><br>
			            			<form action="" method="POST">
			            				<input type="time" name="minut" value="<?php echo date ("h:i:s"); ?>" step="1" style="border-radius: 5px;height: 22px;width:61%;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;"/>
				            			<select style="width: 50%;border-radius: 5px;" name="jugid">
											<option value="no">Seleccionar Jugador:</option>
											<?php 
							         			$usRNq = MYSQL_::Bits("SELECT * FROM jugadores WHERE equip_id = '$equip' ORDER BY id ASC");
							         			while($usRq = mysqli_fetch_assoc($usRNq))
							         			{
							         		?>
												<option value="<?php echo $usRq['id'] ?>"><?php echo $usRq['nombre'] ?></option>
											<?php
							         			}
							         		?>
										</select>

			            				<input type="text" name="equipo" value="<?php echo $equip; ?>" style="display: none;">
										<input type="text" name="tempo" value="<?php echo $temp; ?>" style="display: none;">
										<input type="text" name="jorna" value="<?php echo $jorn; ?>" style="display: none;">
										<input type="text" name="matchid" value="<?php echo $idmatch; ?>" style="display: none;">
				            			<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
				            			<input type="submit" name="report_goal" style="margin-top: 15px;" value="Reportar Gol">
				            		</form>
			            		<?php }else{echo"<br><br><br><br><br>";} ?>

			            	<?php } ?>
			            	<?php if($type == "faltas"){ ?>
			            		<b style="float:left;margin-left: 20px;">Falta para: </b><br>
			            		<form action="" method="POST">
			            			<input style="width:16%;height:100px;margin-bottom: 5px;float:left;margin-right: 20px;" class="button"  type="submit" name="match_faltas_eq" value="<?php echo $Eq1Info["name"]; ?>" />
			            			<input type="text" name="equipo" value="<?php echo $Eq1Info["id"]; ?>" style="display: none;">
			            			<input type="text" name="tempo" value="<?php echo $temp; ?>" style="display: none;">
		                			<input type="text" name="jorna" value="<?php echo $jorn; ?>" style="display: none;">
		                			<input type="text" name="matchid" value="<?php echo $idmatch; ?>" style="display: none;">
			            			<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
			            		</form>
			            		<form action="" method="POST">
			            			<input style="width:16%;height:100px;margin-bottom: 5px;float:left;margin-right: 20px;" class="button" type="submit" name="match_faltas_eq" value="<?php echo $Eq2Info["name"]; ?>" />
			            			<input type="text" name="equipo" value="<?php echo $Eq2Info["id"]; ?>" style="display: none;">
			            			<input type="text" name="tempo" value="<?php echo $temp; ?>" style="display: none;">
					                <input type="text" name="jorna" value="<?php echo $jorn; ?>" style="display: none;">
					                <input type="text" name="matchid" value="<?php echo $idmatch; ?>" style="display: none;">
			            			<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
			            		</form>
			            		<?php if($temp != null AND $jorn != null AND $idmatch != null AND $type != null AND $equip != null){ ?>
			            			<b style="float:left;margin-left: 20px;margin-top: -15px;">Minuto | Tarjeta | Jugador: </b><br>
			            			<form action="" method="POST">
			            				<input type="time" name="minut" value="<?php echo date ("h:i:s"); ?>" step="1" style="border-radius: 5px;height: 22px;width:61%;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;"/>
			            				<br><br>
			            				<select style="width: 62%;border-radius: 5px;" name="tarj">
											<option value="n">Ninguna</option>
											<option value="a">Amarilla</option>
											<option value="r">Roja</option>
										</select>

				            			<select style="width: 50%;border-radius: 5px;" name="jugid">
											<option value="no">Seleccionar Jugador:</option>
											<?php 
							         			$usRNq = MYSQL_::Bits("SELECT * FROM jugadores WHERE equip_id = '$equip' ORDER BY id ASC");
							         			while($usRq = mysqli_fetch_assoc($usRNq))
							         			{
							         		?>
												<option value="<?php echo $usRq['id'] ?>"><?php echo $usRq['nombre'] ?></option>
											<?php
							         			}
							         		?>
										</select>

			            				<input type="text" name="equipo" value="<?php echo $equip; ?>" style="display: none;">
										<input type="text" name="tempo" value="<?php echo $temp; ?>" style="display: none;">
										<input type="text" name="jorna" value="<?php echo $jorn; ?>" style="display: none;">
										<input type="text" name="matchid" value="<?php echo $idmatch; ?>" style="display: none;">
				            			<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
				            			<input type="submit" name="report_falta" style="margin-top: 15px;" value="Reportar Falta">
				            		</form>
			            		<?php }else{echo"<br><br><br><br><br>";} ?>

			            	<?php } ?>

			            	<?php if($type == "comments"){ ?>
			            		<b style="float:left;margin-left: 20px;">Escriba comentarios acerca del Juego: </b><br>
			            		<form action="" method="POST">
			            			<textarea name="comment" style="min-width: 100%;max-width: 100%;min-height: 80px;max-height: 80px;"></textarea>
			            			<br><br>
			            			<input class="button" style="margin-bottom: -30px;" type="submit" name="report_comment" value="Guardar Comentario" />
			            			<input type="text" name="equipo" value="<?php echo $Eq1Info["id"]; ?>" style="display: none;">
			            			<input type="text" name="tempo" value="<?php echo $temp; ?>" style="display: none;">
		                			<input type="text" name="jorna" value="<?php echo $jorn; ?>" style="display: none;">
		                			<input type="text" name="matchid" value="<?php echo $idmatch; ?>" style="display: none;">
			            			<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
			            		</form>
			            	<?php } ?>
			            </div>
		            <?php } ?> 
              </div>
			</div>
		</article>
		<?php }else{ echo '<br><center><b style="color:red">No se encontr&oacute; informaci&oacute;n de ese Juego.</b></center>'; } } ?>
		
		<article class="module width_full">
		<?php 
			if($temp != null && $temp != "" && $jorn != null && $jorn != ""){
				$xlSQ2 	=	MYSQL_::Bits("SELECT * FROM jornadas WHERE id = '$temp'");
				$count = mysqli_num_rows($xlSQ2);
				if($count > 0){
					$CInfo1 = mysqli_fetch_assoc($xlSQ2);
					$xlSQ3 	=	MYSQL_::Bits("SELECT * FROM juegos WHERE fkjornid = '$CInfo1[id]' AND jornid = '$CInfo1[num]'");
					$xlS2 	=	mysqli_num_rows($xlSQ3);
					if($xlS2 > 0){
		?>		
			<header><h3>Juegos de la <?php echo $CInfo1["temporada"] ?> Jornada <?php echo $CInfo1["num"] ?></h3></header>
			<div class="module_content">
					<fieldset>
						<label>Editar Juegos</label>
						<!-- JUEGO -->

						<?php 
							$count = 1;
							while($CInfo = mysqli_fetch_assoc($xlSQ3)){ ?>
								<form method="POST">
								<div style="float:left;font-size: 14px;margin-left: 20px;"><b>No. Juego</b><br><?php echo $count; ?></div>
								<div style="float:left;font-size: 14px;margin-left: 0px;width: 13%;"><b>Equipo Local</b>
									<input type="text" value="<?php echo $CInfo['equip1'] ?>" disabled>
								</div>
								<div style="float:left;font-size: 14px;margin-left: 20px;width: 7%;"><b>Goles EL</b>
									<input type="text" value="<?php echo $CInfo['goals1'] ?>" disabled>
								</div>
								<div style="float:left;font-size: 14px;margin-left: 20px;width: 13%;"><b>Equipo Visitante</b>
									<input type="text" value="<?php echo $CInfo['equip2'] ?>" disabled>
								</div>
								<div style="float:left;font-size: 14px;margin-left: 20px;width: 7%;"><b>Goles EV</b>
									<input type="text" value="<?php echo $CInfo['goals2'] ?>" disabled>
								</div>
								<div style="float:left;font-size: 14px;margin-left: 20px;width: 10%;"><b>Fecha</b>
									<input type="text" name="datepicker<?php echo $count; ?>" id="datepicker<?php echo $count; ?>" readonly="readonly" size="12" value="<?php echo $CInfo['fech']; ?>" disabled/>
								</div>
								<div style="float:left;font-size: 14px;margin-left: 30px;"><b>Hora</b><br>
									<input type="time" name="hora<?php echo $count; ?>" value="<?php echo $CInfo['hour']; ?>" step="1" style="border-radius: 5px;height: 22px;width: 90%;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;" disabled />
								</div>
								<div style="float:left;font-size: 14px;margin-left: 10px;">
									<b>Jugado</b>
									<br><?php if($CInfo['played'] == '1'){ echo 'S&iacute;'; }else{ echo 'No'; } ?></div>
								<!--
								<div style="float:left;font-size: 14px;margin-left: 20px;width: 13%;"><b>Arbitro</b></div>
								<input type="text" name="arb<?php echo $count; ?>" value="<?php echo $CInfo['arb']; ?>" style="width: 13%;" disabled/>
								-->
								<input type="text" name="idgame<?php echo $count; ?>" value="<?php echo $CInfo['id']; ?>" style="display: none;">
								<input type="text" name="totalcount" value="<?php echo $count; ?>" style="display: none;">
								<input type="text" name="temp" value="<?php echo $temp; ?>" style="display: none;">
								<input type="text" name="jorn" value="<?php echo $jorn; ?>" style="display: none;">
								<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
								<input type="submit" name="goto_match" style="margin-top: 15px;" value="Reporte">
								</form>
								<br><br><br><br>
						<?php 
								$count++;
							} 
						?>
						<!-- END JUEGO -->
					</fieldset>
			</div>
		<?php } } } ?>
		</article>


		<div class="clear"></div>
			
		<div class="spacer"></div>
	</section>
</body>

</html>