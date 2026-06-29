<?php
require_once ABSPATH . 'wp-admin/includes/plugin.php';
require_once ABSPATH . 'wp-admin/includes/file.php';

if ( ! function_exists( 'bagueship_core_seed_site' ) ) {
    return;
}

bagueship_core_seed_site();
