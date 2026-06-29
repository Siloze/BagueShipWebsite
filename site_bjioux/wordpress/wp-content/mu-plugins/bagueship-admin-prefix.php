<?php
/**
 * Keep WordPress admin redirects aware of the public /bagueship prefix.
 *
 * Caddy's handle_path strips the prefix before proxying to Apache, so
 * unauthenticated /bagueship/wp-admin/ requests arrive as /wp-admin/.
 * WordPress uses REQUEST_URI for auth_redirect(), which otherwise creates
 * redirect_to=http://locallm.fr/wp-admin/ after login.
 */
if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

$bagueship_public_url  = getenv( 'WORDPRESS_SITE_URL' ) ?: '';
$bagueship_public_path = wp_parse_url( $bagueship_public_url, PHP_URL_PATH );

if ( is_string( $bagueship_public_path ) && '' !== $bagueship_public_path && '/' !== $bagueship_public_path ) {
    $bagueship_public_path = '/' . trim( $bagueship_public_path, '/' );
    $request_uri           = $_SERVER['REQUEST_URI'] ?? '';

    if (
        is_string( $request_uri )
        && ! str_starts_with( $request_uri, $bagueship_public_path . '/' )
        && preg_match( '#^/(wp-admin|wp-login\.php)(/|\?|$)#', $request_uri )
    ) {
        $_SERVER['REQUEST_URI'] = $bagueship_public_path . $request_uri;
    }
}
