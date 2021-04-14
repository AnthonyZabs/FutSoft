<?php

	$Current  =	 'Portada';
	require '../init.php';
	include 'apis/xl_blok.php';
	include 'apis/xl_head.php';
	include 'apis/xl_user.php';

?>
		<h4 class="alert_info">Bienvenido <?php echo userD($USERID,'user') ?> a la administración de <?php echo BN('title') ?></h4>
		
		<article class="module width_full">
			<header><h3>Estadisticas de <?php echo BN('title') ?> </h3></header>
			<div class="module_content">
				<article class="stats_overview">
					<div class="overview_today">
						<p class="overview_day">Usuarios</p>
						<p class="overview_count"><?php echo xlObject('users') ?></p>
						<p class="overview_type">Registrados</p>
						<p class="overview_count"><?php echo fsTotalUs() ?></p>
						<p class="overview_type">Dueños</p>
					</div>
					<div class="overview_previous">
						<p class="overview_day">Estad&iacute;sticas</p>
						<p class="overview_count"><?php echo xlObject('equipos') ?></p>
						<p class="overview_type">Equipos</p>
						<p class="overview_count"><?php echo xlObject('jugadores') ?></p>
						<p class="overview_type">Jugadores</p>
					</div>
				</article>
				<article class="stats_overview">
					<div class="overview_today">
						<p class="overview_day"><?php echo BN('title') ?></p>
						<p class="overview_count"><?php if(BN('mant') == 0){ ?>
							<form action="" method="POST">
				                <input style="width:70%;height:30px;color: red;" class="button" name="turn_mant" type="submit" value="OFF" />
				                <input type="text" name="tovalue" value="1" style="display: none;">
				                <input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
				            </form>
						<?php }else{ ?>
							<form action="" method="POST">
				                <input style="width:70%;height:30px;color: green;" class="button" name="turn_mant" type="submit" value="ON" />
				                <input type="text" name="tovalue" value="0" style="display: none;">
				                <input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
				            </form>
						<?php } ?></p>
						<p class="overview_type">Mantenimiento</p>
						<p class="overview_count"><?php if(BN('regs') == 0){ ?>
							<form action="" method="POST">
				                <input style="width:70%;height:30px;color: red;" class="button" name="turn_regs" type="submit" value="OFF" />
				                <input type="text" name="tovalue" value="1" style="display: none;">
				                <input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
				            </form>
						<?php }else{ ?>
							<form action="" method="POST">
				                <input style="width:70%;height:30px;color: green;" class="button" name="turn_regs" type="submit" value="ON" />
				                <input type="text" name="tovalue" value="0" style="display: none;">
				                <input type="text" name="username" value="<?php echo userD($USERID,'user'); ?>" style="display: none;">
				            </form>
						<?php } ?></p>
						<p class="overview_type">Registros</p>
					</div>
					<div class="overview_previous">
						<p class="overview_day">Gesti&oacute;n</p>
						<p class="overview_count"><?php echo xlObject('access_u_code') ?></p>
						<p class="overview_type">Codigo(s) registro</p>
						<p class="overview_count"><?php echo xlObjectCond('access_u_code', 'used', '1') ?></p>
						<p class="overview_type">Codigo(s) usado(s)</p>
					</div>
				</article>
				<div class="clear"></div>
			</div>
		</article><!-- end of stats article -->
		
		<div class="clear"></div>
		
		<div class="spacer"></div>

	</section>


</body>

</html>