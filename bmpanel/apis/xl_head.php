<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <link rel="shortcut icon" href="<?php echo BN('www') ?>/resources/wp-content/themes/futsoft/images/favicon.ico" type="image/x-icon" />

		<title><?php echo BN('title') ?> | Administración</title>
		
		<!-- CSS -->
		<link rel="stylesheet" href="<?php echo BN('www') ?>/bmpanel/css/layout.css" type="text/css" media="screen" />
		<!-- JS -->
		<script src="<?php echo BN('www') ?>/bmpanel/js/jquery-1.5.2.min.js" type="text/javascript"></script>
		<script src="<?php echo BN('www') ?>/bmpanel/js/hideshow.js" type="text/javascript"></script>
		<script src="<?php echo BN('www') ?>/bmpanel/js/jquery.tablesorter.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="<?php echo BN('www') ?>/bmpanel/js/jquery.equalHeight.js"></script>
		<script type="text/javascript">
			$(document).ready(function() 
		    	{ 
		      	  $(".tablesorter").tablesorter(); 
		   	 } 
			);
			$(document).ready(function() {	
				$(".tab_content").hide(); 
				$("ul.tabs li:first").addClass("active").show(); 
				$(".tab_content:first").show(); 

				//On Click Event
				$("ul.tabs li").click(function() {

					$("ul.tabs li").removeClass("active"); 
					$(this).addClass("active"); 
					$(".tab_content").hide();

					var activeTab = $(this).find("a").attr("href");
					$(activeTab).fadeIn(); 
					return false;
				});
			});
	    </script>
	    <script type="text/javascript">
		    $(function(){
		        $('.column').equalHeight();
		    });
		</script>
	</head>
	<body>
		<header id="header">
			<hgroup>
				<h1 class="site_title"><a href="<?php echo BN('www') ?>/bmpanel">⚽ FutSoft ⚽</a></h1>
				<h2 class="section_title">Panel de administración de <?php echo BN('title') ?></h2>
			</hgroup>
		</header> 
		
		<section id="secondary_bar">
			<div class="user">
				<p><?php echo userD($USERID,'user') ?> (<a class="small_T" href="#"><?php echo userR($USERID,'name') ?></a>)</p>
				<a class="logout_user" href="<?php echo BN('www') ?>/bmpanel/logout.php" title="Cerrar Sesión">X</a>
			</div>
			<div class="breadcrumbs_container">
				<article class="breadcrumbs"><a href="<?php echo BN('www') ?>/bmpanel">Panel administrativo</a> <div class="breadcrumb_divider"></div> <a class="current"><?php echo $Current ?></a></article>
			</div>
		</section>
		
		<aside style="height:125%" id="sidebar" class="column">
			<hr/>

			<h3>1️⃣ Temporadas</h3>
			<ul class="toggle">
				<li class="icn_new_article">
					<a href="<?php echo BN('www') ?>/bmpanel/newtemp.php">Temporadas</a>
				</li>
			</ul>

			<h3>2️⃣ Jornadas</h3>
			<ul class="toggle">
				<li class="icn_new_article">
					<a href="<?php echo BN('www') ?>/bmpanel/newjorn.php">Jornadas</a>
				</li>
				<li class="icn_new_article">
					<a href="<?php echo BN('www') ?>/bmpanel/genjorn.php">Generar Jornadas</a>
				</li>
			</ul>

			<h3>3️⃣ Juegos</h3>
			<ul class="toggle">
				<li class="icn_new_article">
					<a href="<?php echo BN('www') ?>/bmpanel/juegos.php">Mostrar Juegos</a>
				</li>
			</ul>

			<hr>

			<h3>🛡 Equipos</h3>
			<ul class="toggle">
				<li class="icn_new_article">
					<a href="<?php echo BN('www') ?>/bmpanel/newequip.php">Equipos</a>
				</li>
			</ul>

			<h3>🏃🏼 Jugadores</h3>
			<ul class="toggle">
				<li class="icn_new_article">
					<a href="<?php echo BN('www') ?>/bmpanel/newplayer.php">Nuevo Jugador</a>
				</li>
				<li class="icn_edit_article">
					<a href="<?php echo BN('www') ?>/bmpanel/jugadores.php">Mostrar Jugadores</a>
				</li>
			</ul>

			<hr>

			<h3>📊 Estad&iacute;sticas</h3>
			<ul class="toggle">
				<li class="icn_new_article">
					<a href="<?php echo BN('www') ?>/bmpanel/reports.php">Reportes Estad&iacute;sticos</a>
				</li>
				<li class="icn_folder">
					<a href="<?php echo BN('www') ?>/bmpanel/print.php">Imprimir Jornadas (PDF)</a>
				</li>
			</ul>

			<hr>
			
			<?php if(userD($USERID,'rank') == 2){ ?>
				<h3>🔰 Administración</h3>
				<ul class="toggle">
					<li class="icn_new_article"><a href="<?php echo BN('www') ?>/bmpanel/administradores.php">Administradores</a></li>
					<li class="icn_edit_article"><a href="<?php echo BN('www') ?>/bmpanel/newcode.php">C&oacute;digos de Registro</a></li>
				</ul>
				<h3>📡 Servidor</h3>
				<ul class="toggle">
					<li class="icn_folder"><a href="<?php echo BN('www') ?>/bmpanel/config.php">Configuración</a></li>
				</ul>
			<?php } ?>

			<h3>👨‍💼 Sesión</h3>
			<ul class="toggle">
				<li class="icn_folder"><a href="<?php echo BN('www') ?>/bmpanel/">Regresar al incio</a></li>
				<li class="icn_photo"><a href="<?php echo BN('www') ?>/inicio">Regresar a <?php echo BN('title') ?></a></li>
				<li class="icn_jump_back"><a href="<?php echo BN('www') ?>/bmpanel/logout.php">Cerrar sesión</a></li>
			</ul>
			
			<footer class="minum">
				<hr />
				<p><strong>&copy Derechos reservados a <?php echo BN('title') ?></strong></p>
				<p>Develped by FutSoft</p>
			</footer>
		</aside>

		
		<section id="main" class="column">