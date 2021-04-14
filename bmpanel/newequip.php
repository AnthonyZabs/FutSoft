<?php

	$Current  =	 'Registrar nuevo Equipo';
	require '../init.php';
	include 'apis/xl_blok.php';
	include 'apis/xl_head.php';
	include 'apis/xl_user.php';

	if($_GET["eq"])
    $eq = $_GET["eq"];


?>
		<h4 class="alert_info">Desde este apartado podr&aacute; registrar nuevos Equipos para agregarlos en la Jornadas.</h4>
		<?php if($eq == null || $eq == ""){
		?>
		<article class="module width_full">
			<header><h3>Registrar Equipo</h3></header>
			<div class="module_content">
				<form method="POST">
					<fieldset>
						<label>ID Equipo *</label>
						<input type="text" name="id" value="" placeholder="Ingrese el Identificador del Equipo" autocomplete="off" onKeyUp="this.value=this.value.toUpperCase();">
						<label>Nombre Equipo *</label>
						<input type="text" name="name" value="" placeholder="Ingrese el nombre del Equipo" autocomplete="off">
						<label>URL de Escudo *</label>
						 (Tamaño Recomendado 470px x 470px)<br>
						<img src="/resources/wp-content/themes/futsoft/images/esc_dftl.png" height="50" width="50"/>
						<input type="text" name="escudo" value="/resources/wp-content/themes/futsoft/images/esc_dftl.png" placeholder="Ingrese la url del Escudo del Equipo" autocomplete="off" style="width:80%;float:right;margin-top: 15px;margin-right:15px;">
						
						<label>Color Uniforme 1 *</label>
						<input name="color1" type="color" style="float:left;margin-left: 10px;"><br><br>
						<label>Color Uniforme 2 *</label>
						<input name="color2" type="color" style="float:left;margin-left: 10px;"><br><br>

						<label>Representante *</label>
						<input type="text" name="rep" value="" placeholder="Ingrese el nombre completo del Representante del Equipo" autocomplete="off">
						<label>Domicilio *</label>
						<input type="text" name="dom" value="" placeholder="Ingrese el domicilio del Representante" autocomplete="off">
						<label>Teléfono</label>
						<input type="text" name="tel" value="" placeholder="Ingrese Teléfono del Representante" autocomplete="off">
						<label>Email</label>
						<input type="email" name="email" value="" placeholder="Ingrese el Correo Electrónico del Representante" autocomplete="off">
					</fieldset>

					
					<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
					<input type="submit" name="add_equip" value="Registrar Equipo">
				</form>
			</div>
		</article>
		<?php }else{ 
			$xlSQ2 	=	MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$eq'");
			$xlS2 	=	mysqli_num_rows($xlSQ2);
			if($xlS2 > 0){
				$CInfo = mysqli_fetch_assoc($xlSQ2)
		?>
		<article class="module width_full">
			<header><h3>Editar Equipo <?php echo $CInfo["name"]; ?></h3></header>
			<div class="module_content">
				<form method="POST">
						<fieldset>
							<label>ID Equipo *</label>
							<input type="text" name="id" value="<?php echo $CInfo["id"]; ?>" placeholder="Ingrese el Identificador del Equipo" autocomplete="off" onKeyUp="this.value=this.value.toUpperCase();">
							<label>Nombre Equipo *</label>
							<input type="text" name="name" value="<?php echo $CInfo["name"]; ?>" placeholder="Ingrese el nombre del Equipo" autocomplete="off">
							<label>URL de Escudo *</label>
							 (Tamaño Recomendado 470px x 470px)<br>
							<img src="<?php echo $CInfo["escudo"]; ?>" height="50" width="50"/>
							<input type="text" name="escudo" value="<?php echo $CInfo["escudo"]; ?>" placeholder="Ingrese la url del Escudo del Equipo" autocomplete="off" style="width:80%;float:right;margin-top: 15px;margin-right:15px;">

							<label>Color Uniforme 1 *</label>
							<input name="color1" value="<?php echo $CInfo["uni_color1"]; ?>" type="color" style="float:left;margin-left: 10px;"><br><br>
							<label>Color Uniforme 2 *</label>
							<input name="color2" value="<?php echo $CInfo["uni_color2"]; ?>" type="color" style="float:left;margin-left: 10px;"><br><br>

							<label>Representante *</label>
							<input type="text" name="rep" value="<?php echo $CInfo["representante"]; ?>" placeholder="Ingrese el nombre completo del Representante del Equipo" autocomplete="off">
							<label>Domicilio *</label>
							<input type="text" name="dom" value="<?php echo $CInfo["domic"]; ?>" placeholder="Ingrese el domicilio del Representante" autocomplete="off">
							<label>Teléfono</label>
							<input type="text" name="tel" value="<?php echo $CInfo["tel"]; ?>" placeholder="Ingrese Teléfono del Representante" autocomplete="off">
							<label>Email</label>
							<input type="email" name="email" value="<?php echo $CInfo["email"]; ?>" placeholder="Ingrese el Correo Electrónico del Representante" autocomplete="off">
						</fieldset>

						<input type="text" name="lastid" value="<?php echo $CInfo["id"]; ?>" style="display: none;">
						<input type="text" name="lastname" value="<?php echo $CInfo["name"]; ?>" style="display: none;">
						<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
						<input type="submit" name="edit_equip" value="Editar Equipo">
				</form>
			</div>
		</article>
		<?php }else{ echo '<script language="javascript">window.location="newequip.php"</script>'; } } ?>

		<article class="module width_full">
			<header><h3>Equipos registrados en <?php echo BN('title') ?> </h3></header>
			<div class="module_content">
             
           <?php echo AllTeams(); ?>

			</div>
		</article>
		
		<div class="clear"></div>
			
		<div class="spacer"></div>
	</section>
</body>

</html>