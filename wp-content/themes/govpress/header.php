<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package GovPress
 */
?><!DOCTYPE html>
<html lang="<?php language_attributes(); ?>">
<head>
  <meta charset="<?php bloginfo( 'charset' ); ?>">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  <link rel="profile" href="http://gmpg.org/xfn/11">
  <?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<div id="page" class="hfeed site">

	<?php do_action( 'before' ); ?>

	<nav id="site-navigation" class="main-navigation" role="navigation">
		<div class="col-width">
			<h1 class="menu-toggle"><?php _e( 'Menu', 'govpress' ); ?></h1>
			<a class="skip-link screen-reader-text" href="#content"><?php _e( 'Skip to content', 'govpress' ); ?></a>
			<div class="top_header">
				<div class="inline">
					<a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home">
						<img src="<?php echo get_template_directory_uri(); ?>/images/rnp.png" width="30" height="30" alt="">
					</a>
				</div>
				<?php wp_nav_menu( array('theme_location' => 'top', 'menu_class' => 'nav-menu' ) ); ?>
			</div>
			<div class="main_header">
				<div class="inline">
					<a class="inline" href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home">
						<img src="<?php echo get_template_directory_uri(); ?>/images/logo.png" width="46" alt="">
					</a>
				</div>
				<?php wp_nav_menu( array('theme_location' => 'primary', 'menu_class' => 'nav-menu' ) ); ?>
			</div>
		</div>
	</nav><!-- #site-navigation -->

	<header id="masthead" class="site-header" role="banner">
		<div class="site-branding col-width">

			<?php if (is_front_page()) { ?>
				<?php if ( get_header_image() ) : ?>
					<a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home">
						<img src="<?php header_image(); ?>" width="<?php echo get_custom_header()->width; ?>" height="<?php echo get_custom_header()->height; ?>" alt="">
					</a>
				<?php endif; // End header image check. ?>
				<h1 class="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></h1>
				<h2 class="site-description"><?php bloginfo( 'description' ); ?></h2>
			<?php } ?>

		</div>
	</header><!-- #masthead -->

	<?php if ( is_page_template('templates/home-page.php') ) {
		get_template_part( 'templates/above', 'home-page' );
	} ?>

	<div class="col-width">
		<div id="content" class="site-content">
