<?php
if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

if ( function_exists( 'wc_load_cart' ) ) {
    wc_load_cart();
}
if (
    'POST' === ( $_SERVER['REQUEST_METHOD'] ?? '' ) &&
    isset( $_POST['bagueship_cart_size_inline'] ) &&
    function_exists( 'bagueship_core_handle_cart_size_update' )
) {
    bagueship_core_handle_cart_size_update();
}

$cart          = WC()->cart;
$cart_items    = $cart ? $cart->get_cart() : array();
$cart_count    = $cart ? $cart->get_cart_contents_count() : 0;
$cart_subtotal = $cart ? (float) $cart->get_subtotal() : 0;
$cart_total    = $cart ? (float) $cart->get_total( 'edit' ) : 0;
$cart_shipping = $cart ? (float) $cart->get_shipping_total() : 0;
$cart_empty    = empty( $cart_items );
$size_modals   = array();
$shop_url      = wc_get_page_permalink( 'shop' );
$jewels_url    = function_exists( 'bagueship_page_url' ) ? bagueship_page_url( 'bijoux' ) : home_url( '/bijoux/' );
$logo_url      = get_template_directory_uri() . '/assets/images/eclipse-logo.png';
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Panier — Eclipse</title>
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
    --paper:#f7f7f5;
    --night:#050505;
    --ink:#090909;
    --muted:#737373;
    --soft:#a3a3a0;
    --line:#d8d8d4;
    --dark-line:#282828;
    --edge:clamp(28px,4.2vw,68px);
    --font:"Eclipse Sans","Helvetica Neue",Arial,sans-serif;
  }
  *{box-sizing:border-box}
  html,body{margin:0;min-height:100%;background:var(--paper)}
  body.eclipse-cart-body{
    color:var(--ink);
    background:var(--paper);
    font-family:var(--font);
    font-weight:500;
    -webkit-font-smoothing:antialiased;
    overflow-x:hidden;
  }
  a{color:inherit;text-decoration:none}
  button{font:inherit}
  .screen-reader-text{
    position:absolute!important;width:1px;height:1px;padding:0;margin:-1px;
    overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;border:0;
  }

  .cart-shell{
    min-height:calc(100svh - 92px);
    display:grid;
    grid-template-columns:minmax(0,65%) minmax(360px,35%);
    background:var(--paper);
  }
  .cart-content{
    min-width:0;
    padding:68px var(--edge) 48px;
  }
  .cart-heading{
    padding-bottom:31px;
    border-bottom:1px solid var(--line);
    display:flex;
    align-items:flex-end;
    justify-content:space-between;
    gap:30px;
  }
  .cart-kicker{
    margin:0 0 14px;
    color:#7d7d7a;
    font-size:10px;
    font-weight:700;
    letter-spacing:.16em;
    text-transform:uppercase;
  }
  .cart-title{
    margin:0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:clamp(64px,6vw,98px);
    font-weight:400;
    letter-spacing:.01em;
    line-height:.78;
    text-transform:uppercase;
  }
  .cart-count{
    padding-bottom:5px;
    color:#777;
    font-size:10px;
    font-weight:700;
    letter-spacing:.13em;
    text-transform:uppercase;
  }

  .cart-items{display:grid}
  .cart-item{
    display:grid;
    grid-template-columns:clamp(145px,13vw,190px) minmax(0,1fr) auto;
    align-items:center;
    gap:clamp(24px,3vw,48px);
    min-height:260px;
    padding:32px 0;
    border-bottom:1px solid var(--line);
  }
  .cart-item__media{
    position:relative;
    width:100%;
    aspect-ratio:4 / 5;
    overflow:hidden;
    background:#090909;
  }
  .cart-item__media img{
    display:block;
    width:100%;
    height:100%;
    max-width:none;
    object-fit:cover;
    object-position:center 43%;
    transition:transform .85s cubic-bezier(.16,1,.3,1),filter .4s ease;
  }
  .cart-item__media:hover img,
  .cart-item__media:focus-visible img{transform:scale(1.035);filter:brightness(1.06)}
  .cart-item__index{
    position:absolute;
    z-index:2;
    top:13px;
    left:14px;
    color:rgba(255,255,255,.72);
    font-size:9px;
    font-weight:700;
    letter-spacing:.12em;
  }
  .cart-item__meta{min-width:0}
  .cart-item__collection{
    margin:0;
    color:#8b8b88;
    font-size:9px;
    font-weight:700;
    letter-spacing:.15em;
    text-transform:uppercase;
  }
  .cart-item__name{
    margin:12px 0 0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:clamp(36px,3.4vw,56px);
    font-weight:400;
    letter-spacing:.015em;
    line-height:.86;
    text-transform:uppercase;
  }
  .cart-item__details{
    margin:17px 0 0;
    color:#676764;
    font-size:11px;
    font-weight:700;
    letter-spacing:.08em;
    line-height:1.7;
    text-transform:uppercase;
  }
  .cart-item__preorder{
    display:inline-block;
    margin-top:14px;
    padding:7px 9px;
    border:1px solid #bdbdb9;
    color:#52524f;
    font-size:9px;
    font-weight:700;
    letter-spacing:.1em;
    text-transform:uppercase;
  }
  .cart-item__actions{
    display:flex;
    align-items:center;
    flex-wrap:wrap;
    gap:19px;
    margin-top:24px;
  }
  .cart-item__action{
    position:relative;
    border:0;
    padding:0 0 5px;
    background:transparent;
    color:#747471;
    cursor:pointer;
    font-size:9px;
    font-weight:700;
    letter-spacing:.13em;
    text-transform:uppercase;
  }
  .cart-item__action::after{
    content:"";
    position:absolute;
    left:0;right:0;bottom:0;height:1px;
    background:currentColor;
    transform-origin:left;
    transition:transform .3s cubic-bezier(.16,1,.3,1);
  }
  .cart-item__action:hover::after,.cart-item__action:focus-visible::after{transform:scaleX(.55)}
  .cart-item__price{
    align-self:start;
    padding-top:6px;
    text-align:right;
    white-space:nowrap;
    font-size:14px;
    font-weight:700;
  }

  .cart-continue{
    display:inline-flex;
    align-items:center;
    gap:18px;
    margin-top:32px;
    color:#52524f;
    font-size:10px;
    font-weight:700;
    letter-spacing:.13em;
    text-transform:uppercase;
  }
  .cart-continue span{font-size:18px;font-weight:400;transition:transform .3s ease}
  .cart-continue:hover span{transform:translateX(6px)}

  .cart-summary{
    position:relative;
    min-height:calc(100svh - 92px);
    padding:72px clamp(38px,4.1vw,70px) 50px;
    color:#f4f4f1;
    background:
      radial-gradient(65% 44% at 50% 7%,rgba(255,255,255,.055),transparent 75%),
      var(--night);
  }
  .cart-summary__inner{position:sticky;top:142px}
  .cart-summary__kicker{
    margin:0;
    color:#777;
    font-size:9px;
    font-weight:700;
    letter-spacing:.18em;
    text-transform:uppercase;
  }
  .cart-summary__title{
    margin:16px 0 0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:clamp(48px,4.2vw,68px);
    font-weight:400;
    letter-spacing:.02em;
    line-height:.84;
    text-transform:uppercase;
  }
  .cart-summary__rows{
    display:grid;
    gap:17px;
    margin-top:54px;
  }
  .cart-summary__row{
    display:flex;
    justify-content:space-between;
    align-items:baseline;
    gap:24px;
    color:#90908d;
    font-size:10px;
    font-weight:700;
    letter-spacing:.1em;
    text-transform:uppercase;
  }
  .cart-summary__row strong{color:#e7e7e4;font-size:12px;white-space:nowrap}
  .cart-summary__row.is-total{
    margin-top:12px;
    padding-top:25px;
    border-top:1px solid var(--dark-line);
    color:#f3f3f0;
  }
  .cart-summary__row.is-total span{font-size:12px}
  .cart-summary__row.is-total strong{font-size:20px}
  .cart-checkout{
    width:100%;
    height:60px;
    margin-top:38px;
    border:1px solid #f3f3f0;
    background:#f3f3f0;
    color:#080808;
    cursor:pointer;
    font-size:10px;
    font-weight:700;
    letter-spacing:.16em;
    text-transform:uppercase;
    transition:background .3s,color .3s;
  }
  .cart-checkout:hover,.cart-checkout:focus-visible{background:transparent;color:#fff}
  .cart-summary__back{
    display:block;
    width:max-content;
    margin:22px auto 0;
    padding-bottom:5px;
    border-bottom:1px solid #666;
    color:#898986;
    font-size:9px;
    font-weight:700;
    letter-spacing:.12em;
    text-transform:uppercase;
  }
  .cart-assurances{
    display:grid;
    gap:13px;
    margin-top:42px;
    padding-top:27px;
    border-top:1px solid var(--dark-line);
  }
  .cart-assurance{
    display:flex;
    align-items:center;
    gap:12px;
    color:#777;
    font-size:9px;
    font-weight:700;
    letter-spacing:.09em;
    text-transform:uppercase;
  }
  .cart-assurance::before{
    content:"";
    width:7px;height:7px;
    border:1px solid #737373;
    transform:rotate(45deg);
  }

  .cart-empty{
    min-height:420px;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:flex-start;
    border-bottom:1px solid var(--line);
  }
  .cart-empty__title{
    margin:0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:clamp(46px,5vw,74px);
    font-weight:400;
    line-height:.88;
    text-transform:uppercase;
  }
  .cart-empty__copy{max-width:420px;margin:20px 0 0;color:#72726f;font-size:12px;line-height:1.7}
  .cart-empty__link{
    display:inline-flex;
    align-items:center;
    gap:20px;
    margin-top:34px;
    padding-bottom:7px;
    border-bottom:1px solid #111;
    font-size:10px;
    font-weight:700;
    letter-spacing:.14em;
    text-transform:uppercase;
  }
  .cart-empty-art{
    height:100%;
    min-height:520px;
    display:flex;
    flex-direction:column;
    align-items:center;
    justify-content:center;
    text-align:center;
  }
  .cart-empty-art img{width:min(58%,260px);height:auto;opacity:.82}
  .cart-empty-art span{
    margin-top:28px;
    color:#777;
    font-size:9px;
    font-weight:700;
    letter-spacing:.2em;
    text-transform:uppercase;
  }

  .cart-footnote{
    margin-top:68px;
    padding-top:20px;
    border-top:1px solid var(--line);
    display:flex;
    justify-content:space-between;
    gap:20px;
    color:#989894;
    font-size:8px;
    font-weight:700;
    letter-spacing:.12em;
    text-transform:uppercase;
  }

  .size-modal{
    position:fixed;
    z-index:140;
    inset:0;
    display:none;
    align-items:center;
    justify-content:center;
    padding:24px;
    background:rgba(0,0,0,.76);
    backdrop-filter:blur(12px);
  }
  .size-modal.is-open{display:flex}
  .size-modal__panel{
    position:relative;
    width:min(900px,100%);
    display:grid;
    grid-template-columns:1fr 1fr;
    overflow:hidden;
    background:var(--paper);
  }
  .size-modal__visual{min-height:520px;background:#080808;overflow:hidden}
  .size-modal__visual img{display:block;width:100%;height:100%;object-fit:cover;object-position:center 43%}
  .size-modal__body{padding:60px 52px;color:var(--ink)}
  .size-modal__tag{color:#898986;font-size:9px;font-weight:700;letter-spacing:.16em;text-transform:uppercase}
  .size-modal__title{
    margin:16px 0 0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:58px;
    font-weight:400;
    line-height:.86;
    text-transform:uppercase;
  }
  .size-modal__desc{margin:20px 0 0;color:#686865;font-size:11px;line-height:1.7}
  .size-modal__sizes{display:flex;flex-wrap:wrap;gap:8px;margin-top:34px}
  .size-modal__size{
    width:50px;height:50px;
    border:1px solid #c9c9c5;
    background:transparent;
    color:#555;
    cursor:pointer;
    font-size:11px;
    font-weight:700;
  }
  .size-modal__size:hover,.size-modal__size.is-selected{border-color:#080808;background:#080808;color:#fff}
  .size-modal__actions{display:flex;gap:12px;margin-top:34px}
  .size-modal__submit,.size-modal__link{
    height:50px;
    padding:0 21px;
    display:inline-flex;
    align-items:center;
    justify-content:center;
    border:1px solid #080808;
    cursor:pointer;
    font-size:9px;
    font-weight:700;
    letter-spacing:.11em;
    text-transform:uppercase;
  }
  .size-modal__submit{background:#080808;color:#fff}
  .size-modal__link{background:transparent;color:#080808}
  .size-modal__close{
    position:absolute;
    z-index:3;
    right:18px;top:18px;
    width:38px;height:38px;
    border:1px solid #bbb;
    background:var(--paper);
    color:#111;
    cursor:pointer;
    font-size:22px;
  }

  .cart-heading,.cart-item,.cart-summary__inner,.cart-empty{
    opacity:0;
    animation:cartEnter .8s cubic-bezier(.16,1,.3,1) forwards;
  }
  .cart-item:nth-child(1){animation-delay:.08s}
  .cart-item:nth-child(2){animation-delay:.14s}
  .cart-item:nth-child(3){animation-delay:.2s}
  .cart-summary__inner{animation-delay:.12s}
  @keyframes cartEnter{from{opacity:0;transform:translateY(18px)}to{opacity:1;transform:none}}

  @media(max-width:1000px){
    .cart-shell{grid-template-columns:minmax(0,60%) minmax(340px,40%)}
    .cart-content{padding-inline:32px}
    .cart-item{grid-template-columns:135px minmax(0,1fr);gap:24px}
    .cart-item__price{grid-column:2;grid-row:1;justify-self:end}
  }
  @media(max-width:760px){
    .cart-shell{display:block;min-height:0}
    .cart-content{padding:54px 20px 48px}
    .cart-heading{align-items:flex-start}
    .cart-title{font-size:64px}
    .cart-count{padding-top:7px}
    .cart-item{
      grid-template-columns:112px minmax(0,1fr);
      min-height:0;
      padding:25px 0;
      gap:19px;
      align-items:start;
    }
    .cart-item__price{grid-column:2;grid-row:1;padding-top:0;font-size:11px}
    .cart-item__name{padding-right:58px;font-size:39px}
    .cart-item__details{font-size:9px;margin-top:12px}
    .cart-item__actions{margin-top:18px;gap:14px}
    .cart-item__action{font-size:8px}
    .cart-summary{min-height:auto;padding:55px 20px 48px}
    .cart-summary__inner{position:relative;top:auto}
    .cart-summary__title{font-size:55px}
    .cart-summary__rows{margin-top:42px}
    .cart-empty{min-height:390px}
    .cart-empty-art{min-height:450px}
    .cart-footnote{margin-top:45px}
    .size-modal{align-items:flex-end;padding:10px}
    .size-modal__panel{grid-template-columns:1fr;max-height:94svh;overflow:auto}
    .size-modal__visual{min-height:250px;height:34svh}
    .size-modal__body{padding:34px 24px 30px}
    .size-modal__title{font-size:48px}
  }
  @media(prefers-reduced-motion:reduce){
    .cart-heading,.cart-item,.cart-summary__inner,.cart-empty{opacity:1;animation:none}
  }
  body.eclipse-cart-body .bagueship-cookie-banner{display:none!important}
</style>
</head>
<body <?php body_class( 'eclipse-cart-body' ); ?>>
<?php wp_body_open(); ?>

<?php
echo bagueship_eclipse_topbar(
    array(
        'active'      => 'cart',
        'brand_color' => '#080808',
        'items_color' => '#080808',
        'cart_color'  => '#080808',
        'background'  => '#f7f7f5',
    )
);
?>

<main class="cart-shell<?php echo $cart_empty ? ' is-empty' : ''; ?>">
  <section class="cart-content">
    <header class="cart-heading">
      <div>
        <p class="cart-kicker">Votre sélection</p>
        <h1 class="cart-title">Panier</h1>
      </div>
      <span class="cart-count"><?php echo esc_html( sprintf( _n( '%s pièce', '%s pièces', $cart_count, 'bagueship' ), $cart_count ) ); ?></span>
    </header>

    <?php if ( $cart_empty ) : ?>
      <div class="cart-empty">
        <h2 class="cart-empty__title">Votre sélection<br>commence ici.</h2>
        <p class="cart-empty__copy">Découvrez les pièces Eclipse et composez une sélection qui vous ressemble.</p>
        <a class="cart-empty__link" href="<?php echo esc_url( $shop_url ); ?>">Découvrir les collections <span aria-hidden="true">→</span></a>
      </div>
    <?php else : ?>
      <div class="cart-items">
        <?php $visible_index = 0; ?>
        <?php foreach ( $cart_items as $cart_item_key => $cart_item ) : ?>
          <?php
          $quantity = max( 0, (int) ( $cart_item['quantity'] ?? 0 ) );
          if ( 0 === $quantity ) {
              continue;
          }

          $product_id   = (int) ( $cart_item['product_id'] ?? 0 );
          $variation_id = (int) ( $cart_item['variation_id'] ?? 0 );
          $product      = $cart_item['data'] ?? null;
          if ( ! $product instanceof WC_Product || ! $product->exists() ) {
              $product = wc_get_product( $variation_id ?: $product_id );
          }
          if ( ! $product instanceof WC_Product ) {
              continue;
          }

          ++$visible_index;
          $parent_product = $product_id ? wc_get_product( $product_id ) : $product;
          $name           = $product_id ? get_the_title( $product_id ) : $product->get_name();
          $product_url    = $product_id ? get_permalink( $product_id ) : '';
          $image_id       = $product_id ? get_post_thumbnail_id( $product_id ) : 0;
          $image_html     = $image_id
              ? wp_get_attachment_image( $image_id, 'large', false, array( 'alt' => $name ) )
              : $product->get_image( 'large', array( 'alt' => $name ) );
          $product_meta   = function_exists( 'bagueship_core_get_product_meta' ) ? bagueship_core_get_product_meta( $product_id ) : array();
          $material       = $product_meta['matiere'] ?? 'Acier inoxydable';
          $finish         = $product_meta['finition'] ?? 'Argent poli';
          $jewel_type     = function_exists( 'bagueship_catalogue_jewel_type' ) ? bagueship_catalogue_jewel_type( $product_id, $name ) : 'bagues';
          $type_label     = 'boucles' === $jewel_type ? 'Boucle d’oreille' : 'Bague';
          $terms          = get_the_terms( $product_id, 'product_cat' );
          $collection     = ! empty( $terms ) && ! is_wp_error( $terms ) ? $terms[0]->name : 'Eclipse';
          $variation      = (array) ( $cart_item['variation'] ?? array() );
          $size           = (string) ( $variation['attribute_pa_taille'] ?? $variation['attribute_taille'] ?? '' );
          if ( ! $size && $product->is_type( 'variation' ) ) {
              $attributes = $product->get_variation_attributes();
              $size       = (string) ( $attributes['attribute_pa_taille'] ?? $attributes['attribute_taille'] ?? '' );
          }
          $preorder = function_exists( 'bagueship_product_preorder_data' )
              ? bagueship_product_preorder_data( $product_id )
              : array( 'enabled' => false );

          $available_sizes = array();
          if ( $parent_product instanceof WC_Product && $parent_product->is_type( 'variable' ) ) {
              foreach ( $parent_product->get_children() as $child_id ) {
                  $child = wc_get_product( $child_id );
                  if ( ! $child ) {
                      continue;
                  }
                  $attributes = $child->get_attributes();
                  $child_size = (string) ( $attributes['taille'] ?? $attributes['pa_taille'] ?? '' );
                  if ( '' === $child_size ) {
                      continue;
                  }
                  $available_sizes[] = array(
                      'size'         => $child_size,
                      'variation_id' => (int) $child_id,
                      'selected'     => $size === $child_size,
                  );
              }
              usort( $available_sizes, static fn( array $left, array $right ): int => (int) $left['size'] <=> (int) $right['size'] );
          }
          if ( $available_sizes ) {
              $size_modals[] = array(
                  'cart_item_key' => $cart_item_key,
                  'product_id'    => $product_id,
                  'name'          => $name,
                  'material'      => $material,
                  'finish'        => $finish,
                  'current_size'  => $size,
                  'product_url'   => $product_url,
                  'image_html'    => $image_html,
                  'sizes'         => $available_sizes,
              );
          }
          ?>
          <article class="cart-item">
            <a class="cart-item__media" href="<?php echo esc_url( $product_url ); ?>">
              <?php echo wp_kses_post( $image_html ); ?>
              <span class="cart-item__index"><?php echo esc_html( str_pad( (string) $visible_index, 2, '0', STR_PAD_LEFT ) ); ?></span>
            </a>
            <div class="cart-item__meta">
              <p class="cart-item__collection"><?php echo esc_html( $collection . ' / ' . $type_label ); ?></p>
              <h2 class="cart-item__name"><a href="<?php echo esc_url( $product_url ); ?>"><?php echo esc_html( $name ); ?></a></h2>
              <p class="cart-item__details">
                <?php echo esc_html( $material . ' · ' . $finish ); ?><br>
                <?php echo esc_html( $size ? 'Taille ' . $size : 'Taille unique' ); ?> · <?php echo esc_html( sprintf( _n( '%s exemplaire', '%s exemplaires', $quantity, 'bagueship' ), $quantity ) ); ?>
              </p>
              <?php if ( ! empty( $preorder['enabled'] ) ) : ?>
                <span class="cart-item__preorder">Précommande · Prix soutien</span>
              <?php endif; ?>
              <div class="cart-item__actions">
                <?php if ( $available_sizes ) : ?>
                  <button class="cart-item__action" type="button" data-size-modal="<?php echo esc_attr( $cart_item_key ); ?>">Modifier la taille</button>
                <?php else : ?>
                  <button class="cart-item__action" type="button" onclick="window.location.href='<?php echo esc_url( $product_url ); ?>'">Voir la pièce</button>
                <?php endif; ?>
                <button class="cart-item__action" type="button" onclick="window.location.href='<?php echo esc_url( wc_get_cart_remove_url( $cart_item_key ) ); ?>'">Supprimer</button>
              </div>
            </div>
            <div class="cart-item__price">
              <?php echo wp_kses_post( wc_price( (float) ( $cart_item['line_total'] ?? 0 ) + (float) ( $cart_item['line_tax'] ?? 0 ) ) ); ?>
            </div>
          </article>
        <?php endforeach; ?>
      </div>
      <a class="cart-continue" href="<?php echo esc_url( $jewels_url ); ?>">Continuer la sélection <span aria-hidden="true">→</span></a>
    <?php endif; ?>

    <footer class="cart-footnote">
      <span>© <?php echo esc_html( wp_date( 'Y' ) ); ?> Eclipse</span>
      <span>Bijoux en acier · Conçu en France</span>
    </footer>
  </section>

  <aside class="cart-summary">
    <?php if ( $cart_empty ) : ?>
      <div class="cart-empty-art">
        <img src="<?php echo esc_url( $logo_url ); ?>" alt="">
        <span>Votre sélection Eclipse</span>
      </div>
    <?php else : ?>
      <div class="cart-summary__inner">
        <p class="cart-summary__kicker">Commande</p>
        <h2 class="cart-summary__title">Récapitulatif</h2>
        <div class="cart-summary__rows">
          <div class="cart-summary__row"><span>Sous-total</span><strong><?php echo wp_kses_post( wc_price( $cart_subtotal ) ); ?></strong></div>
          <div class="cart-summary__row"><span>Livraison</span><strong><?php echo esc_html( $cart_shipping > 0 ? wp_strip_all_tags( wc_price( $cart_shipping ) ) : 'Offerte' ); ?></strong></div>
          <div class="cart-summary__row"><span>Retours</span><strong>Offerts</strong></div>
          <div class="cart-summary__row is-total"><span>Total</span><strong><?php echo wp_kses_post( wc_price( $cart_total ) ); ?></strong></div>
        </div>
        <button class="cart-checkout" type="button" onclick="window.location.href='<?php echo esc_url( wc_get_checkout_url() ); ?>'">Passer commande</button>
        <a class="cart-summary__back" href="<?php echo esc_url( $shop_url ); ?>">Continuer mes achats</a>
        <div class="cart-assurances">
          <span class="cart-assurance">Paiement sécurisé</span>
          <span class="cart-assurance">Contrôle avant envoi</span>
          <span class="cart-assurance">Garantie 2 ans</span>
        </div>
      </div>
    <?php endif; ?>
  </aside>
</main>

<?php foreach ( $size_modals as $modal ) : ?>
  <div class="size-modal" id="size-modal-<?php echo esc_attr( $modal['cart_item_key'] ); ?>" aria-hidden="true">
    <div class="size-modal__panel" role="dialog" aria-modal="true" aria-labelledby="size-title-<?php echo esc_attr( $modal['cart_item_key'] ); ?>">
      <button class="size-modal__close" type="button" data-size-close aria-label="Fermer">×</button>
      <div class="size-modal__visual"><?php echo wp_kses_post( $modal['image_html'] ); ?></div>
      <form class="size-modal__body" method="post" action="<?php echo esc_url( wc_get_cart_url() ); ?>">
        <input type="hidden" name="bagueship_cart_size_inline" value="1">
        <input type="hidden" name="action" value="bagueship_update_cart_size">
        <input type="hidden" name="cart_item_key" value="<?php echo esc_attr( $modal['cart_item_key'] ); ?>">
        <input type="hidden" name="product_id" value="<?php echo esc_attr( $modal['product_id'] ); ?>">
        <input type="hidden" name="variation_id" value="">
        <input type="hidden" name="attribute_taille" value="">
        <?php wp_nonce_field( 'bagueship_cart_size_' . $modal['cart_item_key'], 'bagueship_cart_size_nonce' ); ?>
        <p class="size-modal__tag"><?php echo esc_html( $modal['material'] ); ?></p>
        <h2 class="size-modal__title" id="size-title-<?php echo esc_attr( $modal['cart_item_key'] ); ?>"><?php echo esc_html( $modal['name'] ); ?></h2>
        <p class="size-modal__desc"><?php echo esc_html( $modal['finish'] ); ?><br><?php echo esc_html( 'Taille actuelle : ' . ( $modal['current_size'] ?: 'non définie' ) ); ?></p>
        <div class="size-modal__sizes" role="group" aria-label="Choisir une taille">
          <?php foreach ( $modal['sizes'] as $size_data ) : ?>
            <button
              class="size-modal__size<?php echo $size_data['selected'] ? ' is-selected' : ''; ?>"
              type="button"
              data-variation-id="<?php echo esc_attr( $size_data['variation_id'] ); ?>"
              data-size-value="<?php echo esc_attr( $size_data['size'] ); ?>"
              aria-pressed="<?php echo $size_data['selected'] ? 'true' : 'false'; ?>"
            ><?php echo esc_html( $size_data['size'] ); ?></button>
          <?php endforeach; ?>
        </div>
        <div class="size-modal__actions">
          <button class="size-modal__submit" type="submit">Mettre à jour</button>
          <a class="size-modal__link" href="<?php echo esc_url( $modal['product_url'] ); ?>">Voir la fiche</a>
        </div>
      </form>
    </div>
  </div>
<?php endforeach; ?>

<script>
(()=>{
  const closeModal=modal=>{
    if(!modal)return;
    modal.classList.remove('is-open');
    modal.setAttribute('aria-hidden','true');
    document.body.style.overflow='';
  };
  const openModal=modal=>{
    if(!modal)return;
    modal.classList.add('is-open');
    modal.setAttribute('aria-hidden','false');
    document.body.style.overflow='hidden';
    const selected=modal.querySelector('.size-modal__size.is-selected')||modal.querySelector('.size-modal__size');
    if(selected)selected.click();
  };

  document.querySelectorAll('[data-size-modal]').forEach(button=>{
    button.addEventListener('click',()=>openModal(document.getElementById('size-modal-'+button.dataset.sizeModal)));
  });
  document.querySelectorAll('.size-modal').forEach(modal=>{
    modal.addEventListener('click',event=>{if(event.target===modal)closeModal(modal)});
    modal.querySelector('[data-size-close]')?.addEventListener('click',()=>closeModal(modal));
    const form=modal.querySelector('form');
    const variationInput=form?.querySelector('input[name="variation_id"]');
    const sizeInput=form?.querySelector('input[name="attribute_taille"]');
    modal.querySelectorAll('.size-modal__size').forEach(button=>{
      button.addEventListener('click',()=>{
        modal.querySelectorAll('.size-modal__size').forEach(other=>{
          other.classList.toggle('is-selected',other===button);
          other.setAttribute('aria-pressed',other===button?'true':'false');
        });
        if(variationInput)variationInput.value=button.dataset.variationId||'';
        if(sizeInput)sizeInput.value=button.dataset.sizeValue||'';
      });
    });
  });
  window.addEventListener('keydown',event=>{
    if(event.key==='Escape')closeModal(document.querySelector('.size-modal.is-open'));
  });
})();
</script>

<?php wp_footer(); ?>
</body>
</html>
