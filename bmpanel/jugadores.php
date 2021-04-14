<?php

	$Current  =	 'Jugadores';
	require '../init.php';
	include 'apis/xl_blok.php';
	include 'apis/xl_head.php';
	include 'apis/xl_user.php';

	if($_GET["id"])
    	$jugid = $_GET["id"];


?>
		<h4 class="alert_info">Desde este apartado podr&aacute; consultar los Jugadores registrados en el sistema.</h4>
		<article class="module width_full">
			<header><h3>Juadores</h3></header>
			<div class="module_content">
				<form method="POST">
						<fieldset>
							<b style="float:left;margin-left: 15px;">Nombre del Jugador</b><br><br>
							<input type="text" name="name" value="" style="width: 88%;" placeholder="Ingrese el nombre del Jugador a Buscar" />
							<input type="submit" name="search_player" value="Buscar">
						</fieldset>						
						<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
				</form>
			</div>
		</article>
		<?php if($jugid != null || $jugid != ""){ ?>
		<article class="module width_full">
			<header><h3>Resultados </h3></header>
			<div class="module_content">
             
           <?php echo AllPlayers($jugid); ?>

			</div>
		</article>
		<?php } ?>
		<div class="clear"></div>
			
		<div class="spacer"></div>
	</section>
</body>

</html>