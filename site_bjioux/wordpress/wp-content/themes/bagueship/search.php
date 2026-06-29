<?php
if ( ! defined( 'ABSPATH' ) ) { exit; }
get_header();
?>
<section class="section">
  <div class="container">
    <div class="eyebrow"><?php esc_html_e( 'Recherche', 'bagueship' ); ?></div>
    <h1 class="headline" style="font-size:clamp(34px,6vw,72px);margin-top:12px;"><?php printf( esc_html__( 'Résultats pour "%s"', 'bagueship' ), esc_html( get_search_query() ) ); ?></h1>
    <div class="loop" style="margin-top:28px;">
      <?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>
        <article class="product-card">
          <div class="product-card__body">
            <div class="card__eyebrow"><?php echo esc_html( get_post_type() ); ?></div>
            <h2 class="product-card__title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
            <p class="product-card__excerpt"><?php echo esc_html( wp_strip_all_tags( get_the_excerpt() ) ); ?></p>
          </div>
        </article>
      <?php endwhile; else : ?>
        <p class="lede"><?php esc_html_e( 'Aucun résultat trouvé.', 'bagueship' ); ?></p>
      <?php endif; ?>
    </div>
  </div>
</section>
<?php
get_footer();
