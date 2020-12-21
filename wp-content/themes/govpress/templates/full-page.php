<?php
/*
 * Template Name: Full Page
 * Description: A template for displaying pages without a sidebar
 *
 * @package GovPress
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<div id="main" class="site-main" role="main">

			<?php while ( have_posts() ) : the_post(); ?>

				<?php get_template_part( 'content', 'page' ); ?>

				<?php
					// If comments are open or we have at least one comment, load up the comment template
					if ( comments_open() || '0' != get_comments_number() ) :
						comments_template();
					endif;
				?>

			<?php endwhile; // end of the loop. ?>

			<?php if ( is_active_sidebar( 'home-page-featured' ) ) : ?>
				<div id="home-page-featured" class="widget-area clear">
					<div class="section-wrap">
						<?php dynamic_sidebar( 'home-page-featured' ); ?>
					</div>
				</div>
			<?php endif; // End home page top widget module ?>

		</div><!-- #main -->
	</div><!-- #primary -->

<?php get_footer(); ?>
