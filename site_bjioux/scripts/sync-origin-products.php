<?php
/**
 * One-shot, repeatable WooCommerce catalogue sync for the Origin collection.
 *
 * Run with:
 * wp eval-file /scripts/sync-origin-products.php
 */

if ( ! defined( 'ABSPATH' ) || ! class_exists( 'WooCommerce' ) ) {
    fwrite( STDERR, "WooCommerce must be loaded.\n" );
    exit( 1 );
}

$source_dir = '/products';
$products   = array(
    array(
        'name'              => 'BIG',
        'slug'              => 'big',
        'sku'               => 'ECLIPSE-ORIGIN-BIG',
        'price'             => 420,
        'short_description' => 'Bague sculpturale aux lignes organiques et affirmées.',
        'description'       => 'BIG est la pièce la plus imposante de la collection Origin. Une bague sculpturale en acier inoxydable, dessinée pour affirmer sa présence.',
        'profile'           => 'Profil sculptural',
        'jewel_type'        => 'bagues',
        'illustration'      => 'BIG_ILLUSTRATION.png',
        'gallery'           => array( 'BIG_1.png', 'BIG_2.png', 'BIG_3.png' ),
    ),
    array(
        'name'              => 'FLAMME',
        'slug'              => 'flamme',
        'sku'               => 'ECLIPSE-ORIGIN-FLAMME',
        'price'             => 380,
        'short_description' => 'Bague ajourée inspirée d’une flamme métallique.',
        'description'       => 'FLAMME développe une silhouette vive et ajourée. Une pièce de la collection Origin pensée comme un mouvement figé dans l’acier.',
        'profile'           => 'Profil ajouré',
        'jewel_type'        => 'bagues',
        'illustration'      => 'FLAMME_ILLUSTRATION.png',
        'gallery'           => array( 'FLAMME_1.png', 'FLAMME_2.png', 'FLAMME_3.png' ),
    ),
    array(
        'name'              => 'THIN',
        'slug'              => 'thin',
        'sku'               => 'ECLIPSE-ORIGIN-THIN',
        'price'             => 340,
        'short_description' => 'Bague fine, incisive et graphique.',
        'description'       => 'THIN traduit l’univers Origin dans une ligne plus fine. Une bague graphique en acier inoxydable, légère visuellement mais immédiatement reconnaissable.',
        'profile'           => 'Profil fin',
        'jewel_type'        => 'bagues',
        'illustration'      => 'THIN_ILLUSTRATION.png',
        'gallery'           => array( 'THIN_1.png', 'THIN_2.png', 'THIN_3.png' ),
    ),
    array(
        'name'              => 'GOTH',
        'slug'              => 'goth',
        'sku'               => 'ECLIPSE-ORIGIN-GOTH',
        'price'             => 320,
        'product_type'      => 'simple',
        'short_description' => 'Boucle d’oreille pendante aux lignes gothiques et acérées.',
        'description'       => 'GOTH étire l’univers Origin dans une silhouette verticale. Une boucle d’oreille pendante en acier inoxydable, sculptée comme un talisman sombre et graphique.',
        'profile'           => 'Pendentif gothique',
        'jewel_type'        => 'boucles',
        'illustration'      => 'GOTH_ILLUSTRATION.png',
        'gallery'           => array( 'GOTH_1.png', 'GOTH_2.png', 'GOTH_3.png' ),
    ),
);

$required_files = array( 'COLLECTION_ORIGIN.png' );
foreach ( $products as $product_data ) {
    $required_files[] = $product_data['illustration'];
    $required_files   = array_merge( $required_files, $product_data['gallery'] );
}
foreach ( $required_files as $required_file ) {
    if ( ! is_readable( $source_dir . '/' . $required_file ) ) {
        fwrite( STDERR, sprintf( "Missing product asset: %s\n", $required_file ) );
        exit( 1 );
    }
}

require_once ABSPATH . 'wp-admin/includes/file.php';
require_once ABSPATH . 'wp-admin/includes/image.php';
require_once ABSPATH . 'wp-admin/includes/media.php';

/**
 * Import one local product image and retain its original filename as metadata.
 */
function eclipse_origin_import_image( string $source_path, string $title, int $parent_id = 0 ): int {
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
        if ( $parent_id ) {
            wp_update_post( array( 'ID' => $attachment_id, 'post_parent' => $parent_id ) );
        }
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
            'post_content'   => '',
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

// Remove the previous WooCommerce catalogue and its product-owned media.
$old_products = wc_get_products(
    array(
        'status' => array( 'publish', 'draft', 'pending', 'private', 'trash' ),
        'limit'  => -1,
        'return' => 'objects',
    )
);
$old_media_ids = array();
foreach ( $old_products as $old_product ) {
    $old_media_ids[] = $old_product->get_image_id();
    $old_media_ids   = array_merge( $old_media_ids, $old_product->get_gallery_image_ids() );
    $old_product->delete( true );
}
foreach ( array_unique( array_filter( array_map( 'absint', $old_media_ids ) ) ) as $old_media_id ) {
    $attachment = get_post( $old_media_id );
    if ( $attachment instanceof WP_Post && 'attachment' === $attachment->post_type && $attachment->post_parent ) {
        wp_delete_attachment( $old_media_id, true );
    }
}

// Origin becomes the only WooCommerce collection, including the default term.
$origin_term = term_exists( 'origin', 'product_cat' );
if ( ! $origin_term ) {
    $origin_term = wp_insert_term(
        'Origin',
        'product_cat',
        array(
            'slug'        => 'origin',
            'description' => 'La première collection Eclipse : trois bagues et une boucle d’oreille, sculpturales, sombres et organiques.',
        )
    );
}
if ( is_wp_error( $origin_term ) ) {
    throw new RuntimeException( $origin_term->get_error_message() );
}
$origin_id = (int) ( is_array( $origin_term ) ? $origin_term['term_id'] : $origin_term );
update_option( 'default_product_cat', $origin_id );

$categories = get_terms( array( 'taxonomy' => 'product_cat', 'hide_empty' => false ) );
if ( ! is_wp_error( $categories ) ) {
    foreach ( $categories as $category ) {
        if ( (int) $category->term_id !== $origin_id ) {
            wp_delete_term( (int) $category->term_id, 'product_cat' );
        }
    }
}

wp_update_term(
    $origin_id,
    'product_cat',
    array( 'description' => 'La première collection Eclipse : trois bagues et une boucle d’oreille, sculpturales, sombres et organiques.' )
);
update_term_meta( $origin_id, 'bagueship_tagline', 'Quatre formes. Une même origine.' );
update_term_meta( $origin_id, 'bagueship_price_from', 'À partir de 320 €' );
update_term_meta( $origin_id, 'bagueship_status', 'Disponible' );
update_term_meta( $origin_id, 'bagueship_collection_state', 'available' );
update_term_meta( $origin_id, 'bagueship_order', '1' );
$collection_image_id = eclipse_origin_import_image( $source_dir . '/COLLECTION_ORIGIN.png', 'Collection Origin' );
update_term_meta( $origin_id, 'thumbnail_id', $collection_image_id );

$sizes       = array( '52', '54', '56', '58', '60', '62' );
$product_ids = array();
foreach ( $products as $menu_order => $product_data ) {
    $product_args = array(
            'name'              => $product_data['name'],
            'slug'              => $product_data['slug'],
            'sku'               => $product_data['sku'],
            'price'             => $product_data['price'],
            'category'          => 'origin',
            'sizes'             => $sizes,
            'short_description' => $product_data['short_description'],
            'description'       => $product_data['description'],
            'meta'              => array(
                'matiere'     => 'Acier inoxydable',
                'finition'    => 'Argent poli',
                'largeur'     => $product_data['profile'],
                'poids_bijou' => 'simple' === ( $product_data['product_type'] ?? 'variable' ) ? 'Taille unique' : 'Selon taille',
                'fabrication' => 'Collection Origin',
                'garantie'    => 'Garantie 2 ans',
                'packaging'   => 'Livré en écrin Eclipse.',
            ),
        );
    $product_id = 'simple' === ( $product_data['product_type'] ?? 'variable' )
        ? bagueship_core_create_simple_product( $product_args )
        : bagueship_core_create_variable_product( $product_args );
    if ( ! $product_id ) {
        throw new RuntimeException( sprintf( 'Unable to create %s.', $product_data['name'] ) );
    }

    wp_update_post( array( 'ID' => $product_id, 'menu_order' => $menu_order ) );
    update_post_meta( $product_id, '_eclipse_jewel_type', $product_data['jewel_type'] );
    foreach ( $product_args['meta'] as $meta_key => $meta_value ) {
        update_post_meta( $product_id, '_bagueship_' . sanitize_key( $meta_key ), sanitize_textarea_field( $meta_value ) );
    }
    $illustration_id = eclipse_origin_import_image(
        $source_dir . '/' . $product_data['illustration'],
        $product_data['name'] . ' — Illustration',
        $product_id
    );
    set_post_thumbnail( $product_id, $illustration_id );

    $gallery_ids = array();
    foreach ( $product_data['gallery'] as $view_index => $gallery_file ) {
        $gallery_ids[] = eclipse_origin_import_image(
            $source_dir . '/' . $gallery_file,
            sprintf( '%s — Vue %d', $product_data['name'], $view_index + 1 ),
            $product_id
        );
    }
    update_post_meta( $product_id, '_product_image_gallery', implode( ',', $gallery_ids ) );
    wc_delete_product_transients( $product_id );
    $product_ids[] = $product_id;
}

clean_term_cache( $origin_id, 'product_cat' );
delete_transient( 'wc_term_counts' );
WC_Cache_Helper::get_transient_version( 'product', true );
flush_rewrite_rules( false );

echo wp_json_encode(
    array(
        'collection' => array( 'id' => $origin_id, 'name' => 'Origin' ),
        'products'   => $product_ids,
        'assets'     => count( $required_files ),
    ),
    JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
) . "\n";
