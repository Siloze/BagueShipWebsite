<?php
if ( ! defined( 'ABSPATH' ) ) {
    exit;
}
$product = wc_get_product( get_the_ID() );
$meta = function_exists( 'bagueship_core_get_product_meta' ) ? bagueship_core_get_product_meta( get_the_ID() ) : array();
$in_stock = $product ? $product->is_in_stock() : false;
$model_url = function_exists( 'bagueship_product_model_url' ) ? bagueship_product_model_url( get_the_ID() ) : '';
$bagueship_steel_environment_url = function_exists( 'bagueship_steel_environment_url' ) ? bagueship_steel_environment_url() : 'neutral';
?>
<article <?php wc_product_class( 'product-card', $product ); ?>>
  <?php $product_terms = wc_get_product_terms( get_the_ID(), 'product_cat', array( 'fields' => 'names' ) ); ?>
  <a class="product-card__media" href="<?php the_permalink(); ?>">
    <?php
    if ( $model_url ) {
        echo '<model-viewer src="' . esc_url( $model_url ) . '" alt="' . esc_attr( get_the_title() ) . '" loading="lazy" reveal="auto" auto-rotate rotation-per-second="14deg" camera-orbit="35deg 68deg 115%" environment-image="' . esc_attr( $bagueship_steel_environment_url ) . '" tone-mapping="aces" shadow-intensity="1.08" shadow-softness=".55" exposure=".84" interaction-prompt="none"></model-viewer>';
    } elseif ( has_post_thumbnail() ) {
        the_post_thumbnail( 'large' );
    } else {
        $fallback_art_url = function_exists( 'bagueship_get_product_art_url' ) ? bagueship_get_product_art_url( get_the_ID() ) : '';
        if ( $fallback_art_url ) {
            echo '<img src="' . esc_url( $fallback_art_url ) . '" alt="">';
        }
    }
    ?>
  </a>
  <div class="product-card__body">
    <div class="card__eyebrow">
      <?php echo esc_html( $product_terms[0] ?? __( 'Produit', 'bagueship' ) ); ?>
    </div>
    <?php if ( ! $in_stock ) : ?>
      <div class="card__eyebrow"><?php esc_html_e( 'Bientôt disponible', 'bagueship' ); ?></div>
    <?php endif; ?>
    <h2 class="product-card__title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
    <p class="product-card__excerpt"><?php echo esc_html( wp_trim_words( wp_strip_all_tags( get_the_excerpt() ?: get_the_content() ), 18 ) ); ?></p>
    <?php if ( ! empty( $meta['availability_note'] ) ) : ?>
      <p class="product-card__excerpt"><?php echo esc_html( $meta['availability_note'] ); ?></p>
    <?php endif; ?>
    <div class="product-card__actions">
      <span class="price"><?php echo wp_kses_post( $product ? $product->get_price_html() : '' ); ?></span>
      <?php
      if ( $in_stock ) {
          woocommerce_template_loop_add_to_cart();
      } else {
          echo '<a class="btn btn--ghost" href="' . esc_url( get_permalink() ) . '">' . esc_html__( 'Voir la pièce', 'bagueship' ) . '</a>';
      }
      ?>
    </div>
  </div>
</article>
