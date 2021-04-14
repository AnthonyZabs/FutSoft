<?php

	$Current  =	 'Configuración general';
	require '../init.php';
	include 'apis/xl_blok.php';
	include 'apis/xl_head.php';
	include 'apis/xl_user.php';

	if(userD($USERID,'rank') != 2){
		echo '<script language="javascript">window.location="/bmpanel"</script>';
	}

	$cnSQ 	=	MYSQL_::Bits("SELECT * FROM config_site");
	$cnQ 	=	mysqli_fetch_assoc($cnSQ);

	#Cuando se ejecute el formulario
	if(isset($_POST['xl_config_add']))
	{
		$title 			= 	SLS3($_POST['xl_config_title']);
		$url 			= 	SLS3($_POST['xl_config_url']);		
		$slogan 		= 	SLS3($_POST['xl_config_slogan']);

		$adSQ 	=	MYSQL_::Bits("UPDATE config_site SET title = '$title', www = '$url', slogan = '$slogan'");
		xlSuccess('Los datos del servidor han sido cambiados correctamente');
		Refresh();
	}

?>
		<h4 class="alert_info">Desde este apartado podras editar los datos generales de la web</h4>
		
		<article class="module width_full">
			<header><h3>Cuidado con los movimientos que realizas en <?php echo BN('title') ?> </h3></header>
			<div class="module_content">
				<form method="POST">
						<fieldset>
							<label>Titulo de la web</label>
							<input class="xlIn" type="text" name="xl_config_title" maxlength="75" value="<?php echo $cnQ['title'] ?>"> 
						</fieldset>
						<fieldset>
							<label>Slogan de la web</label>
							<input class="xlIn" type="text" name="xl_config_slogan" maxlength="125" value="<?php echo $cnQ['slogan'] ?>"> 
						</fieldset>
						<fieldset>
							<label>Enlace de la web</label>
							<input class="xlIn" type="url" name="xl_config_url" maxlength="500" value="<?php echo $cnQ['www'] ?>">
						</fieldset>

						<input type="submit" name="xl_config_add" value="Realizar cambios">
				</form>
			</div>
		</article>
		
		<div class="clear"></div>
			
		<div class="spacer"></div>
	</section>


</body>

</html>