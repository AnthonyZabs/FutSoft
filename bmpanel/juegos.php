<?php

	$Current  =	 'Juegos';
	require '../init.php';
	include 'apis/xl_blok.php';
	include 'apis/xl_head.php';
	include 'apis/xl_user.php';

	if($_GET["t"])
    	$temp = $_GET["t"];
	if($_GET["j"])
    	$jorn = $_GET["j"];


?>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
<script>
jQuery(function($){
	$.datepicker.regional['es'] = {
		closeText: 'Cerrar',
		prevText: '&#x3c;Ant',
		nextText: 'Sig&#x3e;',
		currentText: 'Hoy',
		monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
		'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
		monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
		'Jul','Ago','Sep','Oct','Nov','Dic'],
		dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
		dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
		dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
		weekHeader: 'Sm',
		dateFormat: 'dd/mm/yy',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['es']);
});    
	$(function () {
		$("#datepicker1").datepicker();
		$("#datepicker2").datepicker();
		$("#datepicker3").datepicker();
		$("#datepicker4").datepicker();
		$("#datepicker5").datepicker();
		$("#datepicker6").datepicker();
		$("#datepicker7").datepicker();
		$("#datepicker8").datepicker();
	});
	function contar(obj) {
	  num=0;
	  for(i=0; opt=obj.options[i]; i++)
	    if(opt.selected) num++;

		$('#SelCount').html(num+"/16");
	  return num;
	}
</script>
		<h4 class="alert_info">Desde este apartado podr&aacute; consultar los Juegos Generados en las Jornadas.</h4>
		<article class="module width_full">
			<header><h3>Juegos</h3></header>
			<div class="module_content">
				<form method="POST">
						<fieldset>
							<b>Temporada</b>
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
							<b>Jornada</b>
							<select style="width: 5%;border-radius: 5px;" name="numj">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
							</select>
							<input type="submit" name="search_match" value="Buscar">
						</fieldset>

						
						<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
				</form>
			</div>
		</article>
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
				<form method="POST">
					<fieldset>
						<label>Editar Juegos</label>
						<!-- JUEGO -->

						<?php 
							$count = 1;
							while($CInfo = mysqli_fetch_assoc($xlSQ3)){ ?>
								<div style="float:left;font-size: 14px;margin-left: 20px;"><b>No. Juego</b><br><?php echo $count; ?></div>
								<div style="float:left;font-size: 14px;margin-left: 20px;width: 15%;"><b>Equipo Local</b>
									<input type="text" value="<?php echo $CInfo['equip1'] ?>" disabled>
								</div>
								<div style="float:left;font-size: 14px;margin-left: 20px;width: 15%;"><b>Equipo Visitante</b>
									<input type="text" value="<?php echo $CInfo['equip2'] ?>" disabled>
								</div>
								<div style="float:left;font-size: 14px;margin-left: 20px;"><b>Fecha</b>
									<input type="text" name="datepicker<?php echo $count; ?>" id="datepicker<?php echo $count; ?>" readonly="readonly" size="12" value="<?php echo $CInfo['fech']; ?>" />
								</div>
								<div style="float:left;font-size: 14px;margin-left: 40px;"><b>Hora</b><br>
									<input type="time" name="hora<?php echo $count; ?>" value="<?php echo $CInfo['hour']; ?>" step="1" style="border-radius: 5px;height: 22px;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;"/>
								</div>
								<div style="float:left;font-size: 14px;margin-left: 20px;width: 13%;"><b>Arbitro</b></div>
								<input type="text" name="arb<?php echo $count; ?>" value="<?php echo $CInfo['arb']; ?>" style="width: 13%;" />
								<input type="text" name="idgame<?php echo $count; ?>" value="<?php echo $CInfo['id']; ?>" style="display: none;">
								<br><br><br><br>
						<?php 
								$count++;
							} 
						?>
						<!-- END JUEGO -->
					</fieldset>
					<input type="text" name="totalcount" value="<?php echo $count; ?>" style="display: none;">
					<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
					<input type="submit" name="save_plays" value="Guardar">
				</form>
			</div>
		<?php } } } ?>
		</article>

		<div class="clear"></div>
			
		<div class="spacer"></div>
	</section>
</body>

</html>