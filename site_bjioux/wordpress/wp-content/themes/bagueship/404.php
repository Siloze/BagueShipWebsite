<?php
if ( ! defined( 'ABSPATH' ) ) { exit; }
get_header();
?>
<section class="section">
  <div class="container">
    <div class="eyebrow"><?php esc_html_e( 'Erreur 404', 'bagueship' ); ?></div>
    <h1 class="headline"><?php esc_html_e( 'La page s’est évaporée.', 'bagueship' ); ?></h1>
    <p class="lede"><?php esc_html_e( 'Le lien demandé ne renvoie à rien pour le moment. Repartons sur la boutique.', 'bagueship' ); ?></p>
    <div class="hero-actions">
      <a class="btn btn--primary" href="<?php echo esc_url( home_url( '/' ) ); ?>"><?php esc_html_e( 'Retour accueil', 'bagueship' ); ?></a>
      <a class="btn btn--ghost" href="<?php echo esc_url( wc_get_page_permalink( 'shop' ) ); ?>"><?php esc_html_e( 'Aller à la boutique', 'bagueship' ); ?></a>
    </div>
  </div>
</section>
<?php
get_footer();
