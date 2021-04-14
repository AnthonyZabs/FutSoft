<div id="main" class="clearfix">
    <div id="container">
      	<div class="featured-image"></div>	      
	  	<div id="post-14" class="post-14 page type-page status-publish hentry">
            <h1 class="entry-title">Acceder</h1>
	        <center>
	        	<div id="content" role="main">
		      		<div class="entry-content">
		          		<p style="text-align: justify;">El Acceso es exclusivo del Administrador de la Liga.</p>
						<p style="text-align: justify;">
							<form class="contactform" id="contactform" method="post" onsubmit="return SendAjax('Login');">
						      <label for="contact-name">Usuario</label>
						      <input type="text" name="user" id="login_user" value="" class="required required-field" />
						      
						      <label for="contact-email">Contraseña</label>
						      <input type="password" name="pass" id="login_pass" value="" class="required required-field email" />      
						      
						      
						      <span><input class="button" name="user_acceder" type="submit" value="Acceder" /></span>
						      <input type="hidden" name="contact-submitted" id="contact-submitted" value="true" />
						    </form>
						</p>
						<p>&nbsp;</p>
						<p style="text-align: right;"></p>
	                </div><!-- .entry-content -->
	            </div>
		  </center><!-- #post-## -->
	  	</div>
    </div><!-- #container -->

	<div id="sidebar">
	    <div id="primary" class="widget-area" role="complementary">
	    	<ul class="xoxo">
				<li id="search-2" class="widget-container widget_search">
					<form role="search" method="get" id="searchform" action="http://futsoft.itp/">
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
