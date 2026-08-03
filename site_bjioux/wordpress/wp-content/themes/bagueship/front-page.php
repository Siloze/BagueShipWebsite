<?php
if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

$shop_url    = function_exists( 'wc_get_page_permalink' ) ? wc_get_page_permalink( 'shop' ) : home_url( '/' );
$jewels_url  = function_exists( 'bagueship_page_url' ) ? bagueship_page_url( 'bijoux' ) : home_url( '/bijoux/' );
$about_url   = function_exists( 'bagueship_page_url' ) ? bagueship_page_url( 'promesse' ) : home_url( '/promesse/' );
$cart_url    = function_exists( 'wc_get_cart_url' ) ? wc_get_cart_url() : home_url( '/panier/' );
$cart_count  = function_exists( 'WC' ) && WC()->cart ? WC()->cart->get_cart_contents_count() : 0;
$ring_url    = get_template_directory_uri() . '/assets/images/eclipse-logo.png';
$favicon_url = add_query_arg( 'v', ECLIPSE_THEME_VERSION, get_site_icon_url( 512, $ring_url ) );
$home_image_url = get_template_directory_uri() . '/assets/images/eclipse-home-campaign.png';
$collections = array();

if ( function_exists( 'bagueship_homepage_collection_terms' ) ) {
    foreach ( bagueship_homepage_collection_terms() as $term ) {
        if ( ! $term instanceof WP_Term ) {
            continue;
        }
        $term_url = get_term_link( $term );
        if ( is_wp_error( $term_url ) ) {
            continue;
        }
        $collections[] = array(
            'name' => $term->name,
            'url'  => $term_url,
        );
    }
}
$collections[] = array(
    'name' => 'Coming soon',
    'url'  => $about_url,
);
$jewels = function_exists( 'bagueship_get_catalogue_jewels' ) ? bagueship_get_catalogue_jewels() : array();
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Eclipse — Deviens toi-même</title>
<?php wp_head(); ?>
<link rel="icon" href="<?php echo esc_url( $favicon_url ); ?>" type="image/png" sizes="512x512">
<link rel="shortcut icon" href="<?php echo esc_url( $favicon_url ); ?>" type="image/png">
<link rel="apple-touch-icon" href="<?php echo esc_url( $favicon_url ); ?>">
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
    --paper:#fff;
    --night:#020202;
    --ink:#080808;
    --muted:#656565;
    --split:47.35%;
    --edge:clamp(28px,3.85vw,74px);
    --font:"Eclipse Sans","Helvetica Neue",Arial,sans-serif;
  }
  *{box-sizing:border-box}
  html,body{margin:0;width:100%;min-height:100%;background:var(--paper)}
  body.eclipse-home-body{
    color:var(--ink);
    font-family:var(--font);
    font-weight:500;
    -webkit-font-smoothing:antialiased;
    overflow-x:hidden;
  }
  a{color:inherit;text-decoration:none}
  button,input{font:inherit}
  .screen-reader-text{
    position:absolute!important;
    width:1px;height:1px;padding:0;margin:-1px;
    overflow:hidden;clip:rect(0,0,0,0);
    white-space:nowrap;border:0;
  }
  .eclipse-home{
    position:relative;
    width:100%;
    min-height:100svh;
    isolation:isolate;
    overflow:clip;
    background:var(--paper);
  }
  .home-hero{
    position:relative;
    width:100%;
    height:100svh;
    min-height:0;
    overflow:hidden;
    background:linear-gradient(90deg,var(--paper) 0 var(--split),var(--night) var(--split) 100%);
  }
  .home-hero::after{
    content:"";
    position:absolute;
    z-index:1;
    left:var(--split);
    top:0;
    bottom:0;
    width:1px;
    background:rgba(255,255,255,.13);
    pointer-events:none;
  }

  /* Header */
  .home-nav{
    position:absolute;
    z-index:20;
    inset:0 0 auto;
    height:118px;
    display:grid;
    grid-template-columns:minmax(210px,1fr) auto minmax(210px,1fr);
    align-items:center;
    padding:0 var(--edge);
    color:#fff;
    mix-blend-mode:difference;
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
  .main-links a,.cart-link{
    position:relative;
    padding:14px 0;
  }
  .main-links a:last-child{margin-left:8px}
  .main-links a::after,.cart-link::after{
    content:"";
    position:absolute;
    left:0;
    right:0;
    bottom:7px;
    height:1px;
    background:currentColor;
    transform:scaleX(0);
    transform-origin:left;
    transition:transform .35s cubic-bezier(.16,1,.3,1);
  }
  .main-links a:hover::after,
  .main-links a:focus-visible::after,
  .cart-link:hover::after,
  .cart-link:focus-visible::after{transform:scaleX(1)}
  .cart-link{
    grid-column:3;
    justify-self:end;
    text-transform:uppercase;
    font-size:clamp(10px,.76vw,14px);
    font-weight:700;
    letter-spacing:.075em;
  }

  /* Campaign composition */
  .hero-content{
    position:relative;
    z-index:5;
    width:var(--split);
    height:100svh;
    min-height:0;
    padding:34.2vh clamp(34px,5.2vw,100px) 150px var(--edge);
    display:flex;
    flex-direction:column;
    align-items:flex-start;
  }
  .axis-mark{
    position:absolute;
    left:var(--edge);
    top:12.35vh;
    width:22px;
    height:118px;
  }
  .axis-mark::before{
    content:"";
    position:absolute;
    left:50%;
    top:0;
    bottom:0;
    width:1px;
    background:linear-gradient(transparent,#8b8b8b 15%,#8b8b8b 85%,transparent);
  }
  .axis-mark img{
    position:absolute;
    left:50%;
    top:50%;
    width:34px;
    height:34px;
    object-fit:contain;
    transform:translate(-50%,-50%);
    filter:brightness(0);
  }
  .hero-kicker{
    margin:0;
    color:#4e4e4e;
    text-transform:uppercase;
    font-size:clamp(10px,.82vw,15px);
    font-weight:700;
    letter-spacing:.11em;
  }
  .hero-title{
    margin:30px 0 0;
    color:#050505;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    width:118%;
    font-size:clamp(88px,9.4vw,176px);
    font-weight:400;
    letter-spacing:-.018em;
    line-height:.82;
    text-transform:uppercase;
    transform:scaleX(.9);
    transform-origin:left top;
  }
  .hero-title span{display:block;white-space:nowrap}
  .hero-description{
    margin:40px 0 0;
    max-width:43ch;
    color:#4d4d4d;
    font-size:clamp(11px,.88vw,16px);
    font-weight:700;
    letter-spacing:.095em;
    line-height:2.05;
    text-transform:uppercase;
  }
  .universe-link{
    display:inline-flex;
    align-items:center;
    gap:22px;
    margin-top:clamp(36px,4.5vh,56px);
    padding:0;
    color:#161616;
    text-transform:uppercase;
    font-size:clamp(11px,.85vw,16px);
    font-weight:700;
    letter-spacing:.18em;
    transition:gap .35s cubic-bezier(.16,1,.3,1),opacity .25s;
  }
  .universe-label{padding-bottom:8px;border-bottom:2px solid #111}
  .universe-link:hover,.universe-link:focus-visible{gap:30px;opacity:.58}
  .universe-link svg{width:22px;height:14px;fill:none;stroke:currentColor;stroke-width:1.8}

  /* The supplied Eclipse mark bridges both backgrounds. */
  .eclipse-mark{
    --mark-shift-x:0px;
    --mark-shift-y:0px;
    --mark-rotation:4deg;
    --mark-scale:1;
    --mark-opacity:.96;
    position:absolute;
    z-index:4;
    left:var(--split);
    top:56.25%;
    width:clamp(330px,30.3vw,540px);
    aspect-ratio:1;
    transform:
      translate(calc(-50% + var(--mark-shift-x)),calc(-50% + var(--mark-shift-y)))
      rotate(var(--mark-rotation))
      scale(var(--mark-scale));
    pointer-events:none;
    opacity:var(--mark-opacity);
    filter:drop-shadow(0 0 9px rgba(255,255,255,.08));
    will-change:transform,opacity;
  }
  .eclipse-mark img{
    display:block;
    width:100%;
    height:100%;
    object-fit:contain;
    animation:markIn 1.1s .18s cubic-bezier(.16,1,.3,1) both;
  }
  .campaign-space{
    position:absolute;
    z-index:2;
    left:var(--split);
    right:0;
    top:0;
    bottom:0;
    overflow:hidden;
    pointer-events:none;
  }
  .campaign-space::after{
    content:"";
    position:absolute;
    z-index:2;
    inset:0;
    background:linear-gradient(90deg,rgba(2,2,2,.2),transparent 30%);
  }
  .campaign-image{
    position:absolute;
    z-index:1;
    right:-1.3vw;
    bottom:0;
    width:auto;
    max-width:none;
    height:103%;
    object-fit:contain;
    object-position:right bottom;
    animation:campaignIn 1.15s .12s cubic-bezier(.16,1,.3,1) both;
    will-change:transform,opacity;
  }

  /* Collection index */
  .collection-index{
    position:absolute;
    z-index:15;
    left:var(--edge);
    right:auto;
    bottom:56px;
    width:calc(var(--split) - var(--edge) - 52px);
    display:grid;
    grid-template-columns:repeat(var(--home-collection-count,3),minmax(0,1fr));
    gap:30px;
    color:#fff;
    mix-blend-mode:difference;
  }
  .collection-link{
    min-width:0;
    padding:16px 8px 15px;
    border-bottom:1px solid rgba(255,255,255,.35);
    display:grid;
    grid-template-columns:auto 1fr;
    gap:25px;
    align-items:center;
    text-transform:uppercase;
    font-size:clamp(10px,.78vw,15px);
    font-weight:700;
    letter-spacing:.085em;
    opacity:.43;
    transition:opacity .28s,border-color .28s;
  }
  .collection-link:first-child,.collection-link:hover,.collection-link:focus-visible{
    opacity:1;
    border-color:currentColor;
  }
  .collection-number{font-variant-numeric:tabular-nums}
  .collection-name{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}

  /* The full catalogue continues the home below the collection index. */
  .home-jewels{
    position:relative;
    z-index:6;
    min-height:0;
    padding:clamp(82px,10vh,132px) var(--edge) clamp(58px,5vw,84px);
    background:var(--paper);
    overflow:hidden;
  }
  .home-jewels__head{
    display:flex;
    align-items:flex-end;
    justify-content:space-between;
    gap:30px;
    margin-bottom:42px;
    opacity:1;
    transform:translateY(0);
    transition:
      opacity .8s cubic-bezier(.16,1,.3,1),
      transform 1s cubic-bezier(.16,1,.3,1);
  }
  .home-jewels__title{
    margin:0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:64px;
    font-weight:400;
    line-height:.94;
    letter-spacing:.012em;
    text-transform:uppercase;
  }
  .home-jewels__all{
    position:relative;
    display:inline-flex;
    align-items:center;
    gap:24px;
    padding:10px 0;
    font-size:12px;
    font-weight:700;
    letter-spacing:.07em;
    text-transform:uppercase;
  }
  .home-jewels__all::after{
    content:"";
    position:absolute;
    left:0;
    right:46px;
    bottom:4px;
    height:1px;
    background:currentColor;
    transform-origin:left;
    transition:transform .35s cubic-bezier(.16,1,.3,1);
  }
  .home-jewels__all:hover::after,
  .home-jewels__all:focus-visible::after{transform:scaleX(.62)}
  .home-jewels__arrow{font-size:22px;font-weight:400;line-height:1}
  .home-jewels-grid{
    display:grid;
    grid-template-columns:repeat(4,minmax(0,1fr));
    column-gap:33px;
    row-gap:45px;
  }
  .home-jewel-card{
    min-width:0;
    opacity:1;
    transform:translateY(0);
    transition:
      opacity .85s cubic-bezier(.16,1,.3,1),
      transform 1.05s cubic-bezier(.16,1,.3,1);
    transition-delay:var(--reveal-delay,0ms);
  }
  .home-jewels.is-reveal-pending .home-jewels__head{
    opacity:0;
    transform:translateY(90px);
  }
  .home-jewels.is-reveal-pending.is-entered .home-jewels__head{
    opacity:1;
    transform:translateY(0);
  }
  .home-jewels.is-reveal-pending .home-jewel-card{
    opacity:0;
    transform:translateY(135px) scale(.965);
  }
  .home-jewels.is-reveal-pending.is-entered .home-jewel-card{
    opacity:1;
    transform:translateY(0) scale(1);
  }
  .home-jewel-media{
    position:relative;
    display:block;
    width:100%;
    aspect-ratio:1.42 / 1;
    overflow:hidden;
    background:
      radial-gradient(circle at 50% 46%,rgba(255,255,255,.025),transparent 31%),
      #050505;
  }
  .home-jewel-media::after{
    content:"";
    position:absolute;
    inset:0;
    border:1px solid rgba(255,255,255,.025);
    transition:background .35s ease;
  }
  .home-jewel-media img{
    display:block;
    width:100%;
    height:100%;
    object-fit:cover;
    object-position:center 44%;
    transition:transform .7s cubic-bezier(.16,1,.3,1),filter .4s ease;
  }
  .home-jewel-card:nth-child(n+5) .home-jewel-media{aspect-ratio:1.3 / 1}
  .home-jewel-card:hover .home-jewel-media img{transform:scale(1.025);filter:brightness(1.06)}
  .home-jewel-card:hover .home-jewel-media::after{background:rgba(255,255,255,.035)}
  .home-jewel-meta{
    display:flex;
    align-items:flex-start;
    justify-content:space-between;
    gap:15px;
    padding-top:10px;
    font-size:12px;
    font-weight:700;
    line-height:1.2;
    letter-spacing:.055em;
    text-transform:uppercase;
  }
  .home-jewel-name{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
  .home-jewel-price{flex:0 0 auto;white-space:nowrap}
  .home-jewels__empty{
    margin:0;
    padding:80px 0;
    border-top:1px solid #d9d9d9;
    color:var(--muted);
    font-size:12px;
    font-weight:700;
    letter-spacing:.08em;
    text-transform:uppercase;
  }

  /* The moving hero mark settles here, then gives way to a compact signature. */
  .home-closing{
    position:relative;
    z-index:5;
    min-height:max(690px,100svh);
    padding:0 var(--edge);
    overflow:hidden;
    color:#f5f5f2;
    background:
      radial-gradient(52% 66% at 50% 20%,rgba(255,255,255,.075),transparent 70%),
      var(--night);
  }
  .home-closing__logo-anchor{
    position:absolute;
    left:50%;
    top:78px;
    width:clamp(210px,18vw,290px);
    aspect-ratio:1;
    transform:translateX(-50%);
    pointer-events:none;
  }
  .home-closing__logo-anchor::before{
    content:"";
    position:absolute;
    inset:-24%;
    border:1px solid rgba(255,255,255,.08);
    border-radius:50%;
    opacity:0;
    transform:scale(.72);
    transition:
      opacity 1.1s .15s ease,
      transform 1.5s .15s cubic-bezier(.16,1,.3,1);
  }
  .home-closing__logo-anchor::after{
    content:"";
    position:absolute;
    left:50%;
    top:calc(100% + 26px);
    width:1px;
    height:38px;
    background:linear-gradient(180deg,rgba(255,255,255,.36),transparent);
    opacity:0;
    transform:scaleY(0);
    transform-origin:top;
    transition:
      opacity .7s .7s ease,
      transform .9s .7s cubic-bezier(.16,1,.3,1);
  }
  .home-closing__mark{
    display:block;
    width:100%;
    height:100%;
    max-width:none;
    object-fit:contain;
    opacity:0;
    filter:blur(12px);
    clip-path:circle(8% at 50% 50%);
    transform:rotate(-22deg) scale(.72);
    transition:
      opacity .75s ease,
      filter 1.15s cubic-bezier(.16,1,.3,1),
      clip-path 1.35s cubic-bezier(.16,1,.3,1),
      transform 1.45s cubic-bezier(.16,1,.3,1);
    will-change:transform,filter,clip-path,opacity;
  }
  .home-closing.is-visible .home-closing__mark{
    opacity:1;
    filter:blur(0);
    clip-path:circle(72% at 50% 50%);
    transform:rotate(0) scale(1);
  }
  .home-closing.is-visible .home-closing__logo-anchor::before{
    opacity:1;
    transform:scale(1);
  }
  .home-closing.is-visible .home-closing__logo-anchor::after{
    opacity:1;
    transform:scaleY(1);
  }
  .home-closing__signature{
    position:relative;
    width:100%;
    padding-top:360px;
    text-align:center;
    opacity:1;
    transform:translateY(0);
    transition:
      opacity .9s .38s cubic-bezier(.16,1,.3,1),
      transform 1.05s .38s cubic-bezier(.16,1,.3,1);
  }
  .home-closing.is-reveal-pending .home-closing__signature{
    opacity:0;
    transform:translateY(55px);
  }
  .home-closing.is-reveal-pending.is-visible .home-closing__signature{
    opacity:1;
    transform:translateY(0);
  }
  .home-closing__eyebrow{
    margin:0;
    color:#717171;
    font-size:9px;
    font-weight:700;
    letter-spacing:.22em;
    text-transform:uppercase;
  }
  .home-closing__brand{
    margin:17px 0 0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:clamp(72px,7.2vw,122px);
    font-weight:400;
    letter-spacing:.12em;
    line-height:.8;
    text-indent:.12em;
    text-transform:uppercase;
  }
  .home-closing__line{
    margin:24px 0 0;
    color:#aaa;
    font-size:10px;
    font-weight:700;
    letter-spacing:.17em;
    text-transform:uppercase;
  }
  .home-footer{
    position:absolute;
    left:var(--edge);
    right:var(--edge);
    bottom:0;
    min-height:92px;
    border-top:1px solid #252525;
    display:grid;
    grid-template-columns:1fr auto 1fr;
    align-items:center;
    gap:32px;
    color:#777;
    font-size:9px;
    font-weight:700;
    letter-spacing:.11em;
    text-transform:uppercase;
  }
  .home-footer__links{
    display:flex;
    align-items:center;
    justify-content:center;
    gap:36px;
    color:#b0b0b0;
  }
  .home-footer__links a{
    position:relative;
    padding:9px 0;
    transition:color .25s ease;
  }
  .home-footer__links a::after{
    content:"";
    position:absolute;
    left:0;
    right:0;
    bottom:4px;
    height:1px;
    background:currentColor;
    transform:scaleX(0);
    transform-origin:left;
    transition:transform .3s cubic-bezier(.16,1,.3,1);
  }
  .home-footer__links a:hover,
  .home-footer__links a:focus-visible{color:#fff}
  .home-footer__links a:hover::after,
  .home-footer__links a:focus-visible::after{transform:scaleX(1)}
  .home-footer__place{text-align:right}

  /* Quiet entrance, keeping the editorial stillness of the reference. */
  .home-nav,.axis-mark,.hero-kicker,.hero-title,.hero-description,.universe-link,.collection-index{
    opacity:0;
    animation:enter .85s cubic-bezier(.16,1,.3,1) forwards;
  }
  .home-nav{animation-delay:.05s}
  .axis-mark{animation-delay:.14s}
  .hero-kicker{animation-delay:.19s}
  .hero-title{animation-name:titleEnter;animation-delay:.25s}
  .hero-description{animation-delay:.34s}
  .universe-link{animation-delay:.4s}
  .collection-index{animation-delay:.48s}
  @keyframes enter{
    from{opacity:0;transform:translateY(16px)}
    to{opacity:1;transform:translateY(0)}
  }
  @keyframes markIn{
    from{opacity:0;transform:scale(.92) rotate(-6deg)}
    to{opacity:1;transform:scale(1) rotate(0)}
  }
  @keyframes campaignIn{
    from{opacity:0;transform:translate(3%,3%) scale(.975)}
    to{opacity:1;transform:translate(0,0) scale(1)}
  }
  @keyframes titleEnter{
    from{opacity:0;transform:translateY(16px) scaleX(.9)}
    to{opacity:1;transform:translateY(0) scaleX(.9)}
  }
  @media(min-width:901px) and (min-aspect-ratio:16/10){
    .home-nav{height:92px}
    .wordmark{font-size:20px}
    .main-links,.cart-link{font-size:12px}
    .axis-mark{
      top:10vh;
      height:100px;
    }
    .hero-content{
      padding-top:26vh;
      padding-bottom:128px;
    }
    .hero-title{
      margin-top:22px;
      font-size:clamp(86px,8.3vw,160px);
    }
    .hero-description{
      margin-top:28px;
      font-size:14px;
      line-height:1.85;
    }
    .universe-link{
      margin-top:32px;
      font-size:13px;
    }
    .collection-index{bottom:30px}
    .home-jewels{padding-top:74px}
    .home-jewels__head{margin-bottom:31px}
    .home-jewels__title{font-size:54px}
    .home-jewel-media{aspect-ratio:1.62 / 1}
    .home-jewel-card:nth-child(n+5) .home-jewel-media{aspect-ratio:1.5 / 1}
  }

  @media(max-width:1180px){
    .home-jewels-grid{grid-template-columns:repeat(3,minmax(0,1fr))}
  }

  @media(max-width:900px){
    :root{--split:58%;--edge:24px}
    .home-nav{
      height:88px;
      grid-template-columns:1fr auto;
      padding:0 var(--edge);
    }
    .wordmark{font-size:14px}
    .main-links{
      left:var(--edge);
      right:var(--edge);
      top:72px;
      justify-content:space-between;
      gap:14px;
      font-size:9px;
    }
    .cart-link{font-size:9px}
    .hero-content{
      width:var(--split);
      height:100svh;
      min-height:0;
      padding:29vh 20px 130px var(--edge);
    }
    .axis-mark{top:116px;left:calc(var(--edge) + 8px);height:104px}
    .axis-mark img{width:26px;height:26px}
    .hero-title{font-size:clamp(54px,12vw,92px)}
    .hero-description{max-width:31ch;font-size:9px;line-height:1.75}
    .eclipse-mark{top:53%;width:clamp(210px,35vw,330px)}
    .collection-index{left:var(--edge);right:var(--edge);gap:12px;bottom:22px}
    .collection-index{width:auto}
    .collection-link{gap:10px;padding-inline:2px;font-size:9px}
  }
  @media(max-width:760px){
    :root{--split:38%;--edge:20px}
    .home-hero{
      background:linear-gradient(
        180deg,
        var(--night) 0 var(--split),
        var(--paper) var(--split) 100%
      );
    }
    .home-hero::after{
      left:0;
      right:0;
      top:var(--split);
      bottom:auto;
      width:auto;
      height:1px;
      background:rgba(0,0,0,.12);
    }
    .home-nav{height:105px}
    .wordmark{font-size:14px;letter-spacing:.32em}
    .main-links{top:67px;font-size:10px;letter-spacing:.055em}
    .cart-link{font-size:10px}
    .hero-content{
      width:100%;
      height:100svh;
      padding:calc(38svh + 132px) var(--edge) 116px;
      align-items:center;
      text-align:center;
    }
    .axis-mark{display:none}
    .hero-kicker{font-size:9.5px;letter-spacing:.07em}
    .hero-title{
      width:100%;
      margin-top:16px;
      font-size:clamp(72px,21vw,86px);
      line-height:.84;
      transform:scaleX(.98);
      transform-origin:center top;
    }
    .hero-description{
      margin-top:20px;
      max-width:48ch;
      font-size:9.5px;
      line-height:1.58;
      letter-spacing:.05em;
    }
    .universe-link{margin-top:20px;gap:15px;font-size:9px}
    .universe-label{padding-bottom:6px;border-width:1px}
    .universe-link svg{width:15px}
    .eclipse-mark{
      left:50%;
      top:var(--split);
      width:clamp(210px,58vw,240px);
      opacity:.94;
    }
    .campaign-space{
      left:0;
      top:0;
      bottom:auto;
      height:var(--split);
    }
    .campaign-space::after{
      background:linear-gradient(180deg,rgba(0,0,0,.24),transparent 58%,rgba(0,0,0,.12));
    }
    .campaign-image{
      right:0;
      bottom:0;
      width:100%;
      height:100%;
      object-fit:cover;
      object-position:center 27%;
    }
    .collection-index{grid-template-columns:repeat(var(--home-collection-count,3),1fr);gap:10px;bottom:42px}
    .collection-index{color:#080808;mix-blend-mode:normal}
    .collection-link{display:flex;justify-content:center;gap:9px;font-size:9px;padding:12px 2px}
    .collection-link{border-color:rgba(0,0,0,.28)}
    .home-jewels{padding:68px var(--edge) 62px}
    .home-jewels__head{align-items:center;margin-bottom:28px}
    .home-jewels__title{font-size:52px}
    .home-jewels__all{gap:12px;font-size:9px}
    .home-jewels__all::after{right:30px}
    .home-jewels__arrow{font-size:17px}
    .home-jewels-grid{grid-template-columns:repeat(2,minmax(0,1fr));gap:27px 12px}
    .home-jewel-media,
    .home-jewel-card:nth-child(n+5) .home-jewel-media{aspect-ratio:1 / 1.08}
    .home-jewel-meta{display:block;font-size:10px;padding-top:8px}
    .home-jewel-name,.home-jewel-price{display:block}
    .home-jewel-price{margin-top:5px;color:var(--muted)}
    .home-closing{min-height:100svh;padding-inline:20px}
    .home-closing__logo-anchor{top:64px;width:190px}
    .home-closing__signature{padding-top:292px}
    .home-closing__brand{font-size:70px}
    .home-closing__line{margin-top:18px;font-size:8px}
    .home-footer{
      left:20px;
      right:20px;
      min-height:122px;
      padding:22px 0;
      grid-template-columns:1fr auto;
      align-content:center;
      gap:18px;
      font-size:8px;
    }
    .home-footer__links{
      grid-column:1 / -1;
      grid-row:1;
      gap:24px;
    }
    .home-footer__copyright{grid-column:1;grid-row:2}
    .home-footer__place{grid-column:2;grid-row:2}
  }
  @media(max-width:760px) and (max-height:740px){
    :root{--split:34%}
    .hero-content{padding-top:calc(34svh + 105px)}
    .eclipse-mark{width:190px}
    .hero-kicker{font-size:8px}
    .hero-title{font-size:66px}
    .hero-description{margin-top:15px;font-size:8px}
    .universe-link{margin-top:14px;font-size:8px}
    .collection-index{bottom:14px}
    .collection-link{font-size:7.5px;padding-block:8px}
  }
  @media(prefers-reduced-motion:reduce){
    .home-nav,.axis-mark,.hero-kicker,.hero-title,.hero-description,.universe-link,.collection-index,.eclipse-mark img,.campaign-image{
      animation:none;
      opacity:1;
    }
    .home-jewels__head,.home-jewel-card,.home-closing__signature,.home-closing__mark,
    .home-closing__logo-anchor::before,.home-closing__logo-anchor::after{transition:none!important}
    .home-jewels.is-reveal-pending .home-jewels__head,
    .home-jewels.is-reveal-pending .home-jewel-card,
    .home-closing.is-reveal-pending .home-closing__signature{
      opacity:1;
      transform:none;
    }
    .home-closing__mark{
      opacity:1;
      filter:none;
      clip-path:none;
      transform:none;
    }
  }
  body.eclipse-home-body .bagueship-cookie-banner{display:none!important}
</style>
</head>
<body <?php body_class( 'eclipse-home-body' ); ?>>
<?php wp_body_open(); ?>

<main class="eclipse-home">
  <section class="home-hero" data-home-hero aria-labelledby="home-title">
  <?php
  echo bagueship_eclipse_topbar(
      array(
          'position'    => 'absolute',
          'blend'       => true,
          'brand_color' => '#ffffff',
          'items_color' => '#ffffff',
          'cart_color'  => '#ffffff',
      )
  );
  ?>

  <section class="hero-content" aria-labelledby="home-title">
    <div class="axis-mark" aria-hidden="true">
      <img src="<?php echo esc_url( $ring_url ); ?>" alt="">
    </div>
    <p class="hero-kicker">Bijoux pour ceux qui s’assument</p>
    <h1 class="hero-title" id="home-title"><span>Deviens</span><span>toi meme</span></h1>
    <p class="hero-description">
      Eclipse est une maison de bijoux<br>
      contemporaine pour ceux qui choisissent<br>
      leur propre chemin.
    </p>
    <a class="universe-link" href="<?php echo esc_url( $shop_url ); ?>">
      <span class="universe-label">Découvrir l’univers</span>
      <svg viewBox="0 0 24 14" aria-hidden="true"><path d="M0 7h21M15 1l6 6-6 6"/></svg>
    </a>
  </section>

  <div class="campaign-space" aria-hidden="true">
    <img class="campaign-image" src="<?php echo esc_url( $home_image_url ); ?>" alt="">
  </div>

  <div class="eclipse-mark" aria-hidden="true">
    <img src="<?php echo esc_url( $ring_url ); ?>" alt="">
  </div>

  <nav
    class="collection-index"
    aria-label="Collections Eclipse"
    style="--home-collection-count:<?php echo esc_attr( (string) max( 1, count( $collections ) ) ); ?>"
  >
    <?php foreach ( $collections as $index => $collection ) : ?>
      <a class="collection-link" href="<?php echo esc_url( $collection['url'] ); ?>">
        <span class="collection-number"><?php echo esc_html( str_pad( (string) ( $index + 1 ), 2, '0', STR_PAD_LEFT ) ); ?></span>
        <span class="collection-name"><?php echo esc_html( $collection['name'] ); ?></span>
      </a>
    <?php endforeach; ?>
  </nav>
  </section>

  <section class="home-jewels" data-home-jewels aria-labelledby="home-jewels-title">
    <header class="home-jewels__head">
      <h2 class="home-jewels__title" id="home-jewels-title">Bijoux</h2>
      <a class="home-jewels__all" href="<?php echo esc_url( $jewels_url ); ?>">
        <span>Voir tous les bijoux</span>
        <span class="home-jewels__arrow" aria-hidden="true">→</span>
      </a>
    </header>

    <?php if ( $jewels ) : ?>
      <div class="home-jewels-grid" aria-label="Tous les bijoux Eclipse">
        <?php foreach ( $jewels as $index => $jewel ) : ?>
          <article
            class="home-jewel-card"
            style="--reveal-delay:<?php echo esc_attr( (string) ( min( $index, 7 ) * 65 ) ); ?>ms"
          >
            <a
              class="home-jewel-media"
              href="<?php echo esc_url( $jewel['url'] ); ?>"
              aria-label="<?php echo esc_attr( $jewel['name'] ); ?>"
            >
              <?php if ( $jewel['image'] ) : ?>
                <img src="<?php echo esc_url( $jewel['image'] ); ?>" alt="<?php echo esc_attr( $jewel['name'] ); ?>">
              <?php endif; ?>
            </a>
            <a class="home-jewel-meta" href="<?php echo esc_url( $jewel['url'] ); ?>">
              <span class="home-jewel-name"><?php echo esc_html( $jewel['name'] ); ?></span>
              <?php if ( '' !== $jewel['price'] ) : ?>
                <span class="home-jewel-price"><?php echo esc_html( $jewel['price'] ); ?></span>
              <?php endif; ?>
            </a>
          </article>
        <?php endforeach; ?>
      </div>
    <?php else : ?>
      <p class="home-jewels__empty">Les bijoux Eclipse arrivent bientôt.</p>
    <?php endif; ?>
  </section>

  <section class="home-closing" data-home-closing aria-labelledby="home-closing-brand">
    <div class="home-closing__logo-anchor" aria-hidden="true">
      <img class="home-closing__mark" src="<?php echo esc_url( $ring_url ); ?>" alt="">
    </div>
    <div class="home-closing__signature">
      <p class="home-closing__eyebrow">Maison de bijoux contemporaine</p>
      <h2 class="home-closing__brand" id="home-closing-brand">Eclipse</h2>
      <p class="home-closing__line">Bijoux pour ceux qui s’assument</p>
    </div>

    <footer class="home-footer">
      <span class="home-footer__copyright">© <?php echo esc_html( wp_date( 'Y' ) ); ?> Eclipse</span>
      <nav class="home-footer__links" aria-label="Navigation de pied de page">
        <a href="<?php echo esc_url( $shop_url ); ?>">Collections</a>
        <a href="<?php echo esc_url( $jewels_url ); ?>">Bijoux</a>
        <a href="<?php echo esc_url( $about_url ); ?>">À propos</a>
      </nav>
      <span class="home-footer__place">Conçu en France</span>
    </footer>
  </section>
</main>

<script>
(() => {
  const hero = document.querySelector('[data-home-hero]');
  const mark = hero?.querySelector('.eclipse-mark');
  const jewels = document.querySelector('[data-home-jewels]');
  const closing = document.querySelector('[data-home-closing]');
  const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');

  if (hero && mark && !reducedMotion.matches) {
    let frame = 0;

    const renderLogoMotion = () => {
      frame = 0;
      const progress=Math.min(1,Math.max(0,window.scrollY/Math.max(window.innerHeight*.88,1)));
      const eased=progress*progress*(3-2*progress);
      const fadeProgress=Math.min(1,Math.max(0,(progress-.42)/.58));

      mark.style.setProperty('--mark-shift-x','0px');
      mark.style.setProperty('--mark-shift-y',`${window.innerHeight*.105*eased}px`);
      mark.style.setProperty('--mark-rotation',`${4+(24*eased)}deg`);
      mark.style.setProperty('--mark-scale',`${1-(.16*eased)}`);
      mark.style.setProperty('--mark-opacity',`${.96*(1-(fadeProgress*fadeProgress))}`);
    };

    const requestLogoMotion = () => {
      if (!frame) {
        frame = window.requestAnimationFrame(renderLogoMotion);
      }
    };

    window.addEventListener('scroll', requestLogoMotion, {passive:true});
    window.addEventListener('resize', () => {
      requestLogoMotion();
    });
    renderLogoMotion();
  }

  if (jewels && !reducedMotion.matches) {
    jewels.classList.add('is-reveal-pending');

    const jewelsObserver = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (!entry.isIntersecting) return;
        jewels.classList.add('is-entered');
        jewelsObserver.disconnect();
      });
    }, {threshold:.1, rootMargin:'0px 0px -4% 0px'});

    jewelsObserver.observe(jewels);
  }

  if (closing && !reducedMotion.matches) {
    closing.classList.add('is-reveal-pending');
    const closingObserver = new IntersectionObserver(entries => {
      if (!entries.some(entry => entry.isIntersecting)) return;
      closing.classList.add('is-visible');
      closingObserver.disconnect();
    }, {threshold:.18});
    closingObserver.observe(closing);
  }
})();
</script>
<?php wp_footer(); ?>
</body>
</html>
