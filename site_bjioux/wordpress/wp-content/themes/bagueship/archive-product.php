<?php
if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

$shop_url   = function_exists( 'wc_get_page_permalink' ) ? wc_get_page_permalink( 'shop' ) : home_url( '/' );
$jewels_url = function_exists( 'bagueship_page_url' ) ? bagueship_page_url( 'bijoux' ) : home_url( '/bijoux/' );
$about_url  = function_exists( 'bagueship_page_url' ) ? bagueship_page_url( 'promesse' ) : home_url( '/promesse/' );
$cart_url   = function_exists( 'wc_get_cart_url' ) ? wc_get_cart_url() : home_url( '/panier/' );
$cart_count = function_exists( 'WC' ) && WC()->cart ? WC()->cart->get_cart_contents_count() : 0;
$logo_url   = get_template_directory_uri() . '/assets/images/eclipse-logo.png';
$terms      = function_exists( 'bagueship_homepage_collection_terms' ) ? bagueship_homepage_collection_terms() : array();
$collection_cards = array();

foreach ( $terms as $term ) {
    if ( ! $term instanceof WP_Term ) {
        continue;
    }
    $term_link = get_term_link( $term );
    if ( is_wp_error( $term_link ) ) {
        continue;
    }
    $meta        = function_exists( 'bagueship_collection_meta' ) ? bagueship_collection_meta( $term ) : array();
    $description = trim( wp_strip_all_tags( term_description( $term ) ) );
    $tagline     = trim( (string) ( $meta['tagline'] ?? '' ) );
    $state       = (string) ( $meta['state'] ?? 'available' );
    $count       = (int) $term->count;
    $image_id    = (int) get_term_meta( $term->term_id, 'thumbnail_id', true );

    $collection_cards[] = array(
        'name'     => $term->name,
        'tagline'  => $tagline ?: ( $description ?: 'Collection Eclipse' ),
        'count'    => sprintf(
            _n( '%s pièce', '%s pièces', $count, 'bagueship' ),
            number_format_i18n( $count )
        ),
        'url'      => $term_link,
        'state'    => $state,
        'upcoming' => 'upcoming' === $state,
        'image'    => $image_id ? wp_get_attachment_image_url( $image_id, 'large' ) : '',
    );
}
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Nos collections — Eclipse</title>
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
    --ink:#f7f7f7;
    --muted:#929292;
    --faint:#595959;
    --line:#242424;
    --edge:clamp(30px,3.85vw,74px);
    --font:"Eclipse Sans","Helvetica Neue",Arial,sans-serif;
  }
  *{box-sizing:border-box}
  html,body{margin:0;min-height:100%;background:var(--night)}
  body.eclipse-collections-body{
    color:var(--ink);
    background:var(--night);
    font-family:var(--font);
    font-weight:500;
    -webkit-font-smoothing:antialiased;
    overflow-x:hidden;
  }
  a{color:inherit;text-decoration:none}
  .screen-reader-text{
    position:absolute!important;width:1px;height:1px;padding:0;margin:-1px;
    overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;border:0;
  }
  .collections-page{
    width:100%;
    min-height:100svh;
    padding:0 var(--edge) 38px;
    background:var(--night);
  }

  /* Navigation aligned with the new home. */
  .collections-nav{
    height:118px;
    display:grid;
    grid-template-columns:minmax(210px,1fr) auto minmax(210px,1fr);
    align-items:center;
  }
  .wordmark{
    justify-self:start;
    font-size:clamp(16px,1.25vw,24px);
    font-weight:700;
    letter-spacing:.42em;
    line-height:1;
  }
  .main-links{
    position:absolute;
    left:29.55%;
    display:flex;
    align-items:center;
    gap:clamp(42px,5.4vw,100px);
    text-transform:uppercase;
    font-size:clamp(10px,.76vw,14px);
    font-weight:700;
    letter-spacing:.075em;
  }
  .main-links a,.cart-link{position:relative;padding:14px 0}
  .main-links a:last-child{margin-left:8px}
  .main-links a::after,.cart-link::after{
    content:"";position:absolute;left:0;right:0;bottom:7px;height:1px;
    background:currentColor;transform:scaleX(0);transform-origin:left;
    transition:transform .35s cubic-bezier(.16,1,.3,1);
  }
  .main-links a:hover::after,.main-links a:focus-visible::after,
  .main-links a.is-active::after,.cart-link:hover::after,.cart-link:focus-visible::after{
    transform:scaleX(1);
  }
  .cart-link{
    grid-column:3;
    justify-self:end;
    text-transform:uppercase;
    font-size:clamp(10px,.76vw,14px);
    font-weight:700;
    letter-spacing:.075em;
  }

  .collections-intro{
    margin-top:79px;
    display:flex;
    justify-content:space-between;
    align-items:flex-end;
    gap:48px;
  }
  .section-kicker{
    margin:0 0 16px;
    color:#b4b4b4;
    font-size:13px;
    font-weight:700;
    letter-spacing:.07em;
    text-transform:uppercase;
  }
  .collections-title{
    margin:0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:clamp(54px,4.5vw,82px);
    font-weight:400;
    letter-spacing:.005em;
    line-height:.9;
    text-transform:uppercase;
  }
  .intro-copy{
    width:min(390px,30vw);
    margin:0 10px 2px 0;
    color:#a6a6a6;
    font-size:15px;
    font-weight:500;
    line-height:1.75;
  }

  .collection-grid{
    margin-top:48px;
    display:grid;
    grid-template-columns:repeat(var(--collection-columns,4),minmax(0,1fr));
    gap:34px;
  }
  .collection-card{
    position:relative;
    height:clamp(470px,56.5vh,668px);
    overflow:hidden;
    border:1px solid var(--line);
    background:#050505;
    isolation:isolate;
    transition:border-color .3s,transform .35s cubic-bezier(.16,1,.3,1);
  }
  .collection-card:hover,.collection-card:focus-visible{
    border-color:#575757;
    transform:translateY(-5px);
  }
  .collection-card:not(.is-coming)::before{
    content:"";
    position:absolute;
    inset:0;
    z-index:-1;
    background:
      radial-gradient(85% 50% at 50% 106%,rgba(255,255,255,.035),transparent 68%),
      linear-gradient(180deg,#050505,#030303);
  }
  .collection-card:not(.is-coming)::after{
    content:"";
    position:absolute;
    z-index:2;
    inset:0;
    background:linear-gradient(180deg,rgba(0,0,0,.04) 35%,rgba(0,0,0,.88) 100%);
    pointer-events:none;
  }
  .collection-card__image{
    position:absolute;
    z-index:1;
    inset:0;
    width:100%;
    height:100%;
    object-fit:cover;
    object-position:center 38%;
    transition:transform .9s cubic-bezier(.16,1,.3,1),filter .4s ease;
  }
  .collection-card:hover .collection-card__image,
  .collection-card:focus-visible .collection-card__image{
    transform:scale(1.025);
    filter:brightness(1.08);
  }
  .card-mark{
    position:absolute;
    z-index:3;
    top:26px;
    right:25px;
    width:25px;
    height:25px;
    border:1px solid #a3a3a3;
    border-radius:50%;
  }
  .card-mark::before,.card-mark::after{
    content:"";
    position:absolute;
    left:50%;
    top:50%;
    background:#a3a3a3;
    transform:translate(-50%,-50%);
  }
  .card-mark::before{width:15px;height:1px}
  .card-mark::after{width:1px;height:15px}
  .collection-card__content{
    position:absolute;
    z-index:3;
    left:40px;
    right:34px;
    bottom:55px;
  }
  .card-title{
    margin:0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:clamp(39px,3.25vw,58px);
    font-weight:400;
    letter-spacing:.035em;
    line-height:.95;
    text-transform:uppercase;
  }
  .card-tagline{
    min-height:18px;
    margin:20px 0 0;
    color:#9a9a9a;
    font-size:12px;
    font-weight:700;
    letter-spacing:.16em;
    line-height:1.5;
    text-transform:uppercase;
  }
  .card-count{
    min-height:18px;
    margin:29px 0 0;
    color:#d0d0d0;
    font-size:12px;
    font-weight:700;
    letter-spacing:.08em;
    text-transform:uppercase;
  }
  .card-action{
    display:inline-flex;
    align-items:center;
    gap:25px;
    margin-top:31px;
    color:#d5d5d5;
    font-size:12px;
    font-weight:700;
    letter-spacing:.16em;
    text-transform:uppercase;
  }
  .card-action svg,.all-collections svg{
    width:22px;height:13px;fill:none;stroke:currentColor;stroke-width:1.7;
    transition:transform .3s cubic-bezier(.16,1,.3,1);
  }
  .collection-card:hover .card-action svg,.collection-card:focus-visible .card-action svg,
  .all-collections:hover svg,.all-collections:focus-visible svg{transform:translateX(7px)}

  .collection-card.is-coming{
    background:
      radial-gradient(80% 52% at 50% 42%,rgba(255,255,255,.075),transparent 67%),
      #0a0a0a;
  }
  .coming-logo{
    position:absolute;
    left:50%;
    top:15%;
    width:76%;
    aspect-ratio:1;
    transform:translateX(-50%);
    object-fit:contain;
    opacity:.72;
    filter:grayscale(1) contrast(1.18);
  }
  .all-collections{
    display:inline-flex;
    align-items:center;
    gap:28px;
    margin-top:68px;
    color:#bdbdbd;
    font-size:12px;
    font-weight:700;
    letter-spacing:.13em;
    text-transform:uppercase;
  }

  .collections-intro,.collection-card,.all-collections{
    opacity:0;
    animation:collectionEnter .8s cubic-bezier(.16,1,.3,1) forwards;
  }
  .collection-card:nth-child(1){animation-delay:.12s}
  .collection-card:nth-child(2){animation-delay:.19s}
  .collection-card:nth-child(3){animation-delay:.26s}
  .collection-card:nth-child(4){animation-delay:.33s}
  .all-collections{animation-delay:.4s}
  @keyframes collectionEnter{
    from{opacity:0;transform:translateY(18px)}
    to{opacity:1;transform:translateY(0)}
  }

  @media(min-width:901px) and (min-aspect-ratio:16/10){
    .collections-nav{height:92px}
    .wordmark{font-size:20px}
    .main-links,.cart-link{font-size:12px}
    .collections-intro{margin-top:38px}
    .collection-grid{margin-top:34px}
    .collection-card{height:clamp(470px,59vh,620px)}
    .collection-card__content{left:34px;bottom:31px}
    .all-collections{margin-top:25px}
  }
  @media(max-width:1100px){
    .collection-grid{gap:16px}
    .collection-card__content{left:25px;right:22px}
  }
  @media(max-width:900px){
    .collections-page{padding-inline:20px}
    .collections-nav{
      height:105px;
      grid-template-columns:1fr auto;
    }
    .wordmark{font-size:14px}
    .main-links{
      left:20px;
      right:20px;
      top:67px;
      justify-content:space-between;
      gap:14px;
      font-size:9px;
    }
    .cart-link{font-size:9px}
    .collections-intro{margin-top:54px;align-items:flex-start}
    .collection-grid{
      grid-template-columns:repeat(var(--collection-columns,4),minmax(260px,1fr));
      overflow-x:auto;
      margin-inline:-20px;
      padding:0 20px 16px;
      scroll-snap-type:x mandatory;
      scrollbar-width:none;
    }
    .collection-grid::-webkit-scrollbar{display:none}
    .collection-card{height:min(62vh,590px);scroll-snap-align:center}
  }
  @media(max-width:620px){
    .wordmark{font-size:14px}
    .main-links{font-size:10px}
    .cart-link{font-size:10px}
    .collections-intro{display:block}
    .collections-title{font-size:52px}
    .intro-copy{width:auto;margin:24px 0 0;font-size:13px}
    .collection-grid{margin-top:32px}
    .collection-card{height:min(62vh,520px)}
    .all-collections{margin-bottom:18px}
  }
  @media(prefers-reduced-motion:reduce){
    .collections-intro,.collection-card,.all-collections{animation:none;opacity:1}
  }
  body.eclipse-collections-body .bagueship-cookie-banner{display:none!important}
</style>
</head>
<body <?php body_class( 'eclipse-collections-body' ); ?>>
<?php wp_body_open(); ?>

<?php
echo bagueship_eclipse_topbar(
    array(
        'active'      => 'collection',
        'brand_color' => '#f7f7f7',
        'items_color' => '#f7f7f7',
        'cart_color'  => '#f7f7f7',
    )
);
?>

<main class="collections-page">
  <header class="collections-intro">
    <div>
      <p class="section-kicker">Collections</p>
      <h1 class="collections-title">Nos collections</h1>
    </div>
    <p class="intro-copy">
      Chaque collection raconte une histoire.<br>
      Un chapitre de force, de beauté et d’authenticité.
    </p>
  </header>

  <section
    class="collection-grid"
    aria-label="Collections Eclipse"
    style="--collection-columns:<?php echo esc_attr( (string) min( 4, max( 1, count( $collection_cards ) + 1 ) ) ); ?>"
  >
    <?php foreach ( $collection_cards as $index => $card ) : ?>
      <a class="collection-card<?php echo $card['upcoming'] ? ' is-coming' : ''; ?>" href="<?php echo esc_url( $card['url'] ); ?>">
        <?php if ( $card['image'] && ! $card['upcoming'] ) : ?>
          <img class="collection-card__image" src="<?php echo esc_url( $card['image'] ); ?>" alt="<?php echo esc_attr( $card['name'] ); ?>">
        <?php endif; ?>
        <?php if ( 0 === $index ) : ?><span class="card-mark" aria-hidden="true"></span><?php endif; ?>
        <?php if ( $card['upcoming'] ) : ?>
          <img class="coming-logo" src="<?php echo esc_url( $logo_url ); ?>" alt="">
        <?php endif; ?>
        <div class="collection-card__content">
          <h2 class="card-title"><?php echo esc_html( $card['name'] ); ?></h2>
          <p class="card-tagline"><?php echo esc_html( $card['tagline'] ); ?></p>
          <p class="card-count"><?php echo esc_html( $card['count'] ); ?></p>
          <span class="card-action">
            <?php echo esc_html( $card['upcoming'] ? 'Bientôt' : 'Découvrir' ); ?>
            <svg viewBox="0 0 24 14" aria-hidden="true"><path d="M0 7h21M15 1l6 6-6 6"/></svg>
          </span>
        </div>
      </a>
    <?php endforeach; ?>

    <a class="collection-card is-coming" href="<?php echo esc_url( $about_url ); ?>">
      <img class="coming-logo" src="<?php echo esc_url( $logo_url ); ?>" alt="">
      <div class="collection-card__content">
        <h2 class="card-title">Coming soon</h2>
        <p class="card-tagline">Prochaine collection</p>
        <p class="card-count">—</p>
        <span class="card-action">
          En savoir plus
          <svg viewBox="0 0 24 14" aria-hidden="true"><path d="M0 7h21M15 1l6 6-6 6"/></svg>
        </span>
      </div>
    </a>
  </section>

  <a class="all-collections" href="<?php echo esc_url( $jewels_url ); ?>">
    Voir toutes les collections
    <svg viewBox="0 0 24 14" aria-hidden="true"><path d="M0 7h21M15 1l6 6-6 6"/></svg>
  </a>
</main>

<?php wp_footer(); ?>
</body>
</html>
