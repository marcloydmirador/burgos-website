<?php

/**
 * 1.01
 * Register imc_issues
 *
 */


add_action( 'init', 'imccreation_regissues' );

function imccreation_regissues() {

	$labels = array(
		'name'               => _x( 'Issues', 'post type general name', 'improve-my-city'),
		'singular_name'      => _x( 'Issue', 'post type singular name', 'improve-my-city'),
		'menu_name'          => _x( 'Improve My City', 'admin menu', 'improve-my-city'),
		'name_admin_bar'     => _x( 'Issue', 'add new on admin bar', 'improve-my-city'),
		'add_new'            => _x( 'Add New', 'add new on menu', 'improve-my-city'),
		'add_new_item'       => __( 'Add New Issue', 'improve-my-city'),
		'new_item'           => __( 'New Issue', 'improve-my-city'),
		'edit'               => __( 'Edit ', 'improve-my-city'),
		'edit_item'          => __( 'Edit Issue', 'improve-my-city'),
		'view'               => __( 'View', 'improve-my-city'),
		'view_item'          => __( 'View Issue', 'improve-my-city'),
		'all_items'          => __( 'All Issues', 'improve-my-city'),
		'search_items'       => __( 'Search Issues', 'improve-my-city'),
		'parent_item_colon'  => __( 'Parent Issues:', 'improve-my-city' ),
		'parent'             => __( 'Parent Issue', 'improve-my-city' ),
		'not_found'          => __( 'No issues found.', 'improve-my-city' ),
		'not_found_in_trash' => __( 'No issues found in Trash.', 'improve-my-city' )
	);

	$args = array(
		'labels'             => $labels,
		'description'        => __( 'Description.', 'improve-my-city'),
		'public'             => true,
		'capability_type' => 'imc_issues',
		'capabilities' => array(
			'publish_posts' => 'publish_issues',
			'edit_posts' => 'edit_issues',
			'edit_others_posts' => 'edit_others_issues',
			'delete_posts' => 'delete_issues',
			'delete_others_posts' => 'delete_others_issues',
			'read_private_posts' => 'read_private_issues',
			'edit_post' => 'edit_issue',
			'delete_post' => 'delete_issue',
			'read_post' => 'read_issue',
		),
		'has_archive'        => true,
		'hierarchical'       => false,
		'menu_position'      => 15,
		'menu_icon'          => 'dashicons-universal-access-alt',
		'publicly_queryable' => true,
		'exclude_from_search' => false,
		'query_var'          => true,
		'taxonomies'         => array('imccategory','imcstatus'),
		'show_in_rest'       => true,
		'rest_base'          => 'issues-api',
		'rest_controller_class' => 'WP_REST_Posts_Controller',
		'supports'           => array( 'title', 'editor', 'comments', 'thumbnail', 'custom-fields' )
	);

	// Check options if user added custom slug
	$generaloptions = get_option( 'general_settings' );
	$SlugOption = $generaloptions["imc_custom_slug"];

	if($SlugOption!=''){
		$SlugOption = explode(' ',trim($SlugOption));
		$args['rewrite'] = array( 'slug' => $SlugOption[0] );
	}

	register_post_type( 'imc_issues', $args );

}





function imcplus_myrewrite_flush() {
	// First, we "add" the custom post type via the above written function.
	// Note: "add" is written with quotes, as CPTs don't get added to the DB,
	// They are only referenced in the post_type column with a post entry,
	// when you add a post of this CPT.
	imccreation_regissues();

	// ATTENTION: This is *only* done during plugin activation hook in this example!
	// You should *NEVER EVER* do this on every page load!!
	flush_rewrite_rules();
}
register_activation_hook( __FILE__, 'imcplus_myrewrite_flush' );


/************************************************************************************************************************/


/**
 * 1.02
 * Set "single_template" for imc_issues.
 *
 * It will replace the template "single.php".
 */

function imcplus_set_single_imc_issues_template($single_template) {
	global $post;

	if ($post->post_type == 'imc_issues') {
		$single_template = dirname( __FILE__ ) . '/templates/single-imc_issues.php';
	}
	return $single_template;
}

add_filter( 'single_template', 'imcplus_set_single_imc_issues_template' );




/************************************************************************************************************************/


/**
 * 1.03
 * Set "archive_template" for imc_issues.
 *
 * It will replace the template "archive.php".
 */

function imcplus_set_archive_imc_issues_template($archive_template) {
	global $post;

	if ($post->post_type == 'imc_issues') {
		$archive_template = dirname( __FILE__ ) . '/templates/archive-imc_issues.php';
	}
	return $archive_template;
}

add_filter( 'archive_template', 'imcplus_set_archive_imc_issues_template' );






?>