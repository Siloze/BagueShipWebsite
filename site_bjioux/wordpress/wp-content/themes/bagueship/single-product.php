<?php
if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

global $product;
if ( ! $product instanceof WC_Product ) {
    $product = wc_get_product( get_the_ID() );
}

$product_id    = get_the_ID();
$product_name  = get_the_title();
$product_meta  = function_exists( 'bagueship_core_get_product_meta' ) ? bagueship_core_get_product_meta( $product_id ) : array();
$product_price = $product ? wp_strip_all_tags( $product->get_price_html() ) : '';
$product_short = wp_strip_all_tags( get_the_excerpt() ?: '' );
$shop_url      = function_exists( 'wc_get_page_permalink' ) ? wc_get_page_permalink( 'shop' ) : home_url( '/' );
$jewels_url    = function_exists( 'bagueship_page_url' ) ? bagueship_page_url( 'bijoux' ) : home_url( '/bijoux/' );
$cart_url      = function_exists( 'wc_get_cart_url' ) ? wc_get_cart_url() : home_url( '/panier/' );
$about_url     = function_exists( 'bagueship_page_url' ) ? bagueship_page_url( 'promesse' ) : home_url( '/promesse/' );
$cart_count    = function_exists( 'WC' ) && WC()->cart ? WC()->cart->get_cart_contents_count() : 0;
$material      = $product_meta['matiere'] ?? 'Acier inoxydable 316L';
$product_terms = get_the_terms( $product_id, 'product_cat' );
$collection_name = ( $product_terms && ! is_wp_error( $product_terms ) ) ? $product_terms[0]->name : 'Origin';
$gallery_ids   = $product ? array_values( array_filter( array_map( 'absint', $product->get_gallery_image_ids() ) ) ) : array();
if ( ! $gallery_ids && has_post_thumbnail( $product_id ) ) {
    $gallery_ids[] = get_post_thumbnail_id( $product_id );
}
$product_images = array();
foreach ( array_slice( $gallery_ids, 0, 3 ) as $gallery_id ) {
    $image_url = wp_get_attachment_image_url( $gallery_id, 'full' );
    if ( $image_url ) {
        $product_images[] = array(
            'url' => $image_url,
            'alt' => get_post_meta( $gallery_id, '_wp_attachment_image_alt', true ) ?: $product_name,
        );
    }
}

$preorder_data = function_exists( 'bagueship_product_preorder_data' )
    ? bagueship_product_preorder_data( $product_id )
    : array( 'enabled' => false, 'state' => 'available' );
$is_preorder = ! empty( $preorder_data['enabled'] );
$is_upcoming = 'upcoming' === ( $preorder_data['state'] ?? 'available' );
if ( $product && $is_preorder && function_exists( 'bagueship_preorder_price_for_product' ) ) {
    $product_price = wp_strip_all_tags( wc_price( bagueship_preorder_price_for_product( $product, $product_id ) ) );
}

$variations = array();
$sizes      = array();
if ( $product && $product->is_type( 'variable' ) ) {
    foreach ( $product->get_children() as $variation_id ) {
        $variation = wc_get_product( $variation_id );
        if ( ! $variation ) {
            continue;
        }
        $attributes = $variation->get_attributes();
        $size       = $attributes['pa_taille'] ?? $attributes['taille'] ?? '';
        if ( '' === $size ) {
            continue;
        }
        $size_key             = (string) $size;
        $sizes[]              = $size_key;
        $variations[$size_key] = array(
            'id'    => (int) $variation_id,
            'price' => $is_preorder && function_exists( 'bagueship_preorder_price_for_product' )
                ? wp_strip_all_tags( wc_price( bagueship_preorder_price_for_product( $variation, $product_id ) ) )
                : wp_strip_all_tags( $variation->get_price_html() ),
        );
    }
}
$sizes = array_values( array_unique( array_filter( $sizes ) ) );
sort( $sizes, SORT_NATURAL );

$related_products = array();
$related_query    = new WP_Query(
    array(
        'post_type'      => 'product',
        'post_status'    => 'publish',
        'post__not_in'   => array( $product_id ),
        'posts_per_page' => 4,
        'orderby'        => 'menu_order title',
        'order'          => 'ASC',
    )
);
foreach ( $related_query->posts as $related_post ) {
    $related_product    = wc_get_product( $related_post->ID );
    $related_products[] = array(
        'name'  => get_the_title( $related_post ),
        'url'   => get_permalink( $related_post ),
        'price' => $related_product ? wp_strip_all_tags( $related_product->get_price_html() ) : '',
        'image' => get_the_post_thumbnail_url( $related_post, 'large' ) ?: '',
    );
}
wp_reset_postdata();
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo esc_html( $product_name ); ?> — Eclipse</title>
<?php wp_head(); ?>
<style>
  @font-face{
    font-family:"Eclipse Sans";
    src:url("<?php echo esc_url( get_template_directory_uri() . '/assets/fonts/space-grotesk-500.ttf' ); ?>") format("truetype");
    font-weight:500;
    font-display:swap;
  }
  @font-face{
    font-family:"Eclipse Sans";
    src:url("<?php echo esc_url( get_template_directory_uri() . '/assets/fonts/space-grotesk-700.ttf' ); ?>") format("truetype");
    font-weight:700;
    font-display:swap;
  }
  @font-face{
    font-family:"Eclipse Display";
    src:url("<?php echo esc_url( get_template_directory_uri() . '/assets/fonts/bebas-neue-regular.ttf' ); ?>") format("truetype");
    font-weight:400;
    font-display:swap;
  }
  :root{
    --night:#020202;
    --paper:#fff;
    --ink:#090909;
    --muted:#666;
    --faint:#999;
    --line:#d8d8d8;
    --dark-line:#242424;
    --split:58.55%;
    --edge:clamp(28px,4.2vw,66px);
    --font:"Eclipse Sans","Helvetica Neue",Arial,sans-serif;
  }
  *{box-sizing:border-box}
  html,body{margin:0;min-height:100%;background:var(--paper)}
  body.eclipse-product-body{
    color:var(--ink);
    background:var(--paper);
    font-family:var(--font);
    font-weight:500;
    -webkit-font-smoothing:antialiased;
    overflow-x:hidden;
  }
  a{color:inherit;text-decoration:none}
  button,select{font:inherit}
  .screen-reader-text{
    position:absolute!important;width:1px;height:1px;padding:0;margin:-1px;
    overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;border:0;
  }

  .product-top{
    --product-media-height:clamp(650px,68.1svh,760px);
    position:relative;
    display:grid;
    grid-template-columns:var(--split) calc(100% - var(--split));
    width:100%;
    height:var(--product-media-height);
    min-height:0;
  }
  .product-media{
    --product-thumb-size:120px;
    --product-stage-gap:clamp(24px,2.4vw,36px);
    --product-stage-top-gap:72px;
    position:relative;
    overflow:hidden;
    background:
      radial-gradient(55% 45% at 55% 52%,rgba(255,255,255,.025),transparent 72%),
      var(--night);
    border-right:1px solid #151515;
  }
  .product-image-stage .product-main-image{
    position:absolute;
    inset:0;
    width:100%;
    height:100%;
    object-fit:cover;
    object-position:center;
    transition:opacity .28s ease,transform .7s cubic-bezier(.16,1,.3,1);
  }
  .product-image-stage{
    position:absolute;
    z-index:1;
    top:var(--product-stage-top-gap);
    right:var(--product-stage-gap);
    bottom:var(--product-stage-gap);
    left:calc(var(--edge) + var(--product-thumb-size) + var(--product-stage-gap));
    overflow:hidden;
    background:#050505;
  }
  .product-info{
    position:relative;
    background:var(--paper);
    padding:72px clamp(42px,4vw,72px) 45px clamp(45px,3.8vw,66px);
  }

  /* Split navigation */
  .product-nav{
    position:absolute;
    z-index:20;
    inset:0 0 auto;
    height:96px;
    color:#f7f7f7;
    pointer-events:none;
  }
  .product-nav a{pointer-events:auto}
  .wordmark{
    position:absolute;
    left:var(--edge);
    top:39px;
    font-size:clamp(16px,1.25vw,21px);
    font-weight:700;
    letter-spacing:.42em;
    line-height:1;
  }
  .main-links{
    position:absolute;
    left:28.9%;
    top:32px;
    display:flex;
    gap:clamp(45px,5.2vw,82px);
    text-transform:uppercase;
    font-size:clamp(10px,.78vw,13px);
    font-weight:700;
    letter-spacing:.075em;
  }
  .main-links a{position:relative;padding:13px 0}
  .main-links a:last-child{margin-left:8px}
  .main-links a::after{
    content:"";position:absolute;left:0;right:0;bottom:5px;height:1px;
    background:currentColor;transform:scaleX(0);
  }
  .main-links a:hover::after,.main-links a:focus-visible::after,.main-links a.is-active::after{
    transform:scaleX(1);
  }
  .product-collection{
    position:absolute;
    left:calc(var(--split) + 3.8%);
    top:41px;
    color:#858585;
    font-size:12px;
    font-weight:700;
    letter-spacing:.09em;
    text-transform:uppercase;
  }
  .cart-link{
    position:absolute;
    right:4.2%;
    top:41px;
    color:#4b4b4b;
    font-size:12px;
    font-weight:700;
    letter-spacing:.08em;
    text-transform:uppercase;
  }

  /* Empty media composition, ready for future photography. */
  .thumb-list{
    position:absolute;
    z-index:3;
    left:var(--edge);
    top:calc(var(--product-stage-top-gap) + 74px);
    display:grid;
    gap:17px;
  }
  .media-thumb{
    width:120px;
    height:120px;
    border:1px solid #262626;
    background:#050505;
    cursor:pointer;
    transition:border-color .25s,background .25s;
    overflow:hidden;
    padding:0;
  }
  .media-thumb img{
    display:block;
    width:100%;
    height:100%;
    object-fit:cover;
  }
  .media-thumb.is-active,.media-thumb:hover,.media-thumb:focus-visible{
    border-color:#454545;
    background:#070707;
  }

  /* Product information */
  .product-collection-label{
    margin:0;
    color:#858585;
    font-size:12px;
    font-weight:700;
    letter-spacing:.09em;
    line-height:1;
    text-transform:uppercase;
  }
  .product-heading{
    display:grid;
    grid-template-columns:minmax(0,1fr) auto;
    align-items:start;
    gap:30px;
    margin-top:27px;
  }
  .product-title{
    margin:0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:clamp(48px,3.55vw,60px);
    font-weight:400;
    letter-spacing:.005em;
    line-height:.9;
    text-transform:uppercase;
    white-space:nowrap;
  }
  .product-price{
    padding-top:22px;
    color:#2e2e2e;
    font-size:18px;
    font-weight:700;
    white-space:nowrap;
  }
  .product-description{
    max-width:46ch;
    min-height:72px;
    margin:43px 0 0;
    color:#4f4f4f;
    font-size:14px;
    line-height:1.75;
  }
  .product-features{
    margin-top:34px;
    display:grid;
    gap:18px;
  }
  .feature-row{
    display:flex;
    align-items:center;
    gap:20px;
    color:#545454;
    font-size:12px;
    font-weight:700;
    letter-spacing:.08em;
    text-transform:uppercase;
  }
  .feature-icon{
    position:relative;
    width:23px;
    height:23px;
    flex:0 0 23px;
    border:1px solid #aaa;
    border-radius:50%;
  }
  .feature-icon::before{
    content:"";
    position:absolute;
    left:50%;
    top:50%;
    width:7px;
    height:7px;
    border:1px solid #999;
    transform:translate(-50%,-50%) rotate(45deg);
  }
  .purchase-area{margin-top:48px}
  .product-info > .product-description,
  .product-info > .product-features,
  .product-info > .purchase-area{
    margin-right:clamp(78px,6vw,100px);
  }
  .size-head{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:15px;
    color:#555;
    font-size:11px;
    font-weight:700;
    letter-spacing:.1em;
    text-transform:uppercase;
  }
  .size-guide{padding-bottom:3px;border-bottom:1px solid #a9a9a9;color:#777}
  .size-select-wrap{position:relative}
  .size-select{
    width:100%;
    height:54px;
    appearance:none;
    border:1px solid var(--line);
    border-radius:0;
    background:var(--paper);
    color:#666;
    padding:0 50px 0 20px;
    outline:none;
    font-size:11px;
    font-weight:700;
    letter-spacing:.08em;
    text-transform:uppercase;
    cursor:pointer;
  }
  .size-select-wrap::after{
    content:"⌄";
    position:absolute;
    right:21px;
    top:50%;
    color:#777;
    transform:translateY(-58%);
    pointer-events:none;
  }
  .purchase-row{
    display:grid;
    grid-template-columns:1fr 62px;
    gap:20px;
    margin-top:28px;
  }
  .add-button{
    height:60px;
    border:0;
    background:#050505;
    color:#f7f7f7;
    cursor:pointer;
    font-size:12px;
    font-weight:700;
    letter-spacing:.16em;
    text-transform:uppercase;
    transition:background .25s;
  }
  .add-button:hover,.add-button:focus-visible{background:#242424}
  .add-button:disabled{opacity:.5;cursor:not-allowed}
  .wish-button{
    height:60px;
    border:1px solid var(--line);
    background:transparent;
    color:#777;
    cursor:pointer;
    font-size:29px;
    font-weight:400;
    line-height:1;
  }

  /* Related products */
  .recommendations{
    background:var(--paper);
    padding:47px 9.15vw 15px 5.2vw;
  }
  .recommendations-title{
    margin:0 0 28px;
    color:#555;
    font-size:11px;
    font-weight:700;
    letter-spacing:.1em;
    text-transform:uppercase;
  }
  .related-grid{
    display:grid;
    grid-template-columns:repeat(4,minmax(0,1fr));
    gap:40px;
  }
  .related-media{
    width:100%;
    aspect-ratio:1.74/1;
    border:1px solid #242424;
    background:#050505;
    transition:background .25s,border-color .25s;
    overflow:hidden;
  }
  .related-media img{
    display:block;
    width:100%;
    height:100%;
    object-fit:cover;
    object-position:center 44%;
    transition:transform .7s cubic-bezier(.16,1,.3,1),filter .35s ease;
  }
  .related-card:hover .related-media,.related-card:focus-visible .related-media{
    background:#090909;
    border-color:#555;
  }
  .related-card:hover .related-media img,.related-card:focus-visible .related-media img{
    transform:scale(1.025);
    filter:brightness(1.06);
  }
  .related-name{
    margin-top:10px;
    color:#333;
    font-size:11px;
    font-weight:700;
    letter-spacing:.08em;
    text-transform:uppercase;
  }
  .related-price{
    margin-top:4px;
    color:#333;
    font-size:11px;
    font-weight:700;
  }

  .product-info>*{opacity:0;animation:infoEnter .7s cubic-bezier(.16,1,.3,1) forwards}
  .product-heading{animation-delay:.08s}
  .product-description{animation-delay:.14s}
  .product-features{animation-delay:.2s}
  .purchase-area{animation-delay:.26s}
  @keyframes infoEnter{
    from{opacity:0;transform:translateY(14px)}
    to{opacity:1;transform:translateY(0)}
  }

  @media(min-width:901px) and (min-aspect-ratio:16/10){
    .product-top{--product-media-height:clamp(620px,72svh,730px)}
    .product-info{padding-top:72px}
    .product-description{margin-top:30px}
    .product-features{margin-top:24px;gap:14px}
    .purchase-area{margin-top:32px}
    .recommendations{padding-top:32px}
  }
  /* Keep the full product story and recommendation prices visible on short
     desktop screens such as a MacBook in full-screen mode. */
  @media(min-width:901px) and (max-height:950px){
    .product-top{--product-media-height:630px}
    .product-info{padding-top:72px;padding-bottom:22px}
    .product-heading{margin-top:24px}
    .product-title{font-size:54px}
    .product-price{padding-top:17px;font-size:16px}
    .product-description{
      margin-top:28px;
      min-height:72px;
      font-size:12px;
      line-height:1.6;
    }
    .product-features{margin-top:24px;gap:10px}
    .feature-row{gap:14px;font-size:10px}
    .feature-icon{width:18px;height:18px;flex-basis:18px}
    .purchase-area{margin-top:45px}
    .size-head{margin-bottom:11px}
    .size-select{height:48px}
    .purchase-row{margin-top:18px}
    .add-button,.wish-button{height:52px}
    .recommendations{padding-top:20px;padding-bottom:12px}
    .recommendations-title{margin-bottom:14px}
    .related-grid{gap:30px}
    .related-media{aspect-ratio:2.15/1}
    .related-name{margin-top:7px}
    .related-price{margin-top:2px}
  }
  @media(max-width:1080px){
    .product-info{padding-inline:35px}
    .main-links{gap:32px}
    .product-media{--product-thumb-size:95px}
    .media-thumb{width:95px;height:95px}
    .purchase-area{margin-top:30px}
    .product-features{gap:13px}
  }
  @media(max-width:760px){
    :root{--split:100%}
    .product-top{
      --product-media-height:max(360px,48svh);
      display:block;
      height:auto;
      min-height:0;
    }
    .product-media{height:var(--product-media-height);min-height:0}
    .product-image-stage{
      inset:0;
      width:100%;
      height:var(--product-media-height);
      max-width:none;
      aspect-ratio:auto;
    }
    .product-info{padding:50px 22px 48px}
    .product-nav{height:105px}
    .wordmark{left:20px;top:30px;font-size:14px}
    .main-links{left:20px;right:20px;top:67px;justify-content:space-between;gap:10px;font-size:10px}
    .product-collection{display:none}
    .cart-link{right:20px;top:30px;color:#f7f7f7;font-size:10px}
    .thumb-list{left:18px;top:112px;gap:10px}
    .media-thumb{width:64px;height:64px}
    .product-title{font-size:54px;white-space:normal}
    .product-price{font-size:15px}
    .product-description{margin-top:30px}
    .product-description{min-height:0}
    .product-info > .product-description,
    .product-info > .product-features,
    .product-info > .purchase-area{margin-right:0}
    .purchase-row{grid-template-columns:1fr 58px;gap:12px}
    .related-grid{
      grid-template-columns:repeat(var(--related-columns,4),minmax(240px,1fr));
      overflow-x:auto;
      margin-inline:-5.2vw;
      padding-inline:5.2vw;
      scrollbar-width:none;
    }
    .related-grid::-webkit-scrollbar{display:none}
  }
  @media(prefers-reduced-motion:reduce){
    .product-info>*{opacity:1;animation:none}
  }
  body.eclipse-product-body .bagueship-cookie-banner{display:none!important}
</style>
</head>
<body <?php body_class( 'eclipse-product-body' ); ?>>
<?php wp_body_open(); ?>

<?php
echo bagueship_eclipse_topbar(
    array(
        'active'            => 'jewels',
        'position'          => 'absolute',
        'brand_color'       => '#f7f7f7',
        'items_color'       => '#f7f7f7',
        'cart_color'        => '#4b4b4b',
        'mobile_cart_color' => '#f7f7f7',
    )
);
?>

<main>
  <section class="product-top">
    <div class="product-media" aria-label="Visuels de <?php echo esc_attr( $product_name ); ?>">
      <?php if ( $product_images ) : ?>
        <div class="product-image-stage">
          <img
            class="product-main-image"
            id="productMainImage"
            src="<?php echo esc_url( $product_images[0]['url'] ); ?>"
            alt="<?php echo esc_attr( $product_images[0]['alt'] ); ?>"
          >
        </div>
      <?php endif; ?>
      <div class="thumb-list" aria-label="Vues du produit">
        <?php foreach ( $product_images as $index => $product_image ) : ?>
          <button
            class="media-thumb<?php echo 0 === $index ? ' is-active' : ''; ?>"
            type="button"
            data-product-image="<?php echo esc_url( $product_image['url'] ); ?>"
            data-product-alt="<?php echo esc_attr( $product_image['alt'] ); ?>"
            aria-label="<?php echo esc_attr( sprintf( 'Vue %d', $index + 1 ) ); ?>"
            aria-pressed="<?php echo 0 === $index ? 'true' : 'false'; ?>"
          >
            <img src="<?php echo esc_url( $product_image['url'] ); ?>" alt="">
          </button>
        <?php endforeach; ?>
      </div>
    </div>

    <div class="product-info">
      <p class="product-collection-label"><?php echo esc_html( $collection_name ); ?></p>
      <div class="product-heading">
        <h1 class="product-title"><?php echo esc_html( $product_name ); ?></h1>
        <div class="product-price" id="productPrice"><?php echo esc_html( $product_price ); ?></div>
      </div>

      <p class="product-description">
        <?php echo esc_html( $product_short ?: 'Symbole de force intérieure et d’affirmation de soi. Le cercle brut représente ton essence, ta vérité, ton chemin.' ); ?>
      </p>

      <div class="product-features">
        <div class="feature-row"><span class="feature-icon" aria-hidden="true"></span><span><?php echo esc_html( $material ); ?></span></div>
        <div class="feature-row"><span class="feature-icon" aria-hidden="true"></span><span>Fait à la main</span></div>
        <div class="feature-row"><span class="feature-icon" aria-hidden="true"></span><span>Livraison &amp; retours offerts</span></div>
        <div class="feature-row"><span class="feature-icon" aria-hidden="true"></span><span>Garantie 2 ans</span></div>
      </div>

      <?php if ( ! $is_upcoming ) : ?>
        <div class="purchase-area">
          <div class="size-head">
            <span>Taille</span>
            <a class="size-guide" href="<?php echo esc_url( $about_url ); ?>">Guide des tailles</a>
          </div>
          <div class="size-select-wrap">
            <select class="size-select" id="sizeSelect" aria-label="Sélectionner une taille">
              <?php if ( $sizes ) : ?>
                <option value="">Sélectionner une taille</option>
                <?php foreach ( $sizes as $size ) : ?>
                  <option value="<?php echo esc_attr( $size ); ?>"><?php echo esc_html( $size ); ?></option>
                <?php endforeach; ?>
              <?php else : ?>
                <option value="unique">Taille unique</option>
              <?php endif; ?>
            </select>
          </div>
          <div class="purchase-row">
            <button class="add-button" id="addButton" type="button">
              <?php echo esc_html( $is_preorder ? 'Précommander' : 'Ajouter au panier' ); ?>
            </button>
            <button class="wish-button" type="button" aria-label="Ajouter aux favoris">♡</button>
          </div>
        </div>

        <form id="cartForm" method="post" action="<?php echo esc_url( get_permalink( $product_id ) ); ?>" hidden>
          <input type="hidden" name="add-to-cart" value="<?php echo esc_attr( $product ? $product->get_id() : $product_id ); ?>">
          <?php if ( $sizes ) : ?>
            <input type="hidden" name="variation_id" id="variationId" value="">
            <input type="hidden" name="attribute_pa_taille" id="variationSize" value="">
          <?php endif; ?>
        </form>
      <?php else : ?>
        <div class="purchase-area">
          <button class="add-button" type="button" disabled>Prochainement</button>
        </div>
      <?php endif; ?>
    </div>
  </section>

  <section class="recommendations" aria-labelledby="recommendations-title">
    <h2 class="recommendations-title" id="recommendations-title">Vous aimerez aussi</h2>
    <div class="related-grid" style="--related-columns:<?php echo esc_attr( (string) max( 1, count( $related_products ) ) ); ?>">
      <?php foreach ( array_slice( $related_products, 0, 4 ) as $related ) : ?>
        <a class="related-card" href="<?php echo esc_url( $related['url'] ); ?>">
          <div class="related-media">
            <?php if ( $related['image'] ) : ?>
              <img src="<?php echo esc_url( $related['image'] ); ?>" alt="<?php echo esc_attr( $related['name'] ); ?>">
            <?php endif; ?>
          </div>
          <div class="related-name"><?php echo esc_html( $related['name'] ); ?></div>
          <div class="related-price"><?php echo esc_html( $related['price'] ); ?></div>
        </a>
      <?php endforeach; ?>
    </div>
  </section>
</main>

<script>
(()=>{
  const select=document.getElementById('sizeSelect');
  const button=document.getElementById('addButton');
  const form=document.getElementById('cartForm');
  const price=document.getElementById('productPrice');
  const variationId=document.getElementById('variationId');
  const variationSize=document.getElementById('variationSize');
  const variations=<?php echo wp_json_encode( $variations, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES ); ?>;
  const mainImage=document.getElementById('productMainImage');
  const imageButtons=[...document.querySelectorAll('[data-product-image]')];

  imageButtons.forEach(imageButton=>{
    imageButton.addEventListener('click',()=>{
      if(!mainImage)return;
      mainImage.style.opacity='0';
      window.setTimeout(()=>{
        mainImage.src=imageButton.dataset.productImage;
        mainImage.alt=imageButton.dataset.productAlt||'';
        mainImage.style.opacity='1';
      },180);
      imageButtons.forEach(button=>{
        const active=button===imageButton;
        button.classList.toggle('is-active',active);
        button.setAttribute('aria-pressed',active?'true':'false');
      });
    });
  });

  if(select&&variationId){
    select.addEventListener('change',()=>{
      const selected=select.value;
      const variation=variations[selected]||null;
      variationId.value=variation?.id||'';
      variationSize.value=selected;
      if(variation?.price&&price)price.textContent=variation.price;
    });
  }

  if(button&&form){
    button.addEventListener('click',()=>{
      if(variationId&&!variationId.value){
        select.focus();
        return;
      }
      button.disabled=true;
      button.textContent='Ajout…';
      form.submit();
    });
  }
})();
</script>

<?php wp_footer(); ?>
</body>
</html>
