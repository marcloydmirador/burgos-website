<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db_burgoswebss20' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '0 ZXn%_p -4Kk.fs2MwX2r3>(#L_W<g5J~36`; SP~6Mhi}%MG%jynGkn%Q5/Bt|' );
define( 'SECURE_AUTH_KEY',  'n%^23V>$xarW+_sx-V4syp}4|(iE;fs%2#lgW$zwA K$-00d$=j:1@1|0cp!h@zk' );
define( 'LOGGED_IN_KEY',    '@2ypK]S50*cF>Zx6Tqh@(>_%D96LIA}Z9(=p<prj#([)D{UiTNVJ:bG%VssO7cC9' );
define( 'NONCE_KEY',        '!m>coRm{>ilIzg;84^L#9J@47nOfnh j8lIRd|<I+/oLMvO@/&{:{}]YbNFw5K0/' );
define( 'AUTH_SALT',        '9XVbPwj|,oN<_HkqjW5eZ1=V8<<{tnF00f3nqE52cd8}5`A~f `>{w0XJ?m0HlMr' );
define( 'SECURE_AUTH_SALT', 'SY#Q}<ZA##c{nBItMXrIbExZMi|1GVZa[+$W3v.YkP Fb&J<64hg3Hnjw4^K-YQr' );
define( 'LOGGED_IN_SALT',   '0`TniG{2vL<?r|,71qGB<MR:XEvXoI~(fmO;A3{RgL8DT`kO_496zZk<nUN< A}=' );
define( 'NONCE_SALT',       ',jasUsqxlvQ@HP(w/kMOEU2^E#QzctLY;Bv;<9/bdU%PT.dhtqNV^0C|81xB9bCQ' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'burg_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
