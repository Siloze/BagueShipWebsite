<?php
/**
 * Incrementally add or update the GOTH earring in the Origin collection.
 * Existing products and their media are left untouched.
 */

if ( ! defined( 'ABSPATH' ) || ! class_exists( 'WooCommerce' ) ) {
    fwrite( STDERR, "WooCommerce must be loaded.\n" );
    exit( 1 );
}

$source_dir = '/products';
$assets     = array( 'GOTH_ILLUSTRATION.png', 'GOTH_1.png', 'GOTH_2.png', 'GOTH_3.png' );
foreach ( $assets as $asset ) {
    if ( ! is_readable( $source_dir . '/' . $asset ) ) {
        fwrite( STDERR, sprintf( "Missing product asset: %s\n", $asset ) );
        exit( 1 );
    }
}

require_once ABSPATH . 'wp-admin/includes/file.php';
require_once ABSPATH . 'wp-admin/includes/image.php';
require_once ABSPATH . 'wp-admin/includes/media.php';

function eclipse_goth_import_image( string $source_path, string $title, int $parent_id ): int {
    $source_file = basename( $source_path );
    $existing    = get_posts(
        array(
            'post_type'      => 'attachment',
            'post_status'    => 'inherit',
            'posts_per_page' => 1,
            'fields'         => 'ids',
            'meta_key'       => '_eclipse_origin_source_file',
            'meta_value'     => $source_file,
        )
    );
    if ( $existing ) {
        $attachment_id = (int) $existing[0];
        wp_update_post( array( 'ID' => $attachment_id, 'post_parent' => $parent_id ) );
        return $attachment_id;
    }

    $upload = wp_upload_bits( $source_file, null, file_get_contents( $source_path ) );
    if ( ! empty( $upload['error'] ) ) {
        throw new RuntimeException( $upload['error'] );
    }

    $filetype      = wp_check_filetype( $upload['file'] );
    $attachment_id = wp_insert_attachment(
        array(
            'post_mime_type' => $filetype['type'] ?: 'image/png',
            'post_title'     => $title,
            'post_status'    => 'inherit',
            'post_parent'    => $parent_id,
        ),
        $upload['file'],
        $parent_id,
        true
    );
    if ( is_wp_error( $attachment_id ) ) {
        throw new RuntimeException( $attachment_id->get_error_message() );
    }

    wp_update_attachment_metadata( $attachment_id, wp_generate_attachment_metadata( $attachment_id, $upload['file'] ) );
    update_post_meta( $attachment_id, '_wp_attachment_image_alt', $title );
    update_post_meta( $attachment_id, '_eclipse_origin_source_file', $source_file );
    return (int) $attachment_id;
}

$origin = get_term_by( 'slug', 'origin', 'product_cat' );
if ( ! $origin instanceof WP_Term ) {
    throw new RuntimeException( 'The Origin collection does not exist.' );
}

$existing_id = wc_get_product_id_by_sku( 'ECLIPSE-ORIGIN-GOTH' );
if ( ! $existing_id ) {
    $existing_post = get_page_by_path( 'goth', OBJECT, 'product' );
    $existing_id   = $existing_post instanceof WP_Post ? (int) $existing_post->ID : 0;
}

$product = $existing_id ? wc_get_product( $existing_id ) : false;
if ( ! $product || ! $product->is_type( 'simple' ) ) {
    if ( $product ) {
        $product->delete( true );
    }
    $product = new WC_Product_Simple();
}

$product->set_name( 'GOTH' );
$product->set_slug( 'goth' );
$product->set_status( 'publish' );
$product->set_catalog_visibility( 'visible' );
$product->set_description( 'GOTH étire l’univers Origin dans une silhouette verticale. Une boucle d’oreille pendante en acier inoxydable, sculptée comme un talisman sombre et graphique.' );
$product->set_short_description( 'Boucle d’oreille pendante aux lignes gothiques et acérées.' );
$product->set_sku( 'ECLIPSE-ORIGIN-GOTH' );
$product->set_regular_price( '320' );
$product->set_price( '320' );
$product->set_manage_stock( true );
$product->set_stock_quantity( 12 );
$product->set_stock_status( 'instock' );
$product_id = $product->save();

wp_set_object_terms( $product_id, array( (int) $origin->term_id ), 'product_cat' );
wp_set_object_terms( $product_id, array( 'simple' ), 'product_type' );
wp_update_post( array( 'ID' => $product_id, 'menu_order' => 3 ) );

$meta = array(
    '_eclipse_jewel_type'    => 'boucles',
    '_bagueship_matiere'     => 'Acier inoxydable',
    '_bagueship_finition'    => 'Argent poli',
    '_bagueship_largeur'     => 'Pendentif gothique',
    '_bagueship_poids_bijou' => 'Taille unique',
    '_bagueship_fabrication' => 'Collection Origin',
    '_bagueship_garantie'    => 'Garantie 2 ans',
    '_bagueship_packaging'   => 'Livré en écrin Eclipse.',
);
foreach ( $meta as $meta_key => $meta_value ) {
    update_post_meta( $product_id, $meta_key, $meta_value );
}

$illustration_id = eclipse_goth_import_image( $source_dir . '/GOTH_ILLUSTRATION.png', 'GOTH — Illustration', $product_id );
set_post_thumbnail( $product_id, $illustration_id );

$gallery_ids = array();
foreach ( array( 'GOTH_1.png', 'GOTH_2.png', 'GOTH_3.png' ) as $index => $gallery_file ) {
    $gallery_ids[] = eclipse_goth_import_image(
        $source_dir . '/' . $gallery_file,
        sprintf( 'GOTH — Vue %d', $index + 1 ),
        $product_id
    );
}
update_post_meta( $product_id, '_product_image_gallery', implode( ',', $gallery_ids ) );

wp_update_term(
    (int) $origin->term_id,
    'product_cat',
    array( 'description' => 'La première collection Eclipse : trois bagues et une boucle d’oreille, sculpturales, sombres et organiques.' )
);
update_term_meta( (int) $origin->term_id, 'bagueship_tagline', 'Quatre formes. Une même origine.' );
update_term_meta( (int) $origin->term_id, 'bagueship_price_from', 'À partir de 320 €' );

clean_term_cache( (int) $origin->term_id, 'product_cat' );
wc_delete_product_transients( $product_id );
delete_transient( 'wc_term_counts' );
WC_Cache_Helper::get_transient_version( 'product', true );
flush_rewrite_rules( false );

echo wp_json_encode(
    array(
        'product_id' => $product_id,
        'name'       => 'GOTH',
        'type'       => 'boucles',
        'collection' => 'Origin',
        'gallery'    => $gallery_ids,
    ),
    JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
) . "\n";
