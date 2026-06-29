<?php
if ( ! defined( 'ABSPATH' ) ) { exit; }
global $product;
if ( ! $product instanceof WC_Product ) {
    $product = wc_get_product( get_the_ID() );
}
$bagueship_product_name = get_the_title();
$bagueship_product_terms = wc_get_product_terms( get_the_ID(), 'product_cat', array( 'fields' => 'names' ) );
$bagueship_product_meta = function_exists( 'bagueship_core_get_product_meta' ) ? bagueship_core_get_product_meta( get_the_ID() ) : array();
$bagueship_product_price = $product ? wp_strip_all_tags( $product->get_price_html() ) : '';
$bagueship_preorder_data = function_exists( 'bagueship_product_preorder_data' ) ? bagueship_product_preorder_data( get_the_ID() ) : array( 'enabled' => false, 'state' => 'available' );
$bagueship_collection_state = $bagueship_preorder_data['state'] ?? 'available';
$bagueship_is_preorder = ! empty( $bagueship_preorder_data['enabled'] );
$bagueship_is_upcoming = 'upcoming' === $bagueship_collection_state;
$bagueship_product_price_display = $bagueship_product_price;
if ( $product && $bagueship_is_preorder ) {
    $bagueship_product_price_display = wp_strip_all_tags( wc_price( bagueship_preorder_price_for_product( $product, get_the_ID() ) ) );
}
$bagueship_product_short = wp_strip_all_tags( get_the_excerpt() ?: '' );
$bagueship_product_desc = wp_strip_all_tags( get_the_content() ?: '' );
$bagueship_variations = array();
$bagueship_variation_sizes = array();
if ( $product && $product->is_type( 'variable' ) ) {
    foreach ( $product->get_children() as $variation_id ) {
        $variation = wc_get_product( $variation_id );
        if ( ! $variation ) {
            continue;
        }
        $attrs = $variation->get_attributes();
        $size = $attrs['pa_taille'] ?? $attrs['taille'] ?? '';
        if ( '' === $size ) {
            continue;
        }
        $size = (int) $size;
        $bagueship_variation_sizes[] = $size;
        $bagueship_variations[ (string) $size ] = array(
            'id'       => $variation_id,
            'price'    => $bagueship_is_preorder ? wp_strip_all_tags( wc_price( bagueship_preorder_price_for_product( $variation, get_the_ID() ) ) ) : wp_strip_all_tags( $variation->get_price_html() ),
            'original' => wp_strip_all_tags( $variation->get_price_html() ),
        );
    }
}
$bagueship_variation_sizes = array_values( array_unique( array_filter( $bagueship_variation_sizes ) ) );
sort( $bagueship_variation_sizes );
$bagueship_default_size = $bagueship_variation_sizes ? $bagueship_variation_sizes[0] : 56;
$bagueship_spec_matiere = $bagueship_product_meta['matiere'] ?? 'Acier inoxydable 316L';
$bagueship_spec_matiere_desc = $bagueship_product_meta['guide_taille'] ?? 'Acier chirurgical, hypoallergénique et résistant à la corrosion.';
$bagueship_spec_finition = $bagueship_product_meta['finition'] ?? 'Brossé & facetté';
$bagueship_spec_finition_desc = $bagueship_product_meta['entretien'] ?? 'Surfaces mates et arêtes polies, travaillées à la main.';
$bagueship_spec_profil = $bagueship_product_meta['largeur'] ?? "Bande 8 mm · 2,4 mm d'épaisseur";
$bagueship_spec_poids = $bagueship_product_meta['poids_bijou'] ?? '14 g';
$bagueship_spec_conception = $bagueship_product_meta['fabrication'] ?? 'Déstructurée';
$bagueship_spec_conception_desc = $bagueship_product_meta['packaging'] ?? 'Volume asymétrique, fait main en édition limitée.';
$bagueship_spec_tailles = ! empty( $bagueship_variation_sizes ) ? ( min( $bagueship_variation_sizes ) . ' → ' . max( $bagueship_variation_sizes ) . ' (EU)' ) : '48 → 68 (EU)';
$bagueship_add_to_cart_url = get_permalink( get_the_ID() );
$bagueship_product_model_url = function_exists( 'bagueship_product_model_url' ) ? bagueship_product_model_url( get_the_ID() ) : '';
$bagueship_steel_environment_url = function_exists( 'bagueship_steel_environment_url' ) ? bagueship_steel_environment_url() : 'neutral';
$bagueship_notify_result = isset( $_GET['bagueship_notify'] ) ? sanitize_key( wp_unslash( $_GET['bagueship_notify'] ) ) : '';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title><?php echo esc_html( $bagueship_product_name ); ?> — Bagueship</title>
<style>
  :root{
    --bg:#050506;
    --bg-soft:#0a0a0c;
    --ink:#f5f5f7;
    --ink-dim:#a1a1a6;
    --ink-faint:#6e6e73;
    --hair:rgba(255,255,255,.09);
    --hair-soft:rgba(255,255,255,.06);
    --font: -apple-system, BlinkMacSystemFont, "SF Pro Display", "SF Pro Text", "Helvetica Neue", Helvetica, Arial, sans-serif;
  }

  *{ margin:0; padding:0; box-sizing:border-box; }
  html{ scroll-behavior:auto; }
  body{
    background:var(--bg);
    color:var(--ink);
    font-family:var(--font);
    -webkit-font-smoothing:antialiased;
    text-rendering:optimizeLegibility;
    overflow-x:hidden;
  }
  ::selection{ background:rgba(245,245,247,.18); }

  /* ---------- Top bar ---------- */
  .nav{
    position:fixed; top:0; left:0; right:0; z-index:50;
    height:52px;
    display:flex; align-items:center; justify-content:space-between;
    padding:0 max(22px, 4vw);
    background:rgba(6,6,8,.55);
    backdrop-filter:saturate(160%) blur(18px);
    -webkit-backdrop-filter:saturate(160%) blur(18px);
    border-bottom:1px solid var(--hair-soft);
  }
  .nav .brand{
    font-size:15px; font-weight:600; letter-spacing:.34em;
    padding-left:.34em;
  }
  .nav .right{
    position:absolute; left:50%; transform:translateX(-50%);
    display:flex; align-items:center; justify-content:center; gap:34px;
    font-size:13px; color:var(--ink-dim); font-weight:700; letter-spacing:.2em; text-transform:uppercase; white-space:nowrap;
  }
  .nav .right a{ position:relative; padding:18px 0 17px; color:inherit; text-decoration:none; transition:color .25s; }
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
  .nav .price-pill{
    position:absolute; right:calc(max(22px, 4vw) + 52px);
    color:var(--ink); font-weight:600; letter-spacing:.01em;
  }
  .screen-reader-text{ position:absolute; width:1px; height:1px; padding:0; margin:-1px; overflow:hidden; clip:rect(0,0,0,0); white-space:nowrap; border:0; }
  @media (max-width:640px){
    .nav{ padding:0 14px; }
    .nav .brand{ font-size:10px; letter-spacing:.12em; padding-left:.12em; }
    .nav .right{ gap:18px; font-size:11px; letter-spacing:.14em; }
    .nav .nav-actions{ right:10px; }
    .nav .cart-link{ width:34px; height:34px; }
    .nav .cart-icon{ width:25px; height:20px; }
    .nav .price-pill{ right:52px; font-size:11px; }
  }

  /* ---------- Scroll stage ---------- */
  .scrollzone{ position:relative; height:440vh; }
  .stage{
    position:sticky; top:0; height:100vh;
    display:flex; align-items:center; justify-content:center;
    overflow:hidden;
  }
  /* studio key light + vignette */
  .stage::before{
    content:""; position:absolute; inset:0;
    background:
      radial-gradient(60% 48% at 50% 38%, rgba(78,84,96,.30), rgba(40,44,54,.06) 46%, transparent 70%),
      radial-gradient(120% 90% at 50% 50%, transparent 52%, rgba(0,0,0,.65) 100%);
    pointer-events:none;
  }
  .platform{
    position:absolute; left:50%; top:62%;
    width:54vmin; height:13vmin; transform:translateX(-50%);
    background:radial-gradient(ellipse at center, rgba(150,160,176,.16), transparent 68%);
    filter:blur(22px); pointer-events:none;
  }

  .stage3d{
    position:relative; z-index:2;
    width:min(68vmin,520px); height:min(68vmin,520px);
  }
  .stage3d::before{
    content:""; position:absolute; left:50%; top:64%; width:78%; height:16%;
    transform:translateX(-50%);
    background:radial-gradient(ellipse at center, rgba(150,160,176,.18), transparent 68%);
    filter:blur(22px); pointer-events:none;
  }
  .ring-fade{ transition:opacity .2s linear; will-change:opacity; }
  model-viewer.product-model{
    display:block; width:100%; height:100%;
    background:transparent; --poster-color:transparent;
    position:relative; z-index:2;
  }

  /* ---------- Kinetic overlay text ---------- */
  .cues{
    position:absolute; inset:0; z-index:6;
    display:flex; align-items:center; justify-content:center;
    pointer-events:none; text-align:center;
  }
  .cue{
    position:absolute; left:50%; top:50%;
    transform:translate(-50%,-50%);
    width:min(92vw, 760px);
    opacity:0; will-change:opacity, transform;
  }
  .cue.title h1{
    font-size:clamp(64px, 15vw, 168px);
    font-weight:600; letter-spacing:-.045em; line-height:.92;
  }
  .cue.title p{
    margin-top:18px; font-size:clamp(15px,2.4vw,21px);
    color:var(--ink-dim); font-weight:400; letter-spacing:.005em;
  }
  .cue.phrase p{
    font-size:clamp(26px, 5vw, 54px);
    font-weight:600; letter-spacing:-.025em; line-height:1.08;
    color:var(--ink);
  }
  .scrollhint{
    position:fixed; left:0; right:0; bottom:30px; z-index:7;
    display:flex; flex-direction:column; align-items:center; gap:11px;
    color:var(--ink-faint); font-size:11px; letter-spacing:.32em;
    font-weight:500; text-transform:uppercase;
    transition:opacity .4s; pointer-events:none;
  }
  .scrollhint .line{
    width:1px; height:40px;
    background:linear-gradient(var(--ink-faint), transparent);
    animation:drift 2.4s ease-in-out infinite;
  }
  @keyframes drift{ 0%,100%{ transform:scaleY(.5); opacity:.4 } 50%{ transform:scaleY(1); opacity:1 } }

  /* ---------- Reveal sections ---------- */
  .reveal{ opacity:0; transform:translateY(34px); transition:opacity 1s cubic-bezier(.16,1,.3,1), transform 1s cubic-bezier(.16,1,.3,1); }
  .reveal.in{ opacity:1; transform:none; }

  .section{ position:relative; padding:0 max(22px, 4vw); }
  .wrap{ max-width:980px; margin:0 auto; }

  .eyebrow{
    font-size:12px; letter-spacing:.34em; text-transform:uppercase;
    color:var(--ink-faint); font-weight:600;
  }

  /* Specs */
  .specs{ padding-top:14vh; padding-bottom:12vh; }
  .specs h2{
    font-size:clamp(34px,6vw,68px); font-weight:600;
    letter-spacing:-.035em; line-height:1.02; margin-top:20px;
    max-width:14ch;
  }
  .specs .lead{
    margin-top:26px; max-width:46ch; color:var(--ink-dim);
    font-size:clamp(16px,2.2vw,20px); line-height:1.55; font-weight:400;
    text-wrap:pretty;
  }
  .spec-list{ margin-top:9vh; border-top:1px solid var(--hair); }
  .spec-row{
    display:grid; grid-template-columns:minmax(120px,1fr) 2fr;
    gap:24px; align-items:baseline;
    padding:30px 4px; border-bottom:1px solid var(--hair);
  }
  .spec-row .k{
    font-size:13px; letter-spacing:.04em; color:var(--ink-faint);
    font-weight:500; text-transform:uppercase;
  }
  .spec-row .v{
    font-size:clamp(20px,3vw,30px); font-weight:500;
    letter-spacing:-.02em; color:var(--ink);
  }
  .spec-row .v small{ display:block; margin-top:8px; font-size:14px; color:var(--ink-dim); font-weight:400; letter-spacing:0; }

  /* Purchase */
  .buy{ padding-top:13vh; padding-bottom:20vh; text-align:center; }
  .buy .name{ font-size:clamp(40px,8vw,86px); font-weight:600; letter-spacing:-.04em; line-height:1; }
  .buy .sub{ margin-top:16px; color:var(--ink-dim); font-size:clamp(15px,2.2vw,19px); }
  .buy .amount{ margin-top:40px; font-size:clamp(30px,5vw,46px); font-weight:600; letter-spacing:-.02em; }
  .buy .from{ display:block; font-size:13px; color:var(--ink-faint); letter-spacing:.04em; margin-bottom:6px; font-weight:500; text-transform:uppercase; }
  .commerce-note{
    margin:18px auto 0;
    max-width:560px;
    color:var(--ink-dim);
    font-size:14px;
    line-height:1.55;
  }
  .commerce-badge{
    display:inline-flex; align-items:center; justify-content:center;
    height:30px; padding:0 13px; border-radius:999px;
    box-shadow:inset 0 0 0 1px var(--hair);
    color:var(--ink); font-size:11px; letter-spacing:.22em;
    text-transform:uppercase; font-weight:700;
    margin-bottom:18px;
  }

  .sizes{ margin:48px auto 0; max-width:560px; }
  .sizes .head{
    display:flex; align-items:baseline; justify-content:space-between;
    margin-bottom:18px;
  }
  .sizes .head .lbl{ font-size:13px; letter-spacing:.04em; text-transform:uppercase; color:var(--ink-faint); font-weight:600; }
  .sizes .head .circ{ font-size:14px; color:var(--ink-dim); font-variant-numeric:tabular-nums; }
  .chips{ display:flex; flex-wrap:wrap; gap:10px; justify-content:center; }
  .chip{
    appearance:none; border:1px solid var(--hair); background:transparent;
    color:var(--ink); font-family:inherit; font-size:16px; font-weight:500;
    width:54px; height:54px; border-radius:50%;
    cursor:pointer; transition:border-color .2s, background .2s, transform .2s, color .2s;
    font-variant-numeric:tabular-nums;
  }
  .chip:hover{ border-color:rgba(255,255,255,.45); }
  .chip[aria-pressed="true"]{
    background:var(--ink); color:#0b0b0d; border-color:var(--ink);
    transform:scale(1.04);
  }

  .cta{
    margin-top:46px; display:flex; flex-direction:column; align-items:center; gap:16px;
  }
  .btn-buy{
    appearance:none; border:none; cursor:pointer; font-family:inherit;
    background:var(--ink); color:#0b0b0d;
    font-size:18px; font-weight:600; letter-spacing:-.01em;
    padding:0 46px; height:58px; border-radius:30px; min-width:280px;
    transition:transform .18s cubic-bezier(.16,1,.3,1), background .25s, color .25s;
  }
  .btn-buy:hover{ transform:translateY(-1px); }
  .btn-buy:active{ transform:translateY(0) scale(.99); }
  .btn-buy.added{ background:transparent; color:var(--ink); box-shadow:inset 0 0 0 1px var(--hair); }
  .btn-buy[disabled]{ opacity:.45; cursor:not-allowed; transform:none; }
  .reassure{ font-size:13px; color:var(--ink-faint); letter-spacing:.01em; }
  .notify-form{
    width:min(100%,560px);
    margin:40px auto 0;
    display:grid;
    grid-template-columns:1fr auto;
    gap:12px;
    padding:8px;
    border-radius:999px;
    background:rgba(255,255,255,.035);
    box-shadow:inset 0 0 0 1px var(--hair);
  }
  .notify-form input{
    min-width:0;
    height:52px;
    border:none;
    outline:none;
    background:transparent;
    color:var(--ink);
    font:inherit;
    padding:0 18px;
  }
  .notify-form input::placeholder{ color:var(--ink-faint); }
  .notify-form button{
    border:none;
    height:52px;
    border-radius:999px;
    padding:0 24px;
    background:var(--ink);
    color:#0b0b0d;
    font:inherit;
    font-weight:700;
    cursor:pointer;
  }
  .notify-status{
    margin:14px auto 0;
    max-width:560px;
    color:var(--ink-dim);
    font-size:14px;
    line-height:1.45;
  }
  .notify-status.ok{ color:var(--ink); }
  @media (max-width:560px){
    .notify-form{ grid-template-columns:1fr; border-radius:28px; }
    .notify-form button{ width:100%; }
  }

  .footer{
    border-top:1px solid var(--hair-soft);
    padding:34px max(22px,4vw); text-align:center;
    color:var(--ink-faint); font-size:12px; letter-spacing:.02em;
  }
  .footer .fb{ letter-spacing:.34em; color:var(--ink-dim); font-weight:600; }

  @media (prefers-reduced-motion: reduce){
    .reveal{ transition:none; opacity:1; transform:none; }
    .scrollhint .line{ animation:none; }
  }
</style>
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>

  <nav class="nav">
    <a class="brand" href="<?php echo esc_url( home_url( '/' ) ); ?>">BAGUESHIP</a>
    <?php echo bagueship_topbar_markup( bagueship_topbar_active_key() ); ?>
    <?php if ( ! $bagueship_is_upcoming ) : ?>
      <span class="price-pill"><?php echo wp_kses_post( $bagueship_product_price_display ); ?></span>
    <?php endif; ?>
  </nav>

  <!-- ============ Pinned rotating ring ============ -->
  <section class="scrollzone" id="top">
    <div class="stage">
      <div class="platform"></div>

      <div class="stage3d ring-fade" id="ringFade">
        <?php if ( $bagueship_product_model_url ) : ?>
          <model-viewer
            class="product-model"
            id="productModel"
            src="<?php echo esc_url( $bagueship_product_model_url ); ?>"
            alt="<?php echo esc_attr( $bagueship_product_name ); ?>"
            loading="eager"
            camera-orbit="25deg 68deg 105%"
            min-camera-orbit="auto auto 70%"
            max-camera-orbit="auto auto 170%"
            environment-image="<?php echo esc_attr( $bagueship_steel_environment_url ); ?>"
            tone-mapping="aces"
            shadow-intensity="1.18"
            shadow-softness=".5"
            exposure=".82"
            interaction-prompt="none">
          </model-viewer>
        <?php endif; ?>
      </div>

      <div class="cues" id="cues">
        <div class="cue title" data-cue="0">
          <h1><?php echo esc_html( $bagueship_product_name ); ?></h1>
          <p><?php echo esc_html( $bagueship_product_short ?: $bagueship_spec_matiere ); ?></p>
        </div>
        <div class="cue phrase" data-cue="1"><p>Forgée dans l'acier inoxydable&nbsp;316L.</p></div>
        <div class="cue phrase" data-cue="2"><p>Une architecture déstructurée,<br/>taillée à la lumière.</p></div>
        <div class="cue phrase" data-cue="3"><p>Pensée pour ne jamais vieillir.</p></div>
      </div>
    </div>

    <div class="scrollhint" id="hint">
      <span>Faites défiler</span>
      <span class="line"></span>
    </div>
  </section>

  <!-- ============ Specs ============ -->
  <section class="section specs" id="specs">
    <div class="wrap">
      <div class="eyebrow reveal">Spécifications</div>
      <h2 class="reveal">Chaque détail, sculpté.</h2>
      <p class="lead reveal"><?php echo esc_html( $bagueship_product_desc ?: $bagueship_product_short ); ?></p>

      <div class="spec-list">
        <div class="spec-row reveal">
          <div class="k">Matériau</div>
          <div class="v"><?php echo esc_html( $bagueship_spec_matiere ); ?><small><?php echo esc_html( $bagueship_spec_matiere_desc ); ?></small></div>
        </div>
        <div class="spec-row reveal">
          <div class="k">Finition</div>
          <div class="v"><?php echo esc_html( $bagueship_spec_finition ); ?><small><?php echo esc_html( $bagueship_spec_finition_desc ); ?></small></div>
        </div>
        <div class="spec-row reveal">
          <div class="k">Profil</div>
          <div class="v"><?php echo esc_html( $bagueship_spec_profil ); ?></div>
        </div>
        <div class="spec-row reveal">
          <div class="k">Poids</div>
          <div class="v"><?php echo esc_html( $bagueship_spec_poids ); ?></div>
        </div>
        <div class="spec-row reveal">
          <div class="k">Conception</div>
          <div class="v"><?php echo esc_html( $bagueship_spec_conception ); ?><small><?php echo esc_html( $bagueship_spec_conception_desc ); ?></small></div>
        </div>
        <div class="spec-row reveal">
          <div class="k">Tailles</div>
          <div class="v"><?php echo esc_html( $bagueship_spec_tailles ); ?></div>
        </div>
      </div>
    </div>
  </section>

  <!-- ============ Purchase ============ -->
  <section class="section buy" id="acheter">
    <div class="wrap">
      <div class="name reveal"><?php echo esc_html( $bagueship_product_name ); ?></div>
      <div class="sub reveal"><?php echo esc_html( $bagueship_spec_matiere . " · " . $bagueship_spec_finition ); ?></div>

      <?php if ( $bagueship_is_preorder || $bagueship_is_upcoming ) : ?>
        <div class="commerce-badge reveal"><?php echo esc_html( $bagueship_is_preorder ? 'Précommande ouverte' : 'Collection à venir' ); ?></div>
      <?php endif; ?>

      <?php if ( ! $bagueship_is_upcoming ) : ?>
        <div class="amount reveal" id="bagueshipAmount"><span class="from"><?php echo esc_html( $bagueship_is_preorder ? 'Prix soutien' : 'À partir de' ); ?></span><span id="bagueshipAmountValue"><?php echo wp_kses_post( $bagueship_product_price_display ); ?></span></div>
      <?php endif; ?>

      <?php if ( $bagueship_is_preorder ) : ?>
        <p class="commerce-note reveal">
          <?php
          $preorder_note = ! empty( $bagueship_preorder_data['message'] ) ? $bagueship_preorder_data['message'] : 'Précommande à prix soutien, réservée aux premières pièces de la série.';
          echo esc_html( $preorder_note );
          if ( ! empty( $bagueship_preorder_data['estimate'] ) ) {
              echo ' ' . esc_html( 'Expédition estimée : ' . $bagueship_preorder_data['estimate'] . '.' );
          }
          ?>
        </p>
      <?php elseif ( $bagueship_is_upcoming ) : ?>
        <p class="commerce-note reveal">Cette pièce appartient à une collection en préparation. Les commandes ouvriront lorsque la série sera prête.</p>
      <?php endif; ?>

      <?php if ( ! $bagueship_is_upcoming ) : ?>
        <div class="sizes reveal">
          <div class="head">
            <span class="lbl">Taille de doigt</span>
            <span class="circ" id="circ">Circonférence <?php echo esc_html( $bagueship_default_size ); ?>&nbsp;mm</span>
          </div>
          <div class="chips" id="chips" role="group" aria-label="Taille de bague"></div>
        </div>
      <?php endif; ?>

      <?php if ( $bagueship_is_upcoming ) : ?>
        <form class="notify-form reveal" method="post" action="<?php echo esc_url( admin_url( 'admin-post.php' ) ); ?>">
          <input type="hidden" name="action" value="bagueship_preorder_notify">
          <input type="hidden" name="product_id" value="<?php echo esc_attr( get_the_ID() ); ?>">
          <?php wp_nonce_field( 'bagueship_notify_' . get_the_ID(), 'bagueship_notify_nonce' ); ?>
          <input type="email" name="bagueship_notify_email" placeholder="Votre email" autocomplete="email" required>
          <button type="submit">Me prévenir</button>
        </form>
        <?php if ( $bagueship_notify_result ) : ?>
          <p class="notify-status <?php echo 'ok' === $bagueship_notify_result ? 'ok' : ''; ?>">
            <?php
            if ( 'ok' === $bagueship_notify_result ) {
                echo esc_html( 'C’est noté. Vous serez prévenu dès que la précommande ouvrira.' );
            } elseif ( 'email' === $bagueship_notify_result ) {
                echo esc_html( 'Entrez une adresse email valide pour recevoir l’alerte.' );
            } elseif ( 'closed' === $bagueship_notify_result ) {
                echo esc_html( 'Cette alerte n’est plus disponible pour ce produit.' );
            } else {
                echo esc_html( 'Impossible d’enregistrer cette alerte pour le moment.' );
            }
            ?>
          </p>
        <?php endif; ?>
        <span class="reassure reveal">Aucun paiement maintenant · un seul email lorsque la précommande ouvre</span>
      <?php else : ?>
        <div class="cta reveal">
          <button class="btn-buy" id="buy" type="button"><?php echo esc_html( $bagueship_is_preorder ? 'Précommander' : 'Ajouter au panier' ); ?></button>
          <span class="reassure"><?php echo esc_html( $bagueship_is_preorder ? 'Prix soutien · Conditions de précommande disponibles au checkout' : 'Livraison et retours offerts · Garantie à vie' ); ?></span>
        </div>
        <form id="bagueshipAddToCart" method="post" action="<?php echo esc_url( $bagueship_add_to_cart_url ); ?>" style="display:none;">
          <input type="hidden" name="add-to-cart" value="<?php echo esc_attr( $product ? $product->get_id() : get_the_ID() ); ?>">
          <input type="hidden" name="quantity" value="1">
          <input type="hidden" name="variation_id" id="bagueshipVariationId" value="">
          <input type="hidden" name="attribute_taille" id="bagueshipTaille" value="">
        </form>
      <?php endif; ?>
    </div>
  </section>

  <?php echo bagueship_footer_markup(); ?>

<script>
(function(){
  /* ---------- Scroll-driven rotation + kinetic text ---------- */
  const zone = document.getElementById('top');
  const productModel = document.getElementById('productModel');
  const ringFade = document.getElementById('ringFade');
  const hint = document.getElementById('hint');
  const cueEls = [...document.querySelectorAll('.cue')];

  const clamp = (v,a,b)=>Math.max(a,Math.min(b,v));
  // ramp: 0 before a, 0->1 a..b, 1 b..c, 1->0 c..d
  function band(p,a,b,c,d){
    if(p<a||p>d) return 0;
    if(p<b) return (p-a)/(b-a);
    if(p>c) return 1-(p-c)/(d-c);
    return 1;
  }

  let ticking=false;
  function update(){
    ticking=false;
    const total = zone.offsetHeight - window.innerHeight;
    const p = clamp(-zone.getBoundingClientRect().top / total, 0, 1);

    const orbit = 25 + p * 920;
    const elevation = 68 - p * 10;
    const distance = 105 - p * 8;
    if (productModel) {
      productModel.setAttribute('camera-orbit', orbit.toFixed(2)+'deg '+elevation.toFixed(2)+'deg '+distance.toFixed(2)+'%');
    }

    ringFade.style.opacity = p>0.9 ? (1-(p-0.9)/0.1).toFixed(3) : 1;
    hint.style.opacity = p<0.03 ? 1 : 0;

    // text stages
    const o0 = band(p, -1, -1, 0.15, 0.21);
    const o1 = band(p, 0.30, 0.36, 0.45, 0.51);
    const o2 = band(p, 0.55, 0.61, 0.70, 0.76);
    const o3 = band(p, 0.81, 0.87, 1.1, 1.2);
    const os=[o0,o1,o2,o3];
    cueEls.forEach((el,i)=>{
      const o=os[i];
      el.style.opacity=o;
      const y=(1-o)*16;
      el.style.transform='translate(-50%,calc(-50% + '+y.toFixed(1)+'px))';
    });
  }
  function onScroll(){ if(!ticking){ ticking=true; requestAnimationFrame(update); } }
  window.addEventListener('scroll', onScroll, {passive:true});
  window.addEventListener('resize', update);
  update();

  /* ---------- Reveal on scroll ---------- */
  const io = new IntersectionObserver((entries)=>{
    entries.forEach(e=>{ if(e.isIntersecting){ e.target.classList.add('in'); io.unobserve(e.target); } });
  }, {threshold:0.18, rootMargin:'0px 0px -8% 0px'});
  document.querySelectorAll('.reveal').forEach((el,i)=>{
    el.style.transitionDelay = (Math.min(i,6)*0.06)+'s';
    io.observe(el);
  });

  /* ---------- Size selector ---------- */
  const chips = document.getElementById('chips');
  const circ = document.getElementById('circ');
  const SIZES = <?php echo wp_json_encode( $bagueship_variation_sizes ? $bagueship_variation_sizes : array( 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68 ), JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES ); ?>;
  const VARIATIONS = <?php echo wp_json_encode( $bagueship_variations, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES ); ?>;
  let selected = <?php echo (int) $bagueship_default_size; ?>;
  if (chips && circ) SIZES.forEach(s=>{
    const b=document.createElement('button');
    b.className='chip'; b.type='button'; b.textContent=s;
    b.setAttribute('aria-pressed', s===selected?'true':'false');
    b.addEventListener('click',()=>{
      selected=s;
      [...chips.children].forEach(c=>c.setAttribute('aria-pressed', c===b?'true':'false'));
      circ.innerHTML='Circonférence '+s+'&nbsp;mm';
      const variation = VARIATIONS[String(s)];
      if (variation) {
        document.getElementById('bagueshipVariationId').value = variation.id;
        document.getElementById('bagueshipTaille').value = s;
        const amountValue = document.getElementById('bagueshipAmountValue');
        if (amountValue) amountValue.innerHTML = variation.price;
      }
    });
    chips.appendChild(b);
  });

  /* ---------- Buy ---------- */
  const buy=document.getElementById('buy');
  const form=document.getElementById('bagueshipAddToCart');
  if (buy && form) buy.addEventListener('click',()=>{
    if (buy.disabled) return;
    const variation = VARIATIONS[String(selected)];
    if (variation) {
      document.getElementById('bagueshipVariationId').value = variation.id;
      document.getElementById('bagueshipTaille').value = selected;
    }
    buy.classList.add('added');
    buy.textContent=<?php echo wp_json_encode( $bagueship_is_preorder ? 'Précommande ajoutée ✓' : 'Ajouté au panier ✓' ); ?>;
    form.submit();
  });
})();
</script>
  <?php wp_footer(); ?>
</body>
</html>
