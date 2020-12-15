<?php
/*
 * Template part for displaying special home page sections above the page content.
 * This template is called from header.php.
 *
 * @package GovPress
 */
?>

<?php if ( is_active_sidebar( 'home-page-hero' ) ) : ?>
	<div id="hero-widgets" class="clear">
		<div class="col-width">
			<div class="section-wrap">
				<?php dynamic_sidebar( 'home-page-hero' ); ?>
			</div>
		</div>
	</div>
<?php endif; // End home page top widget module ?>

<?php if ( has_nav_menu( 'icon' ) ) : ?>
	<div id="menu-icon" class="clear">
		<div class="col-width">
			<?php
			wp_nav_menu( array(
				'theme_location' => 'icon',
				'depth' => '1',
				'container_class' => 'menu-icon-container'
			) ); ?>
		</div>
	</div>
<?php endif; // Icon Menu ?>

<div class="hidden">
<?php
$parent = '344'; /* forms page */
$children = wp_dropdown_pages("selected=0&child_of=" . $parent . "&echo=0");

if ($children) {
?>
	<?php 
	    // current child will have class 'current_page_item'
	    echo $children; 
	?>
<?php 
} 
?>
</div>