<?php

	$Current  =	 'Registrar nuevo Jugador';
	require '../init.php';
	include 'apis/xl_blok.php';
	include 'apis/xl_head.php';
	include 'apis/xl_user.php';

	if($_GET["id"])
    $jugid = $_GET["id"];


?>
		<h4 class="alert_info">Desde este apartado podr&aacute; registrar nuevos Jugadores al Sistema.</h4>
		<article class="module width_full">
			<?php if($jugid == null || $jugid == ""){ ?>
			<header><h3>Registrar Jugador</h3></header>
			<div class="module_content">
				<form method="POST">
						<fieldset>
							<label>Nombre *</label>
							<input type="text" name="name" value="" placeholder="Ingrese el nombre del Jugador" autocomplete="off">
							<label>Apellido Paterno *</label>
							<input type="text" name="ap1" value="" placeholder="Ingrese el Apellido Paterno del Jugador" autocomplete="off">
							<label>Apellido Materno *</label>
							<input type="text" name="ap2" value="" placeholder="Ingrese el Apellido Materno del Jugador" autocomplete="off">
							<label>Equipo *</label>
							<select style="width: 97%;height:25px;border-radius: 5px;" name="equip">
								<option value="no">Seleccionar equipo:</option>
								<?php 
				         			$usRN = MYSQL_::Bits("SELECT * FROM equipos ORDER BY id ASC");
				         			while($usR = mysqli_fetch_assoc($usRN))
				         			{
				         		?>
									<option value="<?php echo $usR['id'] ?>"><?php echo $usR['name'] ?></option>
								<?php
				         			}
				         		?>
							</select>
							<label>N&uacute;mero *</label>
							<input type="text" name="num" value="" placeholder="Ingrese el número del Jugador" autocomplete="off">
							<label>Posici&oacute;n *</label>
							<input type="text" name="pos" value="" placeholder="Ingrese la posici&oacute;n del Jugador" autocomplete="off">
							<label>Edad *</label>
							<input type="text" name="edad" value="" placeholder="Ingrese la edad del Jugador" autocomplete="off">
							<label>Peso *</label>
							<input type="text" name="peso" value="" placeholder="Ingrese el peso del Jugador" autocomplete="off">
							<label>Estatura *</label>
							<input type="text" name="estatura" value="" placeholder="Ingrese la estatura del Jugador" autocomplete="off">
							<label>Capitan *</label>
							<select style="width: 97%;height:25px;border-radius: 5px;" name="cap"><option value="NO">No</option><option value="SI">S&iacute;</option></select>
							<label>Foto</label>
							<input type="text" name="foto" value="http://futsoft.itp/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg" placeholder="Ingrese la url de la foto del jugador" autocomplete="off">
						</fieldset>

						
						<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
						<input type="submit" name="add_player" value="Registrar Jugador">
				</form>
			</div>
			<?php }else{ 
				$xlSQ2 	=	MYSQL_::Bits("SELECT * FROM jugadores WHERE id = '$jugid'");
				$xlS2 	=	mysqli_num_rows($xlSQ2);
				if($xlS2 > 0){
					$CInfo = mysqli_fetch_assoc($xlSQ2)
			?>

			<header><h3>Editar Jugador: <?php echo $CInfo["nombre"]; ?></h3></header>
			<div class="module_content">
				<form method="POST">
						<fieldset>
							<label>Nombre *</label>
							<input type="text" name="name" value="<?php echo $CInfo["nombre"]; ?>" placeholder="Ingrese el nombre del Jugador" autocomplete="off">
							<label>Apellido Paterno *</label>
							<input type="text" name="ap1" value="<?php echo $CInfo["ap_pa"]; ?>" placeholder="Ingrese el Apellido Paterno del Jugador" autocomplete="off">
							<label>Apellido Materno *</label>
							<input type="text" name="ap2" value="<?php echo $CInfo["ap_ma"]; ?>" placeholder="Ingrese el Apellido Materno del Jugador" autocomplete="off">
							<label>Equipo *</label>
							<select style="width: 97%;height:25px;border-radius: 5px;" name="equip">
								<option value="<?php echo $CInfo['equip_id'] ?>"><?php echo $CInfo['equip_id'] ?></option>
								<?php 
				         			$usRN = MYSQL_::Bits("SELECT * FROM equipos ORDER BY id ASC");
				         			while($usR = mysqli_fetch_assoc($usRN))
				         			{
				         		?>
									<option value="<?php echo $usR['id'] ?>"><?php echo $usR['name'] ?></option>
								<?php
				         			}
				         		?>
							</select>
							<label>N&uacute;mero *</label>
							<input type="text" name="num" value="<?php echo $CInfo['num'] ?>" placeholder="Ingrese el número del Jugador" autocomplete="off">
							<label>Posici&oacute;n *</label>
							<input type="text" name="pos" value="<?php echo $CInfo['pos'] ?>" placeholder="Ingrese la posici&oacute;n del Jugador" autocomplete="off">
							<label>Edad *</label>
							<input type="text" name="edad" value="<?php echo $CInfo['edad'] ?>" placeholder="Ingrese la edad del Jugador" autocomplete="off">
							<label>Peso *</label>
							<input type="text" name="peso" value="<?php echo $CInfo['peso'] ?>" placeholder="Ingrese el peso del Jugador" autocomplete="off">
							<label>Estatura *</label>
							<input type="text" name="estatura" value="<?php echo $CInfo['estatura'] ?>" placeholder="Ingrese la estatura del Jugador" autocomplete="off">
							<label>Capitan *</label>
							<select style="width: 97%;height:25px;border-radius: 5px;" name="cap">
								<?php 
								if($CInfo['capitan'] == 0){ echo '<option value="NO">No</option>'; }else{ echo '<option value="SI">S&iacute;</option>'; }
								?>
								<option value="NO">No</option>
								<option value="SI">S&iacute;</option>
							</select>
							<label>Foto</label>
							<input type="text" name="foto" value="<?php echo $CInfo['photo'] ?>" placeholder="Ingrese la url de la foto del jugador" autocomplete="off">
						</fieldset>
						<input type="text" name="lastequip" value="<?php echo $CInfo['equip_id'] ?>" style="display: none;">
						<input type="text" name="lastid" value="<?php echo $CInfo['id'] ?>" style="display: none;">
						<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
						<input type="submit" name="save_player" value="Guardar">
				</form>
			</div>
			<?php }else{ echo '<script language="javascript">window.location="jugadores.php"</script>'; } } ?>
		</article>
		
		<div class="clear"></div>
			
		<div class="spacer"></div>
	</section>
</body>

</html>