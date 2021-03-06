<?php
/**
 * GovPress functions and definitions
 *
 * @package GovPress
 */

/**
 * Set the content width based on the theme's design and stylesheet.
 */
if ( ! isset( $content_width ) ) {
	$content_width = 640; /* pixels */
}

/**
 * Set constant for version
 */
define( 'GOVPRESS_VERSION', '1.5.2' );

if ( ! function_exists( 'govpress_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 */
function govpress_setup() {

	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory.
	 * If you're building a theme based on govpress, use a find and replace
	 * to change 'govpress' to the name of your theme in all the template files
	 */
	load_theme_textdomain( 'govpress', get_template_directory() . '/languages' );

	// Add default posts and comments RSS feed links to head.
	add_theme_support( 'automatic-feed-links' );

	/*
	 * Enable support for Post Thumbnails on posts and pages.
	 *
	 * @link http://codex.wordpress.org/Function_Reference/add_theme_support#Post_Thumbnails
	 */
	add_theme_support( 'post-thumbnails' );

	/*
	 * Let WordPress manage the document title.
	 * By adding theme support, we declare that this theme does not use a
	 * hard-coded <title> tag in the document head, and expect WordPress to
	 * provide it for us.
	 */
	add_theme_support( 'title-tag' );

	// This theme uses wp_nav_menu() in two locations.
	register_nav_menus( array(
		'top' => __( 'Top Menu', 'govpress' ),
		'primary' => __( 'Primary Menu', 'govpress' ),
		'sidebar_menu' => __( 'Sidebar Menu', 'govpress' ),
		'icon' => __( 'Icon Menu', 'govpress' ),
	) );

	// Enable support for Post Formats.
	add_theme_support( 'post-formats', array( 'aside', 'image', 'video', 'quote', 'link' ) );

	// Setup the WordPress core custom background feature.
	add_theme_support( 'custom-background', apply_filters( 'govpress_custom_background_args', array(
		'default-color' => 'f8f8f8',
		'default-image' => '',
	) ) );

	// Enable support for HTML5 markup.
	add_theme_support( 'html5', array( 'comment-list', 'search-form', 'comment-form', ) );

	// Enable support for post thumbnails.
	add_theme_support( 'post-thumbnails' );

	// Post editor styles
	add_editor_style( 'editor-style.css' );

	// Theme layouts
	add_theme_support(
		'theme-layouts',
		array(
			'single-column' => __( '1 Column', 'govpress' ),
			'sidebar-right' => __( '2 Columns: Content / Sidebar', 'govpress' ),
			'sidebar-left' => __( '2 Columns: Sidebar / Content', 'govpress' )
		),
		array( 'default' => 'sidebar-right' )
	);

}
endif; // govpress_setup
add_action( 'after_setup_theme', 'govpress_setup' );

/**
 * Register widgetized area and update sidebar with default widgets.
 */
function govpress_widgets_init() {

	register_sidebar( array(
				'name'          => __( 'Header Nav', 'govpress' ),
				'id'            => 'header-nav',
				'before_widget' => '<aside id="%1$s" class="widget %2$s">',
				'after_widget'  => '</aside>',
				'before_title'  => '<h2 class="widget-title">',
				'after_title'   => '</h2>',
		) );

	register_sidebar( array(
				'name'          => __( 'Home Page Hero', 'govpress' ),
				'id'            => 'home-page-hero',
				'before_widget' => '<aside id="%1$s" class="widget %2$s">',
				'after_widget'  => '</aside>',
				'before_title'  => '<h2 class="widget-title">',
				'after_title'   => '</h2>',
		) );

		register_sidebar( array(
				'name'          => __( 'Home Page Featured', 'govpress' ),
				'id'            => 'home-page-featured',
				'before_widget' => '<aside id="%1$s" class="widget %2$s">',
				'after_widget'  => '</aside>',
				'before_title'  => '<h2 class="widget-title">',
				'after_title'   => '</h2>',
		) );

	register_sidebar( array(
		'name'          => __( 'Sidebar', 'govpress' ),
		'id'            => 'primary',
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
		'before_title'  => '<h1 class="widget-title">',
		'after_title'   => '</h1>',
	) );

	register_sidebar( array(
		'name'          => __( 'Footer Area One', 'govpress' ),
		'id'            => 'footer-1',
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
		'before_title'  => '<h4 class="widget-title">',
		'after_title'   => '</h4>',
	) );

	register_sidebar( array(
		'name'          => __( 'Footer Area Two', 'govpress' ),
		'id'            => 'footer-2',
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
		'before_title'  => '<h4 class="widget-title">',
		'after_title'   => '</h4>',
	) );

	register_sidebar( array(
		'name'          => __( 'Footer Area Three', 'govpress' ),
		'id'            => 'footer-3',
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
		'before_title'  => '<h4 class="widget-title">',
		'after_title'   => '</h4>',
	) );

	register_sidebar( array(
		'name'          => __( 'Footer Text', 'govpress' ),
		'id'            => 'footer-text',
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
		'before_title'  => '<h4 class="widget-title">',
		'after_title'   => '</h4>',
	) );
}
add_action( 'widgets_init', 'govpress_widgets_init' );

/**
 * Enqueue scripts and styles.
 */
function govpress_scripts() {

	wp_enqueue_style( 'govpress-style', get_stylesheet_uri(), GOVPRESS_VERSION );

	// Use style-rtl.css for RTL layouts
	wp_style_add_data( 'govpress-style', 'rtl', 'replace' );

	wp_enqueue_script(
		'govpress-theme',
		get_template_directory_uri() . '/js/combined-min.js',
		array( 'jquery' ),
		GOVPRESS_VERSION,
		true
	);

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'govpress_scripts' );

/**
 * Enqueue fonts
 */
function govpress_fonts() {

	wp_enqueue_style(
		'fontawesome',
		get_template_directory_uri() . '/fonts/font-awesome/font-awesome.css',
		array(),
		'4.5.0'
	);

	 /* Translators: If there are characters in your language that are not
		* supported by Open Sans, translate this to 'off'. Do not translate
		* into your own language.
		*/
		$font = _x( 'active', 'Open Sans font: active or inactive', 'govpress' );

		if ( 'inactive' !== $font ) :

				$font_families = array();
				$font_families[] = 'Open Sans:300italic,400italic,600italic,700italic,400,600,700,300';

				$query_args = array(
						'family' => urlencode( implode( '|', $font_families ) ),
						'subset' => urlencode( 'latin,latin-ext' ),
				);

				$font_url = add_query_arg( $query_args, '//fonts.googleapis.com/css' );

		wp_enqueue_style(
				'govpress-open-sans',
				$font_url,
				array(),
				null,
				'screen'
		);

		endif;

}
add_action( 'wp_enqueue_scripts', 'govpress_fonts' );

/**
 * Implement the Custom Header feature.
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Custom functions that act independently of the theme templates.
 */
require get_template_directory() . '/inc/extras.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 */
require get_template_directory() . '/inc/jetpack.php';

/**
 * Icon Menu Walker
 */
require get_template_directory() . '/inc/icon-menu-extras.php';

/**
 * Layout options
 */
require get_template_directory() . '/inc/theme-layouts.php';
