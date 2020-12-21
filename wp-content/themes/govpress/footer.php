<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package GovPress
 */
?>

		</div><!-- #content -->
	</div><!-- .col-width -->

	<?php
		/*
		 * A sidebar in the footer? Yep. You can can customize
		 * your footer with three columns of widgets.
		 */
		if ( ! is_404() )
			get_sidebar( 'footer' );
	?>

	<?php
	$fclass = 'site-footer no-widgets';
	if ( is_active_sidebar( 'footer-text' ) ) {
		$fclass = 'site-footer widgets';
	} ?>

	<footer class="<?php echo $fclass; ?>" role="contentinfo">
		<div class="col-width">
			<?php if ( is_active_sidebar( 'footer-text' ) ) { ?>
				<div class="widget-area" role="complementary">
					<?php dynamic_sidebar( 'footer-text' ); ?>
				</div>
			<?php } else { ?>
				Municipality of Burgos, Pangasinan &copy; 2020
				<?php //printf( __( '%1$s, the %2$s theme for government.', 'govpress' ), 'Powered by <a href="http://govpress.org/">GovPress</a>', '<a href="http://wordpress.org/">WordPress</a>' ); ?>
			<?php } ?>
		</div><!-- .col-width -->
	</footer><!-- .site-footer -->
</div><!-- #page -->

<?php wp_footer(); ?>

	<style type="text/css">
		.entry-content div[id*='tab_container'] > .wpsm_nav-tabs > .entry-content li.presentation > a {
		  background-color: #00006c !important;
		  border: 1px solid #071751 !important;
		}

		.entry-content div[id*='tab_container'] > .wpsm_nav-tabs > .entry-content li.presentation > a:hover, 
		.entry-content div[id*='tab_container'] > .wpsm_nav-tabs > .entry-content li.presentation > a:focus {
		  background-color: #e1dc2e !important;
		  border: 1px solid #cac872 !important;
		}
	</style>

	<script type="text/javascript">
	window.onscroll = function() {myFunction()};

	var navbar = document.getElementById("site-navigation");
	var sticky = navbar.offsetTop;

	setTimeout( function() { 
		if (window.innerWidth > 767) {
			navbar.classList.add("sticky");
		}
	}, 1000);

	function myFunction() {
		if (window.innerWidth > 767) {
		  if (window.pageYOffset >= sticky) {
		    navbar.classList.add("sticky")
		  } else {
		    navbar.classList.remove("sticky");
		  }
		}
	}

	document.onreadystatechange = () => {
	  if (document.readyState === 'complete') {
	    if (document.readyState === 'interactive') {
			document.querySelector('.preloader-active').style.opacity = '0.5';
		}

		if (document.readyState === 'complete') {
			document.querySelector('.preloader-active').classList.remove('preloader-active');
		}
	  }
	};

	
	</script>

</body>
</html>
