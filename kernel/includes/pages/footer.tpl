			<div id="footer-widgets" role="contentinfo" class="clearfix">
				<div id="colophon">
					<div id="footer-widget-area" role="complementary">
						<div id="footer-logo" class="widget-area"></div>
					</div>
				</div>
			</div>
		</div>
		
		<footer class="clearfix">
			<div class="left">&copy; 2019 <?php echo BN('title') ?></div>
			<div class="right">Créditos a los respectivos creadores de <a href="<?php echo BN('www') ?>" target="_blank"><?php echo BN('title') ?></a></div>
			<ul id="social">
				<li class="facebook">
					<a href="https://www.facebook.com/<?php echo BN('title') ?>" title="Facebook" target="_blank">Facebook</a>
				</li>		
				<li class="twitter">
					<a href="https://twitter.com/#" title="Twitter" target="_blank">Twitter</a>
				</li>			
			</ul>
		</footer>

		<link rel='stylesheet' id='adminbar-stylesheet-css'  href='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/css/adminbar.css?ver=4.9.3' type='text/css' media='all' />
		<script type='text/javascript' src='<?php echo BN("www") ?>/resources/wp-includes/js/wp-embed.min.js?ver=4.9.3'></script>

		<!-- Bootstrap JS -->
  		<script type='text/javascript' src='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/js/bootstrap.js?ver=4.9.3'></script>

  		<!-- Functions JS -->
  		<script type='text/javascript' src='<?php echo BN("www") ?>/resources/wp-content/themes/futsoft/js/functions.js?<?php echo time();?>'></script>

		<script type="text/javascript">
			(function($) {
			// drop nav
			$('#drop-nav').change(function() {
				window.location = $(this).val();
			});
			// fancybox all image links
			$('a').each(function() {
				var self = this;
				var file =  $(self).attr('href');
				if (file) {
					var extension = file.substr( (file.lastIndexOf('.') +1) );
					switch(extension) {
						case 'jpg':
						case 'png':
						case 'gif':
							$(self).fancybox({
								'overlayColor' : '#fff'
							});
					}
				}
			});
			})(jQuery);
		</script>
	</body>
</html>