-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2020 at 02:40 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_burgoswebss20`
--

-- --------------------------------------------------------

--
-- Table structure for table `burg_commentmeta`
--

CREATE TABLE `burg_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `burg_comments`
--

CREATE TABLE `burg_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `burg_comments`
--

INSERT INTO `burg_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-08-25 03:53:14', '2020-08-25 03:53:14', 'Hi, this is a comment.\r\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\r\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `burg_imc_keys`
--

CREATE TABLE `burg_imc_keys` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `quota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `burg_imc_logs`
--

CREATE TABLE `burg_imc_logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `issueid` int(11) NOT NULL,
  `stepid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transition_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeline_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `theColor` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `burg_imc_posts_index`
--

CREATE TABLE `burg_imc_posts_index` (
  `id` int(11) UNSIGNED NOT NULL,
  `issueid` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `burg_imc_tokens`
--

CREATE TABLE `burg_imc_tokens` (
  `id` int(11) NOT NULL,
  `key_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `json_size` int(11) NOT NULL,
  `method` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unixtime` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `burg_imc_users_firebase`
--

CREATE TABLE `burg_imc_users_firebase` (
  `id` int(11) UNSIGNED NOT NULL,
  `userid` int(11) UNSIGNED NOT NULL,
  `firebaseid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topicid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `burg_imc_users_slogin`
--

CREATE TABLE `burg_imc_users_slogin` (
  `id` int(11) UNSIGNED NOT NULL,
  `userid` int(11) UNSIGNED NOT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `burg_imc_votes`
--

CREATE TABLE `burg_imc_votes` (
  `id` int(11) UNSIGNED NOT NULL,
  `issueid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modality` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `burg_links`
--

CREATE TABLE `burg_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `burg_options`
--

CREATE TABLE `burg_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `burg_options`
--

INSERT INTO `burg_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'https://localhost/git/burgos-website', 'yes'),
(2, 'home', 'https://localhost/git/burgos-website', 'yes'),
(3, 'blogname', 'Municipality of Burgos, Pangasinan - Website Portal', 'yes'),
(4, 'blogdescription', 'Ili ti Burgos', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'marcloyd.mirador@live.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '', 'yes'),
(29, 'rewrite_rules', '', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:35:\"improve-my-city/improve-my-city.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'govpress', 'yes'),
(41, 'stylesheet', 'govpress', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '48748', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:0:{}', 'yes'),
(78, 'widget_rss', 'a:0:{}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '7', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1613879593', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'initial_db_version', '48748', 'yes'),
(96, 'burg_user_roles', 'a:6:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:72:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:17:\"manage_imc_issues\";b:1;s:15:\"edit_imc_issues\";b:1;s:14:\"publish_issues\";b:1;s:11:\"edit_issues\";b:1;s:18:\"edit_others_issues\";b:1;s:13:\"delete_issues\";b:1;s:20:\"delete_others_issues\";b:1;s:19:\"read_private_issues\";b:1;s:10:\"edit_issue\";b:1;s:12:\"delete_issue\";b:1;s:10:\"read_issue\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:40:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"edit_imc_issues\";b:1;s:14:\"publish_issues\";b:1;s:11:\"edit_issues\";b:1;s:19:\"read_private_issues\";b:1;s:10:\"edit_issue\";b:1;s:10:\"read_issue\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:16:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:15:\"edit_imc_issues\";b:1;s:14:\"publish_issues\";b:1;s:11:\"edit_issues\";b:1;s:19:\"read_private_issues\";b:1;s:10:\"edit_issue\";b:1;s:10:\"read_issue\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:7:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:15:\"edit_imc_issues\";b:1;s:19:\"read_private_issues\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:4:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;s:15:\"edit_imc_issues\";b:1;s:19:\"read_private_issues\";b:1;}}s:9:\"dep_admin\";a:2:{s:4:\"name\";s:16:\"Department Admin\";s:12:\"capabilities\";a:14:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;s:17:\"manage_imc_issues\";b:1;s:15:\"edit_imc_issues\";b:1;s:14:\"publish_issues\";b:1;s:11:\"edit_issues\";b:1;s:18:\"edit_others_issues\";b:1;s:13:\"delete_issues\";b:1;s:20:\"delete_others_issues\";b:1;s:19:\"read_private_issues\";b:1;s:10:\"edit_issue\";b:1;s:12:\"delete_issue\";b:1;s:10:\"read_issue\";b:1;s:12:\"upload_files\";b:1;}}}', 'yes'),
(97, 'fresh_site', '0', 'yes'),
(98, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:9:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"primary\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:14:\"home-page-hero\";a:0:{}s:18:\"home-page-featured\";a:0:{}s:8:\"footer-1\";a:0:{}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:11:\"footer-text\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(104, 'cron', 'a:7:{i:1599137600;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1599148400;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1599191599;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1599191607;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1599191609;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1599623599;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(105, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'recovery_keys', 'a:0:{}', 'yes'),
(116, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.1-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.5.1-partial-0.zip\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:3:\"5.5\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.1-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.5.1-partial-0.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.1-rollback-0.zip\";}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:3:\"5.5\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1599136326;s:15:\"version_checked\";s:3:\"5.5\";s:12:\"translations\";a:0:{}}', 'no'),
(133, 'can_compress_scripts', '1', 'no'),
(140, 'recently_activated', 'a:0:{}', 'yes'),
(146, 'finished_updating_comment_type', '1', 'yes'),
(147, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1599136328;s:7:\"checked\";a:3:{s:19:\"akismet/akismet.php\";s:5:\"4.1.6\";s:9:\"hello.php\";s:5:\"1.7.2\";s:35:\"improve-my-city/improve-my-city.php\";s:5:\"1.4.4\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:3:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.6\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}s:35:\"improve-my-city/improve-my-city.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:29:\"w.org/plugins/improve-my-city\";s:4:\"slug\";s:15:\"improve-my-city\";s:6:\"plugin\";s:35:\"improve-my-city/improve-my-city.php\";s:11:\"new_version\";s:5:\"1.4.4\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/improve-my-city/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/improve-my-city.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/improve-my-city/assets/icon-256x256.png?rev=1452523\";s:2:\"1x\";s:68:\"https://ps.w.org/improve-my-city/assets/icon-128x128.png?rev=1452523\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:71:\"https://ps.w.org/improve-my-city/assets/banner-1544x500.png?rev=1389013\";s:2:\"1x\";s:70:\"https://ps.w.org/improve-my-city/assets/banner-772x250.png?rev=1389013\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(148, 'hclpage', '7', 'yes'),
(152, 'theme_mods_twentytwenty', 'a:2:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1598584494;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}s:18:\"nav_menu_locations\";a:0:{}}', 'yes'),
(153, 'current_theme', 'GovPress', 'yes'),
(154, 'theme_mods_govpress', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1598584481;s:4:\"data\";a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"primary\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:14:\"home-page-hero\";a:0:{}s:18:\"home-page-featured\";a:0:{}s:8:\"footer-1\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:11:\"footer-text\";a:0:{}}}}', 'yes'),
(155, 'theme_switched', '', 'yes'),
(164, 'WPLANG', '', 'yes'),
(165, 'new_admin_email', 'marcloyd.mirador@live.com', 'yes'),
(173, '_transient_health-check-site-status-result', '{\"good\":8,\"recommended\":9,\"critical\":3}', 'yes'),
(196, 'theme_mods_twentynineteen', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1598584527;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(199, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1599136328;s:7:\"checked\";a:4:{s:8:\"govpress\";s:5:\"1.5.2\";s:14:\"twentynineteen\";s:3:\"1.7\";s:15:\"twentyseventeen\";s:3:\"2.4\";s:12:\"twentytwenty\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:4:{s:8:\"govpress\";a:6:{s:5:\"theme\";s:8:\"govpress\";s:11:\"new_version\";s:5:\"1.5.2\";s:3:\"url\";s:38:\"https://wordpress.org/themes/govpress/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/theme/govpress.1.5.2.zip\";s:8:\"requires\";b:0;s:12:\"requires_php\";b:0;}s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.7.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.5.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}', 'no'),
(207, '_transient_is_multi_author', '0', 'yes'),
(222, '_site_transient_timeout_theme_roots', '1599138122', 'no'),
(223, '_site_transient_theme_roots', 'a:4:{s:8:\"govpress\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";}', 'no'),
(224, '_site_transient_timeout_php_check_9ebfd0137bc00e03d9dbfb76ffb119e8', '1599741123', 'no'),
(225, '_site_transient_php_check_9ebfd0137bc00e03d9dbfb76ffb119e8', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `burg_postmeta`
--

CREATE TABLE `burg_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `burg_postmeta`
--

INSERT INTO `burg_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_wp_page_template', '/templates/insert-imc_issues.php'),
(4, 6, '_wp_page_template', '/templates/edit-imc_issues.php'),
(5, 7, '_wp_page_template', '/templates/archive-imc_issues.php'),
(7, 1, '_edit_lock', '1598335503:1'),
(10, 1, '_edit_last', '1'),
(13, 1, '_pingme', '1'),
(14, 1, '_encloseme', '1'),
(15, 7, '_edit_lock', '1599136839:1'),
(16, 7, '_edit_last', '1');

-- --------------------------------------------------------

--
-- Table structure for table `burg_posts`
--

CREATE TABLE `burg_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `burg_posts`
--

INSERT INTO `burg_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-08-25 03:53:14', '2020-08-25 03:53:14', '<!-- wp:paragraph -->\n<p>Mayor Ngayawan praises Proud Burgoz citizen for using city’s Makatulong P5K aid for fishball cart business Mayor Abby Binay on Friday took to Twitter to express her admiration for a Makatizen who used the…</p>\n<!-- /wp:paragraph -->', 'Official Website of Burgos City', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2020-08-25 06:03:06', '2020-08-25 06:03:06', '', 0, 'https://localhost/git/burgos-website/?p=1', 0, 'post', '', 1),
(2, 1, '2020-08-25 03:53:14', '2020-08-25 03:53:14', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"https://localhost/git/burgos-website/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2020-08-25 03:53:14', '2020-08-25 03:53:14', '', 0, 'https://localhost/git/burgos-website/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-08-25 03:53:14', '2020-08-25 03:53:14', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: https://localhost/git/burgos-website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2020-08-25 03:53:14', '2020-08-25 03:53:14', '', 0, 'https://localhost/git/burgos-website/?page_id=3', 0, 'page', '', 0),
(5, 0, '2020-08-25 03:54:37', '2020-08-25 03:54:37', '', 'IMC - Report Issue page', '', 'publish', 'closed', 'closed', '', 'imc-report-issue', '', '', '2020-08-25 03:54:37', '2020-08-25 03:54:37', '', 0, 'https://localhost/git/burgos-website/?page_id=5', 0, 'page', '', 0),
(6, 0, '2020-08-25 03:54:37', '2020-08-25 03:54:37', '', 'IMC - Edit Issue page', '', 'publish', 'closed', 'closed', '', 'imc-edit-issue', '', '', '2020-08-25 03:54:37', '2020-08-25 03:54:37', '', 0, 'https://localhost/git/burgos-website/?page_id=6', 0, 'page', '', 0),
(7, 1, '2020-08-25 03:54:37', '2020-08-25 03:54:37', '<!-- wp:html -->\n<div _ngcontent-c24=\"\" class=\"\">\n    <h2 _ngcontent-c24=\"\">Services That You Can Avail</h2>\n    \n\n        <!----><div _ngcontent-c24=\"\" class=\"list-group search-results z-depth-1\">\n\n             <!---->\n\n             <!---->\n             <select id=\"searchForms\">\n  <option value=\"\"></option>\n  <option value=\"ENGINEERING / BUILDING OFFICIAL SERVICES\">ENGINEERING / BUILDING OFFICIAL SERVICES</option>\n  <option value=\"GENERAL SERVICES\">GENERAL SERVICES</option>\n  <option value=\"SOCIAL WELFARE SERVICES\">SOCIAL WELFARE SERVICES</option>\n  <option value=\"BUSINESS PERMIT AND LICENSING SERVICES\">BUSINESS PERMIT AND LICENSING SERVICES</option>\n  <option value=\"CIVIL REGISTRY SERVICES\">CIVIL REGISTRY SERVICES</option>\n  <option value=\"TREASURY SERVICES\">TREASURY SERVICES</option>\n  <option value=\"MUNICIPAL WATERWORKS SERVICES\">MUNICIPAL WATERWORKS SERVICES</option>\n  <option value=\"MUNICIPAL HEALTH SERVICE\">MUNICIPAL HEALTH SERVICE</option>\n</select>\n        </div>\n    </div>\n    <div _ngcontent-c24=\"\" class=\"d-flex flex-row-reverse\">\n        <a _ngcontent-c24=\"\" class=\"text-white c-pointer\" href=\"/content/i-want-to\">View all</a>\n    </div>\n</div>\n<!-- /wp:html -->', 'Home', '', 'publish', 'closed', 'closed', '', 'improve-my-city', '', '', '2020-08-28 03:26:25', '2020-08-28 03:26:25', '', 0, 'https://localhost/git/burgos-website/?page_id=7', 0, 'page', '', 0),
(9, 1, '2020-08-25 05:45:38', '2020-08-25 05:45:38', '<!-- wp:paragraph -->\n<p>Mayor Ngayawan praises Proud Burgoz citizen for using city’s Makatulong P5K aid for fishball cart business Mayor Abby Binay on Friday took to Twitter to express her admiration for a Makatizen who used the…</p>\n<!-- /wp:paragraph -->', 'Official Website of Burgos CIty', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2020-08-25 05:45:38', '2020-08-25 05:45:38', '', 1, 'https://localhost/git/burgos-website/?p=9', 0, 'revision', '', 0),
(10, 1, '2020-08-25 06:03:03', '2020-08-25 06:03:03', '<!-- wp:paragraph -->\n<p>Mayor Ngayawan praises Proud Burgoz citizen for using city’s Makatulong P5K aid for fishball cart business Mayor Abby Binay on Friday took to Twitter to express her admiration for a Makatizen who used the…</p>\n<!-- /wp:paragraph -->', 'Official Website of Burgos City', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2020-08-25 06:03:03', '2020-08-25 06:03:03', '', 1, 'https://localhost/git/burgos-website/?p=10', 0, 'revision', '', 0),
(11, 1, '2020-08-28 02:39:04', '2020-08-28 02:39:04', '', 'Home', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2020-08-28 02:39:04', '2020-08-28 02:39:04', '', 7, 'https://localhost/git/burgos-website/?p=11', 0, 'revision', '', 0),
(12, 1, '2020-08-28 03:16:39', '2020-08-28 03:16:39', '<!-- wp:paragraph -->\n<p>test</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2020-08-28 03:16:39', '2020-08-28 03:16:39', '', 7, 'https://localhost/git/burgos-website/?p=12', 0, 'revision', '', 0),
(14, 1, '2020-08-28 03:18:51', '2020-08-28 03:18:51', '<!-- wp:html -->\n<div _ngcontent-c24=\"\" class=\"\">\n    <h2 _ngcontent-c24=\"\">Services That You Can Avail</h2>\n    <div _ngcontent-c24=\"\" class=\"p-relative\">\n        <span _ngcontent-c24=\"\" class=\"c-pointer text-dark show-all\">\n            <i _ngcontent-c24=\"\" aria-hidden=\"true\" class=\"fa fa-caret-down\"></i>\n        </span>\n        <shrd-dynamic-form _ngcontent-c24=\"\" _nghost-c10=\"\"><form _ngcontent-c10=\"\" class=\"dynamic-form ng-pristine ng-valid ng-touched\" novalidate=\"\">\n      <div _ngcontent-c10=\"\" class=\"loading\">\n          <dyna-loading _ngcontent-c10=\"\" _nghost-c32=\"\"><div _ngcontent-c32=\"\" class=\" d-flex h-100 w-100\">\n  <div _ngcontent-c32=\"\" class=\"d-flex align-items-center flex-column m-auto\">\n      <div _ngcontent-c32=\"\" class=\"spinner\">\n        <div _ngcontent-c32=\"\" class=\"bounce1\"></div>\n        <div _ngcontent-c32=\"\" class=\"bounce2\"></div>\n        <div _ngcontent-c32=\"\" class=\"bounce3\"></div>\n      </div>\n      <small _ngcontent-c32=\"\" class=\"\">Please wait.</small>\n  </div>\n</div>\n</dyna-loading>\n      </div>\n      <dyn-input-field _ngcontent-c10=\"\"><!----><div>\n        <!----><!----><form-input>\n  <div class=\"form-group ng-pristine ng-valid ng-touched\">\n    <!---->\n    <!---->\n    <div class=\"\">\n      <input class=\"form-control ng-pristine ng-valid ng-touched\" type=\"text\" placeholder=\"Search\">\n      <!---->\n    </div>\n  </div>\n  </form-input>\n            \n            <!---->\n        \n</div>\n\n\n<!---->\n\n\n</dyn-input-field>\n</form>\n</shrd-dynamic-form>\n\n        <!----><div _ngcontent-c24=\"\" class=\"list-group search-results z-depth-1\">\n\n             <!---->\n\n             <!---->\n<a _ngcontent-c24=\"\" class=\"list-group-item list-group-item-action\" href=\"/content/i-want-to/21/requirements\"> ENGINEERING / BUILDING OFFICIAL SERVICES </a>\n<a _ngcontent-c24=\"\" class=\"list-group-item list-group-item-action\" href=\"/content/i-want-to/141/requirements\"> GENERAL SERVICES </a>\n<a _ngcontent-c24=\"\" class=\"list-group-item list-group-item-action\" href=\"/content/i-want-to/141/requirements\"> SOCIAL WELFARE SERVICES </a><a _ngcontent-c24=\"\" class=\"list-group-item list-group-item-action\" href=\"/content/i-want-to/14/requirements\"> BUSINESS PERMIT AND LICENSING SERVICES</a>\n<a _ngcontent-c24=\"\" class=\"list-group-item list-group-item-action\" href=\"/content/i-want-to/141/requirements\">CIVIL REGISTRY SERVICES</a>\n<a _ngcontent-c24=\"\" class=\"list-group-item list-group-item-action\" href=\"/content/i-want-to/141/requirements\">TREASURY SERVICES</a><a _ngcontent-c24=\"\" class=\"list-group-item list-group-item-action\" href=\"/content/i-want-to/31/requirements\"> MUNICIPAL WATERWORKS SERVICES</a>\n<a _ngcontent-c24=\"\" class=\"list-group-item list-group-item-action\" href=\"/content/i-want-to/17/requirements\"> MUNICIPAL HEALTH SERVICES </a>\n        </div>\n    </div>\n    <div _ngcontent-c24=\"\" class=\"d-flex flex-row-reverse\">\n        <a _ngcontent-c24=\"\" class=\"text-white c-pointer\" href=\"/content/i-want-to\">View all</a>\n    </div>\n</div>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2020-08-28 03:18:51', '2020-08-28 03:18:51', '', 7, 'https://localhost/git/burgos-website/?p=14', 0, 'revision', '', 0),
(15, 1, '2020-08-28 03:23:55', '2020-08-28 03:23:55', '<!-- wp:html -->\n<div _ngcontent-c24=\"\" class=\"\">\n    <h2 _ngcontent-c24=\"\">Services That You Can Avail</h2>\n    <div _ngcontent-c24=\"\" class=\"p-relative\">\n        <span _ngcontent-c24=\"\" class=\"c-pointer text-dark show-all\">\n            <i _ngcontent-c24=\"\" aria-hidden=\"true\" class=\"fa fa-caret-down\"></i>\n        </span>\n        <shrd-dynamic-form _ngcontent-c24=\"\" _nghost-c10=\"\"><form _ngcontent-c10=\"\" class=\"dynamic-form ng-pristine ng-valid ng-touched\" novalidate=\"\">\n      <div _ngcontent-c10=\"\" class=\"loading\">\n          <dyna-loading _ngcontent-c10=\"\" _nghost-c32=\"\"><div _ngcontent-c32=\"\" class=\" d-flex h-100 w-100\">\n  <div _ngcontent-c32=\"\" class=\"d-flex align-items-center flex-column m-auto\">\n      <div _ngcontent-c32=\"\" class=\"spinner\">\n        <div _ngcontent-c32=\"\" class=\"bounce1\"></div>\n        <div _ngcontent-c32=\"\" class=\"bounce2\"></div>\n        <div _ngcontent-c32=\"\" class=\"bounce3\"></div>\n      </div>\n      <small _ngcontent-c32=\"\" class=\"\">Please wait.</small>\n  </div>\n</div>\n</dyna-loading>\n      </div>\n      <dyn-input-field _ngcontent-c10=\"\"><!----><div>\n        <!----><!----><form-input>\n  <div class=\"form-group ng-pristine ng-valid ng-touched\">\n    <!---->\n    <!---->\n    <div class=\"\">\n      <input class=\"form-control ng-pristine ng-valid ng-touched\" type=\"text\" placeholder=\"Search\">\n      <!---->\n    </div>\n  </div>\n  </form-input>\n            \n            <!---->\n        \n</div>\n\n\n<!---->\n\n\n</dyn-input-field>\n</form>\n</shrd-dynamic-form>\n\n        <!----><div _ngcontent-c24=\"\" class=\"list-group search-results z-depth-1\">\n\n             <!---->\n\n             <!---->\n             <select id=\"searchForms\">\n  <option value=\"\"></option>\n  <option value=\"ENGINEERING / BUILDING OFFICIAL SERVICES\">ENGINEERING / BUILDING OFFICIAL SERVICES</option>\n  <option value=\"GENERAL SERVICES\">GENERAL SERVICES</option>\n  <option value=\"SOCIAL WELFARE SERVICES\">SOCIAL WELFARE SERVICES</option>\n  <option value=\"BUSINESS PERMIT AND LICENSING SERVICES\">BUSINESS PERMIT AND LICENSING SERVICES</option>\n  <option value=\"CIVIL REGISTRY SERVICES\">CIVIL REGISTRY SERVICES</option>\n  <option value=\"TREASURY SERVICES\">TREASURY SERVICES</option>\n  <option value=\"MUNICIPAL WATERWORKS SERVICES\">MUNICIPAL WATERWORKS SERVICES</option>\n  <option value=\"MUNICIPAL HEALTH SERVICE\">MUNICIPAL HEALTH SERVICE</option>\n</select>\n        </div>\n    </div>\n    <div _ngcontent-c24=\"\" class=\"d-flex flex-row-reverse\">\n        <a _ngcontent-c24=\"\" class=\"text-white c-pointer\" href=\"/content/i-want-to\">View all</a>\n    </div>\n</div>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2020-08-28 03:23:55', '2020-08-28 03:23:55', '', 7, 'https://localhost/git/burgos-website/?p=15', 0, 'revision', '', 0),
(16, 1, '2020-08-28 03:25:29', '2020-08-28 03:25:29', '<!-- wp:html -->\n<div _ngcontent-c24=\"\" class=\"\">\n    <h2 _ngcontent-c24=\"\">Services That You Can Avail</h2>\n    <div _ngcontent-c24=\"\" class=\"p-relative\">\n        <span _ngcontent-c24=\"\" class=\"c-pointer text-dark show-all\">\n            <i _ngcontent-c24=\"\" aria-hidden=\"true\" class=\"fa fa-caret-down\"></i>\n        </span>\n        <shrd-dynamic-form _ngcontent-c24=\"\" _nghost-c10=\"\"><form _ngcontent-c10=\"\" class=\"dynamic-form ng-pristine ng-valid ng-touched\" novalidate=\"\">\n      <div _ngcontent-c10=\"\" class=\"loading\">\n          <dyna-loading _ngcontent-c10=\"\" _nghost-c32=\"\"><div _ngcontent-c32=\"\" class=\" d-flex h-100 w-100\">\n  <div _ngcontent-c32=\"\" class=\"d-flex align-items-center flex-column m-auto\">\n      <div _ngcontent-c32=\"\" class=\"spinner\">\n        <div _ngcontent-c32=\"\" class=\"bounce1\"></div>\n        <div _ngcontent-c32=\"\" class=\"bounce2\"></div>\n        <div _ngcontent-c32=\"\" class=\"bounce3\"></div>\n      </div>\n      <small _ngcontent-c32=\"\" class=\"\">Please wait.</small>\n  </div>\n</div>\n</dyna-loading>\n      </div>\n      <dyn-input-field _ngcontent-c10=\"\"><!----><div>\n        <!----><!---->\n            \n            <!---->\n        \n</div>\n\n\n<!---->\n\n\n</dyn-input-field>\n</form>\n</shrd-dynamic-form>\n\n        <!----><div _ngcontent-c24=\"\" class=\"list-group search-results z-depth-1\">\n\n             <!---->\n\n             <!---->\n             <select id=\"searchForms\">\n  <option value=\"\"></option>\n  <option value=\"ENGINEERING / BUILDING OFFICIAL SERVICES\">ENGINEERING / BUILDING OFFICIAL SERVICES</option>\n  <option value=\"GENERAL SERVICES\">GENERAL SERVICES</option>\n  <option value=\"SOCIAL WELFARE SERVICES\">SOCIAL WELFARE SERVICES</option>\n  <option value=\"BUSINESS PERMIT AND LICENSING SERVICES\">BUSINESS PERMIT AND LICENSING SERVICES</option>\n  <option value=\"CIVIL REGISTRY SERVICES\">CIVIL REGISTRY SERVICES</option>\n  <option value=\"TREASURY SERVICES\">TREASURY SERVICES</option>\n  <option value=\"MUNICIPAL WATERWORKS SERVICES\">MUNICIPAL WATERWORKS SERVICES</option>\n  <option value=\"MUNICIPAL HEALTH SERVICE\">MUNICIPAL HEALTH SERVICE</option>\n</select>\n        </div>\n    </div>\n    <div _ngcontent-c24=\"\" class=\"d-flex flex-row-reverse\">\n        <a _ngcontent-c24=\"\" class=\"text-white c-pointer\" href=\"/content/i-want-to\">View all</a>\n    </div>\n</div>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2020-08-28 03:25:29', '2020-08-28 03:25:29', '', 7, 'https://localhost/git/burgos-website/?p=16', 0, 'revision', '', 0),
(17, 1, '2020-08-28 03:26:25', '2020-08-28 03:26:25', '<!-- wp:html -->\n<div _ngcontent-c24=\"\" class=\"\">\n    <h2 _ngcontent-c24=\"\">Services That You Can Avail</h2>\n    \n\n        <!----><div _ngcontent-c24=\"\" class=\"list-group search-results z-depth-1\">\n\n             <!---->\n\n             <!---->\n             <select id=\"searchForms\">\n  <option value=\"\"></option>\n  <option value=\"ENGINEERING / BUILDING OFFICIAL SERVICES\">ENGINEERING / BUILDING OFFICIAL SERVICES</option>\n  <option value=\"GENERAL SERVICES\">GENERAL SERVICES</option>\n  <option value=\"SOCIAL WELFARE SERVICES\">SOCIAL WELFARE SERVICES</option>\n  <option value=\"BUSINESS PERMIT AND LICENSING SERVICES\">BUSINESS PERMIT AND LICENSING SERVICES</option>\n  <option value=\"CIVIL REGISTRY SERVICES\">CIVIL REGISTRY SERVICES</option>\n  <option value=\"TREASURY SERVICES\">TREASURY SERVICES</option>\n  <option value=\"MUNICIPAL WATERWORKS SERVICES\">MUNICIPAL WATERWORKS SERVICES</option>\n  <option value=\"MUNICIPAL HEALTH SERVICE\">MUNICIPAL HEALTH SERVICE</option>\n</select>\n        </div>\n    </div>\n    <div _ngcontent-c24=\"\" class=\"d-flex flex-row-reverse\">\n        <a _ngcontent-c24=\"\" class=\"text-white c-pointer\" href=\"/content/i-want-to\">View all</a>\n    </div>\n</div>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2020-08-28 03:26:25', '2020-08-28 03:26:25', '', 7, 'https://localhost/git/burgos-website/?p=17', 0, 'revision', '', 0),
(18, 1, '2020-08-28 03:29:21', '2020-08-28 03:29:21', '<!-- wp:html -->\n<div _ngcontent-c24=\"\" class=\"\">\n    <h2 _ngcontent-c24=\"\">Services That You Can Avail</h2>\n    \n\n        <!----><div _ngcontent-c24=\"\" class=\"list-group search-results z-depth-1\">\n\n             <!---->\n\n             <!---->\n             <select id=\"searchForms\">\n  <option value=\"\"></option>\n  <option value=\"ENGINEERING / BUILDING OFFICIAL SERVICES\">ENGINEERING / BUILDING OFFICIAL SERVICES</option>\n  <option value=\"GENERAL SERVICES\">GENERAL SERVICES</option>\n  <option value=\"SOCIAL WELFARE SERVICES\">SOCIAL WELFARE SERVICES</option>\n  <option value=\"BUSINESS PERMIT AND LICENSING SERVICES\">BUSINESS PERMIT AND LICENSING SERVICES</option>\n  <option value=\"CIVIL REGISTRY SERVICES\">CIVIL REGISTRY SERVICES</option>\n  <option value=\"TREASURY SERVICES\">TREASURY SERVICES</option>\n  <option value=\"MUNICIPAL WATERWORKS SERVICES\">MUNICIPAL WATERWORKS SERVICES</option>\n  <option value=\"MUNICIPAL HEALTH SERVICE\">MUNICIPAL HEALTH SERVICE</option>\n</select>\n        </div>\n    </div>\n    <div _ngcontent-c24=\"\" class=\"d-flex flex-row-reverse\">\n        <a _ngcontent-c24=\"\" class=\"text-white c-pointer\" href=\"/content/i-want-to\">View all</a>\n    </div>\n</div>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '7-autosave-v1', '', '', '2020-08-28 03:29:21', '2020-08-28 03:29:21', '', 7, 'https://localhost/git/burgos-website/?p=18', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `burg_termmeta`
--

CREATE TABLE `burg_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `burg_terms`
--

CREATE TABLE `burg_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `burg_terms`
--

INSERT INTO `burg_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Table structure for table `burg_term_relationships`
--

CREATE TABLE `burg_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `burg_term_relationships`
--

INSERT INTO `burg_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `burg_term_taxonomy`
--

CREATE TABLE `burg_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `burg_term_taxonomy`
--

INSERT INTO `burg_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `burg_usermeta`
--

CREATE TABLE `burg_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `burg_usermeta`
--

INSERT INTO `burg_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'tech_support_marc'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'burg_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'burg_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"f943811b254d1572f894887ff2940e680e6ab1c3f7483adb6b4d771deea5db79\";a:4:{s:10:\"expiration\";i:1599537206;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:79.0) Gecko/20100101 Firefox/79.0\";s:5:\"login\";i:1598327606;}}'),
(17, 1, 'burg_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(19, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(20, 1, 'metaboxhidden_nav-menus', 'a:6:{i:0;s:24:\"add-post-type-imc_issues\";i:1;s:12:\"add-post_tag\";i:2;s:15:\"add-post_format\";i:3;s:15:\"add-imccategory\";i:4;s:13:\"add-imcstatus\";i:5;s:17:\"add-imc_usergroup\";}'),
(21, 1, 'enable_custom_fields', '1'),
(22, 1, 'meta-box-order_page', 'a:3:{s:6:\"normal\";s:38:\"postcustom,theme-layouts-post-meta-box\";s:4:\"side\";s:0:\"\";s:8:\"advanced\";s:0:\"\";}'),
(23, 2, 'nickname', 'rluigimcjan'),
(24, 2, 'first_name', 'Luigi'),
(25, 2, 'last_name', 'Repato'),
(26, 2, 'description', ''),
(27, 2, 'rich_editing', 'true'),
(28, 2, 'syntax_highlighting', 'true'),
(29, 2, 'comment_shortcuts', 'false'),
(30, 2, 'admin_color', 'fresh'),
(31, 2, 'use_ssl', '0'),
(32, 2, 'show_admin_bar_front', 'true'),
(33, 2, 'locale', ''),
(34, 2, 'burg_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(35, 2, 'burg_user_level', '10'),
(36, 2, 'dismissed_wp_pointers', '');

-- --------------------------------------------------------

--
-- Table structure for table `burg_users`
--

CREATE TABLE `burg_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `burg_users`
--

INSERT INTO `burg_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'tech_support_marc', '$P$B1ieZDn6en9W/VDEVXLfLtE.cX66oF/', 'tech_support_marc', 'marcloyd.mirador@live.com', 'https://localhost/git/burgos-website', '2020-08-25 03:53:14', '', 0, 'tech_support_marc'),
(2, 'rluigimcjan', '$P$BuYCwJpJ8uOJDySxTfe73HaVYkuZJi/', 'rluigimcjan', 'rluigimcjan@gmail.com', '', '2020-09-03 12:40:16', '', 0, 'Luigi Repato');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `burg_commentmeta`
--
ALTER TABLE `burg_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `burg_comments`
--
ALTER TABLE `burg_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `burg_imc_keys`
--
ALTER TABLE `burg_imc_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `burg_imc_logs`
--
ALTER TABLE `burg_imc_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `burg_imc_posts_index`
--
ALTER TABLE `burg_imc_posts_index`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `burg_imc_tokens`
--
ALTER TABLE `burg_imc_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `burg_imc_users_firebase`
--
ALTER TABLE `burg_imc_users_firebase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `burg_imc_users_slogin`
--
ALTER TABLE `burg_imc_users_slogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `burg_imc_votes`
--
ALTER TABLE `burg_imc_votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `burg_links`
--
ALTER TABLE `burg_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `burg_options`
--
ALTER TABLE `burg_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `burg_postmeta`
--
ALTER TABLE `burg_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `burg_posts`
--
ALTER TABLE `burg_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `burg_termmeta`
--
ALTER TABLE `burg_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `burg_terms`
--
ALTER TABLE `burg_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `burg_term_relationships`
--
ALTER TABLE `burg_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `burg_term_taxonomy`
--
ALTER TABLE `burg_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `burg_usermeta`
--
ALTER TABLE `burg_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `burg_users`
--
ALTER TABLE `burg_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `burg_commentmeta`
--
ALTER TABLE `burg_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `burg_comments`
--
ALTER TABLE `burg_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `burg_imc_keys`
--
ALTER TABLE `burg_imc_keys`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `burg_imc_logs`
--
ALTER TABLE `burg_imc_logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `burg_imc_posts_index`
--
ALTER TABLE `burg_imc_posts_index`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `burg_imc_tokens`
--
ALTER TABLE `burg_imc_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `burg_imc_users_firebase`
--
ALTER TABLE `burg_imc_users_firebase`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `burg_imc_users_slogin`
--
ALTER TABLE `burg_imc_users_slogin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `burg_imc_votes`
--
ALTER TABLE `burg_imc_votes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `burg_links`
--
ALTER TABLE `burg_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `burg_options`
--
ALTER TABLE `burg_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `burg_postmeta`
--
ALTER TABLE `burg_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `burg_posts`
--
ALTER TABLE `burg_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `burg_termmeta`
--
ALTER TABLE `burg_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `burg_terms`
--
ALTER TABLE `burg_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `burg_term_taxonomy`
--
ALTER TABLE `burg_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `burg_usermeta`
--
ALTER TABLE `burg_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `burg_users`
--
ALTER TABLE `burg_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
