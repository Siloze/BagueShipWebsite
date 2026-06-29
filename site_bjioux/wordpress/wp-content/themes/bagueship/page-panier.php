<?php
if ( ! defined( 'ABSPATH' ) ) { exit; }
if ( function_exists( 'wc_load_cart' ) ) {
    wc_load_cart();
}
if ( 'POST' === ( $_SERVER['REQUEST_METHOD'] ?? '' ) && isset( $_POST['bagueship_cart_size_inline'] ) && function_exists( 'bagueship_core_handle_cart_size_update' ) ) {
    bagueship_core_handle_cart_size_update();
}
$bagueship_cart = WC()->cart;
$bagueship_cart_items = $bagueship_cart ? $bagueship_cart->get_cart() : array();
if ( empty( $bagueship_cart_items ) && WC()->session ) {
    $bagueship_session_cart = WC()->session->get( 'cart' );
    if ( is_array( $bagueship_session_cart ) ) {
        $bagueship_cart_items = $bagueship_session_cart;
    }
}
$bagueship_cart_count = $bagueship_cart ? $bagueship_cart->get_cart_contents_count() : 0;
$bagueship_upsell_product_id = function_exists( 'wc_get_product_id_by_sku' ) ? (int) wc_get_product_id_by_sku( 'BAG-ABSTRACT-OPENWORK' ) : 0;
$bagueship_upsell_variations = array();
if ( $bagueship_upsell_product_id ) {
    $bagueship_upsell_product = wc_get_product( $bagueship_upsell_product_id );
    if ( $bagueship_upsell_product && $bagueship_upsell_product->is_type( 'variable' ) ) {
        foreach ( $bagueship_upsell_product->get_children() as $variation_id ) {
            $variation = wc_get_product( $variation_id );
            if ( ! $variation ) {
                continue;
            }
            $attrs = $variation->get_attributes();
            $size = (string) ( $attrs['taille'] ?? $attrs['pa_taille'] ?? '' );
            if ( '' !== $size ) {
                $bagueship_upsell_variations[ $size ] = (int) $variation_id;
            }
        }
    }
}
$bagueship_cart_subtotal = $bagueship_cart ? $bagueship_cart->get_subtotal() : 0;
$bagueship_cart_total = $bagueship_cart ? $bagueship_cart->get_total( 'edit' ) : 0;
$bagueship_cart_shipping = $bagueship_cart ? $bagueship_cart->get_shipping_total() : 0;
$bagueship_steel_environment_url = function_exists( 'bagueship_steel_environment_url' ) ? bagueship_steel_environment_url() : 'neutral';
$bagueship_cart_empty = empty( $bagueship_cart_items );
$bagueship_size_modals = array();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Mon panier — Bagueship</title>
<style>
  :root{
    --bg:#050506; --bg-soft:#0a0a0c; --panel:#0d0d10;
    --ink:#f5f5f7; --ink-dim:#a1a1a6; --ink-faint:#6e6e73;
    --hair:rgba(255,255,255,.09); --hair-soft:rgba(255,255,255,.055);
    --font:-apple-system, BlinkMacSystemFont, "SF Pro Display", "SF Pro Text", "Helvetica Neue", Helvetica, Arial, sans-serif;
  }
  *{ margin:0; padding:0; box-sizing:border-box; }
  body{ background:var(--bg); color:var(--ink); font-family:var(--font); -webkit-font-smoothing:antialiased; min-height:100vh; }
  ::selection{ background:rgba(245,245,247,.18); }
  a{ color:inherit; text-decoration:none; }

  /* Nav */
  .nav{
    position:fixed; top:0; left:0; right:0; z-index:60; height:52px;
    display:flex; align-items:center; justify-content:space-between;
    padding:0 max(22px,4vw);
    background:rgba(6,6,8,.55);
    backdrop-filter:saturate(160%) blur(18px); -webkit-backdrop-filter:saturate(160%) blur(18px);
    border-bottom:1px solid var(--hair-soft);
  }
  .nav .brand{ font-size:15px; font-weight:600; letter-spacing:.34em; padding-left:.34em; }
  .nav .right{ position:absolute; left:50%; transform:translateX(-50%); display:flex; align-items:center; justify-content:center; gap:34px; font-size:13px; color:var(--ink-dim); font-weight:700; letter-spacing:.2em; text-transform:uppercase; white-space:nowrap; }
  .nav .right a{ position:relative; padding:18px 0 17px; transition:color .25s; }
  .nav .right a::after{ content:""; position:absolute; left:0; right:0; bottom:12px; height:1px; background:currentColor; transform:scaleX(0); transform-origin:left center; transition:transform .32s cubic-bezier(.16,1,.3,1); opacity:.9; }
  .nav .right a:hover::after,
  .nav .right a:focus-visible::after,
  .nav .right a.is-active::after,
  .nav .right a[aria-current="page"]::after{ transform:scaleX(1); }
  .nav .right a.is-active,
  .nav .right a[aria-current="page"]{ color:inherit; }
  .nav .nav-actions{ position:absolute; right:max(22px,4vw); top:50%; transform:translateY(-50%); display:flex; align-items:center; gap:14px; }
  .nav .cart-link{ position:relative; width:38px; height:38px; border-radius:50%; color:var(--ink-dim); display:inline-flex; align-items:center; justify-content:center; transition:background .25s, box-shadow .25s, transform .18s; }
  .nav .cart-link:hover,
  .nav .cart-link:focus-visible,
  .nav .cart-link.is-active,
  .nav .cart-link[aria-current="page"]{ background:rgba(255,255,255,.06); box-shadow:inset 0 0 0 1px var(--hair); transform:translateY(-1px); }
  .nav .cart-icon{ width:28px; height:22px; fill:none; stroke:currentColor; stroke-width:1.65; stroke-linecap:round; stroke-linejoin:round; }
  .nav .cart-count{
    position:absolute; right:-2px; top:1px; min-width:14px; height:14px; padding:0 4px; border-radius:999px;
    background:var(--ink); color:#0b0b0d; font-size:9px; font-weight:700;
    display:inline-flex; align-items:center; justify-content:center;
  }
  .screen-reader-text{ position:absolute; width:1px; height:1px; padding:0; margin:-1px; overflow:hidden; clip:rect(0,0,0,0); white-space:nowrap; border:0; }
  @media (max-width:640px){
    .nav{ padding:0 14px; }
    .nav .brand{ font-size:10px; letter-spacing:.12em; padding-left:.12em; }
    .nav .right{ gap:18px; font-size:11px; letter-spacing:.14em; }
    .nav .nav-actions{ right:10px; }
    .nav .cart-link{ width:34px; height:34px; }
    .nav .cart-icon{ width:25px; height:20px; }
  }

  /* Layout */
  .page{ padding-top:52px; min-height:100vh; }
  .wrap{ max-width:1120px; margin:0 auto; padding:0 max(22px,4vw); }
  .header{ padding:9vh 0 5vh; border-bottom:1px solid var(--hair); }
  .header h1{
    font-size:clamp(36px,6vw,72px); font-weight:600;
    letter-spacing:-.04em; line-height:1;
  }
  .header .sub{ margin-top:12px; color:var(--ink-faint); font-size:14px; letter-spacing:.02em; }

  .grid{
    display:grid; grid-template-columns:1fr 380px;
    gap:0 54px; align-items:start; padding:6vh 0 14vh;
  }
  @media (max-width:900px){ .grid{ grid-template-columns:1fr; gap:52px; } }
  .grid.is-empty{ grid-template-columns:1fr; padding-bottom:8vh; }
  .empty-actions{ margin-top:24px; display:flex; flex-wrap:wrap; gap:12px; }
  .empty-actions .btn-back{ width:auto; margin-top:0; padding:0 24px; }

  /* Cart items */
  .items{ display:flex; flex-direction:column; gap:0; }
  .item{
    display:grid; grid-template-columns:130px 1fr auto;
    gap:28px; align-items:center;
    padding:32px 0; border-bottom:1px solid var(--hair);
  }
  @media (max-width:560px){ .item{ grid-template-columns:100px 1fr; gap:20px; } .item .price-col{ grid-column:1/-1; justify-self:end; } }

  /* Ring preview */
  .ring-preview{
    width:130px; height:130px; border-radius:16px;
    background:linear-gradient(160deg,#0e0f12,#08090b);
    box-shadow:inset 0 0 0 1px var(--hair-soft);
    display:flex; align-items:center; justify-content:center;
    position:relative; overflow:hidden; flex:none;
  }
  .ring-preview::before{
    content:""; position:absolute; inset:0;
    background:radial-gradient(60% 50% at 50% 40%, rgba(86,92,104,.3), transparent 65%);
  }
  .ring-preview model-viewer{
    width:118px; height:118px; position:relative; z-index:2;
    background:transparent; --poster-color:transparent;
  }

  /* Item meta */
  .item-meta{ display:flex; flex-direction:column; gap:10px; }
  .item-label{ font-size:11px; letter-spacing:.28em; text-transform:uppercase; color:var(--ink-faint); font-weight:600; }
  .preorder-line{
    display:inline-flex; align-items:center;
    width:max-content; max-width:100%;
    height:auto; min-height:28px; padding:6px 10px;
    border-radius:999px; box-shadow:inset 0 0 0 1px var(--hair);
    color:var(--ink); font-size:12px; line-height:1.35; font-weight:600;
  }
  .item-name{ font-size:clamp(20px,2.8vw,28px); font-weight:600; letter-spacing:-.025em; }
  .item-detail{ font-size:14px; color:var(--ink-dim); line-height:1.5; }
  .item-actions{ margin-top:18px; display:flex; align-items:center; gap:18px; }
  .item-actions button{
    background:none; border:none; font-family:inherit; cursor:pointer;
    font-size:13px; color:var(--ink-faint); font-weight:500;
    letter-spacing:.02em; transition:color .2s; padding:0;
  }
  .item-actions button:hover{ color:var(--ink); }
  .item-actions .sep{ width:1px; height:13px; background:var(--hair); }

  /* Size badge */
  .size-badge{
    display:inline-flex; align-items:center; gap:8px;
    height:32px; padding:0 12px; border-radius:16px;
    box-shadow:inset 0 0 0 1px var(--hair); font-size:13px; font-weight:500;
    color:var(--ink-dim);
  }

  /* Price col */
  .price-col{ text-align:right; min-width:80px; }
  .price-col .amount{ font-size:clamp(20px,2.4vw,24px); font-weight:600; letter-spacing:-.02em; font-variant-numeric:tabular-nums; }
  .price-col .orig{ font-size:13px; color:var(--ink-faint); margin-top:5px; text-decoration:line-through; }

  /* Summary */
  .summary{
    position:sticky; top:76px;
    background:var(--panel); border-radius:20px;
    box-shadow:inset 0 0 0 1px var(--hair-soft);
    padding:32px 30px 36px;
  }
  .summary h2{ font-size:20px; font-weight:600; letter-spacing:-.02em; padding-bottom:22px; border-bottom:1px solid var(--hair); }
  .sum-rows{ margin-top:22px; display:flex; flex-direction:column; gap:16px; }
  .sum-row{ display:flex; justify-content:space-between; align-items:baseline; font-size:15px; }
  .sum-row .k{ color:var(--ink-dim); }
  .sum-row .v{ font-weight:500; font-variant-numeric:tabular-nums; }
  .sum-row.total{ padding-top:20px; border-top:1px solid var(--hair); margin-top:6px; }
  .sum-row.total .k{ color:var(--ink); font-size:17px; font-weight:600; }
  .sum-row.total .v{ font-size:22px; font-weight:600; letter-spacing:-.02em; }
  .sum-row.free .v{ color:#4ade80; }
  .btn-checkout{
    margin-top:28px; width:100%; height:54px; border-radius:28px;
    background:var(--ink); color:#0b0b0d; border:none; cursor:pointer;
    font-family:inherit; font-size:17px; font-weight:600; letter-spacing:-.01em;
    transition:transform .18s cubic-bezier(.16,1,.3,1), filter .2s;
  }
  .btn-checkout:hover{ transform:translateY(-1px); filter:brightness(1.04); }
  .btn-checkout:active{ transform:scale(.99); }
  .btn-back{
    margin-top:14px; width:100%; height:48px; border-radius:28px;
    background:transparent; color:var(--ink); border:1px solid var(--hair);
    cursor:pointer; font-family:inherit; font-size:15px; font-weight:500;
    transition:border-color .2s, transform .15s;
  }
  .btn-back:hover{ border-color:rgba(255,255,255,.38); transform:translateY(-1px); }
  .badges{ margin-top:26px; display:flex; flex-direction:column; gap:11px; }
  .badge{ display:flex; align-items:center; gap:11px; font-size:13px; color:var(--ink-dim); }
  .badge svg{ flex:none; width:16px; height:16px; color:var(--ink-faint); }

  /* Upsell */
  .upsell{ margin-top:6vh; padding-top:5vh; border-top:1px solid var(--hair); }
  .upsell h3{ font-size:clamp(18px,2.4vw,22px); font-weight:600; letter-spacing:-.02em; }
  .upsell .sub{ margin-top:8px; color:var(--ink-dim); font-size:14px; }
  .upsell-cards{ margin-top:32px; display:grid; grid-template-columns:repeat(2,1fr); gap:16px; }
  @media (max-width:560px){ .upsell-cards{ grid-template-columns:1fr; } }
  .ucard{
    appearance:none;
    border:none;
    padding:22px 22px 20px; border-radius:16px;
    background:var(--panel); box-shadow:inset 0 0 0 1px var(--hair-soft);
    display:flex; flex-direction:column; gap:10px;
    cursor:pointer; transition:box-shadow .2s, transform .2s;
    text-align:left;
  }
  .ucard:hover{ box-shadow:inset 0 0 0 1px rgba(255,255,255,.22); transform:translateY(-2px); }
  .ucard .utag{ font-size:11px; letter-spacing:.28em; text-transform:uppercase; color:var(--ink-faint); font-weight:600; }
  .ucard .uname{ font-size:17px; font-weight:600; letter-spacing:-.02em; }
  .ucard .uprice{ font-size:15px; color:var(--ink-dim); font-weight:500; }
  .ucard .urow{ display:flex; align-items:center; justify-content:space-between; }
  .ucard .uadd{
    width:30px; height:30px; border-radius:50%; border:1px solid var(--hair);
    display:flex; align-items:center; justify-content:center;
    color:var(--ink-dim); transition:border-color .2s, color .2s;
    background:transparent; padding:0; cursor:pointer;
  }
  .ucard:hover .uadd{ border-color:rgba(255,255,255,.4); color:var(--ink); }
  .ucard .uadd svg{ width:14px; height:14px; }

  /* Size modal */
  .size-modal{
    position:fixed; inset:0; z-index:120;
    display:none; align-items:center; justify-content:center;
    padding:22px; background:rgba(0,0,0,.68);
    backdrop-filter:blur(18px) saturate(140%);
    -webkit-backdrop-filter:blur(18px) saturate(140%);
  }
  .size-modal.is-open{ display:flex; }
  .size-modal__panel{
    width:min(860px,100%);
    border-radius:28px;
    background:linear-gradient(160deg,#101115,#07080a);
    box-shadow:inset 0 0 0 1px var(--hair), 0 30px 100px rgba(0,0,0,.42);
    display:grid; grid-template-columns:minmax(230px,.82fr) 1fr;
    overflow:hidden; position:relative;
  }
  .size-modal__visual{
    min-height:390px; display:flex; align-items:center; justify-content:center;
    position:relative; background:radial-gradient(60% 44% at 50% 45%, rgba(95,102,116,.25), transparent 68%);
    border-right:1px solid var(--hair-soft);
  }
  .size-modal__visual::after{
    content:""; position:absolute; left:50%; top:68%; width:70%; height:18%;
    transform:translateX(-50%); background:radial-gradient(ellipse at center, rgba(150,160,176,.18), transparent 70%);
    filter:blur(22px);
  }
  .size-modal__visual model-viewer{
    width:min(82%,280px); height:280px; position:relative; z-index:2;
    background:transparent; --poster-color:transparent;
  }
  .size-modal__body{ padding:34px; }
  .size-modal__tag{ color:var(--ink-faint); font-size:11px; letter-spacing:.3em; text-transform:uppercase; font-weight:700; }
  .size-modal__title{ margin-top:12px; font-size:clamp(26px,4vw,40px); line-height:1; letter-spacing:-.035em; font-weight:600; }
  .size-modal__desc{ margin-top:14px; color:var(--ink-dim); font-size:14px; line-height:1.55; }
  .size-modal__sizes{ margin-top:28px; display:flex; flex-wrap:wrap; gap:10px; }
  .size-modal__size{
    width:52px; height:52px; border-radius:50%;
    border:1px solid var(--hair); background:transparent; color:var(--ink);
    font:inherit; font-size:15px; font-weight:600; cursor:pointer;
    transition:background .2s, color .2s, border-color .2s, transform .2s;
  }
  .size-modal__size:hover,
  .size-modal__size.is-selected{
    background:var(--ink); color:#0b0b0d; border-color:var(--ink); transform:translateY(-1px);
  }
  .size-modal__actions{ margin-top:30px; display:flex; flex-wrap:wrap; gap:12px; align-items:center; }
  .size-modal__submit,
  .size-modal__link{
    height:48px; border-radius:999px; padding:0 22px;
    display:inline-flex; align-items:center; justify-content:center;
    font:inherit; font-weight:700; cursor:pointer;
  }
  .size-modal__submit{ border:none; background:var(--ink); color:#0b0b0d; }
  .size-modal__link{ border:1px solid var(--hair); color:var(--ink); background:transparent; }
  .size-modal__close{
    position:absolute; right:16px; top:16px; width:38px; height:38px; border-radius:50%;
    border:1px solid var(--hair); background:rgba(0,0,0,.16); color:var(--ink);
    cursor:pointer; font-size:24px; line-height:1;
  }
  @media (max-width:720px){
    .size-modal{ align-items:flex-end; padding:12px; }
    .size-modal__panel{ grid-template-columns:1fr; border-radius:24px; max-height:92svh; overflow:auto; }
    .size-modal__visual{ min-height:220px; border-right:none; border-bottom:1px solid var(--hair-soft); }
    .size-modal__visual model-viewer{ height:210px; }
    .size-modal__body{ padding:26px 22px 28px; }
  }

  /* Reveal */
  .reveal{ opacity:1; transform:none; transition:opacity .9s cubic-bezier(.16,1,.3,1), transform .9s cubic-bezier(.16,1,.3,1); }
  .reveal.in{ opacity:1; transform:none; }
  @media (prefers-reduced-motion:reduce){ .reveal{ opacity:1; transform:none; transition:none; } }
</style>
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>

<nav class="nav">
  <a class="brand" href="<?php echo esc_url( home_url( '/' ) ); ?>">BAGUESHIP</a>
  <?php echo bagueship_topbar_markup( bagueship_topbar_active_key() ); ?>
</nav>

<div class="page">
  <div class="wrap">
    <div class="header reveal">
      <h1>Mon panier</h1>
      <div class="sub"><?php echo esc_html( sprintf( _n( "%s article · Livraison offerte", "%s articles · Livraison offerte", $bagueship_cart_count, "bagueship" ), $bagueship_cart_count ) ); ?></div>
    </div>

    <div class="grid<?php echo $bagueship_cart_empty ? ' is-empty' : ''; ?>">
      <!-- ── Articles ── -->
      <div>
        <div class="items">
          <?php if ( $bagueship_cart_empty ) : ?>
            <div class="item reveal" style="grid-template-columns:1fr;">
              <div class="item-meta">
                <div class="item-name"><?php esc_html_e( 'Votre panier est vide', 'bagueship' ); ?></div>
                <div class="item-detail"><?php esc_html_e( 'Ajoutez une bague depuis la collection pour continuer.', 'bagueship' ); ?></div>
                <div class="empty-actions">
                  <button class="btn-back" type="button" onclick="window.location.href='<?php echo esc_url( wc_get_page_permalink( 'shop' ) ); ?>'"><?php esc_html_e( 'Découvrir la collection', 'bagueship' ); ?></button>
                </div>
              </div>
            </div>
          <?php else : ?>
            <?php foreach ( $bagueship_cart_items as $cart_item_key => $cart_item ) : ?>
              <?php
              $item_quantity = (int) ( $cart_item['quantity'] ?? 0 );
              if ( 0 >= $item_quantity ) {
                  continue;
              }
              $item_product = $cart_item['data'] ?? null;
              if ( ! $item_product || ! is_a( $item_product, 'WC_Product' ) || ! $item_product->exists() ) {
                  if ( ! $resolved_id ) {
                      $resolved_id = (int) ( $cart_item['product_id'] ?? 0 );
                  }
                  $item_product = $resolved_id ? wc_get_product( $resolved_id ) : null;
              }
              $item_product_id = (int) ( $cart_item['product_id'] ?? 0 );
              $item_name = $item_product_id ? get_the_title( $item_product_id ) : ( $item_product && $item_product->exists() ? $item_product->get_name() : __( 'Produit', 'bagueship' ) );
              $item_variation = $cart_item['variation'] ?? array();
              $item_size = $item_variation['attribute_pa_taille'] ?? $item_variation['attribute_taille'] ?? '';
              if ( ! $item_size && $item_product && $item_product->is_type( 'variation' ) ) {
                  $variation_attributes = $item_product->get_variation_attributes();
                  $item_size = $variation_attributes['attribute_pa_taille'] ?? $variation_attributes['attribute_taille'] ?? '';
              }
              $item_meta = function_exists( 'bagueship_core_get_product_meta' ) ? bagueship_core_get_product_meta( $item_product_id ) : array();
              $item_label = $item_meta['matiere'] ?? 'Acier inoxydable 316L';
              $item_finish = $item_meta['finition'] ?? 'Finition brossée & facettée';
              $item_model_url = function_exists( 'bagueship_product_model_url' ) ? bagueship_product_model_url( $item_product_id ) : '';
              $item_preorder = function_exists( 'bagueship_product_preorder_data' ) ? bagueship_product_preorder_data( $item_product_id ) : array( 'enabled' => false );
              $item_sizes = array();
              $parent_product = $item_product_id ? wc_get_product( $item_product_id ) : null;
              if ( $parent_product && $parent_product->is_type( 'variable' ) ) {
                  foreach ( $parent_product->get_children() as $variation_id ) {
                      $variation_product = wc_get_product( $variation_id );
                      if ( ! $variation_product ) {
                          continue;
                      }
                      $attrs = $variation_product->get_attributes();
                      $size = (string) ( $attrs['taille'] ?? $attrs['pa_taille'] ?? '' );
                      if ( '' === $size ) {
                          continue;
                      }
                      $item_sizes[] = array(
                          'size'         => $size,
                          'variation_id' => (int) $variation_id,
                          'selected'     => (string) $item_size === $size,
                      );
                  }
              }
              usort(
                  $item_sizes,
                  static function ( array $a, array $b ): int {
                      return (int) $a['size'] <=> (int) $b['size'];
                  }
              );
              if ( $item_sizes ) {
                  $bagueship_size_modals[] = array(
                      'cart_item_key' => $cart_item_key,
                      'product_id'    => $item_product_id,
                      'name'          => $item_name,
                      'label'         => $item_label,
                      'finish'        => $item_finish,
                      'current_size'  => (string) $item_size,
                      'product_url'   => get_permalink( $item_product_id ),
                      'model_url'     => $item_model_url,
                      'sizes'         => $item_sizes,
                  );
              }
              ?>
              <div class="item reveal">
                <div class="ring-preview">
                  <?php if ( $item_model_url ) : ?>
                    <model-viewer src="<?php echo esc_url( $item_model_url ); ?>" alt="<?php echo esc_attr( $item_name ); ?>" loading="lazy" reveal="auto" auto-rotate rotation-per-second="14deg" camera-orbit="35deg 68deg 115%" environment-image="<?php echo esc_attr( $bagueship_steel_environment_url ); ?>" tone-mapping="aces" shadow-intensity="1.08" shadow-softness=".55" exposure=".84" interaction-prompt="none"></model-viewer>
                  <?php endif; ?>
                </div>
                <div class="item-meta">
                  <div class="item-label"><?php echo esc_html( $item_label ); ?></div>
                  <?php if ( ! empty( $item_preorder['enabled'] ) ) : ?>
                    <div class="preorder-line">Précommande · Prix soutien<?php echo ! empty( $item_preorder['estimate'] ) ? esc_html( ' · Expédition estimée ' . $item_preorder['estimate'] ) : ''; ?></div>
                  <?php endif; ?>
                  <div class="item-name"><?php echo esc_html( $item_name ); ?></div>
                  <div class="item-detail"><?php echo esc_html( $item_finish ); ?><br/>
                    <?php if ( $item_size ) : ?>
                      <div class="size-badge" style="margin-top:10px;">Taille <strong style="color:var(--ink);margin-left:2px;"><?php echo esc_html( $item_size ); ?></strong></div>
                    <?php endif; ?>
                  </div>
                  <div class="item-actions">
                    <?php if ( $item_sizes ) : ?>
                      <button type="button" data-size-modal="<?php echo esc_attr( $cart_item_key ); ?>">Modifier la taille</button>
                    <?php else : ?>
                      <button type="button" onclick="window.location.href='<?php echo esc_url( get_permalink( $item_product_id ) ); ?>'">Modifier la taille</button>
                    <?php endif; ?>
                    <span class="sep"></span>
                    <button type="button" onclick="window.location.href='<?php echo esc_url( wc_get_cart_remove_url( $cart_item_key ) ); ?>'">Supprimer</button>
                  </div>
                </div>
                <div class="price-col">
                  <div class="amount"><?php echo wp_kses_post( wc_price( (float) ( $cart_item['line_total'] ?? 0 ) + (float) ( $cart_item['line_tax'] ?? 0 ) ) ); ?></div>
                </div>
              </div>
            <?php endforeach; ?>
          <?php endif; ?>
        </div>

        <?php if ( ! $bagueship_cart_empty ) : ?>
        <!-- Upsell -->
        <div class="upsell reveal">
          <h3>Compléter votre commande</h3>
          <div class="sub">Éditions limitées — disponibles maintenant.</div>
          <div class="upsell-cards">
            <form class="ucard" method="post" action="<?php echo esc_url( wc_get_cart_url() ); ?>">
              <input type="hidden" name="add-to-cart" value="<?php echo esc_attr( $bagueship_upsell_product_id ); ?>">
              <input type="hidden" name="quantity" value="1">
              <input type="hidden" name="variation_id" value="<?php echo esc_attr( $bagueship_upsell_variations['52'] ?? 0 ); ?>">
              <input type="hidden" name="attribute_taille" value="52">
              <div class="utag">Finition</div>
              <div class="urow">
                <div>
                  <div class="uname">Abstract Openwork</div>
                  <div class="uprice">380&nbsp;€</div>
                </div>
                <button class="uadd" type="submit" aria-label="Ajouter Abstract Openwork au panier">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M12 5v14M5 12h14"></path></svg>
                </button>
              </div>
            </form>
            <form class="ucard" method="post" action="<?php echo esc_url( wc_get_cart_url() ); ?>">
              <input type="hidden" name="add-to-cart" value="<?php echo esc_attr( $bagueship_upsell_product_id ); ?>">
              <input type="hidden" name="quantity" value="1">
              <input type="hidden" name="variation_id" value="<?php echo esc_attr( $bagueship_upsell_variations['56'] ?? 0 ); ?>">
              <input type="hidden" name="attribute_taille" value="56">
              <div class="utag">Finition</div>
              <div class="urow">
                <div>
                  <div class="uname">Abstract Openwork</div>
                  <div class="uprice">380&nbsp;€</div>
                </div>
                <button class="uadd" type="submit" aria-label="Ajouter Abstract Openwork au panier">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M12 5v14M5 12h14"></path></svg>
                </button>
              </div>
            </form>
          </div>
        </div>
        <?php endif; ?>
      </div>

      <!-- ── Summary ── -->
      <?php if ( ! $bagueship_cart_empty ) : ?>
      <div class="reveal">
        <div class="summary">
          <h2>Récapitulatif</h2>
          <div class="sum-rows">
            <div class="sum-row">
              <span class="k">Sous-total</span>
              <span class="v"><?php echo wp_kses_post( wc_price( $bagueship_cart_subtotal ) ); ?></span>
            </div>
            <div class="sum-row free">
              <span class="k">Livraison</span>
              <span class="v"><?php echo esc_html( $bagueship_cart_shipping > 0 ? wp_strip_all_tags( wc_price( $bagueship_cart_shipping ) ) : __( "Offerte", "bagueship" ) ); ?></span>
            </div>
            <div class="sum-row">
              <span class="k">Retours</span>
              <span class="v" style="color:var(--ink-dim)"><?php esc_html_e( "Offerts", "bagueship" ); ?></span>
            </div>
            <div class="sum-row total">
              <span class="k">Total</span>
              <span class="v"><?php echo wp_kses_post( wc_price( $bagueship_cart_total ) ); ?></span>
            </div>
          </div>
          <button class="btn-checkout" onclick="window.location.href='<?php echo esc_url( wc_get_checkout_url() ); ?>'">Passer commande</button>
          <button class="btn-back" onclick="window.location.href='<?php echo esc_url( wc_get_page_permalink( 'shop' ) ); ?>'">Continuer mes achats</button>
          <div class="badges">
            <div class="badge">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
              Paiement 100% sécurisé
            </div>
            <div class="badge">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M14 9V5a3 3 0 00-6 0v4"></path><rect x="2" y="9" width="20" height="13" rx="2"></rect></svg>
              Vérifiée &amp; testée avant envoi
            </div>
            <div class="badge">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><path d="M12 8v4l3 3"></path></svg>
              Expédié sous 2–3 jours ouvrés
            </div>
          </div>
        </div>
      </div>
      <?php endif; ?>
    </div>
  </div>
</div>

<?php echo bagueship_footer_markup(); ?>

<?php foreach ( $bagueship_size_modals as $modal ) : ?>
  <div class="size-modal" id="size-modal-<?php echo esc_attr( $modal['cart_item_key'] ); ?>" aria-hidden="true">
    <div class="size-modal__panel" role="dialog" aria-modal="true" aria-labelledby="size-title-<?php echo esc_attr( $modal['cart_item_key'] ); ?>">
      <button class="size-modal__close" type="button" data-size-close aria-label="<?php esc_attr_e( 'Fermer', 'bagueship' ); ?>">×</button>
      <div class="size-modal__visual">
        <?php if ( ! empty( $modal['model_url'] ) ) : ?>
          <model-viewer src="<?php echo esc_url( $modal['model_url'] ); ?>" alt="<?php echo esc_attr( $modal['name'] ); ?>" loading="lazy" reveal="auto" auto-rotate camera-controls disable-zoom touch-action="none" rotation-per-second="12deg" camera-orbit="35deg 68deg 115%" environment-image="<?php echo esc_attr( $bagueship_steel_environment_url ); ?>" tone-mapping="aces" shadow-intensity="1.08" shadow-softness=".55" exposure=".84" interaction-prompt="none"></model-viewer>
        <?php endif; ?>
      </div>
      <form class="size-modal__body" method="post" action="<?php echo esc_url( wc_get_cart_url() ); ?>">
        <input type="hidden" name="bagueship_cart_size_inline" value="1">
        <input type="hidden" name="action" value="bagueship_update_cart_size">
        <input type="hidden" name="cart_item_key" value="<?php echo esc_attr( $modal['cart_item_key'] ); ?>">
        <input type="hidden" name="product_id" value="<?php echo esc_attr( $modal['product_id'] ); ?>">
        <input type="hidden" name="variation_id" value="">
        <input type="hidden" name="attribute_taille" value="">
        <?php wp_nonce_field( 'bagueship_cart_size_' . $modal['cart_item_key'], 'bagueship_cart_size_nonce' ); ?>
        <div class="size-modal__tag"><?php echo esc_html( $modal['label'] ); ?></div>
        <h2 class="size-modal__title" id="size-title-<?php echo esc_attr( $modal['cart_item_key'] ); ?>"><?php echo esc_html( $modal['name'] ); ?></h2>
        <p class="size-modal__desc">
          <?php echo esc_html( $modal['finish'] ); ?><br>
          <?php echo esc_html( 'Taille actuelle : ' . ( $modal['current_size'] ?: 'non définie' ) ); ?>
        </p>
        <div class="size-modal__sizes" role="group" aria-label="<?php esc_attr_e( 'Choisir une taille', 'bagueship' ); ?>">
          <?php foreach ( $modal['sizes'] as $size_data ) : ?>
            <button
              class="size-modal__size<?php echo ! empty( $size_data['selected'] ) ? ' is-selected' : ''; ?>"
              type="button"
              data-variation-id="<?php echo esc_attr( $size_data['variation_id'] ); ?>"
              data-size-value="<?php echo esc_attr( $size_data['size'] ); ?>"
              aria-pressed="<?php echo ! empty( $size_data['selected'] ) ? 'true' : 'false'; ?>"
            ><?php echo esc_html( $size_data['size'] ); ?></button>
          <?php endforeach; ?>
        </div>
        <div class="size-modal__actions">
          <button class="size-modal__submit" type="submit"><?php esc_html_e( 'Mettre à jour', 'bagueship' ); ?></button>
          <a class="size-modal__link" href="<?php echo esc_url( $modal['product_url'] ); ?>"><?php esc_html_e( 'Voir la fiche', 'bagueship' ); ?></a>
        </div>
      </form>
    </div>
  </div>
<?php endforeach; ?>

<script>
(function(){
  /* Reveal */
  const io=new IntersectionObserver(es=>{
    es.forEach(e=>{ if(e.isIntersecting){ e.target.classList.add('in'); io.unobserve(e.target); } });
  },{threshold:0.14});
  document.querySelectorAll('.reveal').forEach((el,i)=>{
    el.style.transitionDelay=(Math.min(i,4)*0.07)+'s';
    io.observe(el);
  });

  const closeModal = (modal) => {
    if (!modal) return;
    modal.classList.remove('is-open');
    modal.setAttribute('aria-hidden', 'true');
    document.body.style.overflow = '';
  };
  const openModal = (modal) => {
    if (!modal) return;
    modal.classList.add('is-open');
    modal.setAttribute('aria-hidden', 'false');
    document.body.style.overflow = 'hidden';
    const selected = modal.querySelector('.size-modal__size.is-selected') || modal.querySelector('.size-modal__size');
    if (selected) selected.click();
  };
  document.querySelectorAll('[data-size-modal]').forEach((button) => {
    button.addEventListener('click', () => openModal(document.getElementById('size-modal-' + button.dataset.sizeModal)));
  });
  document.querySelectorAll('.size-modal').forEach((modal) => {
    modal.addEventListener('click', (event) => {
      if (event.target === modal) closeModal(modal);
    });
    modal.querySelectorAll('[data-size-close]').forEach((button) => {
      button.addEventListener('click', () => closeModal(modal));
    });
    const form = modal.querySelector('form');
    const variationInput = form ? form.querySelector('input[name="variation_id"]') : null;
    const sizeInput = form ? form.querySelector('input[name="attribute_taille"]') : null;
    modal.querySelectorAll('.size-modal__size').forEach((button) => {
      button.addEventListener('click', () => {
        modal.querySelectorAll('.size-modal__size').forEach((other) => {
          other.classList.toggle('is-selected', other === button);
          other.setAttribute('aria-pressed', other === button ? 'true' : 'false');
        });
        if (variationInput) variationInput.value = button.dataset.variationId || '';
        if (sizeInput) sizeInput.value = button.dataset.sizeValue || '';
      });
    });
  });
  window.addEventListener('keydown', (event) => {
    if (event.key === 'Escape') {
      closeModal(document.querySelector('.size-modal.is-open'));
    }
  });
})();
</script>
  <?php wp_footer(); ?>
</body>
</html>
