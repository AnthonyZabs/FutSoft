<?php

	$Current  =	 'Administrar Codigos';
	require '../init.php';
	include 'apis/xl_blok.php';
	include 'apis/xl_head.php';
	include 'apis/xl_user.php';

	if(userD($USERID,'rank') != 2){
		echo '<script language="javascript">window.location="/bmpanel"</script>';
	}

?>
<style type="text/css">table, th, td {
    border: 2px dotted white;
}</style>
		<h4 class="alert_info">Puedes Administrar codigos desde esta sección</h4>
		
		<article class="module width_full">
			<header><h3>Generar codigo para <?php echo BN('title') ?> </h3></header>
			<div class="module_content">
				<form method="POST">
					<?php if(isset($_SESSION['NewCode'])): echo '<h4 class="alert_success">Nuevo codigo es : <b>'.$_SESSION['NewCode'].'</b></h4>'; unset($_SESSION['NewCode']); endif; ?>
						<input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
						<input type="submit" name="add_access_code" value="Generar Codigo">
				</form>
			</div>
		</article>

				<article class="module width_full">
			<header><h3>Codigos Generados en <?php echo BN('title') ?> </h3></header>
			<div class="module_content">
             
           <?php echo AllCodes(); ?>

			</div>
		</article>
		
		<div class="clear"></div>
			
		<div class="spacer"></div>
	</section>
</body>

</html>