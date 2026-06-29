<?php
if ( ! defined( 'ABSPATH' ) ) { exit; }
get_header();
$term = get_queried_object();
$meta = $term instanceof WP_Term ? bagueship_collection_meta( $term ) : array();
$model_url = $term instanceof WP_Term && function_exists( 'bagueship_collection_model_url' ) ? bagueship_collection_model_url( $term ) : '';
$bagueship_steel_environment_url = function_exists( 'bagueship_steel_environment_url' ) ? bagueship_steel_environment_url() : 'neutral';
?>
<section class="section">
  <div class="container">
    <?php bagueship_breadcrumbs(); ?>
    <div class="hero-grid" style="margin-top:20px;">
      <div class="hero-copy">
        <div class="eyebrow"><?php echo esc_html( $meta['status'] ?: __( 'Collection', 'bagueship' ) ); ?></div>
        <h1 class="headline"><?php echo esc_html( single_term_title( '', false ) ); ?></h1>
        <p class="lede"><?php echo esc_html( $meta['tagline'] ?: term_description() ); ?></p>
        <?php if ( ! empty( $meta['status'] ) && 'Disponible' !== $meta['status'] ) : ?>
          <p class="lede"><?php esc_html_e( 'Cette collection est présentée comme à venir et ne doit pas être utilisée comme un achat immédiat.', 'bagueship' ); ?></p>
        <?php endif; ?>
      </div>
      <div class="hero-art">
        <?php if ( $model_url ) : ?>
          <model-viewer src="<?php echo esc_url( $model_url ); ?>" alt="<?php echo esc_attr( single_term_title( '', false ) ); ?>" loading="eager" reveal="auto" auto-rotate rotation-per-second="14deg" camera-orbit="35deg 68deg 115%" environment-image="<?php echo esc_attr( $bagueship_steel_environment_url ); ?>" tone-mapping="aces" shadow-intensity="1.18" shadow-softness=".5" exposure=".82" interaction-prompt="none"></model-viewer>
        <?php endif; ?>
      </div>
    </div>
    <?php if ( have_posts() ) : ?>
      <div class="loop" style="margin-top:32px;">
        <?php while ( have_posts() ) : the_post(); ?>
          <?php wc_get_template_part( 'content', 'product' ); ?>
        <?php endwhile; ?>
      </div>
      <div style="margin-top:28px;"><?php woocommerce_pagination(); ?></div>
    <?php else : ?>
      <p class="lede"><?php esc_html_e( 'Cette collection est vide pour le moment.', 'bagueship' ); ?></p>
    <?php endif; ?>
  </div>
</section>
<?php
get_footer();
