<?php
  // Check Mant
  $xlSQ   = MYSQL_::Bits("SELECT * FROM config_site WHERE mant = '1'");
  $xlS  = mysqli_num_rows($xlSQ);
  if($xlS > 0 && $zone != "acceder" && userD($USERID,'rank') < 2){
    echo '<script language="javascript">window.location="/mantenimiento"</script>';
    return;
  }
  // Check Registros
  $xlSQ   = MYSQL_::Bits("SELECT * FROM config_site WHERE regs = '0'");
  $xlS  = mysqli_num_rows($xlSQ);
  if($xlS > 0 && $zone == "register"){
    echo '<script language="javascript">alert("Los Registros están desactivados temporalmente.");</script>';
    echo '<script language="javascript">window.location="/inicio"</script>';
    return;
  }
?>
<!DOCTYPE html>
<html lang="es-ES">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="icon" href="<?php echo BN('www') ?>/resources/wp-content/themes/futsoft/images/favicon.ico" type="image/x-icon" />
    <title><?php echo BN('title') ?> &bull; <?php echo BN('slogan') ?></title>
    
    <!-- shortcodes css -->
    <link rel='stylesheet' id='et-shortcodes-css-css'  href='<?php echo BN("www") ?>/resources/wp-content/plugins/et-shortcodes/css/shortcodes.css?ver=3.0' type='text/css' media='all' />
    <link rel='stylesheet' id='et-shortcodes-responsive-css-css'  href='<?php echo BN("www") ?>/resources/wp-content/plugins/et-shortcodes/css/shortcodes_responsive.css?ver=3.0' type='text/css' media='all' />

    <link rel='stylesheet' id='stylesheet-css'  href='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/style.css?ver=4.9.3' type='text/css' media='all' />
    <link rel='stylesheet' id='jquery-fancybox-css'  href='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/js/fancybox/jquery.fancybox-1.3.4.css?ver=4.9.3' type='text/css' media='all' />
    
    <!-- Bootstrap CSS -->
    <link rel='stylesheet' id='responsive-stylesheet-css'  href='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/bootstrap.css?ver=4.9.3' type='text/css' media='all' />

    <!-- Javascripts -->
    <script type='text/javascript' src='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/js/jquery-3.2.1.min.js'></script>
    <script type='text/javascript' src='<?php echo BN("www") ?>/resources/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>

    <!-- JS Plugins -->
    <script type='text/javascript' src='<?php echo BN("www") ?>/resources/wp-content/plugins/AZGlossaryIndex/js/toggle.js?ver=4.9.3'></script>
    <script type='text/javascript' src='http://platform.twitter.com/widgets.js?ver=4.9.3'></script>
    <script type='text/javascript' src='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/js/jquery.themeboy-rotator.js?ver=4.9.3'></script>
    <script type='text/javascript' src='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/js/jquery.evenHeights.1.0.0-min.js?ver=4.9.3'></script>
    <script type='text/javascript' src='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/js/fancybox/jquery.easing-1.3.pack.js?ver=4.9.3'></script>
    <script type='text/javascript' src='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/js/fancybox/jquery.mousewheel-3.0.4.pack.js?ver=4.9.3'></script>
    <script type='text/javascript' src='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/js/fancybox/jquery.fancybox-1.3.4.pack.js?ver=4.9.3'></script>
    
    <!-- Custom CSS -->
    <style type="text/css">
      body,
      .image-rotator .image_thumb ul li .more a,
      .image-rotator .image_thumb ul li .more a:hover,
      .tb_players .gallery-view li .name a,
      ul.tb_matches-sidebar .kickoff time, ul.tb_matches-sidebar .kickoff .score,
      #wrapper, #menu #searchform input#s,
      ul.tb_matches-sidebar .kickoff a {
        color: #333333}
      a,
      .highlighted,
      h2.entry-title {
        color: #048852;
      }
      a:hover {
        color: #00602a;
      }
      #header {
        background-image: url(<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/images/header.jpg);
        min-height: 140px;
      }
      #header #maintitle h1,
      #header #maintitle h1 a {
        color: #333333;
      }
      #header #maintitle h2,
      #header #maintitle h2 a {
        color: #048852;
      }
      .image-rotator {
        background-color: #f5f5f5;  
      }
      .image-rotator .image_thumb ul li,
      .image-rotator .image_thumb ul li .more a {
        color: #333333;
      }
      #wrapper,
      #menu #searchform input#s {
        background-color: #ffffff;
      }
      #sidebar {
        background-color: #f0f0f0;
      }
      .widget-container {
        background-color: #ffffff;
      }
      #menu li:hover a,
      #menu li:hover input,
      #menu #searchform input#searchsubmit:hover,
      .image-rotator .image_thumb ul li.active,
      .image-rotator .image_thumb ul li.active a,
      #content section h3,
      .widget-container h3,
      .contactform .button:hover,
      input[type="submit"]:hover {
        color: #ffffff;
      }
      #menu {
        background-color: #333333;
        background-image: -webkit-gradient(
          linear,
          left top,
          left bottom,
          color-stop(0, #5b5b5b),
          color-stop(0.3, #333333)
        );
        background-image: -moz-linear-gradient(
        center top,
          #5b5b5b 0%,
          #333333 30%
        );
      }
      #menu li {
        border-right-color: #0b0b0b;
        border-left-color: #5b5b5b;
      }
      #menu li a,
      #menu #searchform input#searchsubmit {
        color: #dddddd;
      }
      #menu .menu li:hover {
        background-color: #007e48;
        background-image: -webkit-gradient(
          linear,
          left top,
          left bottom,
          color-stop(0, #2cb07a),
          color-stop(0.3, #007e48),
          color-stop(1, #007e48)
        );
        background-image: -moz-linear-gradient(
        center top,
          #2cb07a 0%,
          #007e48 30%,
          #007e48 100%
        );
        border-right-color: #003802;
        border-left-color: #048852;
      }
      #menu li ul.children,
      #menu li ul.sub-menu {
        background-color: #007e48;
      }
      #content section h3,
      .widget-container h3,
      .tb_players .gallery-view li .number,
      .navigation .nav-previous a:hover,
      .navigation .nav-next a:hover,
      .commentlist .comment .reply a:hover,
      .contactform .button:hover,
      .link-button a:hover,
      input[type="submit"]:hover {
        background: #007e48;
        background-image: -webkit-gradient(
          linear,
          left top,
          left bottom,
          color-stop(0, #048852),
          color-stop(1, #00602a)
        );  
        background-image: -moz-linear-gradient(
          center top,
          #048852 0%,
          #00602a 100%
        );
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#048852', endColorstr='#00602a');
      }
      #respond h3 {
        color: #048852;
      }
      .image-rotator .image_thumb ul li.active {
        background: #007e48;
        background-image: -webkit-gradient(
          linear,
          left top,
          left bottom,
          color-stop(0, #048852),
          color-stop(1, #004c16)
        );
        background-image: -moz-linear-gradient(
          center top,
          #048852 0%,
          #004c16 100%
        );
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#048852', endColorstr='#004c16');
        cursor: default;
        border-color: #002400;
      }
      .image-rotator .image_thumb ul li.active .more a:hover {
        color: #ffffff; 
      }
      #footer-widgets {
        background-color: #333333;
      }
      #footer-widgets #footer-logo {
        background-image: url(<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/images/logo2.png);
      }


      #content .navigation .nav-previous a:hover,
      #content .navigation .nav-next a:hover {
        background: #007e48;
        background-image: -webkit-gradient(
          linear,
          left top,
          left bottom,
          color-stop(0, #048852),
          color-stop(1, #00602a)
        );
        background-image: -moz-linear-gradient(
          center top,
          #048852 0%,
          #00602a 100%
        );
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#048852', endColorstr='#00602a');
      }

      #main table tbody tr,
      ul.tb_matches-sidebar li {
        border-color: #ffffff;
      }
      a.tb_view_all {
        color: #838383;
        text-shadow: 1px 1px 0 #ffffff;
      }
      a.tb_view_all:hover {
        color: #333333;
      }
      #sponsors {
        background-color: #f0f0f0;
      }

      #social { position: absolute; top: 175px; margin-left: -48px; } 
      #social li { display: block; margin: 0 0 6px; }
      .recentcomments a{display:inline !important;padding:0 !important;margin:0 !important;}</style>
    <style type="text/css" id="custom-background-css">
      body.custom-background {
        background-image: url("<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/images/background.jpg");
        background-position: center top;
        background-size: auto;
        background-repeat: no-repeat;
        background-attachment: scroll;
      }
    </style>
  </head>

  <body class="home blog custom-background">

    <div id="response_ajax"></div>

    <div id="fb-root"></div>
    <div id="wrapper">

      <!-- HEADER -->
      <header id="header">
        <a id="logo" href="<?php echo BN('www') ?>/inicio">
          <img src="<?php echo BN('www') ?>/resources/wp-content/themes/futsoft/images/logo1.png" alt="<?php echo BN('title') ?>" />
        </a>
        <hgroup id="maintitle">
          <h1><a href="<?php echo BN('www') ?>/inicio"><?php echo BN('title') ?></a></h1>
          <h2><a href="<?php echo BN('www') ?>/inicio"><?php echo BN('slogan') ?></a></h2>
        </hgroup>
        <hgroup style="margin-top:20px;float:right;margin-right: 20px;font-size: 15px;">
          <?php 
            //Enlaces mediante sesion
            if($_SESSION == TRUE)
            {
              echo 'Bienvenido <b>'.userD($USERID,'user').'</b><br>';
              echo '<i><a style="text-decoration:underline" href="'.Site.'/bmpanel">Panel de Administraci&oacute;n</a></i><br><br>';
              echo '<a href="'.Site.'/salir">Cerrar Sesión</a>';
            }
          ?>
        </hgroup>
        <div class="clear"></div>
      </header>
      <!-- END HEADER -->

      <!-- MENU -->
      <nav id="menu" class="clearfix">
        <div class="menu-header">
          <ul id="menu-menu-1" class="menu">
            <li id="menu-item-1" <?php if($zone == 'inicio'){?> class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item"<?php }else{?> class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1" <?php }?>>
              <a href="<?php echo BN('www') ?>/inicio">Inicio</a>
            </li>
            
            <li id="menu-item-2" <?php if($zone == 'stats'){?> class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item"<?php }else{?> class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-2" <?php }?>>
              <a>Estad&iacute;sticas</a>
              <ul class="sub-menu">
                <li id="menu-item-3" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3">
                  <a href="<?php echo BN('www') ?>/tabla-general">Tabla General</a>
                </li>
                <li id="menu-item-5" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-5">
                  <a href="<?php echo BN('www') ?>/goleo-individual">Goleo Individual</a>
                </li>
              </ul>
            </li>

            <li id="menu-item-7" <?php if($zone == 'jornadas'){?> class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item"<?php }else{?> class="menu-item menu-item-type-post_type menu-item-object-page menu-item-7" <?php }?>>
              <a href="<?php echo BN('www') ?>/jornadas">Jornadas</a>
            </li>
            <li id="menu-item-8" <?php if($zone == 'players' || $zone == 'plantillas'){?> class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item"<?php }else{?> class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-8" <?php }?>>
              <a>Equipos</a>
              <ul class="sub-menu">
                <li id="menu-item-9" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-9">
                  <a href="<?php echo BN('www') ?>/jugadores">Jugadores</a>
                </li>
                <li id="menu-item-10" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-10">
                  <a href="<?php echo BN('www') ?>/plantillas">Plantillas</a>
                </li>
              </ul>
            </li>
            <?php if($_SESSION != TRUE){ ?>
              <li id="searchform" <?php if($zone == 'acceder'){?> class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item"<?php }else{?> class="menu-item menu-item-type-post_type menu-item-object-page menu-item-7" <?php }?>>
                <a href="<?php echo BN('www') ?>/acceder">Entrar</a>
              </li>
              <li id="searchform" <?php if($zone == 'register'){?> class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item"<?php }else{?> class="menu-item menu-item-type-post_type menu-item-object-page menu-item-8" <?php }?>>
                <a href="<?php echo BN('www') ?>/registro">Registrarse</a>
              </li>
            <?php } ?>
          </ul>
        </div>
        <!-- MENU MOVIL DEVICES -->
        <select id="drop-nav">
          <option value="">Men&uacute;...</option> 
            id="menu-item-48"><option value="<?php echo BN('www') ?>/inicio">Inicio</option></option>
            id="menu-item-1317"><option value="<?php echo BN('www') ?>/#">Estadísticas</option></option>
            id="menu-item-351"><option value="<?php echo BN('www') ?>/#">Posiciones</option></option>
            id="menu-item-359"><option>Jornadas</option>
            id="menu-item-360"><option value="<?php echo BN('www') ?>/#">&nbsp;&nbsp;&nbsp;&nbsp;Jugadores</option></option>
            id="menu-item-439"><option value="<?php echo BN('www') ?>/#">&nbsp;&nbsp;&nbsp;&nbsp;Equipos</option></option>
            id="menu-item-904"><option value="<?php echo BN('www') ?>/#">&nbsp;&nbsp;&nbsp;&nbsp;Juegos</option></option></option>
            <?php if($_SESSION != TRUE){ ?>
              id="menu-item-49"><option value="<?php echo BN('www') ?>/acceder">Entrar</option></option>
              id="menu-item-49"><option value="<?php echo BN('www') ?>/registro">Registrarse</option></option>
            <?php } ?>
        </select> 
        <!-- END MENU MOVIL DEVICES -->
      </nav>