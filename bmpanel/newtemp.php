<?php

	$Current  =	 'Crear nueva temporada';
	require '../init.php';
	include 'apis/xl_blok.php';
	include 'apis/xl_head.php';
	include 'apis/xl_user.php';

?>
		<h4 class="alert_info">Desde este apartado podr&aacute; crear una nueva temporada para agregar jornadas en ella.</h4>
		
		<article class="module width_full">
			<header><h3>Crear Temporada</h3></header>
			<div class="module_content">
				<form method="POST">
						<fieldset>
							<label>Nombre de la temporada</label>
							<b>TEMPORADA <?php echo date("Y"); ?></b> <select style="width: 5%;border-radius: 5px;" name="class"><option value="A">A</option><option value="B">B</option></select>
						</fieldset>
						<input type="submit" name="add_temp" value="Crear Temporada">
				</form>
			</div>
		</article>

		<article class="module width_full">
			<header><h3>Temporadas Creadas en <?php echo BN('title') ?> </h3></header>
			<div class="module_content">
             
           <?php echo AllTemps(); ?>

			</div>
		</article>
		
		<div class="clear"></div>
			
		<div class="spacer"></div>
	</section>
</body>

</html>