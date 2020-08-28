<?php


/**
 * 4.01
 * Add Columns @ Issues Admin Panel
 *
 */


add_filter( 'manage_edit-imc_issues_columns', 'imcplus_admincol_add' ) ;

function imcplus_admincol_add( $columns ) {

	$columns = array(
		'cb' => '<input type="checkbox" />',
		'issue-id' => __( 'Issue ID' , 'improve-my-city' ),
		'title' => __( 'Issue' , 'improve-my-city' ),
		'imccategory' => __( 'Issue Category'  , 'improve-my-city' ),
		'imcstatus' => __( 'Issue Status' , 'improve-my-city'  ),
		'author' => __( 'Author' , 'improve-my-city'  ),
		'comments' => '<span class="vers comment-grey-bubble" title="Comments"><span class="screen-reader-text">'.__('Comments' , 'improve-my-city').'</span></span>',
		'date' => __( 'Date' , 'improve-my-city' )
	);

	return $columns;
}


add_action( 'manage_imc_issues_posts_custom_column', 'imcplus_admincol_manage', 10, 2 );

function imcplus_admincol_manage( $column, $post_id ) {
	global $post;

	switch( $column ) {

		/* If displaying the 'imccategory' column. */
		case 'imccategory' :

			/* Get the terms. */
			$category_link_obj = get_the_term_list( $post_id, 'imccategory' );
			$category_link = new SimpleXMLElement($category_link_obj);

			$category_arr = get_the_terms($post->ID , 'imccategory' );
			$term_thumb = get_term_by('id', $category_arr[0]->term_id, 'imccategory');
			$cat_thumb_arr = wp_get_attachment_image_src( $term_thumb->term_image);

			$plugin_path_url = imc_calculate_plugin_base_url();

			if ( empty( $category_arr ) ) {
				/* If no imccategory is found, output a default message. */
				echo __( 'Unknown Category' , 'improve-my-city' );

			} else if ($cat_thumb_arr[0]) {

				echo '<a href="'.$category_link['href'].'" target="_blank"><img style="margin-right: 2px;" width="20" height="20" src="'. $cat_thumb_arr[0].'"></a>&nbsp;' . $category_link_obj;

			} else {
				echo '<a href="'.$category_link['href'].'" target="_blank"><img style="margin-right: 2px;" width="20" height="20" src='. $plugin_path_url.'/img/ic_default_cat.png></a>&nbsp;' . $category_link_obj;

			}

			break;

		/* If displaying the 'imcstatus' column. */
		case 'imcstatus' :

			/* Get the terms. */
			$status = get_the_term_list( $post_id, 'imcstatus' );

			//The color of status is in wp_options table so:
			//Returns Array of Term ID's for "tax_imcstatus_color_"
			$term_list = wp_get_post_terms($post_id, 'imcstatus', array("fields" => "ids"));
			$color = 'eeeeee';

			if ( $term_list ) {
				foreach ( $term_list as $term_color ) {
					//real label of the saved option
					//tax_imcstatus_color_ + the id of status
					$option_label = 'tax_imcstatus_color_' . $term_color;

					//the desired color code			
					$term_data = get_option($option_label);

					if ($term_data) {
						$color = $term_data;
					}
				}
				// if the issue's category admin mail is blank
				// we notify website's admin
			}

			if ( empty( $status ) ) {
				/* If no imcstatus is found, output a default message. */
				echo __( 'Unknown Status' , 'improve-my-city' );

			} else {
				echo '<div style="width:20px;height:20px;float:left;margin-right:2px;border-radius:10px;background-color:#' . $color . '"></div>&nbsp;' . $status;
			}

			break;

		case 'issue-id' :

			echo '#' . get_the_ID();
			break;

		/* Just break out of the switch statement for everything else. */
		default :
			break;
	}
}

/************************************************************************************************************************/


/**
 * 4.02
 * Make Columns of the IMC Issues sortable
 *
 *
 */

function imcplus_sortablecol_byid( $columns ) {
	$columns['issue-id'] = 'issue-id';
	return $columns;
}

function imcplus_sortablecol_bycategory( $columns ) {
	$columns['imccategory'] = 'imccategory';
	return $columns;
}

function imcplus_sortablecol_bystatus( $columns ) {
	$columns['imcstatus'] = 'imcstatus';
	return $columns;
}

function imcplus_sortablecol_byauthor( $columns ) {
	$columns['author'] = 'author';
	return $columns;
}

add_filter( 'manage_edit-imc_issues_sortable_columns', 'imcplus_sortablecol_byid' );
add_filter( 'manage_edit-imc_issues_sortable_columns', 'imcplus_sortablecol_bycategory' );
add_filter( 'manage_edit-imc_issues_sortable_columns', 'imcplus_sortablecol_bystatus' );
add_filter( 'manage_edit-imc_issues_sortable_columns', 'imcplus_sortablecol_byauthor' );


/************************************************************************************************************************/


/**
 * 4.03
 * Enable Filtering @ issues' admin columns
 *
 */

/*********************************************** Filter by imccategory **********************************************/

add_action( 'restrict_manage_posts', 'my_restrict_manage_posts' );

function my_restrict_manage_posts() {
	global $typenow, $post, $post_id;

	if( $typenow != "page" && $typenow != "post" ){
		//get post type
		$post_type=get_query_var('post_type');

		//get taxonomy associated with current post type
		$taxonomies = get_object_taxonomies($post_type);

		//in next loop add filter for tax
		if ($taxonomies) {
			foreach ($taxonomies as $tax_slug) {
				$tax_obj = get_taxonomy($tax_slug);
				$tax_name = $tax_obj->labels->name;
				$terms = get_terms($tax_slug);
				echo "<select name='$tax_slug' id='$tax_slug' class='postform'>";
				echo "<option value=''>Show All $tax_name</option>";
				foreach ($terms as $term) {
					$label = (isset($_GET[$tax_slug])) ? $_GET[$tax_slug] : ''; // Fix
					echo '<option value='. $term->slug, $label == $term->slug ? ' selected="selected"' : '','>' . $term->name .' (' . $term->count .')</option>';
				}
				echo "</select>";
			}
		}
	}
}



//// Display filtering by imccategory
//add_action('restrict_manage_posts', 'imcplus_filtercol_bycategory_add');
//
//function imcplus_filtercol_bycategory_add() {
//	global $typenow;
//	$post_type = 'imc_issues';
//	$taxonomy  = 'imccategory';
//	if ($typenow == $post_type) {
//		$selected      = isset($_GET[$taxonomy]) ? $_GET[$taxonomy] : '';
//		$info_taxonomy = get_taxonomy($taxonomy);
//		wp_dropdown_categories(array(
//			'show_option_all' => __('Show All Categories' , 'improve-my-city'),
//			'taxonomy'        => $taxonomy,
//			'name'            => $taxonomy,
//			'orderby'         => 'name',
//			'selected'        => $selected,
//			'show_count'      => true,
//			'hide_empty'      => false,
//		));
//	};
//}
//
//// Filter posts by imccategory implementation
//add_filter('parse_query', 'imcplus_filtercol_bycategory_impl');
//
//function imcplus_filtercol_bycategory_impl($query) {
//	global $pagenow;
//	$post_type = 'imc_issues';
//	$taxonomy  = 'imccategory';
//	$q_vars    = &$query->query_vars;
//	if ( $pagenow == 'edit.php' && isset($q_vars['post_type']) && $q_vars['post_type'] == $post_type && isset($q_vars[$taxonomy]) && is_numeric($q_vars[$taxonomy]) && $q_vars[$taxonomy] != 0 ) {
//		$term = get_term_by('id', $q_vars[$taxonomy], $taxonomy);
//		$q_vars[$taxonomy] = $term->slug;
//	}
//}
//
//
///*********************************************** Filter by imcstatus **********************************************/
//
////Display filtering by imcstatus
//add_action('restrict_manage_posts', 'imcplus_filtercol_bystatus_add');
//
//function imcplus_filtercol_bystatus_add() {
//	global $typenow;
//	$post_type = 'imc_issues';
//	$taxonomy  = 'imcstatus';
//	if ($typenow == $post_type) {
//		$selected      = isset($_GET[$taxonomy]) ? $_GET[$taxonomy] : '';
//		$info_taxonomy = get_taxonomy($taxonomy);
//		wp_dropdown_categories(array(
//			'show_option_all' => __('Show All Statuses' , 'improve-my-city'),
//			'taxonomy'        => $taxonomy,
//			'name'            => $taxonomy,
//			'orderby'         => 'name',
//			'selected'        => $selected,
//			'show_count'      => true,
//			'hide_empty'      => false,
//		));
//	};
//}
//
////Filter posts by imcstatus implementation
//add_filter('parse_query', 'imcplus_filtercol_bystatus_impl');
//
//function imcplus_filtercol_bystatus_impl($query) {
//	global $pagenow;
//	$post_type = 'imc_issues';
//	$taxonomy  = 'imcstatus';
//	$q_vars    = &$query->query_vars;
//	if ( $pagenow == 'edit.php' && isset($q_vars['post_type']) && $q_vars['post_type'] == $post_type && isset($q_vars[$taxonomy]) && is_numeric($q_vars[$taxonomy]) && $q_vars[$taxonomy] != 0 ) {
//		$term = get_term_by('id', $q_vars[$taxonomy], $taxonomy);
//		$q_vars[$taxonomy] = $term->slug;
//	}
//}
//
//
///*********************************************** Filter by author **********************************************/
//
////Display filtering by imcstatus
//add_action('restrict_manage_posts','imcplus_filtercol_byauthor_add');
//
//function imcplus_filtercol_byauthor_add(){
//
//	//execute only on imc_issues
//	global $post_type;
//	if($post_type == 'imc_issues'){
//		//get a listing of all users that are 'author' or above
//		$user_args = array(
//			'show_option_all'   => __('Show All Authors' , 'improve-my-city'),
//			'orderby'           => 'display_name',
//			'order'             => 'ASC',
//			'name'              => 'author_admin_filter',
//			'who'               => 'authors',
//			'include_selected'  => true
//		);
//		//determine if we have selected a user to be filtered by already
//		if(isset($_GET['author_admin_filter'])){
//			//set the selected value to the value of the author
//			$user_args['selected'] = intval(sanitize_text_field($_GET['author_admin_filter']), 10);
//		}
//
//		//display the users as a drop down
//		wp_dropdown_users($user_args);
//	}
//
//}
//
////Filter posts by author implementation
//add_action('pre_get_posts','imcplus_filtercol_byauthor_impl');
//
//function imcplus_filtercol_byauthor_impl($query){
//
//	global $post_type, $pagenow;
//
//	//if we are currently on the edit screen of the post type listings
//	if($pagenow == 'edit.php' && $post_type == 'imc_issues'){
//
//		if(isset($_GET['author_admin_filter'])){
//
//			//set the query variable for 'author' to the desired value
//			$author_id = sanitize_text_field($_GET['author_admin_filter']);
//
//			//if the author is not 0 (meaning all)
//			if($author_id != 0){
//				$query->query_vars['author'] = $author_id;
//			}
//
//		}
//	}
//}



?>