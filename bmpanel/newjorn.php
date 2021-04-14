<?php

	$Current  =	 'Crear nueva Jornada';
	require '../init.php';
	include 'apis/xl_blok.php';
	include 'apis/xl_head.php';
	include 'apis/xl_user.php';

	$xlSQ1	=	MYSQL_::Bits("SELECT * FROM equipos");
	$TotalTeams	=	mysqli_num_rows($xlSQ1);

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
		<h4 class="alert_info">Desde este apartado podr&aacute; crear una nueva jornada para agregar juegos en ella.</h4>
		
		<article class="module width_full">
			<header><h3>Crear Jornada</h3></header>
			<div class="module_content">
				<form method="POST">
					<fieldset>
						<label>Configuración</label>
						<b>N&uacute;mero de Jornada:</b>
						<select style="width: 5%;border-radius: 5px;" name="numj">
							<option value="1">1</option>
						</select>
						<b>Seleccione la Temporada:</b>
						<select style="width: 20%;border-radius: 5px;" name="class">
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
					</fieldset>

					<fieldset>
						<label>Seleccionar 16 Equipos</label>
						Equipos Seleccionados: <div id="SelCount">0/16</div>
						<select name="team[]" multiple size="<?php echo $TotalTeams; ?>" style="height: 200px;" onchange="contar(this)">
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
						<label>Agregar Juegos</label>
						<!-- JUEGO -->
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b>No. Juego</b><br>1</div>
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b>Fecha</b>
							<input type="text" name="datepicker1" id="datepicker1" readonly="readonly" size="12" />
						</div>
						<div style="float:left;font-size: 14px;margin-left: 40px;"><b>Hora</b><br>
							<input type="time" name="hora1" value="<?php echo date ("h:i:s"); ?>" step="1" style="border-radius: 5px;height: 22px;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;"/>
						</div>
						<!-- END JUEGO -->
						<!-- JUEGO -->
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b>No. Juego</b><br>2</div>
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b>Fecha</b>
							<input type="text" name="datepicker2" id="datepicker2" readonly="readonly" size="12" />
						</div>
						<div style="float:left;font-size: 14px;margin-left: 40px;"><b>Hora</b><br>
							<input type="time" name="hora2" value="<?php echo date ("h:i:s"); ?>" step="1" style="border-radius: 5px;height: 22px;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;"/>
						</div>
						<!-- END JUEGO -->
						<!-- JUEGO -->
						<br><br><br>
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b style="color:#f6f6f6;">No. Juego</b><br>3</div>
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b>Fecha</b>
							<input type="text" name="datepicker3" id="datepicker3" readonly="readonly" size="12" />
						</div>
						<div style="float:left;font-size: 14px;margin-left: 40px;"><b>Hora</b><br>
							<input type="time" name="hora3" value="<?php echo date ("h:i:s"); ?>" step="1" style="border-radius: 5px;height: 22px;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;"/>
						</div>
						<!-- END JUEGO -->
						<!-- JUEGO -->
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b style="color:#f6f6f6;">No. Juego</b><br>4</div>
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b>Fecha</b>
							<input type="text" name="datepicker4" id="datepicker4" readonly="readonly" size="12" />
						</div>
						<div style="float:left;font-size: 14px;margin-left: 40px;"><b>Hora</b><br>
							<input type="time" name="hora4" value="<?php echo date ("h:i:s"); ?>" step="1" style="border-radius: 5px;height: 22px;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;"/>
						</div>
						<!-- END JUEGO -->
						<!-- JUEGO -->
						<br><br><br>
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b style="color:#f6f6f6;">No. Juego</b><br>5</div>
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b>Fecha</b>
							<input type="text" name="datepicker5" id="datepicker5" readonly="readonly" size="12" />
						</div>
						<div style="float:left;font-size: 14px;margin-left: 40px;"><b>Hora</b><br>
							<input type="time" name="hora5" value="<?php echo date ("h:i:s"); ?>" step="1" style="border-radius: 5px;height: 22px;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;"/>
						</div>
						<!-- END JUEGO -->
						<!-- JUEGO -->
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b style="color:#f6f6f6;">No. Juego</b><br>6</div>
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b>Fecha</b>
							<input type="text" name="datepicker6" id="datepicker6" readonly="readonly" size="12" />
						</div>
						<div style="float:left;font-size: 14px;margin-left: 40px;"><b>Hora</b><br>
							<input type="time" name="hora6" value="<?php echo date ("h:i:s"); ?>" step="1" style="border-radius: 5px;height: 22px;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;"/>
						</div>
						<!-- END JUEGO -->
						<!-- JUEGO -->
						<br><br><br>
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b style="color:#f6f6f6;">No. Juego</b><br>7</div>
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b>Fecha</b>
							<input type="text" name="datepicker7" id="datepicker7" readonly="readonly" size="12" />
						</div>
						<div style="float:left;font-size: 14px;margin-left: 40px;"><b>Hora</b><br>
							<input type="time" name="hora7" value="<?php echo date ("h:i:s"); ?>" step="1" style="border-radius: 5px;height: 22px;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;"/>
						</div>
						<!-- END JUEGO -->
						<!-- JUEGO -->
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b style="color:#f6f6f6;">No. Juego</b><br>8</div>
						<div style="float:left;font-size: 14px;margin-left: 20px;"><b>Fecha</b>
							<input type="text" name="datepicker8" id="datepicker8" readonly="readonly" size="12" />
						</div>
						<div style="float:left;font-size: 14px;margin-left: 40px;"><b>Hora</b><br>
							<input type="time" name="hora8" value="<?php echo date ("h:i:s"); ?>" step="1" style="border-radius: 5px;height: 22px;font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;"/>
						</div>
						<!-- END JUEGO -->
					</fieldset>
					<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
					<input type="submit" name="add_jorn" value="Crear Jornada">
				</form>
			</div>
		</article>

		<article class="module width_full">
			<header><h3>Jornadas Creadas en <?php echo BN('title') ?> </h3></header>
			<div class="module_content">
             
           <?php echo AllJorns(); ?>

			</div>
		</article>
		
		<div class="clear"></div>
			
		<div class="spacer"></div>
	</section>
</body>

</html>