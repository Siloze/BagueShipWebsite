<?php if ( ! defined( 'ABSPATH' ) ) { exit; } ?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
  <meta charset="<?php bloginfo( 'charset' ); ?>">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>
<?php
if ( function_exists( 'bagueship_eclipse_topbar' ) ) {
    echo bagueship_eclipse_topbar(
        array(
            'active'      => bagueship_topbar_active_key(),
            'position'    => 'sticky',
            'brand_color' => '#f7f7f7',
            'items_color' => '#f7f7f7',
            'cart_color'  => '#f7f7f7',
            'background'  => 'rgba(2,2,2,.96)',
        )
    );
}
?>
