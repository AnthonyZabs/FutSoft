<?php

	$Current  =	 'Cerrar sesión';
	require '../init.php';
	include 'apis/xl_blok.php';
	include 'apis/xl_head.php';
	include 'apis/xl_user.php';

?>
		<h4 class="alert_info">Desde este apartado podras salir completamente del sitio</h4>
		
		<article class="module width_full">
			<header><h3><?php echo $Current ?></h3></header>
			<div class="module_content">
				<form method="POST">
						<fieldset>
							<label>¿Deseas cerrar tu sesión?</label>
						</fieldset>
						<input type="submit" name="xl_logout" value="Cerrar sesión">
						<a href="<?php echo BN('www') ?>/bmpanel/">Cancelar</a>
				</form>
			</div>
		</article>
		
		<div class="clear"></div>
			
		<div class="spacer"></div>
	</section>


</body>

</html>