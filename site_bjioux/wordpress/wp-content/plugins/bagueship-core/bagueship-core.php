<?php
/**
 * Plugin Name: Bagueship Core
 * Description: Bootstrap WordPress/WooCommerce content, collections, legal pages and helper forms for Bagueship.
 * Version: 1.0.0
 * Author: Codex
 */

if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

function bagueship_core_option_defaults(): array {
    return array(
        'company_name'     => '',
        'legal_form'       => '',
        'address'          => '',
        'email'            => '',
        'phone'            => '',
        'siret'            => '',
        'vat'              => '',
        'director'         => '',
        'host'             => '',
        'mediator'         => '',
        'mediator_url'     => '',
        'data_contact'     => '',
        'return_address'   => '',
        'withdraw_email'   => '',
        'shipping_email'   => '',
        'cookie_text'      => '',
        'seo_home_title'   => '',
        'seo_home_desc'    => '',
        'seo_shop_title'   => '',
        'seo_shop_desc'    => '',
    );
}

function bagueship_core_slug_to_label( string $slug ): string {
    return ucwords( str_replace( array( '-', '_' ), ' ', $slug ) );
}

function bagueship_core_get_options(): array {
    return wp_parse_args( get_option( 'bagueship_legal_info', array() ), bagueship_core_option_defaults() );
}

function bagueship_core_render_field( string $key, string $label, array $options ): void {
    printf(
        '<tr><th scope="row"><label for="%1$s">%2$s</label></th><td><input class="regular-text" id="%1$s" name="bagueship_legal_info[%1$s]" value="%3$s"></td></tr>',
        esc_attr( $key ),
        esc_html( $label ),
        esc_attr( $options[ $key ] ?? '' )
    );
}

function bagueship_core_render_textarea_field( string $key, string $label, array $options ): void {
    printf(
        '<tr><th scope="row"><label for="%1$s">%2$s</label></th><td><textarea class="large-text" rows="4" id="%1$s" name="bagueship_legal_info[%1$s]">%3$s</textarea></td></tr>',
        esc_attr( $key ),
        esc_html( $label ),
        esc_textarea( $options[ $key ] ?? '' )
    );
}

function bagueship_core_admin_menu(): void {
    add_options_page( 'Bagueship', 'Bagueship', 'manage_options', 'bagueship-core', 'bagueship_core_settings_page' );
    add_submenu_page( 'woocommerce', 'Bagueship exports', 'Bagueship exports', 'manage_woocommerce', 'bagueship-exports', 'bagueship_core_exports_page' );
    add_submenu_page( 'woocommerce', 'Alertes précommande', 'Alertes précommande', 'manage_woocommerce', 'bagueship-notify', 'bagueship_core_notify_admin_page' );
}
add_action( 'admin_menu', 'bagueship_core_admin_menu' );

function bagueship_core_register_notify_post_type(): void {
    register_post_type(
        'bagueship_notify',
        array(
            'labels'       => array(
                'name'          => 'Alertes précommande',
                'singular_name' => 'Alerte précommande',
            ),
            'public'       => false,
            'show_ui'      => true,
            'show_in_menu' => false,
            'supports'     => array( 'title' ),
            'capability_type' => 'post',
        )
    );
}
add_action( 'init', 'bagueship_core_register_notify_post_type' );

function bagueship_core_register_settings(): void {
    register_setting( 'bagueship_core', 'bagueship_legal_info', 'bagueship_core_sanitize_options' );
}
add_action( 'admin_init', 'bagueship_core_register_settings' );

function bagueship_core_sanitize_options( $input ): array {
    $defaults = bagueship_core_option_defaults();
    $output = array();
    foreach ( $defaults as $key => $default ) {
        $output[ $key ] = isset( $input[ $key ] ) ? sanitize_text_field( wp_unslash( $input[ $key ] ) ) : $default;
    }
    return $output;
}

function bagueship_core_settings_page(): void {
    $options = bagueship_core_get_options();
    ?>
    <div class="wrap">
      <h1>Bagueship</h1>
      <p>Informations légales et de contact utilisées par les pages du site.</p>
      <form method="post" action="options.php">
        <?php settings_fields( 'bagueship_core' ); ?>
        <table class="form-table" role="presentation">
          <?php
          bagueship_core_render_field( 'company_name', 'Raison sociale', $options );
          bagueship_core_render_field( 'legal_form', 'Forme juridique', $options );
          bagueship_core_render_field( 'address', 'Adresse', $options );
          bagueship_core_render_field( 'email', 'Email', $options );
          bagueship_core_render_field( 'phone', 'Téléphone', $options );
          bagueship_core_render_field( 'siret', 'SIRET', $options );
          bagueship_core_render_field( 'vat', 'TVA intracommunautaire', $options );
          bagueship_core_render_field( 'director', 'Directeur de publication', $options );
          bagueship_core_render_field( 'host', 'Hébergeur', $options );
          bagueship_core_render_field( 'mediator', 'Médiateur de la consommation', $options );
          bagueship_core_render_field( 'mediator_url', 'URL médiateur', $options );
          bagueship_core_render_field( 'data_contact', 'Contact données personnelles', $options );
          bagueship_core_render_field( 'return_address', 'Adresse de retour', $options );
          bagueship_core_render_field( 'withdraw_email', 'Email rétractation', $options );
          bagueship_core_render_field( 'shipping_email', 'Email livraison', $options );
          bagueship_core_render_textarea_field( 'cookie_text', 'Texte bannière cookies', $options );
          bagueship_core_render_field( 'seo_home_title', 'Titre SEO accueil', $options );
          bagueship_core_render_textarea_field( 'seo_home_desc', 'Description SEO accueil', $options );
          bagueship_core_render_field( 'seo_shop_title', 'Titre SEO boutique', $options );
          bagueship_core_render_textarea_field( 'seo_shop_desc', 'Description SEO boutique', $options );
          ?>
        </table>
        <?php submit_button(); ?>
      </form>
    </div>
    <?php
}

function bagueship_core_set_term_meta( int $term_id, array $meta ): void {
    foreach ( $meta as $key => $value ) {
        update_term_meta( $term_id, $key, $value );
    }
}

function bagueship_core_ensure_term( string $name, string $slug, array $meta = array() ): int {
    $term = term_exists( $slug, 'product_cat' );
    if ( $term && isset( $term['term_id'] ) ) {
        $term_id = (int) $term['term_id'];
    } else {
        $created = wp_insert_term( $name, 'product_cat', array( 'slug' => $slug ) );
        if ( is_wp_error( $created ) ) {
            return 0;
        }
        $term_id = (int) $created['term_id'];
    }
    if ( $meta ) {
        bagueship_core_set_term_meta( $term_id, $meta );
    }
    return $term_id;
}

function bagueship_core_create_page( string $title, string $slug, string $content = '', string $template = '' ): int {
    $existing = get_page_by_path( $slug );
    if ( $existing instanceof WP_Post ) {
        $page_id = $existing->ID;
        wp_update_post(
            array(
                'ID'           => $page_id,
                'post_title'   => $title,
                'post_content' => $content,
                'post_status'  => 'publish',
            )
        );
    } else {
        $page_id = wp_insert_post(
            array(
                'post_type'    => 'page',
                'post_title'   => $title,
                'post_name'    => $slug,
                'post_content' => $content,
                'post_status'  => 'publish',
            )
        );
    }
    if ( $template && $page_id ) {
        update_post_meta( $page_id, '_wp_page_template', $template );
    }
    return (int) $page_id;
}

function bagueship_core_page_id_by_slug( string $slug ): int {
    $page = get_page_by_path( $slug );
    return $page instanceof WP_Post ? (int) $page->ID : 0;
}

function bagueship_core_create_menu( string $name, array $slugs ): void {
    $menu_id = wp_get_nav_menu_object( $name );
    if ( ! $menu_id ) {
        $menu_id = wp_create_nav_menu( $name );
    } else {
        $menu_id = $menu_id->term_id;
        $items = wp_get_nav_menu_items( $menu_id );
        if ( $items ) {
            foreach ( $items as $item ) {
                wp_delete_post( (int) $item->ID, true );
            }
        }
    }
    foreach ( $slugs as $slug ) {
        $page = get_page_by_path( $slug );
        if ( $page instanceof WP_Post ) {
            wp_update_nav_menu_item(
                $menu_id,
                0,
                array(
                    'menu-item-object-id' => $page->ID,
                    'menu-item-object'    => 'page',
                    'menu-item-type'      => 'post_type',
                    'menu-item-status'    => 'publish',
                    'menu-item-title'     => get_the_title( $page ),
                )
            );
        }
    }
}

function bagueship_core_assign_menu_locations(): void {
    $locations = get_theme_mod( 'nav_menu_locations', array() );
    $primary   = wp_get_nav_menu_object( 'Primary' );
    $footer    = wp_get_nav_menu_object( 'Footer' );
    if ( $primary ) {
        $locations['primary'] = (int) $primary->term_id;
    }
    if ( $footer ) {
        $locations['footer'] = (int) $footer->term_id;
    }
    set_theme_mod( 'nav_menu_locations', $locations );
}

function bagueship_core_add_roles(): void {
    if ( ! get_role( 'gestionnaire_boutique' ) ) {
        add_role(
            'gestionnaire_boutique',
            'Gestionnaire boutique',
            array(
                'read'                  => true,
                'manage_woocommerce'    => true,
                'edit_products'         => true,
                'edit_product'          => true,
                'publish_products'      => true,
                'read_private_products' => true,
                'edit_shop_orders'      => true,
                'read_shop_orders'      => true,
                'manage_product_terms'  => true,
                'edit_product_terms'    => true,
                'delete_product_terms'  => true,
                'assign_product_terms'  => true,
            )
        );
    }
    if ( ! get_role( 'editeur_contenu' ) ) {
        add_role(
            'editeur_contenu',
            'Editeur contenu',
            array(
                'read'                 => true,
                'edit_pages'           => true,
                'edit_published_pages' => true,
                'publish_pages'        => true,
                'upload_files'         => true,
            )
        );
    }
}

function bagueship_core_term_meta( int $term_id ): array {
    return array(
        'bagueship_tagline'                   => (string) get_term_meta( $term_id, 'bagueship_tagline', true ),
        'bagueship_price_from'                => (string) get_term_meta( $term_id, 'bagueship_price_from', true ),
        'bagueship_status'                    => (string) get_term_meta( $term_id, 'bagueship_status', true ),
        'bagueship_collection_state'          => (string) get_term_meta( $term_id, 'bagueship_collection_state', true ),
        'bagueship_preorder_enabled'          => (string) get_term_meta( $term_id, 'bagueship_preorder_enabled', true ),
        'bagueship_preorder_discount_percent' => (string) get_term_meta( $term_id, 'bagueship_preorder_discount_percent', true ),
        'bagueship_preorder_estimate'         => (string) get_term_meta( $term_id, 'bagueship_preorder_estimate', true ),
        'bagueship_preorder_message'          => (string) get_term_meta( $term_id, 'bagueship_preorder_message', true ),
        'bagueship_accent'                    => (string) get_term_meta( $term_id, 'bagueship_accent', true ),
        'bagueship_order'                     => (int) get_term_meta( $term_id, 'bagueship_order', true ),
    );
}

function bagueship_core_collection_state_options(): array {
    return array(
        'available' => 'Disponible',
        'upcoming'  => 'À venir',
        'preorder'  => 'Précommande ouverte',
        'archived'  => 'Archivée',
    );
}

function bagueship_core_collection_state_label( string $state ): string {
    $options = bagueship_core_collection_state_options();
    return $options[ $state ] ?? $options['available'];
}

function bagueship_core_product_cat_add_fields(): void {
    ?>
    <div class="form-field">
      <label for="bagueship_tagline">Accroche</label>
      <input name="bagueship_tagline" id="bagueship_tagline" type="text" value="">
    </div>
    <div class="form-field">
      <label for="bagueship_price_from">Prix à partir de</label>
      <input name="bagueship_price_from" id="bagueship_price_from" type="text" value="">
    </div>
    <div class="form-field">
      <label for="bagueship_status">Statut</label>
      <input name="bagueship_status" id="bagueship_status" type="text" value="">
    </div>
    <div class="form-field">
      <label for="bagueship_collection_state">État commercial</label>
      <select name="bagueship_collection_state" id="bagueship_collection_state">
        <?php foreach ( bagueship_core_collection_state_options() as $value => $label ) : ?>
          <option value="<?php echo esc_attr( $value ); ?>"><?php echo esc_html( $label ); ?></option>
        <?php endforeach; ?>
      </select>
    </div>
    <div class="form-field">
      <label for="bagueship_preorder_discount_percent">Remise soutien précommande (%)</label>
      <input name="bagueship_preorder_discount_percent" id="bagueship_preorder_discount_percent" type="number" min="0" max="80" step="1" value="20">
    </div>
    <div class="form-field">
      <label for="bagueship_preorder_estimate">Expédition estimée</label>
      <input name="bagueship_preorder_estimate" id="bagueship_preorder_estimate" type="text" value="" placeholder="Ex: octobre 2026">
    </div>
    <div class="form-field">
      <label for="bagueship_preorder_message">Message de précommande</label>
      <textarea name="bagueship_preorder_message" id="bagueship_preorder_message" rows="4"></textarea>
    </div>
    <div class="form-field">
      <label for="bagueship_accent">Accent couleur / ambiance</label>
      <input name="bagueship_accent" id="bagueship_accent" type="text" value="">
    </div>
    <div class="form-field">
      <label for="bagueship_order">Ordre d'affichage</label>
      <input name="bagueship_order" id="bagueship_order" type="number" min="0" step="1" value="0">
    </div>
    <?php
}
add_action( 'product_cat_add_form_fields', 'bagueship_core_product_cat_add_fields' );

function bagueship_core_product_cat_edit_fields( WP_Term $term ): void {
    $meta = bagueship_core_term_meta( $term->term_id );
    ?>
    <tr class="form-field">
      <th scope="row"><label for="bagueship_tagline">Accroche</label></th>
      <td><input name="bagueship_tagline" id="bagueship_tagline" type="text" value="<?php echo esc_attr( $meta['bagueship_tagline'] ); ?>"></td>
    </tr>
    <tr class="form-field">
      <th scope="row"><label for="bagueship_price_from">Prix à partir de</label></th>
      <td><input name="bagueship_price_from" id="bagueship_price_from" type="text" value="<?php echo esc_attr( $meta['bagueship_price_from'] ); ?>"></td>
    </tr>
    <tr class="form-field">
      <th scope="row"><label for="bagueship_status">Statut</label></th>
      <td><input name="bagueship_status" id="bagueship_status" type="text" value="<?php echo esc_attr( $meta['bagueship_status'] ); ?>"></td>
    </tr>
    <tr class="form-field">
      <th scope="row"><label for="bagueship_collection_state">État commercial</label></th>
      <td>
        <select name="bagueship_collection_state" id="bagueship_collection_state">
          <?php foreach ( bagueship_core_collection_state_options() as $value => $label ) : ?>
            <option value="<?php echo esc_attr( $value ); ?>"<?php selected( $meta['bagueship_collection_state'] ?: 'available', $value ); ?>><?php echo esc_html( $label ); ?></option>
          <?php endforeach; ?>
        </select>
        <p class="description">Pilote les badges, l'achat et la précommande sur le site.</p>
      </td>
    </tr>
    <tr class="form-field">
      <th scope="row"><label for="bagueship_preorder_discount_percent">Remise soutien précommande (%)</label></th>
      <td><input name="bagueship_preorder_discount_percent" id="bagueship_preorder_discount_percent" type="number" min="0" max="80" step="1" value="<?php echo esc_attr( $meta['bagueship_preorder_discount_percent'] ?: 20 ); ?>"></td>
    </tr>
    <tr class="form-field">
      <th scope="row"><label for="bagueship_preorder_estimate">Expédition estimée</label></th>
      <td><input name="bagueship_preorder_estimate" id="bagueship_preorder_estimate" type="text" value="<?php echo esc_attr( $meta['bagueship_preorder_estimate'] ); ?>" placeholder="Ex: octobre 2026"></td>
    </tr>
    <tr class="form-field">
      <th scope="row"><label for="bagueship_preorder_message">Message de précommande</label></th>
      <td><textarea name="bagueship_preorder_message" id="bagueship_preorder_message" rows="4"><?php echo esc_textarea( $meta['bagueship_preorder_message'] ); ?></textarea></td>
    </tr>
    <tr class="form-field">
      <th scope="row"><label for="bagueship_accent">Accent couleur / ambiance</label></th>
      <td><input name="bagueship_accent" id="bagueship_accent" type="text" value="<?php echo esc_attr( $meta['bagueship_accent'] ); ?>"></td>
    </tr>
    <tr class="form-field">
      <th scope="row"><label for="bagueship_order">Ordre d'affichage</label></th>
      <td><input name="bagueship_order" id="bagueship_order" type="number" min="0" step="1" value="<?php echo esc_attr( $meta['bagueship_order'] ?: 0 ); ?>"></td>
    </tr>
    <?php
}
add_action( 'product_cat_edit_form_fields', 'bagueship_core_product_cat_edit_fields' );

function bagueship_core_save_product_cat_meta( int $term_id ): void {
    $keys = array( 'bagueship_tagline', 'bagueship_price_from', 'bagueship_status', 'bagueship_collection_state', 'bagueship_preorder_discount_percent', 'bagueship_preorder_estimate', 'bagueship_preorder_message', 'bagueship_accent', 'bagueship_order' );
    foreach ( $keys as $key ) {
        if ( isset( $_POST[ $key ] ) ) {
            if ( 'bagueship_order' === $key || 'bagueship_preorder_discount_percent' === $key ) {
                $value = (string) absint( wp_unslash( $_POST[ $key ] ) );
            } elseif ( 'bagueship_collection_state' === $key ) {
                $state = sanitize_key( wp_unslash( $_POST[ $key ] ) );
                $value = array_key_exists( $state, bagueship_core_collection_state_options() ) ? $state : 'available';
            } elseif ( 'bagueship_preorder_message' === $key ) {
                $value = sanitize_textarea_field( wp_unslash( $_POST[ $key ] ) );
            } else {
                $value = sanitize_text_field( wp_unslash( $_POST[ $key ] ) );
            }
            update_term_meta( $term_id, $key, $value );
        }
    }
}
add_action( 'created_product_cat', 'bagueship_core_save_product_cat_meta' );
add_action( 'edited_product_cat', 'bagueship_core_save_product_cat_meta' );

function bagueship_core_product_image_id( string $slug ): int {
    return 0;
}

function bagueship_core_cleanup_catalog( array $allowed_product_slugs, array $allowed_category_slugs ): void {
    $products = get_posts(
        array(
            'post_type'      => 'product',
            'post_status'    => 'any',
            'posts_per_page' => -1,
            'fields'         => 'ids',
        )
    );
    foreach ( $products as $product_id ) {
        $slug = get_post_field( 'post_name', (int) $product_id );
        if ( ! in_array( $slug, $allowed_product_slugs, true ) ) {
            wp_delete_post( (int) $product_id, true );
        }
    }

    $terms = get_terms(
        array(
            'taxonomy'   => 'product_cat',
            'hide_empty' => false,
        )
    );
    if ( is_wp_error( $terms ) ) {
        return;
    }
    foreach ( $terms as $term ) {
        if ( in_array( $term->slug, array( 'uncategorized', 'non-classe' ), true ) ) {
            continue;
        }
        if ( ! in_array( $term->slug, $allowed_category_slugs, true ) ) {
            wp_delete_term( (int) $term->term_id, 'product_cat' );
        }
    }
}

function bagueship_core_create_variable_product( array $args ): int {
    if ( ! class_exists( 'WC_Product_Variable' ) ) {
        return 0;
    }

    $existing = wc_get_product_id_by_sku( $args['sku'] );
    if ( $existing ) {
        $product = wc_get_product( $existing );
        if ( ! $product || ! $product->is_type( 'variable' ) ) {
            wp_delete_post( (int) $existing, true );
            $product = new WC_Product_Variable();
        } else {
            foreach ( $product->get_children() as $child_id ) {
                wp_delete_post( (int) $child_id, true );
            }
        }
    } else {
        $product = new WC_Product_Variable();
    }

    $product->set_name( $args['name'] );
    $product->set_slug( $args['slug'] );
    $product->set_status( 'publish' );
    $product->set_description( $args['description'] );
    $product->set_short_description( $args['short_description'] );
    $product->set_sku( $args['sku'] );
    $product->set_regular_price( '' );
    $product->set_catalog_visibility( 'visible' );
    $product->set_manage_stock( false );
    $product->save();

    wp_set_object_terms( $product->get_id(), array( $args['category'] ), 'product_cat' );
    wp_set_object_terms( $product->get_id(), array( 'variable' ), 'product_type' );

    $image_id = bagueship_core_product_image_id( $args['slug'] );
    if ( $image_id ) {
        set_post_thumbnail( $product->get_id(), $image_id );
    }

    $attribute = new WC_Product_Attribute();
    $attribute->set_name( 'taille' );
    $attribute->set_options( $args['sizes'] );
    $attribute->set_visible( true );
    $attribute->set_variation( true );
    $product->set_attributes( array( $attribute ) );
    $product->save();

    foreach ( $args['sizes'] as $size ) {
        $variation = new WC_Product_Variation();
        $variation->set_parent_id( $product->get_id() );
        $variation->set_status( 'publish' );
        $variation->set_attributes( array( 'attribute_taille' => $size ) );
        $variation->set_regular_price( (string) $args['price'] );
        $variation->set_sku( $args['sku'] . '-' . $size );
        $variation->set_manage_stock( true );
        $variation->set_stock_quantity( 8 );
        $variation->set_stock_status( 'instock' );
        $variation->save();
    }

    WC_Product_Variable::sync( $product->get_id() );
    wc_delete_product_transients( $product->get_id() );

    update_post_meta( $product->get_id(), '_price', $args['price'] );
    update_post_meta( $product->get_id(), '_regular_price', $args['price'] );
    update_post_meta( $product->get_id(), '_featured', 'yes' );
    if ( ! empty( $args['model_file'] ) ) {
        update_post_meta( $product->get_id(), '_bagueship_model_file', sanitize_file_name( $args['model_file'] ) );
    }
    if ( ! empty( $args['meta'] ) && is_array( $args['meta'] ) ) {
        foreach ( $args['meta'] as $key => $value ) {
            update_post_meta( $product->get_id(), '_bagueship_' . sanitize_key( $key ), sanitize_textarea_field( (string) $value ) );
        }
    }

    return $product->get_id();
}

function bagueship_core_create_simple_product( array $args ): int {
    if ( ! class_exists( 'WC_Product_Simple' ) ) {
        return 0;
    }
    $existing = wc_get_product_id_by_sku( $args['sku'] );
    if ( $existing ) {
        return (int) $existing;
    }
    $product = new WC_Product_Simple();
    $product->set_name( $args['name'] );
    $product->set_slug( $args['slug'] );
    $product->set_status( 'publish' );
    $product->set_description( $args['description'] );
    $product->set_short_description( $args['short_description'] );
    $product->set_sku( $args['sku'] );
    $product->set_regular_price( (string) $args['price'] );
    $product->set_manage_stock( true );
    $product->set_stock_quantity( 12 );
    $product->set_stock_status( 'instock' );
    $product->save();
    wp_set_object_terms( $product->get_id(), array( $args['category'] ), 'product_cat' );
    $image_id = bagueship_core_product_image_id( $args['slug'] );
    if ( $image_id ) {
        set_post_thumbnail( $product->get_id(), $image_id );
    }
    return $product->get_id();
}

function bagueship_core_register_product_fields(): void {
    echo '<div class="options_group">';
    woocommerce_wp_text_input( array( 'id' => '_bagueship_matiere', 'label' => 'Matière' ) );
    woocommerce_wp_text_input( array( 'id' => '_bagueship_finition', 'label' => 'Finition' ) );
    woocommerce_wp_text_input( array( 'id' => '_bagueship_couleur', 'label' => 'Couleur' ) );
    woocommerce_wp_text_input( array( 'id' => '_bagueship_largeur', 'label' => 'Largeur' ) );
    woocommerce_wp_text_input( array( 'id' => '_bagueship_epaisseur', 'label' => 'Épaisseur' ) );
    woocommerce_wp_text_input( array( 'id' => '_bagueship_poids_bijou', 'label' => 'Poids du bijou' ) );
    woocommerce_wp_text_input( array( 'id' => '_bagueship_guide_taille', 'label' => 'Guide taille' ) );
    woocommerce_wp_textarea_input( array( 'id' => '_bagueship_entretien', 'label' => 'Entretien' ) );
    woocommerce_wp_textarea_input( array( 'id' => '_bagueship_fabrication', 'label' => 'Fabrication' ) );
    woocommerce_wp_textarea_input( array( 'id' => '_bagueship_garantie', 'label' => 'Garantie' ) );
    woocommerce_wp_textarea_input( array( 'id' => '_bagueship_packaging', 'label' => 'Packaging' ) );
    woocommerce_wp_textarea_input( array( 'id' => '_bagueship_availability_note', 'label' => 'Note de disponibilité' ) );
    woocommerce_wp_text_input( array( 'id' => '_bagueship_model_file', 'label' => 'Fichier modèle 3D' ) );
    echo '</div>';
}
add_action( 'woocommerce_product_options_general_product_data', 'bagueship_core_register_product_fields' );

function bagueship_core_save_product_fields( WC_Product $product ): void {
    $keys = array( '_bagueship_matiere', '_bagueship_finition', '_bagueship_couleur', '_bagueship_largeur', '_bagueship_epaisseur', '_bagueship_poids_bijou', '_bagueship_guide_taille', '_bagueship_entretien', '_bagueship_fabrication', '_bagueship_garantie', '_bagueship_packaging', '_bagueship_availability_note', '_bagueship_model_file' );
    foreach ( $keys as $key ) {
        if ( isset( $_POST[ $key ] ) ) {
            $product->update_meta_data( $key, sanitize_textarea_field( wp_unslash( $_POST[ $key ] ) ) );
        }
    }
}
add_action( 'woocommerce_admin_process_product_object', 'bagueship_core_save_product_fields' );

function bagueship_core_available_model_files(): array {
    $models_dir = trailingslashit( get_stylesheet_directory() ) . 'assets/models';
    if ( ! is_dir( $models_dir ) ) {
        return array();
    }

    $files = glob( trailingslashit( $models_dir ) . '*.glb' );
    if ( ! is_array( $files ) ) {
        return array();
    }

    $files = array_map( 'basename', $files );
    sort( $files, SORT_NATURAL | SORT_FLAG_CASE );

    return $files;
}

function bagueship_core_register_model_metabox(): void {
    add_meta_box(
        'bagueship-model-file',
        'Modèle 3D Bagueship',
        'bagueship_core_render_model_metabox',
        'product',
        'side',
        'default'
    );
}
add_action( 'add_meta_boxes_product', 'bagueship_core_register_model_metabox' );

function bagueship_core_render_model_metabox( WP_Post $post ): void {
    $current = (string) get_post_meta( $post->ID, '_bagueship_model_file', true );
    $files   = bagueship_core_available_model_files();

    wp_nonce_field( 'bagueship_save_model_file', 'bagueship_model_file_nonce' );
    echo '<p><label for="bagueship_model_file_select"><strong>Fichier .glb associé</strong></label></p>';
    echo '<select id="bagueship_model_file_select" name="_bagueship_model_file" style="width:100%;">';
    echo '<option value="">Auto: slug-produit.glb</option>';
    foreach ( $files as $file ) {
        printf(
            '<option value="%s"%s>%s</option>',
            esc_attr( $file ),
            selected( $current, $file, false ),
            esc_html( $file )
        );
    }
    echo '</select>';
    echo '<p class="description">Les fichiers sont lus depuis <code>wp-content/themes/bagueship/assets/models/</code>. Si tu laisses vide, le site cherche automatiquement un fichier portant le slug du produit.</p>';
}

function bagueship_core_save_model_metabox( int $post_id ): void {
    if ( ! isset( $_POST['bagueship_model_file_nonce'] ) || ! wp_verify_nonce( sanitize_text_field( wp_unslash( $_POST['bagueship_model_file_nonce'] ) ), 'bagueship_save_model_file' ) ) {
        return;
    }

    if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
        return;
    }

    if ( ! current_user_can( 'edit_post', $post_id ) ) {
        return;
    }

    if ( isset( $_POST['_bagueship_model_file'] ) ) {
        $model_file = sanitize_file_name( wp_unslash( $_POST['_bagueship_model_file'] ) );
        if ( '' === $model_file ) {
            delete_post_meta( $post_id, '_bagueship_model_file' );
            return;
        }
        update_post_meta( $post_id, '_bagueship_model_file', $model_file );
    }
}
add_action( 'save_post_product', 'bagueship_core_save_model_metabox' );

function bagueship_core_product_collection_preorder_data( int $product_id ): array {
    $parent_id = wp_get_post_parent_id( $product_id );
    if ( $parent_id ) {
        $product_id = (int) $parent_id;
    }

    $terms = get_the_terms( $product_id, 'product_cat' );
    if ( is_wp_error( $terms ) || empty( $terms ) ) {
        return array( 'state' => 'available', 'enabled' => false );
    }

    foreach ( $terms as $term ) {
        $meta = bagueship_core_term_meta( (int) $term->term_id );
        $state = $meta['bagueship_collection_state'] ?: ( 'Disponible' === $meta['bagueship_status'] ? 'available' : 'available' );
        if ( 'preorder' !== $state && 'upcoming' !== $state ) {
            continue;
        }

        $discount = (int) ( $meta['bagueship_preorder_discount_percent'] ?: 20 );
        $discount = max( 0, min( 80, $discount ) );

        return array(
            'state'            => $state,
            'enabled'          => 'preorder' === $state,
            'term_id'          => (int) $term->term_id,
            'collection_name'  => $term->name,
            'label'            => bagueship_core_collection_state_label( $state ),
            'discount_percent' => $discount,
            'estimate'         => $meta['bagueship_preorder_estimate'],
            'message'          => $meta['bagueship_preorder_message'],
        );
    }

    return array( 'state' => 'available', 'enabled' => false );
}

function bagueship_core_preorder_price( float $regular_price, array $preorder_data ): float {
    if ( empty( $preorder_data['enabled'] ) || $regular_price <= 0 ) {
        return $regular_price;
    }

    $discount = (int) ( $preorder_data['discount_percent'] ?? 20 );
    $discounted = $regular_price * ( 100 - $discount ) / 100;

    return (float) wc_format_decimal( max( 1, $discounted ), wc_get_price_decimals() );
}

function bagueship_core_cart_item_preorder_data( array $cart_item ): array {
    $product_id = (int) ( $cart_item['product_id'] ?? 0 );
    if ( ! $product_id ) {
        return array( 'enabled' => false );
    }
    return bagueship_core_product_collection_preorder_data( $product_id );
}

function bagueship_core_apply_preorder_cart_prices( WC_Cart $cart ): void {
    if ( is_admin() && ! defined( 'DOING_AJAX' ) ) {
        return;
    }

    foreach ( $cart->get_cart() as $cart_item ) {
        if ( empty( $cart_item['data'] ) || ! $cart_item['data'] instanceof WC_Product ) {
            continue;
        }

        $preorder_data = bagueship_core_cart_item_preorder_data( $cart_item );
        if ( empty( $preorder_data['enabled'] ) ) {
            continue;
        }

        $regular_price = (float) $cart_item['data']->get_regular_price();
        if ( $regular_price <= 0 ) {
            $regular_price = (float) $cart_item['data']->get_price();
        }
        $cart_item['data']->set_price( bagueship_core_preorder_price( $regular_price, $preorder_data ) );
    }
}
add_action( 'woocommerce_before_calculate_totals', 'bagueship_core_apply_preorder_cart_prices', 20 );

function bagueship_core_validate_collection_purchase( bool $passed, int $product_id ): bool {
    $data = bagueship_core_product_collection_preorder_data( $product_id );
    if ( 'upcoming' === ( $data['state'] ?? 'available' ) ) {
        wc_add_notice( 'Cette collection est à venir. Les commandes ne sont pas encore ouvertes.', 'error' );
        return false;
    }
    if ( 'archived' === ( $data['state'] ?? 'available' ) ) {
        wc_add_notice( 'Cette collection n’est plus disponible à la commande.', 'error' );
        return false;
    }
    return $passed;
}
add_filter( 'woocommerce_add_to_cart_validation', 'bagueship_core_validate_collection_purchase', 10, 2 );

function bagueship_core_handle_cart_size_update(): void {
    if ( ! function_exists( 'wc_load_cart' ) ) {
        wp_safe_redirect( wc_get_cart_url() );
        exit;
    }
    wc_load_cart();

    $cart_item_key = isset( $_POST['cart_item_key'] ) ? sanitize_text_field( wp_unslash( $_POST['cart_item_key'] ) ) : '';
    $product_id    = isset( $_POST['product_id'] ) ? absint( wp_unslash( $_POST['product_id'] ) ) : 0;
    $variation_id  = isset( $_POST['variation_id'] ) ? absint( wp_unslash( $_POST['variation_id'] ) ) : 0;
    $size          = isset( $_POST['attribute_taille'] ) ? sanitize_text_field( wp_unslash( $_POST['attribute_taille'] ) ) : '';

    if ( ! $cart_item_key || ! $product_id || ! $variation_id || ! $size || ! isset( $_POST['bagueship_cart_size_nonce'] ) || ! wp_verify_nonce( sanitize_text_field( wp_unslash( $_POST['bagueship_cart_size_nonce'] ) ), 'bagueship_cart_size_' . $cart_item_key ) ) {
        wc_add_notice( 'Impossible de modifier la taille de cet article.', 'error' );
        wp_safe_redirect( wc_get_cart_url() );
        exit;
    }

    $cart = WC()->cart;
    if ( ! $cart || empty( $cart->cart_contents[ $cart_item_key ] ) ) {
        $session_cart = WC()->session ? WC()->session->get( 'cart' ) : array();
        if ( is_array( $session_cart ) && ! empty( $session_cart[ $cart_item_key ] ) ) {
            $session_cart[ $cart_item_key ]['variation_id'] = $variation_id;
            $session_cart[ $cart_item_key ]['variation']    = array( 'attribute_taille' => $size );
            WC()->session->set( 'cart', $session_cart );
            wc_add_notice( 'La taille a été mise à jour.', 'success' );
            wp_safe_redirect( wc_get_cart_url() );
            exit;
        }
        wc_add_notice( 'Cet article n’est plus dans votre panier.', 'error' );
        wp_safe_redirect( wc_get_cart_url() );
        exit;
    }

    $cart_item = $cart->cart_contents[ $cart_item_key ];
    $quantity  = max( 1, (int) ( $cart_item['quantity'] ?? 1 ) );
    $variation = wc_get_product( $variation_id );
    if ( ! $variation || (int) $variation->get_parent_id() !== $product_id ) {
        wc_add_notice( 'Cette taille n’est pas disponible pour cet article.', 'error' );
        wp_safe_redirect( wc_get_cart_url() );
        exit;
    }

    $variation_attributes = $variation->get_variation_attributes();
    if ( empty( $variation_attributes ) ) {
        $variation_attributes = array( 'attribute_taille' => $size );
    }

    if ( (int) ( $cart_item['variation_id'] ?? 0 ) === $variation_id ) {
        $cart->cart_contents[ $cart_item_key ]['variation'] = $variation_attributes;
        $cart->cart_contents[ $cart_item_key ]['data']      = $variation;
        $cart->cart_contents[ $cart_item_key ]['quantity']  = $quantity;
    } else {
        $cart_item_data = $cart_item;
        foreach ( array( 'key', 'product_id', 'variation_id', 'variation', 'quantity', 'data', 'data_hash', 'line_tax_data', 'line_subtotal', 'line_subtotal_tax', 'line_total', 'line_tax' ) as $reserved_key ) {
            unset( $cart_item_data[ $reserved_key ] );
        }

        $new_cart_item_key = $cart->add_to_cart( $product_id, $quantity, $variation_id, $variation_attributes, $cart_item_data );
        if ( ! $new_cart_item_key ) {
            wc_add_notice( 'Impossible de modifier la taille de cet article.', 'error' );
            wp_safe_redirect( wc_get_cart_url() );
            exit;
        }

        $cart->remove_cart_item( $cart_item_key );
    }
    $cart->calculate_totals();
    $cart->set_session();

    wc_add_notice( 'La taille a été mise à jour.', 'success' );

    wp_safe_redirect( wc_get_cart_url() );
    exit;
}
add_action( 'admin_post_bagueship_update_cart_size', 'bagueship_core_handle_cart_size_update' );
add_action( 'admin_post_nopriv_bagueship_update_cart_size', 'bagueship_core_handle_cart_size_update' );

function bagueship_core_notify_result_url( int $product_id, string $status ): string {
    $url = $product_id ? get_permalink( $product_id ) : home_url( '/' );
    return add_query_arg( 'bagueship_notify', rawurlencode( $status ), $url . '#acheter' );
}

function bagueship_core_handle_preorder_notify(): void {
    $product_id = isset( $_POST['product_id'] ) ? absint( wp_unslash( $_POST['product_id'] ) ) : 0;
    if ( ! $product_id || ! isset( $_POST['bagueship_notify_nonce'] ) || ! wp_verify_nonce( sanitize_text_field( wp_unslash( $_POST['bagueship_notify_nonce'] ) ), 'bagueship_notify_' . $product_id ) ) {
        wp_safe_redirect( bagueship_core_notify_result_url( $product_id, 'invalid' ) );
        exit;
    }

    $product = wc_get_product( $product_id );
    $data    = bagueship_core_product_collection_preorder_data( $product_id );
    if ( ! $product || 'upcoming' !== ( $data['state'] ?? 'available' ) ) {
        wp_safe_redirect( bagueship_core_notify_result_url( $product_id, 'closed' ) );
        exit;
    }

    $email = isset( $_POST['bagueship_notify_email'] ) ? sanitize_email( wp_unslash( $_POST['bagueship_notify_email'] ) ) : '';
    if ( ! is_email( $email ) ) {
        wp_safe_redirect( bagueship_core_notify_result_url( $product_id, 'email' ) );
        exit;
    }

    $existing = get_posts(
        array(
            'post_type'      => 'bagueship_notify',
            'post_status'    => 'private',
            'posts_per_page' => 1,
            'fields'         => 'ids',
            'meta_query'     => array(
                'relation' => 'AND',
                array(
                    'key'   => '_bagueship_notify_email',
                    'value' => $email,
                ),
                array(
                    'key'   => '_bagueship_notify_product_id',
                    'value' => $product_id,
                ),
            ),
        )
    );

    if ( empty( $existing ) ) {
        $notify_id = wp_insert_post(
            array(
                'post_type'   => 'bagueship_notify',
                'post_status' => 'private',
                'post_title'  => sprintf( '%s · %s', $email, $product->get_name() ),
            )
        );
        if ( $notify_id && ! is_wp_error( $notify_id ) ) {
            update_post_meta( $notify_id, '_bagueship_notify_email', $email );
            update_post_meta( $notify_id, '_bagueship_notify_product_id', $product_id );
            update_post_meta( $notify_id, '_bagueship_notify_product_name', $product->get_name() );
            update_post_meta( $notify_id, '_bagueship_notify_collection_name', $data['collection_name'] ?? '' );
            update_post_meta( $notify_id, '_bagueship_notify_registered_at', current_time( 'mysql' ) );
        }
    }

    wp_safe_redirect( bagueship_core_notify_result_url( $product_id, 'ok' ) );
    exit;
}
add_action( 'admin_post_bagueship_preorder_notify', 'bagueship_core_handle_preorder_notify' );
add_action( 'admin_post_nopriv_bagueship_preorder_notify', 'bagueship_core_handle_preorder_notify' );

function bagueship_core_notify_admin_page(): void {
    if ( ! current_user_can( 'manage_woocommerce' ) ) {
        wp_die( esc_html__( 'Accès refusé.', 'bagueship' ) );
    }

    $alerts = get_posts(
        array(
            'post_type'      => 'bagueship_notify',
            'post_status'    => 'private',
            'posts_per_page' => 200,
            'orderby'        => 'date',
            'order'          => 'DESC',
        )
    );
    ?>
    <div class="wrap">
      <h1>Alertes précommande</h1>
      <p>Emails laissés sur les produits appartenant à une collection à venir.</p>
      <table class="widefat striped">
        <thead>
          <tr>
            <th>Email</th>
            <th>Produit</th>
            <th>Collection</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody>
        <?php if ( empty( $alerts ) ) : ?>
          <tr><td colspan="4">Aucune alerte pour le moment.</td></tr>
        <?php endif; ?>
        <?php foreach ( $alerts as $alert ) : ?>
          <tr>
            <td><a href="mailto:<?php echo esc_attr( get_post_meta( $alert->ID, '_bagueship_notify_email', true ) ); ?>"><?php echo esc_html( get_post_meta( $alert->ID, '_bagueship_notify_email', true ) ); ?></a></td>
            <td><?php echo esc_html( get_post_meta( $alert->ID, '_bagueship_notify_product_name', true ) ); ?></td>
            <td><?php echo esc_html( get_post_meta( $alert->ID, '_bagueship_notify_collection_name', true ) ); ?></td>
            <td><?php echo esc_html( get_post_meta( $alert->ID, '_bagueship_notify_registered_at', true ) ?: get_the_date( 'Y-m-d H:i', $alert ) ); ?></td>
          </tr>
        <?php endforeach; ?>
        </tbody>
      </table>
    </div>
    <?php
}

function bagueship_core_preorder_cart_item_data( array $item_data, array $cart_item ): array {
    $preorder_data = bagueship_core_cart_item_preorder_data( $cart_item );
    if ( empty( $preorder_data['enabled'] ) ) {
        return $item_data;
    }

    $item_data[] = array(
        'key'   => 'Précommande',
        'value' => trim( 'Prix soutien' . ( ! empty( $preorder_data['estimate'] ) ? ' · Expédition estimée ' . $preorder_data['estimate'] : '' ) ),
    );

    return $item_data;
}
add_filter( 'woocommerce_get_item_data', 'bagueship_core_preorder_cart_item_data', 10, 2 );

function bagueship_core_checkout_preorder_notice(): void {
    if ( ! function_exists( 'WC' ) || ! WC()->cart ) {
        return;
    }
    foreach ( WC()->cart->get_cart() as $cart_item ) {
        $data = bagueship_core_cart_item_preorder_data( $cart_item );
        if ( empty( $data['enabled'] ) ) {
            continue;
        }
        $estimate = ! empty( $data['estimate'] ) ? ' Expédition estimée : ' . $data['estimate'] . '.' : '';
        wc_print_notice( 'Votre commande contient une précommande à prix soutien.' . $estimate, 'notice' );
        return;
    }
}
add_action( 'woocommerce_before_checkout_form', 'bagueship_core_checkout_preorder_notice', 5 );

function bagueship_core_preorder_order_line_item( WC_Order_Item_Product $item, string $cart_item_key, array $values ): void {
    $preorder_data = bagueship_core_cart_item_preorder_data( $values );
    if ( empty( $preorder_data['enabled'] ) ) {
        return;
    }

    $item->add_meta_data( 'Précommande', 'Oui', true );
    $item->add_meta_data( 'Type', 'Prix soutien', true );
    if ( ! empty( $preorder_data['estimate'] ) ) {
        $item->add_meta_data( 'Expédition estimée', $preorder_data['estimate'], true );
    }
}
add_action( 'woocommerce_checkout_create_order_line_item', 'bagueship_core_preorder_order_line_item', 10, 3 );

function bagueship_core_get_product_meta( int $product_id ): array {
    return array(
        'matiere'           => (string) get_post_meta( $product_id, '_bagueship_matiere', true ),
        'finition'          => (string) get_post_meta( $product_id, '_bagueship_finition', true ),
        'couleur'           => (string) get_post_meta( $product_id, '_bagueship_couleur', true ),
        'largeur'           => (string) get_post_meta( $product_id, '_bagueship_largeur', true ),
        'epaisseur'         => (string) get_post_meta( $product_id, '_bagueship_epaisseur', true ),
        'poids_bijou'       => (string) get_post_meta( $product_id, '_bagueship_poids_bijou', true ),
        'guide_taille'      => (string) get_post_meta( $product_id, '_bagueship_guide_taille', true ),
        'entretien'         => (string) get_post_meta( $product_id, '_bagueship_entretien', true ),
        'fabrication'       => (string) get_post_meta( $product_id, '_bagueship_fabrication', true ),
        'garantie'          => (string) get_post_meta( $product_id, '_bagueship_garantie', true ),
        'packaging'         => (string) get_post_meta( $product_id, '_bagueship_packaging', true ),
        'availability_note' => (string) get_post_meta( $product_id, '_bagueship_availability_note', true ),
        'model_file'        => (string) get_post_meta( $product_id, '_bagueship_model_file', true ),
    );
}

function bagueship_core_value_or_placeholder( string $value, string $placeholder ): string {
    $value = trim( $value );
    return '' !== $value ? esc_html( $value ) : '<span class="legal-missing">[À compléter : ' . esc_html( $placeholder ) . ']</span>';
}

function bagueship_core_legal_identity_html( array $options ): string {
    $rows = array(
        'Éditeur du site'           => bagueship_core_value_or_placeholder( $options['company_name'], 'raison sociale ou nom commercial' ),
        'Forme juridique'          => bagueship_core_value_or_placeholder( $options['legal_form'], 'forme juridique' ),
        'Adresse du siège'         => bagueship_core_value_or_placeholder( $options['address'], 'adresse complète' ),
        'SIRET'                    => bagueship_core_value_or_placeholder( $options['siret'], 'numéro SIRET' ),
        'TVA intracommunautaire'   => bagueship_core_value_or_placeholder( $options['vat'], 'numéro de TVA ou mention non applicable' ),
        'Directeur de publication' => bagueship_core_value_or_placeholder( $options['director'], 'nom du responsable de publication' ),
        'Contact'                  => bagueship_core_value_or_placeholder( $options['email'], 'adresse email de contact' ),
        'Téléphone'                => bagueship_core_value_or_placeholder( $options['phone'], 'numéro de téléphone ou mention non disponible' ),
    );

    $html = '<div class="legal-card"><h2>Identité de l’éditeur</h2>';
    foreach ( $rows as $label => $value ) {
        $html .= '<p><strong>' . esc_html( $label ) . ' :</strong> ' . $value . '</p>';
    }
    $html .= '</div>';
    return $html;
}

function bagueship_core_seed_legal_pages(): void {
    $options = bagueship_core_get_options();

    $company        = bagueship_core_value_or_placeholder( $options['company_name'], 'raison sociale' );
    $return_address = bagueship_core_value_or_placeholder( $options['return_address'], 'adresse de retour' );
    $withdraw_email = bagueship_core_value_or_placeholder( $options['withdraw_email'] ?: $options['email'], 'email rétractation' );
    $shipping_email = bagueship_core_value_or_placeholder( $options['shipping_email'] ?: $options['email'], 'email livraison' );
    $data_contact   = bagueship_core_value_or_placeholder( $options['data_contact'] ?: $options['email'], 'contact données personnelles' );
    $mediator       = bagueship_core_value_or_placeholder( $options['mediator'], 'médiateur de la consommation' );
    $mediator_url   = bagueship_core_value_or_placeholder( $options['mediator_url'], 'URL du médiateur' );

    $mentions  = '<h2>Mentions légales</h2>';
    $mentions .= '<p>Cette page permet d’identifier l’éditeur du site Bagueship et les principaux responsables du service.</p>';
    $mentions .= bagueship_core_legal_identity_html( $options );
    $mentions .= '<div class="legal-card"><h2>Hébergement</h2><p><strong>Hébergeur :</strong> ' . bagueship_core_value_or_placeholder( $options['host'], 'nom, adresse et contact de l’hébergeur' ) . '</p></div>';
    $mentions .= '<div class="legal-card"><h2>Propriété intellectuelle</h2><p>Les textes, visuels, modèles 3D, éléments graphiques, logos, interfaces et contenus du site sont protégés. Toute reproduction, extraction, modification ou réutilisation sans autorisation écrite préalable est interdite, sauf exceptions prévues par la loi.</p></div>';
    $mentions .= '<div class="legal-card"><h2>Données personnelles</h2><p>Pour toute demande liée aux données personnelles, contactez : ' . $data_contact . '.</p></div>';

    $cgu  = '<h2>Conditions générales d’utilisation et de vente</h2>';
    $cgu .= '<p>Les présentes conditions encadrent l’accès au site Bagueship, la navigation, les commandes, les précommandes, les paiements, la livraison, les retours et les garanties applicables aux bijoux vendus en ligne.</p>';
    $cgu .= '<h2>1. Identité du vendeur</h2>' . bagueship_core_legal_identity_html( $options );
    $cgu .= '<h2>2. Produits</h2><p>Bagueship vend des bijoux, principalement des bagues en acier inoxydable. Les caractéristiques essentielles sont indiquées sur chaque fiche produit : modèle, matériau, finition, taille, prix, disponibilité, statut de précommande éventuel et visuel 3D lorsque disponible.</p>';
    $cgu .= '<h2>3. Prix</h2><p>Les prix sont affichés en euros. Les éventuels frais de livraison, remises, taxes et frais additionnels sont indiqués avant validation de la commande. Pour les précommandes, le prix peut être inférieur au prix public prévu afin de soutenir la fabrication ou le lancement d’une collection.</p>';
    $cgu .= '<h2>4. Commande</h2><p>Le client sélectionne un produit, une taille, une quantité, puis valide son panier. Avant paiement, un récapitulatif permet de vérifier la commande et de corriger les erreurs éventuelles. La commande devient ferme après confirmation du paiement ou validation du mode de paiement disponible.</p>';
    $cgu .= '<h2>5. Paiement</h2><p>Le paiement s’effectue via les moyens proposés au moment de la commande. Le site doit afficher clairement le prestataire de paiement actif avant mise en production. Aucune donnée complète de carte bancaire n’est destinée à être stockée par Bagueship.</p>';
    $cgu .= '<h2>6. Précommandes</h2><p>Une précommande concerne un produit non immédiatement disponible. La fiche produit indique le statut, le prix de soutien et, lorsqu’elle est connue, une estimation d’expédition. En cas de modification significative du délai, le client est informé par email. Les droits légaux du consommateur restent applicables, sauf exception prévue par la loi.</p>';
    $cgu .= '<h2>7. Livraison</h2><p>La livraison est prévue en France via Mondial Relay. Le délai indicatif est de 1 à 2 semaines et les frais de livraison sont de 3 €, sauf indication différente affichée avant validation de commande. Pour toute question de suivi : ' . $shipping_email . '. Une page de suivi permet aussi de retrouver les informations de commande lorsque le transporteur les communique.</p>';
    $cgu .= '<h2>8. Droit de rétractation</h2><p>Conformément aux règles applicables à la vente à distance, le consommateur dispose en principe d’un délai de 14 jours pour exercer son droit de rétractation à compter de la réception du produit. Bagueship ne prévoit pas d’exclusion commerciale spécifique au droit de retour à ce stade, hors limites impératives prévues par la loi. La demande peut être envoyée à : ' . $withdraw_email . '.</p>';
    $cgu .= '<h2>9. Retours et remboursements</h2><p>Les produits doivent être retournés complets, non portés au-delà d’un simple essayage, non dégradés et dans leur emballage lorsque cela est possible. L’adresse de retour est : ' . $return_address . '. Le remboursement intervient après réception et contrôle du produit retourné, selon le moyen de paiement initial lorsque techniquement possible.</p>';
    $cgu .= '<h2>10. Garantie commerciale 1 an</h2><p>Bagueship propose une garantie commerciale d’un an couvrant les défauts anormaux de fabrication dans des conditions normales d’usage. Elle ne couvre pas l’usure normale, les rayures liées au port, les chocs, pertes, vols, modifications, mauvaise utilisation ou entretien inadapté. Cette garantie commerciale s’ajoute aux garanties légales.</p>';
    $cgu .= '<h2>11. Garanties légales</h2><p>Le client bénéficie des garanties légales applicables, notamment la garantie légale de conformité et la garantie contre les vices cachés, dans les conditions prévues par le droit français.</p>';
    $cgu .= '<h2>12. Données personnelles</h2><p>Les données nécessaires à la commande, au paiement, à la livraison, au service client, à la prévention de la fraude et aux obligations comptables sont traitées conformément à la politique de confidentialité. Contact données personnelles : ' . $data_contact . '.</p>';
    $cgu .= '<h2>13. Cookies</h2><p>Le site peut utiliser des cookies nécessaires à son fonctionnement et, selon les choix de l’utilisateur, des traceurs optionnels. Le consentement peut être accepté, refusé ou modifié depuis la page dédiée.</p>';
    $cgu .= '<h2>14. Responsabilité</h2><p>Bagueship s’efforce d’assurer l’accès au site et l’exactitude des informations publiées. Des interruptions techniques, erreurs ou évolutions de stock peuvent toutefois survenir. Les photographies, rendus 3D et couleurs peuvent varier selon les écrans.</p>';
    $cgu .= '<h2>15. Médiation et litiges</h2><p>En cas de litige, le client contacte d’abord Bagueship afin de rechercher une solution amiable. Si le différend persiste, le consommateur peut recourir au médiateur suivant : ' . $mediator . ' - ' . $mediator_url . '.</p>';
    $cgu .= '<h2>16. Droit applicable</h2><p>Les présentes conditions sont soumises au droit français, sous réserve des règles impératives protectrices du consommateur.</p>';

    $privacy  = '<h2>Politique de confidentialité</h2>';
    $privacy .= '<p>Cette politique explique comment Bagueship collecte et utilise les données personnelles nécessaires au fonctionnement du site, aux commandes et aux demandes client.</p>';
    $privacy .= '<h2>Responsable du traitement</h2><p>' . $company . ' est responsable des traitements réalisés via le site. Contact données personnelles : ' . $data_contact . '.</p>';
    $privacy .= '<h2>Données collectées</h2><p>Selon les usages du site, les données peuvent inclure : identité, email, téléphone, adresses de facturation et livraison, contenu des messages, informations de commande, historique d’achat, statut de paiement, données techniques de navigation et choix cookies.</p>';
    $privacy .= '<h2>Finalités</h2><p>Les données sont utilisées pour traiter les commandes, livrer les produits, gérer le service client, envoyer les alertes précommande demandées, respecter les obligations comptables et fiscales, sécuriser le site, gérer les retours et garanties, et améliorer l’expérience lorsque le consentement le permet.</p>';
    $privacy .= '<h2>Destinataires et outils utilisés ou prévus</h2><p>Les données peuvent être transmises aux prestataires strictement nécessaires : hébergeur OVH, WordPress/WooCommerce pour la boutique, prestataire de paiement Stripe lorsqu’il sera activé, transporteur Mondial Relay, outil de newsletter lorsqu’il sera choisi, réseaux sociaux utilisés pour la communication de marque, outils email, comptabilité et autorités lorsque la loi l’exige.</p>';
    $privacy .= '<h2>Durées de conservation</h2><p>Les données sont conservées pendant la durée nécessaire à leur finalité : gestion client et commande, obligations comptables, preuve contractuelle, demandes de garantie ou contentieux éventuel. Les durées précises doivent être validées selon l’organisation réelle de Bagueship.</p>';
    $privacy .= '<h2>Droits</h2><p>Vous pouvez demander l’accès, la rectification, l’effacement, la limitation, l’opposition ou la portabilité de vos données lorsque ces droits s’appliquent. Vous pouvez aussi retirer votre consentement pour les traitements fondés sur celui-ci.</p>[bagueship_personal_data_request_form]';

    $cookies  = '<h2>Politique cookies</h2>';
    $cookies .= '<p>Le site utilise des cookies nécessaires au panier, à la commande, à la sécurité et à la conservation de certains choix. Ces cookies sont indispensables au service demandé.</p>';
    $cookies .= '<p>Les éventuels cookies de mesure d’audience, newsletter, publicité, personnalisation, paiement Stripe ou réseaux sociaux ne doivent être déposés qu’après consentement lorsque la réglementation l’exige. Les outils exacts devront être confirmés avant la mise en production des traceurs optionnels.</p>';
    $cookies .= '<h2>Modifier mon choix</h2><p>Vous pouvez modifier votre choix à tout moment depuis ce lien.</p>[bagueship_cookie_preferences]';

    $delivery   = '<h2>Suivre le colis</h2><p>Les commandes sont prévues en livraison France via Mondial Relay, avec un délai indicatif de 1 à 2 semaines et des frais de livraison de 3 €.</p><p>Renseignez votre numéro de commande et l’email utilisé lors de l’achat pour retrouver les informations de suivi disponibles.</p>[woocommerce_order_tracking]<p>Si le suivi transporteur n’apparaît pas encore, contactez-nous via la page contact avec votre numéro de commande.</p>';
    $returns    = '<h2>Retour de produit</h2><p>Vous pouvez demander un retour depuis cette page. Indiquez le numéro de commande, l’email utilisé et le motif de la demande.</p><p>Adresse de retour : ' . $return_address . '.</p><p>Les retours doivent être envoyés complets, protégés, non abîmés et accompagnés des informations de commande.</p>[bagueship_withdrawal_form]';
    $warranty   = '<h2>Garantie 1 an</h2><p>Chaque bague Bagueship bénéficie d’une garantie commerciale d’un an contre les défauts anormaux de fabrication constatés dans des conditions normales d’usage.</p><p>La garantie ne couvre pas l’usure normale, les rayures, chocs, pertes, vols, modifications, mauvaise utilisation, exposition inadaptée ou entretien contraire aux recommandations.</p><p>Pour ouvrir une demande, contactez-nous avec le numéro de commande, des photos nettes et une description du problème.</p>';
    $questions  = '<h2>Questions</h2><h3>Comment choisir ma taille ?</h3><p>Consultez le guide des tailles ou contactez-nous si vous hésitez entre deux tailles.</p><h3>Les bagues sont-elles en acier ?</h3><p>Oui, les fiches produit indiquent la matière et la finition de chaque modèle.</p><h3>Comment fonctionne une précommande ?</h3><p>La précommande permet de soutenir le lancement d’une collection avec un prix inférieur au prix public prévu. Le délai estimé est indiqué lorsqu’il est connu.</p><h3>Puis-je retourner une bague ?</h3><p>Oui, lorsque les conditions légales et commerciales de retour sont remplies. Utilisez la page Retour de produit.</p><h3>Comment suivre mon colis ?</h3><p>Utilisez la page Suivre le colis avec votre numéro de commande et votre email.</p>';
    $ambassador = '<h2>Devenir ambassadeur / ambassadrice</h2><p>Bagueship recherche des profils capables de porter l’univers de la marque avec sincérité : créateurs, modèles, stylistes, photographes, artistes, ou simplement personnes avec une vraie présence visuelle.</p><p>Présentez-vous brièvement, ajoutez vos réseaux et expliquez pourquoi l’univers Bagueship vous parle.</p>[bagueship_ambassador_form]';

    bagueship_core_create_page( 'Mentions légales', 'mentions-legales', $mentions );
    bagueship_core_create_page( 'CGU', 'conditions-generales-utilisation', $cgu );
    bagueship_core_create_page( 'Conditions générales de vente', 'conditions-generales-de-vente', $cgu );
    bagueship_core_create_page( 'Conditions de précommande', 'conditions-de-precommande', '<h2>Conditions de précommande</h2><p>Certains produits peuvent être proposés en précommande avec un prix de soutien inférieur au prix public prévu. La fiche produit et le panier indiquent le statut de précommande, le prix appliqué et, lorsqu’elle est connue, l’estimation d’expédition.</p><p>Une précommande confirme une intention d’achat avant disponibilité immédiate du produit. Les délais annoncés sont des estimations liées à la fabrication, aux contrôles qualité et à la logistique. En cas de changement significatif de délai, le client est informé par email.</p><p>Sauf mention contraire sur la fiche produit, les droits légaux du consommateur restent applicables, notamment les garanties légales et les règles de rétractation prévues dans les CGU/CGV.</p>' );
    bagueship_core_create_page( 'Politique de confidentialité', 'politique-de-confidentialite', $privacy );
    bagueship_core_create_page( 'Données personnelles', 'donnees-personnelles', '<h2>Données personnelles</h2><p>Vous pouvez demander un export ou une suppression de vos données personnelles via le formulaire ci-dessous.</p>[bagueship_personal_data_request_form]' );
    bagueship_core_create_page( 'Politique cookies', 'politique-cookies', $cookies );
    bagueship_core_create_page( 'Livraison et retours', 'livraison-et-retours', '<h2>Livraison et retours</h2><p>La livraison est prévue en France via Mondial Relay. Le délai indicatif est de 1 à 2 semaines et les frais de livraison sont de 3 €, sauf indication différente affichée avant validation de commande.</p><p>Les retours sont traités via la page Retour de produit. Bagueship ne prévoit pas d’exclusion commerciale spécifique au droit de retour à ce stade, hors limites impératives prévues par la loi.</p><p>Contact livraison : ' . $shipping_email . '.</p>' );
    bagueship_core_create_page( 'Guide des tailles', 'guide-des-tailles', '<h2>Guide des tailles</h2><p>Mesurez le diamètre intérieur d’une bague qui vous va déjà, ou mesurez votre tour de doigt avec une bande de papier fine. En cas d’hésitation, contactez-nous avant commande.</p>' );
    bagueship_core_create_page( 'Entretien', 'entretien', '<h2>Entretien</h2><p>Nettoyez votre bague avec un chiffon doux. Évitez les chocs, produits abrasifs et contacts prolongés avec des produits chimiques afin de préserver la finition.</p>' );
    bagueship_core_create_page( 'À propos', 'a-propos', '<h2>À propos</h2><p>Bagueship construit un univers de bijoux en acier, sculptural, sombre et accessible, avec des pièces pensées comme des objets visuels forts.</p>' );
    bagueship_core_create_page( 'Questions', 'questions', $questions );
    bagueship_core_create_page( 'FAQ', 'faq', $questions );
    bagueship_core_create_page( 'Contact', 'contact', '<h2>Contact</h2><p>Une question sur une taille, une commande, une précommande ou un retour ? Écrivez-nous ici.</p>[bagueship_contact_form]' );
    bagueship_core_create_page( 'Suivre le colis', 'suivre-le-colis', $delivery );
    bagueship_core_create_page( 'Suivi de commande', 'suivi-de-commande', $delivery );
    bagueship_core_create_page( 'Retour de produit', 'retour-de-produit', $returns );
    bagueship_core_create_page( 'Garantie 1 an', 'garantie-1-an', $warranty );
    bagueship_core_create_page( 'Rétractation', 'retractation', $returns );
    bagueship_core_create_page( 'Devenir ambassadeur / ambassadrice', 'devenir-ambassadeur', $ambassador );
    bagueship_core_create_page( 'Maintenance', 'maintenance', '<h2>Maintenance</h2><p>La boutique est temporairement indisponible pendant une opération de maintenance.</p>' );
    bagueship_core_create_page( 'Paiement échoué', 'paiement-echoue', '<h2>Paiement échoué</h2><p>Le paiement n’a pas pu être validé. Vous pouvez réessayer ou retourner à la boutique.</p><p><a class="button" href="' . esc_url( wc_get_page_permalink( 'shop' ) ) . '">Retour boutique</a></p>' );
}

function bagueship_core_seed_site(): void {
    if ( ! function_exists( 'WC' ) ) {
        return;
    }

    update_option( 'blogname', 'Bagueship' );
    update_option( 'blogdescription', 'Boutique WordPress WooCommerce pour bijoux en acier.' );
    update_option( 'permalink_structure', '/%postname%/' );
    update_option( 'woocommerce_enable_guest_checkout', 'yes' );
    update_option( 'woocommerce_enable_checkout_login_reminder', 'no' );
    update_option( 'woocommerce_enable_myaccount_registration', 'yes' );
    update_option( 'woocommerce_enable_delayed_account_creation', 'yes' );
    update_option( 'woocommerce_registration_generate_username', 'yes' );
    update_option( 'woocommerce_registration_generate_password', 'yes' );
    update_option( 'woocommerce_coming_soon', 'no' );
    update_option( 'woocommerce_calc_taxes', 'yes' );
    update_option( 'woocommerce_prices_include_tax', 'no' );
    update_option( 'woocommerce_currency', 'EUR' );
    update_option( 'woocommerce_default_country', 'FR:75' );
    update_option( 'show_on_front', 'page' );
    bagueship_core_add_roles();

    $home_id = bagueship_core_create_page( 'Accueil', 'accueil', '' );
    $shop_id = bagueship_core_create_page( 'Boutique', 'boutique', '' );
    $cart_id = bagueship_core_create_page( 'Panier', 'panier', '[woocommerce_cart]' );
    $checkout_id = bagueship_core_create_page( 'Commande', 'commande', '[woocommerce_checkout]' );
    $account_id = bagueship_core_create_page( 'Mon compte', 'mon-compte', 'La commande invitée reste active, et la création de compte est proposée en fin de commande.' );
    update_option( 'page_on_front', $home_id );
    update_option( 'woocommerce_shop_page_id', $shop_id );
    update_option( 'woocommerce_cart_page_id', $cart_id );
    update_option( 'woocommerce_checkout_page_id', $checkout_id );
    update_option( 'woocommerce_myaccount_page_id', $account_id );

    $product_slugs = array( 'abstract-openwork-cuff', 'wavy-silver-cuff', 'chrome-embrace', 'curved-bar-silver-ring' );
    $collection_slugs = array( 'abstract', 'finger' );
    bagueship_core_cleanup_catalog( $product_slugs, $collection_slugs );

    $collections = array(
        array(
            'name' => 'Abstract',
            'slug' => 'abstract',
            'meta' => array( 'bagueship_tagline' => 'Volumes ouverts, lignes sculpturales et reflets francs.', 'bagueship_price_from' => 'À partir de 380 €', 'bagueship_status' => 'Disponible', 'bagueship_collection_state' => 'available', 'bagueship_order' => 1 ),
        ),
        array(
            'name' => 'Finger',
            'slug' => 'finger',
            'meta' => array( 'bagueship_tagline' => 'Courbes portées près du doigt, acier miroir et profils enveloppants.', 'bagueship_price_from' => 'À partir de 340 €', 'bagueship_status' => 'Disponible', 'bagueship_collection_state' => 'available', 'bagueship_order' => 2 ),
        ),
    );
    foreach ( $collections as $collection ) {
        bagueship_core_ensure_term( $collection['name'], $collection['slug'], $collection['meta'] );
    }

    $sizes = array( '52', '54', '56', '58', '60', '62' );
    $products = array(
        array(
            'name' => 'Abstract Openwork Cuff',
            'slug' => 'abstract-openwork-cuff',
            'sku' => 'BAG-ABSTRACT-OPENWORK',
            'price' => 380,
            'category' => 'abstract',
            'sizes' => $sizes,
            'short_description' => 'Bague ajourée en acier argenté, dessinée comme une structure ouverte.',
            'description' => 'Abstract Openwork Cuff met en avant un volume ajouré et sculptural. Le modèle 3D affiché sur le site correspond au fichier GLB réel de la collection Abstract.',
            'model_file' => 'abstract-openwork-cuff.glb',
            'meta' => array(
                'matiere' => 'Acier inoxydable',
                'finition' => 'Argent sculptural',
                'largeur' => 'Anneau ouvert',
                'poids_bijou' => 'Selon taille',
                'fabrication' => 'Modèle 3D Abstract',
                'packaging' => 'Livré en écrin Bagueship.',
            ),
        ),
        array(
            'name' => 'Wavy Silver Cuff',
            'slug' => 'wavy-silver-cuff',
            'sku' => 'BAG-ABSTRACT-WAVY',
            'price' => 420,
            'category' => 'abstract',
            'sizes' => $sizes,
            'short_description' => 'Bague cuff ondulée, acier clair et silhouette fluide.',
            'description' => 'Wavy Silver Cuff reprend une géométrie souple et lumineuse. Le rendu du site utilise son vrai modèle GLB.',
            'model_file' => 'wavy-silver-cuff.glb',
            'meta' => array(
                'matiere' => 'Acier inoxydable',
                'finition' => 'Argent poli',
                'largeur' => 'Cuff ondulé',
                'poids_bijou' => 'Selon taille',
                'fabrication' => 'Modèle 3D Abstract',
                'packaging' => 'Livré en écrin Bagueship.',
            ),
        ),
        array(
            'name' => 'Chrome Embrace',
            'slug' => 'chrome-embrace',
            'sku' => 'BAG-FINGER-CHROME',
            'price' => 360,
            'category' => 'finger',
            'sizes' => $sizes,
            'short_description' => 'Anneau chromé enveloppant, pensé pour suivre le doigt.',
            'description' => 'Chrome Embrace est la première pièce de la collection Finger. Son aperçu, sa carte collection et sa page produit utilisent son GLB réel.',
            'model_file' => 'chrome-embrace.glb',
            'meta' => array(
                'matiere' => 'Acier inoxydable',
                'finition' => 'Chrome miroir',
                'largeur' => 'Profil enveloppant',
                'poids_bijou' => 'Selon taille',
                'fabrication' => 'Modèle 3D Finger',
                'packaging' => 'Livré en écrin Bagueship.',
            ),
        ),
        array(
            'name' => 'Curved Bar Silver Ring',
            'slug' => 'curved-bar-silver-ring',
            'sku' => 'BAG-FINGER-CURVED',
            'price' => 340,
            'category' => 'finger',
            'sizes' => $sizes,
            'short_description' => 'Bague argentée à barre courbée, minimale et tendue.',
            'description' => 'Curved Bar Silver Ring complète la collection Finger avec une ligne plus directe. Le site charge son modèle GLB réel.',
            'model_file' => 'curved-bar-silver-ring.glb',
            'meta' => array(
                'matiere' => 'Acier inoxydable',
                'finition' => 'Argent satiné',
                'largeur' => 'Barre courbée',
                'poids_bijou' => 'Selon taille',
                'fabrication' => 'Modèle 3D Finger',
                'packaging' => 'Livré en écrin Bagueship.',
            ),
        ),
    );
    foreach ( $products as $product_args ) {
        bagueship_core_create_variable_product( $product_args );
    }

    bagueship_core_seed_legal_pages();
    bagueship_core_create_menu( 'Primary', array( 'accueil', 'boutique', 'guide-des-tailles', 'a-propos', 'contact' ) );
    bagueship_core_create_menu( 'Footer', array( 'contact', 'suivre-le-colis', 'questions', 'retour-de-produit', 'garantie-1-an', 'conditions-generales-utilisation', 'mentions-legales', 'devenir-ambassadeur' ) );
    bagueship_core_assign_menu_locations();

    if ( class_exists( 'WC_Shipping_Zones' ) ) {
        $zones = WC_Shipping_Zones::get_zones();
        if ( empty( $zones ) ) {
            $zone = new WC_Shipping_Zone();
            $zone->set_zone_name( 'France' );
            $zone->add_location( 'FR', 'country' );
            $zone_id = $zone->save();
            $zone = new WC_Shipping_Zone( $zone_id );
            $zone->add_shipping_method( 'flat_rate' );
            $zone->add_shipping_method( 'free_shipping' );
        }
    }

    if ( class_exists( 'WC_Payment_Gateways' ) ) {
        $gateways = WC_Payment_Gateways::instance();
        foreach ( $gateways->payment_gateways() as $gateway ) {
            if ( isset( $gateway->id ) && 'bagueship_test' === $gateway->id ) {
                return;
            }
        }
    }

    flush_rewrite_rules( false );
}

register_activation_hook( __FILE__, 'bagueship_core_seed_site' );

function bagueship_core_run_migrations(): void {
    $target_version = '20260618_legal_footer';
    if ( get_option( 'bagueship_core_migration_version' ) === $target_version ) {
        return;
    }

    bagueship_core_seed_legal_pages();
    bagueship_core_create_menu( 'Footer', array( 'contact', 'suivre-le-colis', 'questions', 'retour-de-produit', 'garantie-1-an', 'conditions-generales-utilisation', 'mentions-legales', 'devenir-ambassadeur' ) );
    bagueship_core_assign_menu_locations();
    update_option( 'bagueship_core_migration_version', $target_version );
    flush_rewrite_rules( false );
}
add_action( 'init', 'bagueship_core_run_migrations', 30 );

function bagueship_core_boot_payment_gateway(): void {
    if ( ! class_exists( 'WC_Payment_Gateway' ) || class_exists( 'WC_Gateway_Bagueship_Test' ) ) {
        return;
    }

    class WC_Gateway_Bagueship_Test extends WC_Payment_Gateway {
        public function __construct() {
            $this->id                 = 'bagueship_test';
            $this->method_title       = 'Paiement de test Bagueship';
            $this->method_description = 'Marque la commande comme payée pour les tests locaux et le staging.';
            $this->has_fields         = false;
            $this->title              = 'Paiement de test';
            $this->enabled            = 'yes';
            $this->supports           = array( 'products' );
            $this->init_form_fields();
            $this->init_settings();
            $this->title = (string) $this->get_option( 'title', $this->title );
        }

        public function init_form_fields() {
            $this->form_fields = array(
                'enabled' => array(
                    'title'   => 'Activer',
                    'type'    => 'checkbox',
                    'label'   => 'Activer le paiement de test',
                    'default' => 'yes',
                ),
                'title' => array(
                    'title'   => 'Titre',
                    'type'    => 'text',
                    'default' => 'Paiement de test',
                ),
                'behavior' => array(
                    'title'   => 'Comportement',
                    'type'    => 'select',
                    'default' => 'success',
                    'options' => array(
                        'success' => 'Succès',
                        'failure' => 'Échec simulé',
                    ),
                ),
            );
        }

        public function process_payment( $order_id ): array {
            $order = wc_get_order( $order_id );
            if ( $order ) {
                $behavior = (string) $this->get_option( 'behavior', 'success' );
                if ( 'failure' === $behavior ) {
                    $order->update_status( 'failed', 'Paiement de test Bagueship : échec simulé.' );
                    return array(
                        'result'   => 'failure',
                        'redirect' => wc_get_page_permalink( 'checkout' ),
                    );
                }
                $order->payment_complete();
                $order->add_order_note( 'Commande payée via le gateway de test Bagueship.' );
            }
            return array(
                'result'   => 'success',
                'redirect' => $this->get_return_url( $order ),
            );
        }
    }

    add_filter(
        'woocommerce_payment_gateways',
        static function ( array $gateways ): array {
            $gateways[] = 'WC_Gateway_Bagueship_Test';
            return $gateways;
        }
    );
}
add_action( 'plugins_loaded', 'bagueship_core_boot_payment_gateway', 20 );

function bagueship_core_contact_handler(): void {
    if ( ! isset( $_POST['bagueship_contact_nonce'] ) || ! wp_verify_nonce( sanitize_text_field( wp_unslash( $_POST['bagueship_contact_nonce'] ) ), 'bagueship_contact' ) ) {
        wp_die( 'Nonce invalide.' );
    }
    $name    = sanitize_text_field( wp_unslash( $_POST['name'] ?? '' ) );
    $email   = sanitize_email( wp_unslash( $_POST['email'] ?? '' ) );
    $message = sanitize_textarea_field( wp_unslash( $_POST['message'] ?? '' ) );
    $to      = get_option( 'admin_email' );
    wp_mail( $to, 'Contact Bagueship', "Nom: $name\nEmail: $email\n\n$message" );
    wp_safe_redirect( add_query_arg( 'sent', '1', wp_get_referer() ?: home_url( '/' ) ) );
    exit;
}
add_action( 'admin_post_nopriv_bagueship_contact', 'bagueship_core_contact_handler' );
add_action( 'admin_post_bagueship_contact', 'bagueship_core_contact_handler' );

function bagueship_core_ambassador_form_shortcode(): string {
    $output = '<form class="woocommerce-form" method="post" action="' . esc_url( admin_url( 'admin-post.php' ) ) . '">';
    $output .= wp_nonce_field( 'bagueship_ambassador', 'bagueship_ambassador_nonce', true, false );
    $output .= '<input type="hidden" name="action" value="bagueship_ambassador">';
    $output .= '<p><label>Nom ou pseudo<br><input type="text" name="name" required></label></p>';
    $output .= '<p><label>Email<br><input type="email" name="email" required></label></p>';
    $output .= '<p><label>Réseaux sociaux / portfolio<br><input type="text" name="links" placeholder="Instagram, TikTok, site..."></label></p>';
    $output .= '<p><label>Pourquoi Bagueship ?<br><textarea name="message" rows="6" required></textarea></label></p>';
    $output .= '<p><button class="button" type="submit">Envoyer ma candidature</button></p>';
    $output .= '</form>';
    return $output;
}
add_shortcode( 'bagueship_ambassador_form', 'bagueship_core_ambassador_form_shortcode' );

function bagueship_core_ambassador_handler(): void {
    if ( ! isset( $_POST['bagueship_ambassador_nonce'] ) || ! wp_verify_nonce( sanitize_text_field( wp_unslash( $_POST['bagueship_ambassador_nonce'] ) ), 'bagueship_ambassador' ) ) {
        wp_die( 'Nonce invalide.' );
    }
    $name    = sanitize_text_field( wp_unslash( $_POST['name'] ?? '' ) );
    $email   = sanitize_email( wp_unslash( $_POST['email'] ?? '' ) );
    $links   = sanitize_text_field( wp_unslash( $_POST['links'] ?? '' ) );
    $message = sanitize_textarea_field( wp_unslash( $_POST['message'] ?? '' ) );
    $to      = get_option( 'admin_email' );
    wp_mail( $to, 'Candidature ambassadeur Bagueship', "Nom: $name\nEmail: $email\nRéseaux: $links\n\n$message" );
    wp_safe_redirect( add_query_arg( 'ambassador', '1', wp_get_referer() ?: home_url( '/' ) ) );
    exit;
}
add_action( 'admin_post_nopriv_bagueship_ambassador', 'bagueship_core_ambassador_handler' );
add_action( 'admin_post_bagueship_ambassador', 'bagueship_core_ambassador_handler' );

function bagueship_core_withdrawal_handler(): void {
    if ( ! isset( $_POST['bagueship_withdrawal_nonce'] ) || ! wp_verify_nonce( sanitize_text_field( wp_unslash( $_POST['bagueship_withdrawal_nonce'] ) ), 'bagueship_withdrawal' ) ) {
        wp_die( 'Nonce invalide.' );
    }
    $order_number = sanitize_text_field( wp_unslash( $_POST['order_number'] ?? '' ) );
    $email        = sanitize_email( wp_unslash( $_POST['email'] ?? '' ) );
    $details      = sanitize_textarea_field( wp_unslash( $_POST['details'] ?? '' ) );
    $to           = get_option( 'admin_email' );
    wp_mail( $to, 'Rétractation Bagueship', "Commande: $order_number\nEmail: $email\n\n$details" );
    wp_safe_redirect( add_query_arg( 'withdrawal', '1', wp_get_referer() ?: home_url( '/' ) ) );
    exit;
}
add_action( 'admin_post_nopriv_bagueship_withdrawal', 'bagueship_core_withdrawal_handler' );
add_action( 'admin_post_bagueship_withdrawal', 'bagueship_core_withdrawal_handler' );

function bagueship_core_personal_data_request_form_shortcode(): string {
    $output = '<form class="woocommerce-form" method="post" action="' . esc_url( admin_url( 'admin-post.php' ) ) . '">';
    $output .= wp_nonce_field( 'bagueship_personal_data_request', 'bagueship_personal_data_request_nonce', true, false );
    $output .= '<input type="hidden" name="action" value="bagueship_personal_data_request">';
    $output .= '<p><label>Type de demande<br><select name="request_type" required><option value="export">Exporter mes données</option><option value="delete">Supprimer mes données</option></select></label></p>';
    $output .= '<p><label>Nom et prénom<br><input type="text" name="name" required></label></p>';
    $output .= '<p><label>Email de contact<br><input type="email" name="email" required></label></p>';
    $output .= '<p><label>Précisions<br><textarea name="details" rows="5"></textarea></label></p>';
    $output .= '<p><button class="button" type="submit">Envoyer ma demande</button></p>';
    $output .= '</form>';
    return $output;
}
add_shortcode( 'bagueship_personal_data_request_form', 'bagueship_core_personal_data_request_form_shortcode' );

function bagueship_core_personal_data_request_handler(): void {
    if ( ! isset( $_POST['bagueship_personal_data_request_nonce'] ) || ! wp_verify_nonce( sanitize_text_field( wp_unslash( $_POST['bagueship_personal_data_request_nonce'] ) ), 'bagueship_personal_data_request' ) ) {
        wp_die( 'Nonce invalide.' );
    }
    $request_type = sanitize_text_field( wp_unslash( $_POST['request_type'] ?? '' ) );
    $name         = sanitize_text_field( wp_unslash( $_POST['name'] ?? '' ) );
    $email        = sanitize_email( wp_unslash( $_POST['email'] ?? '' ) );
    $details      = sanitize_textarea_field( wp_unslash( $_POST['details'] ?? '' ) );
    $to           = get_option( 'admin_email' );
    wp_mail( $to, 'Demande données personnelles Bagueship', "Type: $request_type\nNom: $name\nEmail: $email\n\n$details" );
    wp_safe_redirect( add_query_arg( 'personal-data', '1', wp_get_referer() ?: home_url( '/' ) ) );
    exit;
}
add_action( 'admin_post_nopriv_bagueship_personal_data_request', 'bagueship_core_personal_data_request_handler' );
add_action( 'admin_post_bagueship_personal_data_request', 'bagueship_core_personal_data_request_handler' );

function bagueship_core_mail_from_address( string $from ): string {
    $admin_email = sanitize_email( (string) get_option( 'admin_email' ) );
    return $admin_email ?: $from;
}

function bagueship_core_mail_from_name( string $name ): string {
    return 'Bagueship';
}

add_filter( 'wp_mail_from', 'bagueship_core_mail_from_address' );
add_filter( 'wp_mail_from_name', 'bagueship_core_mail_from_name' );

function bagueship_core_configure_mailer( PHPMailer\PHPMailer\PHPMailer $phpmailer ): void {
    $phpmailer->isSMTP();
    $phpmailer->Host       = 'mailpit';
    $phpmailer->Port       = 1025;
    $phpmailer->SMTPAuth   = false;
    $phpmailer->SMTPSecure = '';
    $phpmailer->SMTPAutoTLS = false;
}
add_action( 'phpmailer_init', 'bagueship_core_configure_mailer' );

function bagueship_core_product_schema_markup(): void {
    if ( ! is_product() ) {
        return;
    }
    $product = wc_get_product( get_the_ID() );
    if ( ! $product ) {
        return;
    }
    $data = array(
        '@context'    => 'https://schema.org',
        '@type'       => 'Product',
        'name'        => get_the_title(),
        'description' => wp_strip_all_tags( get_the_excerpt() ?: get_the_content() ),
        'sku'         => $product->get_sku(),
        'image'       => has_post_thumbnail() ? wp_get_attachment_image_url( get_post_thumbnail_id(), 'large' ) : '',
        'offers'      => array(
            '@type'         => 'Offer',
            'priceCurrency' => 'EUR',
            'price'         => $product->get_price(),
            'availability'  => $product->is_in_stock() ? 'https://schema.org/InStock' : 'https://schema.org/OutOfStock',
            'url'           => get_permalink(),
        ),
    );
    echo '<script type="application/ld+json">' . wp_json_encode( $data ) . '</script>';
}
add_action( 'wp_head', 'bagueship_core_product_schema_markup', 20 );

function bagueship_core_organization_schema_markup(): void {
    if ( is_admin() ) {
        return;
    }
    $options = bagueship_core_get_options();
    $data = array(
        '@context' => 'https://schema.org',
        '@type'    => 'Organization',
        'name'     => get_bloginfo( 'name' ),
        'url'      => home_url( '/' ),
    );
    if ( ! empty( $options['email'] ) ) {
        $data['email'] = $options['email'];
    }
    if ( ! empty( $options['phone'] ) ) {
        $data['telephone'] = $options['phone'];
    }
    echo '<script type="application/ld+json">' . wp_json_encode( $data ) . '</script>';
}
add_action( 'wp_head', 'bagueship_core_organization_schema_markup', 21 );

function bagueship_core_head_meta(): void {
    if ( is_admin() ) {
        return;
    }
    $description = '';
    $options = bagueship_core_get_options();
    if ( is_product() ) {
        $description = wp_strip_all_tags( get_the_excerpt() ?: wp_trim_words( strip_shortcodes( get_the_content() ), 28 ) );
    } elseif ( is_shop() ) {
        $description = $options['seo_shop_desc'] ?: 'Boutique Bagueship: collections, bagues variables, panier WooCommerce et checkout invité.';
    } elseif ( is_front_page() ) {
        $description = $options['seo_home_desc'] ?: get_bloginfo( 'description' );
    } elseif ( is_singular() ) {
        $description = wp_strip_all_tags( get_the_excerpt() ?: wp_trim_words( strip_shortcodes( get_the_content() ), 28 ) );
        if ( ! $description && ( is_cart() || is_checkout() || is_account_page() ) ) {
            $description = wp_strip_all_tags( get_the_title() );
        }
    }
    if ( $description ) {
        printf( '<meta name="description" content="%s">' . "\n", esc_attr( $description ) );
    }
    printf( '<meta property="og:title" content="%s">' . "\n", esc_attr( wp_get_document_title() ) );
    if ( $description ) {
        printf( '<meta property="og:description" content="%s">' . "\n", esc_attr( $description ) );
    }
    printf( '<meta property="og:type" content="%s">' . "\n", esc_attr( is_product() ? 'product' : 'website' ) );
}
add_action( 'wp_head', 'bagueship_core_head_meta', 5 );

function bagueship_core_document_title( string $title ): string {
    $options = bagueship_core_get_options();
    if ( is_front_page() && ! empty( $options['seo_home_title'] ) ) {
        return $options['seo_home_title'];
    }
    if ( ( is_shop() || is_post_type_archive( 'product' ) ) && ! empty( $options['seo_shop_title'] ) ) {
        return $options['seo_shop_title'];
    }
    return $title;
}
add_filter( 'pre_get_document_title', 'bagueship_core_document_title' );

function bagueship_core_filter_catalog_query( WP_Query $query ): void {
    if ( is_admin() || ! $query->is_main_query() ) {
        return;
    }
    if ( ! ( is_shop() || is_post_type_archive( 'product' ) ) ) {
        return;
    }

    $tax_query  = (array) $query->get( 'tax_query', array() );
    $meta_query = (array) $query->get( 'meta_query', array() );

    if ( ! empty( $_GET['collection'] ) ) {
        $slug = sanitize_title( wp_unslash( $_GET['collection'] ) );
        $term = get_term_by( 'slug', $slug, 'product_cat' );
        if ( $term instanceof WP_Term ) {
            $tax_query[] = array(
                'taxonomy' => 'product_cat',
                'field'    => 'term_id',
                'terms'    => array( (int) $term->term_id ),
            );
        }
    }

    if ( ! empty( $_GET['size'] ) ) {
        $tax_query[] = array(
            'taxonomy' => 'pa_taille',
            'field'    => 'slug',
            'terms'    => array( sanitize_title( wp_unslash( $_GET['size'] ) ) ),
        );
    }

    if ( ! empty( $_GET['availability'] ) ) {
        $availability = sanitize_title( wp_unslash( $_GET['availability'] ) );
        if ( 'available' === $availability ) {
            $meta_query[] = array( 'key' => '_stock_status', 'value' => 'instock' );
        } elseif ( 'unavailable' === $availability ) {
            $meta_query[] = array( 'key' => '_stock_status', 'value' => 'outofstock' );
        }
    }

    if ( ! empty( $_GET['finish'] ) ) {
        $meta_query[] = array(
            'key'     => '_bagueship_finition',
            'value'   => sanitize_text_field( wp_unslash( $_GET['finish'] ) ),
            'compare' => 'LIKE',
        );
    }

    if ( ! empty( $_GET['min_price'] ) || ! empty( $_GET['max_price'] ) ) {
        $price_clause = array( 'key' => '_price', 'type' => 'NUMERIC' );
        if ( ! empty( $_GET['min_price'] ) ) {
            $price_clause['value']   = (float) wp_unslash( $_GET['min_price'] );
            $price_clause['compare'] = '>=';
            $meta_query[]            = $price_clause;
        }
        if ( ! empty( $_GET['max_price'] ) ) {
            $price_clause['value']   = (float) wp_unslash( $_GET['max_price'] );
            $price_clause['compare'] = '<=';
            $meta_query[]            = $price_clause;
        }
    }

    if ( $tax_query ) {
        $query->set( 'tax_query', $tax_query );
    }
    if ( $meta_query ) {
        $query->set( 'meta_query', $meta_query );
    }
}
add_action( 'pre_get_posts', 'bagueship_core_filter_catalog_query', 20 );

function bagueship_core_delivery_estimate_notice(): void {
    if ( is_cart() || is_checkout() ) {
        echo '<div class="woocommerce-info" role="status">Préparation estimée sous 24 à 48 h ouvrées, puis livraison estimée sous 2 à 4 jours ouvrés en France métropolitaine.</div>';
    }
}
add_action( 'woocommerce_before_cart', 'bagueship_core_delivery_estimate_notice', 5 );
add_action( 'woocommerce_review_order_before_payment', 'bagueship_core_delivery_estimate_notice', 5 );

function bagueship_core_robots( array $robots ): array {
    if ( is_cart() || is_checkout() || is_account_page() || is_search() || is_page( array( 'maintenance', 'paiement-echoue' ) ) ) {
        $robots['noindex']  = true;
        $robots['nofollow'] = true;
    }
    return $robots;
}
add_filter( 'wp_robots', 'bagueship_core_robots' );

function bagueship_core_cookie_banner(): void {
    if ( is_admin() ) {
        return;
    }
    $options = bagueship_core_get_options();
    $message = $options['cookie_text'] ?: 'Bagueship utilise uniquement les cookies techniques nécessaires au panier, au checkout et à la session. Vous pouvez accepter ou refuser les traceurs non essentiels.';
    ?>
    <div class="bagueship-cookie-banner" id="bagueship-cookie-banner" hidden>
      <div>
        <strong>Cookies</strong>
        <p><?php echo esc_html( $message ); ?></p>
      </div>
      <div class="bagueship-cookie-banner__actions">
        <button
          type="button"
          class="btn btn--ghost"
          data-bagueship-cookie="reject"
          onclick="if (window.bagueshipSetCookieConsent) { window.bagueshipSetCookieConsent('reject'); } return false;"
          style="background:transparent;color:#f5f5f7;border:1px solid rgba(255,255,255,.32);box-shadow:inset 0 0 0 1px rgba(255,255,255,.08);cursor:pointer;"
        >Refuser</button>
        <button
          type="button"
          class="btn btn--primary"
          data-bagueship-cookie="accept"
          onclick="if (window.bagueshipSetCookieConsent) { window.bagueshipSetCookieConsent('accept'); } return false;"
          style="background:#f5f5f7;color:#09090b;border:1px solid #f5f5f7;cursor:pointer;"
        >Accepter</button>
      </div>
    </div>
    <script>
    (function() {
      const cookieName = 'bagueship_cookie_consent';
      const banner = document.getElementById('bagueship-cookie-banner');
      if (!banner || document.cookie.indexOf(cookieName + '=') !== -1) {
        return;
      }

      const setConsent = function(value) {
        var maxAge = 60 * 60 * 24 * 365;
        document.cookie = cookieName + '=' + encodeURIComponent(value) + '; path=/; max-age=' + maxAge + '; samesite=lax';
        banner.hidden = true;
        window.location.reload();
      };

      window.bagueshipSetCookieConsent = setConsent;
      banner.hidden = false;
      banner.querySelectorAll('[data-bagueship-cookie]').forEach(function(button) {
        button.addEventListener('click', function(event) {
          event.preventDefault();
          var value = button.getAttribute('data-bagueship-cookie');
          if (!value) {
            return;
          }
          setConsent(value);
        });
      });
    })();
    </script>
    <?php
}
add_action( 'wp_footer', 'bagueship_core_cookie_banner', 20 );

function bagueship_core_cookie_preferences_shortcode(): string {
    $url = add_query_arg( 'bagueship_reset_cookies', '1', home_url( add_query_arg( array(), $GLOBALS['wp']->request ?? '' ) ) );
    return '<p><a class="button" href="' . esc_url( $url ) . '">Modifier mon choix cookies</a></p>';
}
add_shortcode( 'bagueship_cookie_preferences', 'bagueship_core_cookie_preferences_shortcode' );

function bagueship_core_cookie_reset(): void {
    if ( empty( $_GET['bagueship_reset_cookies'] ) ) {
        return;
    }
    setcookie( 'bagueship_cookie_consent', '', time() - 3600, '/' );
    wp_safe_redirect( wp_get_referer() ?: home_url( '/' ) );
    exit;
}
add_action( 'template_redirect', 'bagueship_core_cookie_reset' );

function bagueship_core_register_order_statuses(): void {
    register_post_status(
        'wc-bagueship-preparation',
        array(
            'label'                     => 'En préparation',
            'public'                    => true,
            'exclude_from_search'       => false,
            'show_in_admin_all_list'    => true,
            'show_in_admin_status_list' => true,
            'label_count'               => _n_noop( 'En préparation <span class="count">(%s)</span>', 'En préparation <span class="count">(%s)</span>' ),
        )
    );
    register_post_status(
        'wc-bagueship-expediee',
        array(
            'label'                     => 'Expédiée',
            'public'                    => true,
            'exclude_from_search'       => false,
            'show_in_admin_all_list'    => true,
            'show_in_admin_status_list' => true,
            'label_count'               => _n_noop( 'Expédiée <span class="count">(%s)</span>', 'Expédiée <span class="count">(%s)</span>' ),
        )
    );
}
add_action( 'init', 'bagueship_core_register_order_statuses' );

function bagueship_core_filter_order_statuses( array $statuses ): array {
    $statuses['wc-bagueship-preparation'] = 'En préparation';
    $statuses['wc-bagueship-expediee']    = 'Expédiée';
    return $statuses;
}
add_filter( 'wc_order_statuses', 'bagueship_core_filter_order_statuses' );

function bagueship_core_order_tracking_fields(): void {
    global $post;
    $order_id = $post instanceof WP_Post ? $post->ID : 0;
    echo '<div class="order_data_column">';
    woocommerce_wp_text_input( array( 'id' => '_bagueship_tracking_number', 'label' => 'Numéro de suivi', 'wrapper_class' => 'form-field-wide', 'value' => $order_id ? get_post_meta( $order_id, '_bagueship_tracking_number', true ) : '' ) );
    woocommerce_wp_text_input( array( 'id' => '_bagueship_shipping_carrier', 'label' => 'Transporteur', 'wrapper_class' => 'form-field-wide', 'value' => $order_id ? get_post_meta( $order_id, '_bagueship_shipping_carrier', true ) : '' ) );
    echo '</div>';
}
add_action( 'woocommerce_admin_order_data_after_order_details', 'bagueship_core_order_tracking_fields' );

function bagueship_core_save_order_tracking_fields( int $order_id ): void {
    if ( isset( $_POST['_bagueship_tracking_number'] ) ) {
        update_post_meta( $order_id, '_bagueship_tracking_number', sanitize_text_field( wp_unslash( $_POST['_bagueship_tracking_number'] ) ) );
    }
    if ( isset( $_POST['_bagueship_shipping_carrier'] ) ) {
        update_post_meta( $order_id, '_bagueship_shipping_carrier', sanitize_text_field( wp_unslash( $_POST['_bagueship_shipping_carrier'] ) ) );
    }
}
add_action( 'woocommerce_process_shop_order_meta', 'bagueship_core_save_order_tracking_fields' );

function bagueship_core_exports_page(): void {
    $csv_url = wp_nonce_url( admin_url( 'admin-post.php?action=bagueship_export_orders_csv' ), 'bagueship_export_orders_csv' );
    ?>
    <div class="wrap">
      <h1>Exports Bagueship</h1>
      <p>Export CSV des commandes pour la préparation et la comptabilité.</p>
      <p><a class="button button-primary" href="<?php echo esc_url( $csv_url ); ?>">Télécharger l’export CSV</a></p>
    </div>
    <?php
}

function bagueship_core_export_orders_csv(): void {
    if ( ! current_user_can( 'manage_woocommerce' ) ) {
        wp_die( 'Accès refusé.' );
    }
    check_admin_referer( 'bagueship_export_orders_csv' );
    nocache_headers();
    header( 'Content-Type: text/csv; charset=utf-8' );
    header( 'Content-Disposition: attachment; filename=bagueship-orders.csv' );
    $out = fopen( 'php://output', 'w' );
    fputcsv( $out, array( 'Order ID', 'Date', 'Status', 'Customer', 'Email', 'Total', 'Tax', 'Shipping', 'Discount', 'Payment', 'Tracking', 'Carrier' ) );
    $orders = wc_get_orders(
        array(
            'limit'   => -1,
            'status'  => array_keys( wc_get_order_statuses() ),
            'orderby' => 'date',
            'order'   => 'DESC',
        )
    );
    foreach ( $orders as $order ) {
        fputcsv(
            $out,
            array(
                $order->get_id(),
                $order->get_date_created() ? $order->get_date_created()->date_i18n( 'Y-m-d H:i:s' ) : '',
                $order->get_status(),
                trim( $order->get_formatted_billing_full_name() ),
                $order->get_billing_email(),
                $order->get_total(),
                $order->get_total_tax(),
                $order->get_shipping_total(),
                $order->get_discount_total(),
                $order->get_payment_method_title(),
                get_post_meta( $order->get_id(), '_bagueship_tracking_number', true ),
                get_post_meta( $order->get_id(), '_bagueship_shipping_carrier', true ),
            )
        );
    }
    fclose( $out );
    exit;
}
add_action( 'admin_post_bagueship_export_orders_csv', 'bagueship_core_export_orders_csv' );

function bagueship_core_send_order_status_email( WC_Order $order, string $subject, string $message ): void {
    $to = $order->get_billing_email();
    if ( ! $to ) {
        return;
    }
    wp_mail( $to, $subject, $message );
}

function bagueship_core_order_first_name( WC_Order $order ): string {
    $first_name = trim( (string) $order->get_billing_first_name() );
    return $first_name !== '' ? $first_name : 'Client';
}

function bagueship_core_order_status_preparation( int $order_id ): void {
    $order = wc_get_order( $order_id );
    if ( ! $order ) {
        return;
    }
    $order->add_order_note( 'Commande passée en préparation Bagueship.' );
    bagueship_core_send_order_status_email(
        $order,
        'Votre commande Bagueship est en préparation',
        "Bonjour " . bagueship_core_order_first_name( $order ) . ",\n\nVotre commande est en préparation.\n\nNous vous tiendrons informé dès l'expédition."
    );
}
add_action( 'woocommerce_order_status_bagueship-preparation', 'bagueship_core_order_status_preparation' );

function bagueship_core_order_status_expediee( int $order_id ): void {
    $order = wc_get_order( $order_id );
    if ( ! $order ) {
        return;
    }
    $tracking = (string) get_post_meta( $order_id, '_bagueship_tracking_number', true );
    $carrier  = (string) get_post_meta( $order_id, '_bagueship_shipping_carrier', true );
    $order->add_order_note( 'Commande marquée expédiée Bagueship.' );
    $message = "Bonjour " . bagueship_core_order_first_name( $order ) . ",\n\nVotre commande a été expédiée.";
    if ( $carrier || $tracking ) {
        $message .= "\n\n";
    }
    if ( $carrier ) {
        $message .= "Transporteur : " . $carrier . "\n";
    }
    if ( $tracking ) {
        $message .= "Numéro de suivi : " . $tracking . "\n";
    }
    bagueship_core_send_order_status_email( $order, 'Votre commande Bagueship a été expédiée', $message );
}
add_action( 'woocommerce_order_status_bagueship-expediee', 'bagueship_core_order_status_expediee' );

if ( ! defined( 'DISALLOW_FILE_EDIT' ) ) {
    define( 'DISALLOW_FILE_EDIT', true );
}
