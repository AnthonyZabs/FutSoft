<div id="main" class="clearfix">
    <div id="container">
      <div class="featured-image"></div>      
      <div id="post-14" class="post-14 page type-page status-publish hentry">
        <h1 class="entry-title">Registro</h1>
        <div id="content" role="main">
          <div class="entry-content">
            <p style="text-align: justify;">El registro de Administradores está restringido con una Clave secreta. Contactar con el Dueño de la Liga.</p>
            <p style="text-align: justify;">
          	  <form class="contactform" id="contactform" method="post" onsubmit="return SendAjax('Register');">
                <label for="contact-name">Nombre de usuario</label>
                <input type="text" name="user" id="reg_user" value="" class="required required-field" />

                <label for="contact-name">Nombre completo</label>
                <input type="text" name="name" id="reg_name" value="" class="required required-field" />
                
                <label for="contact-email">Contraseña</label>
                <input type="password" name="pass" id="reg_pass" value="" class="required required-field email" />    

                <label for="contact-email">Repetir Contraseña</label>
                <input type="password" name="pas2" id="reg_pas2" value="" class="required required-field email" /> 

                <label for="contact-name">Correo electrónico</label>
                <input type="email" name="emal" id="reg_emal" value="" class="required required-field" />    

                <label for="contact-name">Clave de Registro</label>
                <input type="text" name="clv" id="reg_clv" value="" class="required required-field" />    
                
                
                <span><input class="button" name="user_register" type="submit" value="Crear Cuenta" /></span>
              </form>
            </p>
            <p>&nbsp;</p>
            <p style="text-align: right;"></p>
          </div><!-- .entry-content -->
        </div><!-- #post-## -->
      </div>
    </div><!-- #container -->

    <div id="sidebar">
      <div id="primary" class="widget-area" role="complementary">
        <ul class="xoxo">
        <li id="search-2" class="widget-container widget_search">
          <form role="search" method="get" id="searchform" action="#">
              <ul>
                <li class="query"><input type="text" value="" name="s" id="s" /></li>
                <li><input type="submit" id="searchsubmit" value="Buscar" /></li>
              </ul>
          </form>
        </li>    
        <?php include 'kernel/includes/pages/index/news.tpl'; ?>
        </ul>
      </div><!-- #primary .widget-area -->
    </div>  
    <div id="sponsors"><ul class="sponsors"></ul></div>
</div><!-- #main -->
