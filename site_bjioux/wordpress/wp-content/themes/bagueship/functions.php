<?php

if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

define( 'BAGUESHIP_THEME_VERSION', '1.0.9' );

function bagueship_theme_setup(): void {
    load_theme_textdomain( 'bagueship', get_template_directory() . '/languages' );
    add_theme_support( 'title-tag' );
    add_theme_support( 'post-thumbnails' );
    add_theme_support( 'html5', array( 'search-form', 'comment-form', 'comment-list', 'gallery', 'caption', 'style', 'script' ) );
    add_theme_support( 'woocommerce' );
    add_theme_support( 'wc-product-gallery-slider' );
    add_theme_support( 'wc-product-gallery-lightbox' );
    add_theme_support( 'wc-product-gallery-zoom' );
    register_nav_menus(
        array(
            'primary' => __( 'Primary menu', 'bagueship' ),
            'footer'  => __( 'Footer menu', 'bagueship' ),
        )
    );
}
add_action( 'after_setup_theme', 'bagueship_theme_setup' );

function bagueship_render_nav_links( string $location ): void {
    $locations = get_nav_menu_locations();
    if ( empty( $locations[ $location ] ) ) {
        return;
    }
    $items = wp_get_nav_menu_items( $locations[ $location ] );
    if ( empty( $items ) ) {
        return;
    }
    foreach ( $items as $item ) {
        printf(
            '<a href="%1$s">%2$s</a>',
            esc_url( $item->url ),
            esc_html( $item->title )
        );
    }
}

function bagueship_topbar_item( string $label, string $url, bool $active = false, string $extra_class = '', string $suffix_html = '' ): string {
    $classes = array();
    if ( $active ) {
        $classes[] = 'is-active';
    }
    if ( $extra_class ) {
        $classes[] = $extra_class;
    }
    $class_attr = $classes ? ' class="' . esc_attr( implode( ' ', $classes ) ) . '"' : '';
    $aria = $active ? ' aria-current="page"' : '';
    return sprintf(
        '<a href="%1$s"%2$s%3$s>%4$s%5$s</a>',
        esc_url( $url ),
        $class_attr,
        $aria,
        esc_html( $label ),
        $suffix_html
    );
}

function bagueship_topbar_markup( string $active = '' ): string {
    $items = array(
        'collection' => array( 'Collection', wc_get_page_permalink( 'shop' ) ),
        'promesse'   => array( 'Promesse', home_url( '/#promesse' ) ),
    );

    $markup = '<div class="right">';
    foreach ( $items as $key => $item ) {
        $markup .= bagueship_topbar_item( $item[0], $item[1], $active === $key );
    }
    $markup .= '</div>';

    $cart_count = function_exists( 'bagueship_get_cart_count' ) ? bagueship_get_cart_count() : 0;
    $cart_icon  = '<svg class="cart-icon" viewBox="0 0 32 24" aria-hidden="true" focusable="false"><path d="M8.4 8.2h15.2l-1.08 10.2a2.1 2.1 0 0 1-2.1 1.88H11.58a2.1 2.1 0 0 1-2.1-1.88L8.4 8.2Z"/><path d="M12.2 8.2V6.7a3.8 3.8 0 0 1 7.6 0v1.5"/></svg>';
    $cart_label = '<span class="screen-reader-text">' . esc_html__( 'Panier', 'bagueship' ) . '</span>';
    $cart_count_html = $cart_count > 0 ? '<span class="cart-count">' . esc_html( (string) $cart_count ) . '</span>' : '';
    $markup .= sprintf(
        '<div class="nav-actions"><a href="%1$s" class="cart-link%2$s"%3$s aria-label="%4$s">%5$s%6$s%7$s</a></div>',
        esc_url( wc_get_cart_url() ),
        'cart' === $active ? ' is-active' : '',
        'cart' === $active ? ' aria-current="page"' : '',
        esc_attr__( 'Panier', 'bagueship' ),
        $cart_icon,
        $cart_label,
        $cart_count_html
    );
    return $markup;
}

function bagueship_topbar_active_key(): string {
    if ( is_cart() ) {
        return 'cart';
    }
    if ( is_product() || is_shop() || is_product_category() ) {
        return 'collection';
    }
    if ( is_front_page() ) {
        return '';
    }
    return '';
}

function bagueship_page_url( string $slug ): string {
    $page = get_page_by_path( $slug );
    if ( $page instanceof WP_Post ) {
        return get_permalink( $page );
    }
    return home_url( '/' . trim( $slug, '/' ) . '/' );
}

function bagueship_footer_markup(): string {
    $help_links = array(
        array( 'Contact', bagueship_page_url( 'contact' ) ),
        array( 'Suivre le colis', bagueship_page_url( 'suivre-le-colis' ) ),
        array( 'Questions', bagueship_page_url( 'questions' ) ),
        array( 'Retour de produit', bagueship_page_url( 'retour-de-produit' ) ),
        array( 'Garantie 1 an', bagueship_page_url( 'garantie-1-an' ) ),
    );
    $learn_links = array(
        array( 'CGU', bagueship_page_url( 'conditions-generales-utilisation' ) ),
        array( 'Mentions légales', bagueship_page_url( 'mentions-legales' ) ),
        array( 'Devenir ambassadeur / ambassadrice', bagueship_page_url( 'devenir-ambassadeur' ) ),
    );

    $render_links = static function( array $links ): string {
        $html = '';
        foreach ( $links as $link ) {
            $html .= sprintf( '<a href="%1$s">%2$s</a>' . "\n", esc_url( $link[1] ), esc_html( $link[0] ) );
        }
        return $html;
    };

    return sprintf(
        '<footer class="bagueship-footer"><div class="bagueship-footer__glow" aria-hidden="true"></div><div class="bagueship-footer__inner"><div class="bagueship-footer__panel"><a class="bagueship-footer__brand" href="%1$s"><span>BAGUESHIP</span><small>Acier sculptural</small></a><div class="bagueship-footer__menus"><section class="bagueship-footer__group"><h2>Aide</h2><nav aria-label="Aide">%2$s</nav></section><section class="bagueship-footer__group"><h2>En savoir plus</h2><nav aria-label="En savoir plus">%3$s</nav></section></div></div><div class="bagueship-footer__bottom"><span>Conçu en France · © 2026</span><span>Bijoux en acier · Commandes sécurisées</span></div></div></footer>',
        esc_url( home_url( '/' ) ),
        $render_links( $help_links ),
        $render_links( $learn_links )
    );
}

function bagueship_enqueue_assets(): void {
    wp_enqueue_style( 'bagueship-style', get_stylesheet_uri(), array(), BAGUESHIP_THEME_VERSION );
    wp_enqueue_script( 'bagueship-theme', get_template_directory_uri() . '/assets/theme.js', array(), BAGUESHIP_THEME_VERSION, true );
    wp_enqueue_script( 'bagueship-model-viewer', get_template_directory_uri() . '/assets/vendor/model-viewer/model-viewer-umd.min.js', array(), '4.3.1', true );
}
add_action( 'wp_enqueue_scripts', 'bagueship_enqueue_assets' );

function bagueship_body_classes( array $classes ): array {
    $classes[] = 'bagueship-theme';
    return $classes;
}
add_filter( 'body_class', 'bagueship_body_classes' );

function bagueship_woocommerce_wrapper_start(): void {
    echo '<main id="primary" class="site-main"><div class="container section">';
}

function bagueship_woocommerce_wrapper_end(): void {
    echo '</div></main>';
}
add_action( 'woocommerce_before_main_content', 'bagueship_woocommerce_wrapper_start', 5 );
add_action( 'woocommerce_after_main_content', 'bagueship_woocommerce_wrapper_end', 50 );

function bagueship_woocommerce_upsell_columns( int $columns ): int {
    return 3;
}
add_filter( 'woocommerce_upsells_columns', 'bagueship_woocommerce_upsell_columns' );

function bagueship_woocommerce_related_products_args( array $args ): array {
    $args['posts_per_page'] = 3;
    $args['columns']        = 3;
    return $args;
}
add_filter( 'woocommerce_output_related_products_args', 'bagueship_woocommerce_related_products_args' );

function bagueship_filter_shop_query( WP_Query $query ): void {
    if ( is_admin() || ! $query->is_main_query() ) {
        return;
    }

    if ( ( is_shop() || is_post_type_archive( 'product' ) ) && isset( $_GET['collection'] ) ) {
        $slug = sanitize_title( wp_unslash( $_GET['collection'] ) );
        $term = get_term_by( 'slug', $slug, 'product_cat' );
        if ( $term instanceof WP_Term ) {
            $tax_query   = (array) $query->get( 'tax_query', array() );
            $tax_query[] = array(
                'taxonomy' => 'product_cat',
                'field'    => 'term_id',
                'terms'    => array( (int) $term->term_id ),
            );
            $query->set( 'tax_query', $tax_query );
        }
    }
}
add_action( 'pre_get_posts', 'bagueship_filter_shop_query' );

function bagueship_product_link( int $product_id ): string {
    return get_permalink( $product_id );
}
function bagueship_collection_primary_product_url( WP_Term $term ): string {
    $product_id = bagueship_collection_primary_product_id( $term );
    return $product_id ? get_permalink( $product_id ) : '';
}

function bagueship_collection_primary_product_id( WP_Term $term ): int {
    $product = get_page_by_path( $term->slug, OBJECT, 'product' );
    if ( $product instanceof WP_Post ) {
        return (int) $product->ID;
    }

    $query = new WP_Query(
        array(
            'post_type'      => 'product',
            'post_status'    => 'publish',
            'posts_per_page' => 1,
            'fields'         => 'ids',
            'tax_query'      => array(
                array(
                    'taxonomy' => 'product_cat',
                    'field'    => 'term_id',
                    'terms'    => array( (int) $term->term_id ),
                ),
            ),
            'orderby'        => 'menu_order title',
            'order'          => 'ASC',
        )
    );

    return ! empty( $query->posts[0] ) ? (int) $query->posts[0] : 0;
}

function bagueship_product_model_url( int $product_id ): string {
    $model_file = (string) get_post_meta( $product_id, '_bagueship_model_file', true );
    if ( '' === $model_file ) {
        $model_file = get_post_field( 'post_name', $product_id ) . '.glb';
    }

    $model_file = basename( $model_file );
    $model_path = trailingslashit( get_stylesheet_directory() ) . 'assets/models/' . $model_file;
    if ( ! file_exists( $model_path ) ) {
        return '';
    }

    $model_url = trailingslashit( get_stylesheet_directory_uri() ) . 'assets/models/' . $model_file;

    return add_query_arg( 'v', (string) filemtime( $model_path ), $model_url );
}

function bagueship_steel_environment_url(): string {
    return 'legacy';
}

function bagueship_collection_model_url( WP_Term $term ): string {
    $product_id = bagueship_collection_primary_product_id( $term );
    return $product_id ? bagueship_product_model_url( $product_id ) : '';
}

function bagueship_get_product_collection_terms( int $product_id ): array {
    $terms = get_the_terms( $product_id, 'product_cat' );
    if ( is_wp_error( $terms ) || empty( $terms ) ) {
        return array();
    }
    return $terms;
}

function bagueship_collection_meta( WP_Term $term ): array {
    $state = (string) get_term_meta( $term->term_id, 'bagueship_collection_state', true );
    if ( '' === $state ) {
        $state = 'available';
    }
    return array(
        'tagline'                   => (string) get_term_meta( $term->term_id, 'bagueship_tagline', true ),
        'price_from'                => (string) get_term_meta( $term->term_id, 'bagueship_price_from', true ),
        'status'                    => (string) get_term_meta( $term->term_id, 'bagueship_status', true ),
        'state'                     => $state,
        'preorder_enabled'          => 'preorder' === $state,
        'preorder_discount_percent' => (int) get_term_meta( $term->term_id, 'bagueship_preorder_discount_percent', true ),
        'preorder_estimate'         => (string) get_term_meta( $term->term_id, 'bagueship_preorder_estimate', true ),
        'preorder_message'          => (string) get_term_meta( $term->term_id, 'bagueship_preorder_message', true ),
        'accent'                    => (string) get_term_meta( $term->term_id, 'bagueship_accent', true ),
    );
}

function bagueship_collection_state_label( string $state ): string {
    $labels = array(
        'available' => __( 'Disponible', 'bagueship' ),
        'upcoming'  => __( 'À venir', 'bagueship' ),
        'preorder'  => __( 'Précommande', 'bagueship' ),
        'archived'  => __( 'Archivée', 'bagueship' ),
    );
    return $labels[ $state ] ?? $labels['available'];
}

function bagueship_product_preorder_data( int $product_id ): array {
    if ( function_exists( 'bagueship_core_product_collection_preorder_data' ) ) {
        return bagueship_core_product_collection_preorder_data( $product_id );
    }
    return array( 'enabled' => false, 'state' => 'available' );
}

function bagueship_preorder_price_for_product( WC_Product $product, int $product_id = 0 ): float {
    $product_id = $product_id ?: $product->get_id();
    $preorder = bagueship_product_preorder_data( $product_id );
    $regular = (float) $product->get_regular_price();
    if ( $regular <= 0 ) {
        $regular = (float) $product->get_price();
    }
    if ( function_exists( 'bagueship_core_preorder_price' ) ) {
        return bagueship_core_preorder_price( $regular, $preorder );
    }
    return $regular;
}

function bagueship_format_price_from_term( WP_Term $term ): string {
    $meta = bagueship_collection_meta( $term );
    return $meta['price_from'] ?: __( 'À partir de la première pièce', 'bagueship' );
}

function bagueship_get_product_art_url( int $product_id ): string {
    return '';
}

function bagueship_get_cart_count(): int {
    if ( function_exists( 'WC' ) && WC()->cart ) {
        return (int) WC()->cart->get_cart_contents_count();
    }
    return 0;
}

function bagueship_disable_canonical_redirects_for_prefixed_site( $redirect_url ) {
    $home_path = wp_parse_url( home_url( '/' ), PHP_URL_PATH );
    if ( ! empty( $home_path ) && '/' !== $home_path && ! is_admin() ) {
        return false;
    }

    return $redirect_url;
}
add_filter( 'redirect_canonical', 'bagueship_disable_canonical_redirects_for_prefixed_site' );

function bagueship_redirect_collection_archives_to_primary_product(): void {
    if ( ! is_product_category() ) {
        return;
    }

    $term = get_queried_object();
    if ( ! $term instanceof WP_Term ) {
        return;
    }

    $url = bagueship_collection_primary_product_url( $term );
    if ( $url ) {
        wp_safe_redirect( $url, 302 );
        exit;
    }
}
add_action( 'template_redirect', 'bagueship_redirect_collection_archives_to_primary_product', 1 );

function bagueship_breadcrumbs(): void {
    echo '<nav class="breadcrumbs" aria-label="' . esc_attr__( 'Fil d’Ariane', 'bagueship' ) . '">';
    echo '<a href="' . esc_url( home_url( '/' ) ) . '">' . esc_html__( 'Accueil', 'bagueship' ) . '</a>';
    if ( is_shop() || is_product_category() || is_product() ) {
        echo '<span>/</span><a href="' . esc_url( wc_get_page_permalink( 'shop' ) ) . '">' . esc_html__( 'Boutique', 'bagueship' ) . '</a>';
    }
    if ( is_product_category() ) {
        $term = get_queried_object();
        if ( $term instanceof WP_Term ) {
            echo '<span>/</span><span>' . esc_html( $term->name ) . '</span>';
        }
    }
    if ( is_product() ) {
        $terms = get_the_terms( get_the_ID(), 'product_cat' );
        if ( ! empty( $terms ) && ! is_wp_error( $terms ) ) {
            echo '<span>/</span><span>' . esc_html( $terms[0]->name ) . '</span>';
        }
        echo '<span>/</span><span>' . esc_html( get_the_title() ) . '</span>';
    }
    echo '</nav>';
}

function bagueship_homepage_collection_terms(): array {
    $terms = get_terms(
        array(
            'taxonomy'   => 'product_cat',
            'hide_empty' => false,
            'slug'       => array( 'abstract', 'finger' ),
            'orderby'    => 'meta_value_num',
            'meta_key'   => 'bagueship_order',
            'order'      => 'ASC',
        )
    );
    if ( is_wp_error( $terms ) ) {
        return array();
    }
    return $terms;
}

function bagueship_contact_form_shortcode(): string {
    $output = '<form class="woocommerce-form" method="post" action="' . esc_url( admin_url( 'admin-post.php' ) ) . '">';
    $output .= wp_nonce_field( 'bagueship_contact', 'bagueship_contact_nonce', true, false );
    $output .= '<input type="hidden" name="action" value="bagueship_contact">';
    $output .= '<p><label>Nom<br><input type="text" name="name" required></label></p>';
    $output .= '<p><label>Email<br><input type="email" name="email" required></label></p>';
    $output .= '<p><label>Message<br><textarea name="message" rows="6" required></textarea></label></p>';
    $output .= '<p><button class="button" type="submit">Envoyer</button></p>';
    $output .= '</form>';
    return $output;
}
add_shortcode( 'bagueship_contact_form', 'bagueship_contact_form_shortcode' );

function bagueship_withdrawal_form_shortcode(): string {
    $output = '<form class="woocommerce-form" method="post" action="' . esc_url( admin_url( 'admin-post.php' ) ) . '">';
    $output .= wp_nonce_field( 'bagueship_withdrawal', 'bagueship_withdrawal_nonce', true, false );
    $output .= '<input type="hidden" name="action" value="bagueship_withdrawal">';
    $output .= '<p><label>Numéro de commande<br><input type="text" name="order_number" required></label></p>';
    $output .= '<p><label>Email de commande<br><input type="email" name="email" required></label></p>';
    $output .= '<p><label>Motif / détails<br><textarea name="details" rows="6"></textarea></label></p>';
    $output .= '<p><button class="button" type="submit">Exercer mon droit de rétractation</button></p>';
    $output .= '</form>';
    return $output;
}
add_shortcode( 'bagueship_withdrawal_form', 'bagueship_withdrawal_form_shortcode' );

function bagueship_admin_notice( string $message, string $type = 'success' ): void {
    set_transient( 'bagueship_notice_' . get_current_user_id(), array( 'message' => $message, 'type' => $type ), 60 );
}

function bagueship_render_notice(): void {
    $notice = get_transient( 'bagueship_notice_' . get_current_user_id() );
    if ( ! $notice ) {
        return;
    }
    delete_transient( 'bagueship_notice_' . get_current_user_id() );
    printf(
        '<div class="woocommerce-%1$s">%2$s</div>',
        esc_attr( $notice['type'] ),
        wp_kses_post( $notice['message'] )
    );
}
add_action( 'wp_footer', 'bagueship_render_notice' );

function bagueship_theme_register_sizes(): void {
    add_image_size( 'bagueship-card', 900, 900, true );
}
add_action( 'after_setup_theme', 'bagueship_theme_register_sizes', 20 );
