<?php
if ( ! defined( 'ABSPATH' ) ) { exit; }
$bagueship_collection_terms = function_exists( 'bagueship_homepage_collection_terms' ) ? bagueship_homepage_collection_terms() : array();
$bagueship_collection_featured_product = get_page_by_path( 'abstract-openwork-cuff', OBJECT, 'product' );
$bagueship_collection_featured_url = $bagueship_collection_featured_product ? get_permalink( $bagueship_collection_featured_product ) : wc_get_page_permalink( 'shop' );
$bagueship_collection_sections = array();
$bagueship_steel_environment_url = function_exists( 'bagueship_steel_environment_url' ) ? bagueship_steel_environment_url() : 'neutral';
foreach ( $bagueship_collection_terms as $collection_index => $collection_term ) {
    if ( ! $collection_term instanceof WP_Term ) {
        continue;
    }

    $collection_meta = function_exists( 'bagueship_collection_meta' ) ? bagueship_collection_meta( $collection_term ) : array();
    $collection_state = $collection_meta['state'] ?? 'available';
    $product_query   = new WP_Query(
        array(
            'post_type'      => 'product',
            'post_status'    => 'publish',
            'posts_per_page' => -1,
            'orderby'        => 'menu_order title',
            'order'          => 'ASC',
            'tax_query'      => array(
                array(
                    'taxonomy' => 'product_cat',
                    'field'    => 'term_id',
                    'terms'    => array( (int) $collection_term->term_id ),
                ),
            ),
        )
    );

    $cards = array();
    foreach ( $product_query->posts as $product_post ) {
        $product = wc_get_product( $product_post->ID );
        if ( ! $product ) {
            continue;
        }
        $card_price = wp_strip_all_tags( $product->get_price_html() );
        if ( 'preorder' === $collection_state && function_exists( 'bagueship_core_preorder_price' ) ) {
            $base_price = $product->is_type( 'variable' ) ? (float) $product->get_variation_price( 'min', true ) : (float) $product->get_price();
            $card_price = 'Prix soutien ' . wp_strip_all_tags( wc_price( bagueship_core_preorder_price( $base_price, array( 'enabled' => true, 'discount_percent' => (int) ( $collection_meta['preorder_discount_percent'] ?: 20 ) ) ) ) );
        } elseif ( 'upcoming' === $collection_state ) {
            $card_price = 'Me prévenir';
        }
        $cards[] = array(
            'name'   => get_the_title( $product_post ),
            'finish' => $collection_term->name,
            'price'  => $card_price,
            'url'    => get_permalink( $product_post ) . ( 'upcoming' === $collection_state ? '#acheter' : '' ),
            'model'  => function_exists( 'bagueship_product_model_url' ) ? bagueship_product_model_url( $product_post->ID ) : '',
            'state'  => $collection_state,
        );
    }
    wp_reset_postdata();

    if ( empty( $cards ) ) {
        continue;
    }

    $bagueship_collection_sections[] = array(
        'id'          => 'collection-' . sanitize_html_class( $collection_term->slug ),
        'label'       => sprintf( 'Collection %s', array( 'I', 'II', 'III', 'IV', 'V' )[ $collection_index % 5 ] ),
        'name'        => $collection_term->name,
        'description' => $collection_meta['tagline'] ?? '',
        'from'        => 'upcoming' === $collection_state ? '' : ( function_exists( 'bagueship_format_price_from_term' ) ? bagueship_format_price_from_term( $collection_term ) : '' ),
        'state'       => $collection_state,
        'state_label' => function_exists( 'bagueship_collection_state_label' ) ? bagueship_collection_state_label( $collection_state ) : '',
        'estimate'    => $collection_meta['preorder_estimate'] ?? '',
        'message'     => $collection_meta['preorder_message'] ?? '',
        'cards'       => $cards,
    );
}

$bagueship_collection_groups = array(
    'available' => array(
        'title'    => 'Collections disponibles',
        'kicker'   => 'Sélection actuelle',
        'subtitle' => 'Les pièces ouvertes à la commande immédiate.',
        'sections' => array(),
    ),
    'preorder'  => array(
        'title'    => 'Collections en précommande',
        'kicker'   => 'Prix soutien',
        'subtitle' => 'Des séries ouvertes en avance, avec un tarif préférentiel pendant la phase de lancement.',
        'sections' => array(),
    ),
    'upcoming'  => array(
        'title'    => 'Collections à venir',
        'kicker'   => 'En préparation',
        'subtitle' => 'Les prochaines lignes Bagueship, encore en atelier avant ouverture des commandes.',
        'sections' => array(),
    ),
);
foreach ( $bagueship_collection_sections as $section ) {
    $group_key = isset( $bagueship_collection_groups[ $section['state'] ] ) ? $section['state'] : 'available';
    $bagueship_collection_groups[ $group_key ]['sections'][] = $section;
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Collections — Bagueship</title>
<style>
  :root{
    --bg:#050506; --panel:#0d0d10; --panel2:#0f0f12;
    --ink:#f5f5f7; --ink-dim:#a1a1a6; --ink-faint:#6e6e73;
    --hair:rgba(255,255,255,.09); --hair-soft:rgba(255,255,255,.055);
    --font:-apple-system,BlinkMacSystemFont,"SF Pro Display","SF Pro Text","Helvetica Neue",Helvetica,Arial,sans-serif;
  }
  *{ margin:0; padding:0; box-sizing:border-box; }
  body{ background:var(--bg); color:var(--ink); font-family:var(--font); -webkit-font-smoothing:antialiased; overflow-x:hidden; }
  ::selection{ background:rgba(245,245,247,.18); }
  a{ color:inherit; text-decoration:none; }

  /* ── Nav ── */
  .nav{
    position:fixed; top:0; left:0; right:0; z-index:60; height:52px;
    display:flex; align-items:center; justify-content:space-between;
    padding:0 max(22px,4vw);
    background:rgba(6,6,8,.55);
    backdrop-filter:saturate(160%) blur(18px);
    -webkit-backdrop-filter:saturate(160%) blur(18px);
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

  .eyebrow{ font-size:12px; letter-spacing:.34em; text-transform:uppercase; color:var(--ink-faint); font-weight:600; }

  /* ── Collection block ── */
  .cblock{ padding:8vh 0 4vh; scroll-margin-top:72px; }
  .cblock + .cblock{ padding-top:5vh; }
  .collection-divider{
    max-width:1120px; margin:10vh auto 0; padding:0 max(22px,4vw);
    display:grid; grid-template-columns:1fr auto 1fr; align-items:center; gap:22px;
  }
  .collection-divider:first-of-type{ margin-top:calc(52px + 5vh); }
  .collection-divider::before,
  .collection-divider::after{
    content:""; height:1px;
    background:linear-gradient(90deg, transparent, rgba(255,255,255,.16), transparent);
  }
  .divider-mark{
    width:9px; height:9px; border-radius:50%;
    background:linear-gradient(145deg, rgba(255,255,255,.86), rgba(125,132,142,.45));
    box-shadow:0 0 26px rgba(190,200,214,.22), inset 0 0 0 1px rgba(255,255,255,.32);
  }
  .divider-copy{
    max-width:720px; margin:22px auto 0; padding:0 max(22px,4vw);
    text-align:center;
  }
  .divider-kicker{
    color:var(--ink-faint); font-size:11px; letter-spacing:.34em;
    text-transform:uppercase; font-weight:700;
  }
  .divider-title{
    margin-top:12px; color:var(--ink); font-size:clamp(26px,4vw,46px);
    line-height:1.02; letter-spacing:-.035em; font-weight:600;
  }
  .divider-subtitle{
    margin:14px auto 0; max-width:54ch; color:var(--ink-dim);
    font-size:15px; line-height:1.55;
  }
  .chead{
    max-width:1120px; margin:0 auto; padding:0 max(22px,4vw);
    display:flex; align-items:flex-end; justify-content:space-between; gap:24px;
  }
  .chead .left .ctag{ font-size:12px; letter-spacing:.3em; text-transform:uppercase; color:var(--ink-faint); font-weight:600; }
  .state-badge{
    display:inline-flex; align-items:center; justify-content:center;
    height:28px; padding:0 12px; border-radius:999px;
    box-shadow:inset 0 0 0 1px var(--hair);
    color:var(--ink); font-size:11px; letter-spacing:.22em;
    text-transform:uppercase; font-weight:700;
    margin-top:14px;
  }
  .chead .left h2{
    margin-top:14px; font-size:clamp(28px,4.5vw,54px); font-weight:600;
    letter-spacing:-.035em; line-height:1.02; max-width:18ch; text-wrap:balance;
  }
  .chead .left .cdesc{
    margin-top:14px; max-width:54ch; color:var(--ink-dim);
    font-size:15px; line-height:1.55;
  }
  .chead .left .from{
    margin-top:12px; color:var(--ink); font-size:14px; font-weight:600;
  }
  .chead .arrows{ display:flex; gap:10px; flex-shrink:0; padding-bottom:4px; }
  .arrow{
    width:44px; height:44px; border-radius:50%; cursor:pointer;
    background:transparent; box-shadow:inset 0 0 0 1px var(--hair);
    color:var(--ink); display:flex; align-items:center; justify-content:center;
    border:none; transition:box-shadow .2s, transform .15s, opacity .2s;
  }
  .arrow:hover{ box-shadow:inset 0 0 0 1px rgba(255,255,255,.42); }
  .arrow:active{ transform:scale(.93); }
  .arrow[disabled]{ opacity:.28; cursor:default; pointer-events:none; }
  .arrow svg{ width:17px; height:17px; }
  @media (max-width:640px){ .chead .arrows{ display:none; } }

  /* rail */
  .rail{
    margin-top:4.5vh; display:flex; gap:18px;
    padding:8px max(22px,4vw) 28px;
    overflow-x:auto; scroll-snap-type:x mandatory;
    scroll-padding-inline:max(22px,4vw);
    scrollbar-width:none; cursor:grab;
    -webkit-overflow-scrolling:touch;
    overscroll-behavior-x:contain;
    touch-action:pan-x pan-y;
    user-select:none;
  }
  .rail:active, .rail.dragging{ cursor:grabbing; }
  .rail::-webkit-scrollbar{ display:none; }

  /* card */
  .card{
    flex:0 0 clamp(240px,42vw,360px); height:clamp(370px,54vh,455px);
    scroll-snap-align:center;
    scroll-snap-stop:always;
    border-radius:22px;
    background:linear-gradient(175deg,#0f1013 0%,#08090b 100%);
    box-shadow:inset 0 0 0 1px var(--hair-soft);
    position:relative; overflow:hidden;
    display:flex; flex-direction:column;
    transition:box-shadow .35s, transform .35s;
  }
  .card:hover{ box-shadow:inset 0 0 0 1px rgba(255,255,255,.18); transform:translateY(-3px); }
  .card.is-rotating-model{ cursor:default; }
  .card.selected{ box-shadow:inset 0 0 0 1.5px rgba(255,255,255,.52); }
  .card .glow{
    position:absolute; inset:0; pointer-events:none;
    background:radial-gradient(58% 44% at 50% 38%, rgba(86,92,104,.28), transparent 64%);
  }
  .card .badge-new{
    position:absolute; top:20px; right:20px; z-index:4;
    height:24px; padding:0 11px; border-radius:12px;
    background:rgba(255,255,255,.1); border:1px solid var(--hair);
    font-size:11px; letter-spacing:.2em; text-transform:uppercase;
    color:var(--ink-dim); font-weight:600;
    display:flex; align-items:center;
  }
  .card .ring-area{
    flex:1.18; display:flex; align-items:center; justify-content:center;
    position:relative; z-index:2;
    padding-top:22px;
    padding-bottom:34px;
  }
  @media (min-width:641px){
    .card .ring-area{ align-items:flex-start; padding-top:42px; }
  }
  .card .ring-area::before{
    content:""; position:absolute; left:50%; top:66%; width:66%; height:13%;
    transform:translateX(-50%);
    background:radial-gradient(ellipse at center, rgba(150,160,176,.18), transparent 68%);
    filter:blur(20px); pointer-events:none;
  }
  .card .ring-area model-viewer{
    display:block; width:118px !important; height:118px !important;
    background:transparent; --poster-color:transparent;
    position:relative; z-index:2;
    pointer-events:auto;
  }
  .card .info{
    position:absolute; z-index:3;
    left:0; right:0; bottom:22px;
    padding:0 22px;
  }
  .card .finish-tag{ font-size:11px; letter-spacing:.28em; text-transform:uppercase; color:var(--ink-faint); font-weight:600; }
  .card .cname{ margin-top:10px; font-size:clamp(22px,3.2vw,34px); font-weight:600; letter-spacing:-.03em; }
  .card .row{ margin-top:16px; display:flex; align-items:center; justify-content:space-between; gap:12px; }
  .card .price{ font-size:18px; font-weight:600; letter-spacing:-.01em; }
  .card .price.notify-price{
    display:inline-flex; align-items:center; justify-content:center;
    min-height:34px; padding:0 14px; border-radius:999px;
    box-shadow:inset 0 0 0 1px var(--hair);
    color:var(--ink); font-size:12px; letter-spacing:.16em;
    text-transform:uppercase; font-weight:700;
  }
  .card .cta-link{
    display:inline-flex; align-items:center; gap:6px;
    font-size:14px; font-weight:500; color:var(--ink-dim);
    transition:color .2s, gap .2s;
  }
  .card:hover .cta-link{ color:var(--ink); gap:10px; }
  .card .cta-link svg{ width:13px; height:13px; }

  /* dots */
  .dots{ display:flex; gap:8px; justify-content:center; margin-top:3vh; }
  .dot{ width:6px; height:6px; border-radius:50%; background:var(--hair); transition:background .25s, transform .25s; }
  .dot.on{ background:var(--ink); transform:scale(1.3); }

  @media (max-width:640px){
    .collection-divider{ margin-top:8vh; gap:14px; }
    .collection-divider:first-of-type{ margin-top:calc(52px + 3vh); }
    .divider-copy{ margin-top:18px; text-align:left; }
    .divider-subtitle{ margin-left:0; }
    .cblock{ padding:6vh 0 3vh; }
    .rail{
      gap:14px;
      padding:6px calc((100vw - min(68vw,280px)) / 2) 24px;
      scroll-padding-inline:calc((100vw - min(68vw,280px)) / 2);
      scroll-snap-type:x proximity;
      cursor:auto;
      touch-action:pan-x pan-y;
    }
    .card{
      flex-basis:min(64vw,250px);
      height:min(46vh,330px);
      min-height:300px;
      border-radius:18px;
    }
    .card .ring-area model-viewer{
      width:78px;
      height:78px;
      max-width:38%;
      max-height:13vh;
      pointer-events:auto;
      touch-action:none;
    }
    .card .ring-area{ flex:.86; padding-top:12px; padding-bottom:22px; }
    .card .info{ bottom:18px; padding:0 16px; }
    .card .cname{ margin-top:8px; font-size:clamp(18px,5.4vw,22px); }
    .card .row{ margin-top:10px; }
    .card .price{ font-size:15px; }
    .card .cta-link{ font-size:12.5px; }
  }

  footer{
    border-top:1px solid var(--hair-soft); padding:36px max(22px,4vw);
    display:flex; align-items:center; justify-content:space-between; gap:20px; flex-wrap:wrap;
  }
  .fb{ letter-spacing:.34em; color:var(--ink); font-weight:600; font-size:14px; }
  .flinks{ display:flex; gap:22px; color:var(--ink-faint); font-size:13px; }
  .flinks a:hover{ color:var(--ink-dim); }
  .fcopy{ color:var(--ink-faint); font-size:12px; }

  /* Reveal */
  .reveal{ opacity:0; transform:translateY(28px); transition:opacity 1s cubic-bezier(.16,1,.3,1), transform 1s cubic-bezier(.16,1,.3,1); }
  .reveal.in{ opacity:1; transform:none; }
  @media (prefers-reduced-motion:reduce){ .reveal{ opacity:1; transform:none; transition:none; } }
</style>
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>

<!-- ── Nav ── -->
<nav class="nav">
  <a class="brand" href="<?php echo esc_url( home_url( '/' ) ); ?>">BAGUESHIP</a>
  <?php echo bagueship_topbar_markup( bagueship_topbar_active_key() ); ?>
</nav>

<!-- ════ Collections ════ -->
<?php foreach ( $bagueship_collection_groups as $group ) : ?>
<?php if ( empty( $group['sections'] ) ) { continue; } ?>
<div class="collection-divider reveal" aria-hidden="true"><span class="divider-mark"></span></div>
<div class="divider-copy reveal">
  <div class="divider-kicker"><?php echo esc_html( $group['kicker'] ); ?></div>
  <h2 class="divider-title"><?php echo esc_html( $group['title'] ); ?></h2>
  <p class="divider-subtitle"><?php echo esc_html( $group['subtitle'] ); ?></p>
</div>
<?php foreach ( $group['sections'] as $section ) : ?>
<section class="cblock" id="<?php echo esc_attr( $section['id'] ); ?>">
  <div class="chead reveal">
    <div class="left">
      <div class="ctag"><?php echo esc_html( $section['label'] ); ?></div>
      <?php if ( 'available' !== $section['state'] ) : ?>
        <div class="state-badge"><?php echo esc_html( $section['state_label'] ); ?></div>
      <?php endif; ?>
      <h2><?php echo esc_html( $section['name'] ); ?></h2>
      <?php if ( ! empty( $section['description'] ) ) : ?>
        <p class="cdesc"><?php echo esc_html( $section['description'] ); ?></p>
      <?php endif; ?>
      <?php if ( ! empty( $section['from'] ) ) : ?>
        <div class="from"><?php echo esc_html( $section['from'] ); ?></div>
      <?php endif; ?>
      <?php if ( ! empty( $section['estimate'] ) ) : ?>
        <p class="cdesc"><?php echo esc_html( 'Expédition estimée : ' . $section['estimate'] ); ?></p>
      <?php endif; ?>
    </div>
    <div class="arrows">
      <button class="arrow" data-rail-prev="<?php echo esc_attr( $section['id'] ); ?>" disabled aria-label="Précédent">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M15 5 L8 12 L15 19"/></svg>
      </button>
      <button class="arrow" data-rail-next="<?php echo esc_attr( $section['id'] ); ?>" aria-label="Suivant">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M9 5 L16 12 L9 19"/></svg>
      </button>
    </div>
  </div>
  <div class="rail" id="<?php echo esc_attr( $section['id'] ); ?>-rail">
    <?php foreach ( $section['cards'] as $card ) : ?>
      <a class="card" href="<?php echo esc_url( $card['url'] ); ?>">
        <div class="glow"></div>
        <div class="ring-area">
          <?php if ( ! empty( $card['model'] ) ) : ?>
            <model-viewer src="<?php echo esc_url( $card['model'] ); ?>" alt="<?php echo esc_attr( $card['name'] ); ?>" loading="lazy" reveal="auto" auto-rotate camera-controls disable-zoom disable-pan disable-tap touch-action="none" rotation-per-second="7deg" orbit-sensitivity=".45" interpolation-decay="120" camera-orbit="35deg 68deg 112%" min-camera-orbit="auto 28deg 112%" max-camera-orbit="auto 86deg 112%" min-field-of-view="24deg" max-field-of-view="24deg" environment-image="<?php echo esc_attr( $bagueship_steel_environment_url ); ?>" tone-mapping="aces" shadow-intensity="1.08" shadow-softness=".55" exposure=".84" interaction-prompt="none"></model-viewer>
          <?php endif; ?>
        </div>
        <div class="info">
          <div class="finish-tag"><?php echo esc_html( $card['finish'] ); ?></div>
          <div class="cname"><?php echo esc_html( $card['name'] ); ?></div>
          <div class="row">
            <span class="price<?php echo 'upcoming' === $card['state'] ? ' notify-price' : ''; ?>"><?php echo esc_html( $card['price'] ); ?></span>
            <span class="cta-link"><?php echo esc_html( 'upcoming' === $card['state'] ? 'Alerte email' : 'En savoir plus' ); ?> <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M9 5 L16 12 L9 19"/></svg></span>
          </div>
        </div>
      </a>
    <?php endforeach; ?>
  </div>
  <div class="dots" id="<?php echo esc_attr( $section['id'] ); ?>-dots">
    <?php foreach ( $section['cards'] as $dot_index => $card ) : ?>
      <span class="dot<?php echo 0 === $dot_index ? ' on' : ''; ?>"></span>
    <?php endforeach; ?>
  </div>
</section>
<?php endforeach; ?>
<?php endforeach; ?>

<?php echo bagueship_footer_markup(); ?>

<script>
(function(){
  /* Rail nav helper */
  function setupRail(railEl, dotsEl, prevBtn, nextBtn){
    const cards=[...railEl.querySelectorAll('.card')];
    const dots=[...dotsEl.children];
    const hasFinePointer=window.matchMedia('(pointer: fine)').matches;
    let snapTimer=0;
    function cardCenter(card){
      return card.offsetLeft + (card.offsetWidth / 2);
    }
    function viewportCenter(){
      return railEl.scrollLeft + (railEl.clientWidth / 2);
    }
    function active(){
      const center=viewportCenter();
      let best=0;
      let bestDistance=Infinity;
      cards.forEach((card,index)=>{
        const distance=Math.abs(cardCenter(card)-center);
        if(distance<bestDistance){
          best=index;
          bestDistance=distance;
        }
      });
      return best;
    }
    function scrollToIndex(index, behavior='smooth'){
      const card=cards[Math.max(0, Math.min(cards.length-1, index))];
      if(!card) return;
      const railBox=railEl.getBoundingClientRect();
      const cardBox=card.getBoundingClientRect();
      const delta=(cardBox.left + cardBox.width / 2) - (railBox.left + railBox.width / 2);
      railEl.scrollTo({left:railEl.scrollLeft + delta, behavior});
    }
    function snapToNearest(){
      if(!hasFinePointer) return;
      if(railEl.classList.contains('dragging')) return;
      scrollToIndex(active(), 'smooth');
    }
    function queueSnap(delay=120){
      if(!hasFinePointer) return;
      window.clearTimeout(snapTimer);
      snapTimer=window.setTimeout(snapToNearest, delay);
    }
    function sync(){
      const a=active();
      dots.forEach((d,i)=>d.classList.toggle('on',i===a));
      if(prevBtn) prevBtn.disabled = railEl.scrollLeft < 8;
      if(nextBtn) nextBtn.disabled = railEl.scrollLeft > railEl.scrollWidth-railEl.clientWidth-8;
    }
    if(prevBtn) prevBtn.addEventListener('click',()=>scrollToIndex(active()-1));
    if(nextBtn) nextBtn.addEventListener('click',()=>scrollToIndex(active()+1));
    dots.forEach((dot,index)=>dot.addEventListener('click',()=>scrollToIndex(index)));
    railEl.addEventListener('scroll',()=>{
      sync();
      queueSnap(150);
    },{passive:true});
    railEl.addEventListener('scrollend',()=>snapToNearest());
    window.addEventListener('resize',sync);
    if(hasFinePointer){
      let down=false,moved=false,sx=0,sl=0;
      railEl.addEventListener('pointerdown',e=>{down=true;moved=false;sx=e.clientX;sl=railEl.scrollLeft;railEl.classList.add('dragging');});
      railEl.addEventListener('pointermove',e=>{if(!down)return;const dx=e.clientX-sx;if(Math.abs(dx)>5)moved=true;railEl.scrollLeft=sl-dx;});
      function end(){ if(!down)return;down=false;railEl.classList.remove('dragging'); queueSnap(30); }
      railEl.addEventListener('pointerup',end);
      railEl.addEventListener('pointerleave',end);
      railEl.addEventListener('pointercancel',end);
      cards.forEach(c=>c.addEventListener('click',e=>{if(moved)e.preventDefault();}));
    }
    setTimeout(sync,60);
  }

  document.querySelectorAll('.rail').forEach((rail)=>{
    const id=rail.id.replace(/-rail$/,'');
    setupRail(
      rail,
      document.getElementById(id+'-dots'),
      document.querySelector('[data-rail-prev="'+id+'"]'),
      document.querySelector('[data-rail-next="'+id+'"]')
    );
  });

  document.querySelectorAll('.card model-viewer').forEach((viewer)=>{
    const card=viewer.closest('.card');
    let interacting=false;
    if(card){
      card.setAttribute('draggable', 'false');
      card.addEventListener('dragstart',(event)=>event.preventDefault());
      viewer.addEventListener('dragstart',(event)=>event.preventDefault());
      viewer.addEventListener('dblclick',(event)=>{
        event.preventDefault();
        event.stopPropagation();
      }, true);
      viewer.addEventListener('pointerdown',()=>{
        interacting=true;
        card.classList.add('is-rotating-model');
      }, true);
      const endInteraction=()=>{
        window.setTimeout(()=>{
          interacting=false;
          card.classList.remove('is-rotating-model');
        }, 220);
      };
      viewer.addEventListener('pointerup',endInteraction, true);
      viewer.addEventListener('pointercancel',endInteraction, true);
      viewer.addEventListener('pointerleave',endInteraction, true);
      card.addEventListener('click',(event)=>{
        if(interacting || event.target === viewer || viewer.contains(event.target)){
          event.preventDefault();
          event.stopPropagation();
        }
      }, true);
    }
  });

  /* ── Reveal ── */
  const io=new IntersectionObserver(es=>{
    es.forEach(e=>{ if(e.isIntersecting){ e.target.classList.add('in'); io.unobserve(e.target); } });
  },{threshold:0.13, rootMargin:'0px 0px -5% 0px'});
  document.querySelectorAll('.reveal').forEach((el,i)=>{
    el.style.transitionDelay=(Math.min(i%5,4)*0.07)+'s';
    io.observe(el);
  });
})();
</script>
  <?php wp_footer(); ?>
</body>
</html>
