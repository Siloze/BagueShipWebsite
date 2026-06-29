<?php
if ( ! defined( 'ABSPATH' ) ) { exit; }
get_header();
?>
<section class="section">
  <div class="container">
    <?php bagueship_breadcrumbs(); ?>
    <?php while ( have_posts() ) : the_post(); ?>
      <h1 class="headline" style="font-size:clamp(34px,6vw,72px);margin-top:12px;"><?php the_title(); ?></h1>
      <div class="page-content" style="margin-top:22px;max-width:none;">
        <?php the_content(); ?>
      </div>
    <?php endwhile; ?>
  </div>
</section>
<?php
get_footer();
