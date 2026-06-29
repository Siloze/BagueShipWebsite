<?php
if ( ! defined( 'ABSPATH' ) ) { exit; }
$bagueship_home_collections = array();
$bagueship_home_hero_models = array();
$bagueship_home_hero_collection = array(
    'name'    => 'Collection',
    'tagline' => 'La dernière collection Bagueship.',
    'url'     => wc_get_page_permalink( 'shop' ),
);
$bagueship_steel_environment_url = function_exists( 'bagueship_steel_environment_url' ) ? bagueship_steel_environment_url() : 'neutral';
$bagueship_home_collection_terms = function_exists( 'bagueship_homepage_collection_terms' ) ? bagueship_homepage_collection_terms() : array();
$bagueship_home_featured_product = get_page_by_path( 'abstract-openwork-cuff', OBJECT, 'product' );
$bagueship_home_featured_product_url = $bagueship_home_featured_product ? get_permalink( $bagueship_home_featured_product ) : wc_get_page_permalink( 'shop' );

$bagueship_home_collection_products = static function ( WP_Term $term ): array {
    $query = new WP_Query(
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
                    'terms'    => array( (int) $term->term_id ),
                ),
            ),
        )
    );

    $models = array();
    foreach ( $query->posts as $product_post ) {
        $model_url = function_exists( 'bagueship_product_model_url' ) ? bagueship_product_model_url( (int) $product_post->ID ) : '';
        if ( ! $model_url ) {
            continue;
        }
        $models[] = array(
            'name' => get_the_title( $product_post ),
            'url'  => $model_url,
        );
    }
    wp_reset_postdata();

    return $models;
};

foreach ( $bagueship_home_collection_terms as $index => $term ) {
    $meta = function_exists( 'bagueship_collection_meta' ) ? bagueship_collection_meta( $term ) : array();
    $shop_url = function_exists( 'wc_get_page_permalink' ) ? wc_get_page_permalink( 'shop' ) : home_url( '/' );
    $models = $bagueship_home_collection_products( $term );
    $bagueship_home_collections[] = array(
        'label'  => sprintf( 'Collection %s', array( 'I', 'II', 'III', 'IV', 'V' )[ $index % 5 ] ),
        'name'   => $term->name,
        'tagline' => $meta['tagline'] ?? '',
        'from'   => function_exists( 'bagueship_format_price_from_term' ) ? bagueship_format_price_from_term( $term ) : '',
        'soon'   => false,
        'url'    => $shop_url . '#collection-' . $term->slug,
        'models' => $models,
        'state'  => $meta['state'] ?? 'available',
        'state_label' => function_exists( 'bagueship_collection_state_label' ) ? bagueship_collection_state_label( $meta['state'] ?? 'available' ) : '',
    );
}
if ( ! empty( $bagueship_home_collections ) ) {
    $last_collection = end( $bagueship_home_collections );
    $bagueship_home_hero_collection = array(
        'name'    => $last_collection['name'],
        'tagline' => $last_collection['tagline'] ?: 'Dernières pièces en acier, sculptées pour capter la lumière sans perdre leur ligne.',
        'url'     => $last_collection['url'],
    );
    foreach ( $last_collection['models'] as $model ) {
        $bagueship_home_hero_models[ $model['url'] ] = $model;
    }
    reset( $bagueship_home_collections );
}
$bagueship_home_hero_models = array_values( $bagueship_home_hero_models );
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Bagueship — L'acier, sculpté par la nuit</title>
<style>
  :root{
    --bg:#050506; --panel:#0c0c0e;
    --ink:#f5f5f7; --ink-dim:#a1a1a6; --ink-faint:#6e6e73;
    --hair:rgba(255,255,255,.09); --hair-soft:rgba(255,255,255,.055);
    --font:-apple-system,BlinkMacSystemFont,"SF Pro Display","SF Pro Text","Helvetica Neue",Helvetica,Arial,sans-serif;
  }
  *{ margin:0; padding:0; box-sizing:border-box; }
  html{ overflow-x:clip; }
  body{ width:100%; max-width:100vw; background:var(--bg); color:var(--ink); font-family:var(--font); -webkit-font-smoothing:antialiased; overflow-x:clip; }
  ::selection{ background:rgba(245,245,247,.18); }
  a{ color:inherit; text-decoration:none; }

  /* ── Nav ── */
  .nav{
    position:fixed; top:0; left:0; right:0; z-index:60; height:52px;
    display:flex; align-items:center; justify-content:space-between;
    padding:0 max(22px,4vw);
    background:rgba(6,6,8,.5);
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
    .nav{
      display:grid;
      grid-template-columns:minmax(72px,.7fr) minmax(0,1.65fr) 34px;
      gap:8px;
      width:100%;
      max-width:100vw;
      padding:0 10px;
      overflow:hidden;
      background:rgba(6,6,8,.88);
      backdrop-filter:none;
      -webkit-backdrop-filter:none;
    }
    .nav .brand{
      min-width:0;
      overflow:hidden;
      font-size:9px;
      letter-spacing:.1em;
      padding-left:.1em;
    }
    .nav .right{
      position:static;
      left:auto;
      transform:none;
      min-width:0;
      width:100%;
      justify-self:center;
      gap:clamp(10px,3vw,18px);
      font-size:10px;
      letter-spacing:.1em;
      overflow:hidden;
    }
    .nav .right a{
      min-width:0;
      padding-left:0;
      padding-right:0;
      white-space:nowrap;
    }
    .nav .nav-actions{
      position:static;
      right:auto;
      top:auto;
      transform:none;
      justify-self:end;
      width:34px;
      min-width:34px;
    }
    .nav .cart-link{ width:34px; height:34px; }
    .nav .cart-icon{ width:25px; height:20px; }
  }
  @media (max-width:640px){
    body.home .nav{
      display:grid;
      grid-template-columns:minmax(68px,max-content) minmax(0,1fr) 34px;
      align-items:center;
      justify-content:initial;
      column-gap:8px;
      width:100vw;
      max-width:100vw;
      padding:0 10px;
      overflow:hidden;
    }
    body.home .nav .brand{
      grid-column:1;
      min-width:0;
      overflow:hidden;
      white-space:nowrap;
      font-size:9px;
      letter-spacing:.1em;
      padding-left:.1em;
    }
    body.home .nav .right{
      grid-column:2;
      position:static;
      left:auto;
      transform:none;
      min-width:0;
      width:100%;
      display:flex;
      align-items:center;
      justify-content:center;
      gap:clamp(8px,2.6vw,14px);
      overflow:hidden;
      font-size:10px;
      letter-spacing:.1em;
      white-space:nowrap;
    }
    body.home .nav .right a{
      min-width:0;
      padding-left:0;
      padding-right:0;
      white-space:nowrap;
    }
    body.home .nav .nav-actions{
      grid-column:3;
      position:static;
      right:auto;
      top:auto;
      transform:none;
      justify-self:end;
      width:34px;
      min-width:34px;
      display:flex;
      align-items:center;
      justify-content:flex-end;
    }
    body.home .nav .cart-link{
      width:34px;
      height:34px;
    }
  }

  /* ── Buttons ── */
  .btn{ display:inline-flex; align-items:center; justify-content:center; font-family:inherit; font-weight:600; font-size:16px; letter-spacing:-.01em; height:52px; padding:0 30px; border-radius:28px; cursor:pointer; border:none; transition:transform .18s cubic-bezier(.16,1,.3,1), background .25s, box-shadow .25s; }
  .btn-primary{ background:var(--ink); color:#0b0b0d; }
  .btn-primary:hover{ transform:translateY(-1px); }
  .btn-ghost{ background:transparent; color:var(--ink); box-shadow:inset 0 0 0 1px var(--hair); }
  .btn-ghost:hover{ box-shadow:inset 0 0 0 1px rgba(255,255,255,.42); transform:translateY(-1px); }

  .eyebrow{ font-size:12px; letter-spacing:.34em; text-transform:uppercase; color:var(--ink-faint); font-weight:600; }
  .section{ position:relative; padding:0 max(22px,4vw); }
  .wrap{ max-width:1120px; margin:0 auto; }

  /* ── Real 3D model display ── */
  model-viewer{ display:block; width:100%; height:100%; --poster-color:transparent; background:transparent; }
  .model-stage{
    position:relative;
    width:min(70vmin,620px);
    aspect-ratio:1;
  }
  .ring-arc{
    position:relative;
    width:100%;
    height:100%;
    isolation:isolate;
    transform-style:preserve-3d;
    transition:transform .45s cubic-bezier(.16,1,.3,1);
    will-change:transform;
  }
  .ring-arc::before{
    content:""; position:absolute; left:50%; top:70%; width:86%; height:18%;
    transform:translateX(-50%);
    background:radial-gradient(ellipse at center, rgba(150,160,176,.22), transparent 68%);
    filter:blur(22px); pointer-events:none;
  }
  .ring-arc::after{
    content:""; position:absolute; left:50%; top:68%; width:62%; height:1px;
    transform:translateX(-50%);
    background:linear-gradient(90deg, transparent, rgba(255,255,255,.14), transparent);
    opacity:.5;
  }
  .arc-item{
    position:absolute;
    left:50%;
    top:52%;
    width:var(--size, 34%);
    height:var(--size, 34%);
    transform:
      translate(-50%,-50%)
      translate(var(--x, 0), var(--y, 0))
      rotate(var(--r, 0deg))
      scale(var(--s, 1));
    z-index:var(--z, 2);
    filter:drop-shadow(0 28px 30px rgba(0,0,0,.34));
    transition:transform .32s cubic-bezier(.16,1,.3,1), filter .32s cubic-bezier(.16,1,.3,1);
    will-change:transform;
  }
  .arc-item model-viewer{
    width:100%;
    height:100%;
  }
  .hero-stage .arc-item{
    --size:32%;
    transition:none;
  }
  .hero-stage,
  .hero-stage .model-stage,
  .hero-stage .ring-arc{
    contain:layout paint style;
  }
  .card .ring-arc::before{
    top:71%;
    width:82%;
    height:16%;
    filter:blur(18px);
  }
  .card .ring-arc::after{
    top:69%;
  }
  .card .arc-item{
    --size:30%;
  }

  /* ── Hero ── */
  .hero{ min-height:54vh; display:flex; align-items:flex-start; padding-top:52px; overflow:hidden; }
  .hero::before{ content:""; position:absolute; inset:0; background:radial-gradient(58% 56% at 50% 42%, rgba(78,84,96,.2), transparent 62%); pointer-events:none; }
  .hero-grid{
    width:100%; max-width:1180px; margin:0 auto;
    min-height:calc(54vh - 52px);
    padding-top:8vh;
    display:flex; flex-direction:column; align-items:center; justify-content:flex-start; gap:0;
    position:relative; z-index:2;
  }
  .hero-copy{
    position:relative;
    z-index:4;
    order:2;
    margin:-10vh auto 0;
    width:min(760px,calc(100vw - 44px));
    display:grid;
    justify-items:center;
    text-align:center;
  }
  .hero-copy .eyebrow{ font-size:11px; letter-spacing:.34em; color:var(--ink-faint); }
  .hero h1{
    margin-top:18px;
    font-size:clamp(46px,8vw,96px);
    font-weight:600;
    letter-spacing:-.055em;
    line-height:.92;
    text-wrap:balance;
  }
  .hero .sub{
    margin-top:22px;
    max-width:44ch;
    color:var(--ink-dim);
    font-size:clamp(15px,1.8vw,19px);
    line-height:1.55;
    text-wrap:pretty;
  }
  .hero .ctas{ margin-top:34px; display:flex; gap:14px; flex-wrap:wrap; justify-content:center; }
  .hero-stage{
    order:1;
    height:calc(52vh - 52px);
    min-height:360px;
    width:100%;
    display:flex;
    align-items:center;
    justify-content:center;
    position:relative;
    pointer-events:none;
    transform:translate3d(0,var(--hero-pin-y,0px),0);
    will-change:transform;
    backface-visibility:hidden;
  }
  .hero-stage .model-stage{ transform:translateY(-2vh); }
  @media (max-width:880px){
    .hero{
      min-height:178svh;
      display:block;
      overflow:visible;
      padding-top:52px;
    }
    .hero-grid{
      display:block;
      max-width:none;
      width:100%;
      min-height:calc(178svh - 52px);
      padding-top:0;
      text-align:center;
    }
    .hero-copy{
      position:relative;
      z-index:4;
      margin:-26svh auto 0;
      width:calc(100vw - 44px);
      max-width:560px;
      padding-bottom:18svh;
      overflow-wrap:break-word;
    }
    .hero .ctas{ justify-content:center; }
    .hero-stage{
      position:sticky;
      top:52px;
      height:calc(100svh - 52px);
      min-height:500px;
      width:100%;
      max-width:100vw;
      justify-content:center;
      pointer-events:none;
      z-index:2;
      order:1;
      transform:none;
      will-change:auto;
      backface-visibility:hidden;
      contain:none;
    }
    .hero .sub{ margin-left:auto; margin-right:auto; }
    .model-stage{ width:min(94vw,500px); }
    .hero-stage .model-stage,
    .hero-stage .ring-arc{ contain:none; transform:none; }
    .hero-stage .arc-item{ --size:29%; }
    .hero::before{ background:radial-gradient(72% 46% at 50% 42%, rgba(92,98,108,.22), transparent 64%); }
  }
  @media (max-width:520px){
    .hero{ min-height:182svh; }
    .hero-grid{ min-height:calc(182svh - 52px); }
    .hero-stage{ min-height:calc(100svh - 52px); }
    .model-stage{ width:min(92vw,450px); }
    .hero-stage .model-stage{ transform:none; }
    .hero-stage .arc-item{ --size:30%; }
    .hero h1{ font-size:clamp(42px,12vw,58px); }
    .hero .sub{ font-size:17px; }
  }

  /* Page-specific overrides: the global theme stylesheet is loaded after this block. */
  body.home .hero.section{
    min-height:74vh;
    display:flex;
    align-items:center;
    padding:52px max(22px,4vw) 0;
    overflow:hidden;
  }
  body.home .hero-grid{
    width:100%;
    max-width:1180px;
    margin:0 auto;
    min-height:calc(74vh - 52px);
    padding-top:0;
    display:grid;
    grid-template-columns:minmax(0,1.06fr) minmax(360px,.94fr);
    align-items:center;
    justify-content:center;
    gap:clamp(34px,6vw,86px);
    position:relative;
    z-index:2;
  }
  body.home .hero-copy{
    grid-column:2;
    grid-row:1;
    max-width:620px;
    width:100%;
    order:initial;
    margin:0;
    justify-items:start;
    text-align:left;
  }
  body.home .hero-stage{
    grid-column:1;
    grid-row:1;
    order:initial;
    position:relative;
    height:min(64vh,620px);
    min-height:430px;
    width:100%;
    display:flex;
    align-items:center;
    justify-content:center;
  }
  body.home .hero .ctas{ justify-content:flex-start; }
  @media (max-width:880px){
    body.home .hero.section{
      min-height:168svh;
      display:block;
      overflow:visible;
      padding:52px max(22px,4vw) 0;
      margin-bottom:34svh;
    }
    body.home .hero-grid{
      display:block;
      width:100%;
      max-width:none;
      min-height:calc(168svh - 52px);
      padding-top:0;
      text-align:center;
    }
    body.home .hero-stage{
      position:sticky;
      top:52px;
      height:calc(100svh - 52px);
      min-height:calc(100svh - 52px);
      width:100%;
      max-width:100vw;
      z-index:2;
      transform:none;
      will-change:auto;
      contain:none;
    }
    body.home .hero-stage .model-stage,
    body.home .hero-stage .ring-arc{
      contain:none;
    }
    body.home .hero-stage .model-stage{ transform:translateY(-8svh); }
    body.home .hero-stage .ring-arc{ transform:none; }
    body.home .hero-copy{
      position:absolute;
      left:50%;
      bottom:-12svh;
      transform:translateX(-50%);
      z-index:4;
      margin:0;
      width:calc(100vw - 44px);
      max-width:560px;
      padding-bottom:18svh;
      justify-items:center;
      text-align:center;
    }
    body.home .hero .ctas{ justify-content:center; }
  }
  @media (max-width:520px){
    body.home .hero.section{ min-height:170svh; margin-bottom:20svh; }
    body.home .hero-grid{ min-height:calc(170svh - 52px); }
    body.home .hero-stage .model-stage{ transform:translateY(-8svh); }
    body.home .hero-copy{ bottom:-14svh; }
  }

  /* ── Promise ── */
  .promise{ padding:18vh 0 14vh; }
  .promise .head{ max-width:760px; }
  .promise h2{ margin-top:18px; font-size:clamp(32px,5.2vw,64px); font-weight:600; letter-spacing:-.035em; line-height:1.02; max-width:16ch; text-wrap:balance; }
  .promise .lead{ margin-top:24px; max-width:52ch; color:var(--ink-dim); font-size:clamp(16px,2.1vw,20px); line-height:1.55; text-wrap:pretty; }
  .steps{ margin-top:11vh; display:grid; grid-template-columns:repeat(4,1fr); gap:0; border-top:1px solid var(--hair); }
  .step{ padding:34px 26px 10px 0; border-right:1px solid var(--hair); }
  .step:last-child{ border-right:none; padding-right:0; }
  .step .idx{ font-size:13px; letter-spacing:.16em; color:var(--ink-faint); font-weight:600; }
  .step h3{ margin-top:20px; font-size:clamp(18px,2.4vw,23px); font-weight:600; letter-spacing:-.02em; }
  .step p{ margin-top:12px; color:var(--ink-dim); font-size:15px; line-height:1.5; }
  @media (max-width:820px){ .steps{ grid-template-columns:1fr 1fr; } .step{ border-bottom:1px solid var(--hair); padding-right:22px; } .step:nth-child(2n){ border-right:none; } }
  @media (max-width:480px){ .steps{ grid-template-columns:1fr; } .step{ border-right:none; } }
  .seal-row{ margin-top:9vh; display:flex; align-items:center; gap:26px; flex-wrap:wrap; }
  .seal{ width:100px; height:100px; border-radius:50%; flex:none; position:relative; box-shadow:inset 0 0 0 1px var(--hair); display:flex; align-items:center; justify-content:center; }
  .seal::before{ content:""; position:absolute; inset:8px; border-radius:50%; box-shadow:inset 0 0 0 1px var(--hair-soft); }
  .seal svg{ width:38px; height:38px; }
  .seal-row .txt strong{ font-weight:600; font-size:clamp(17px,2.2vw,21px); letter-spacing:-.01em; }
  .seal-row .txt p{ margin-top:8px; color:var(--ink-dim); font-size:15px; line-height:1.5; max-width:44ch; }

  /* ── Collections rail ── */
  .collection{ padding:0 0 16vh; margin-top:-8vh; }
  .collection .topbar{ display:flex; align-items:flex-end; justify-content:space-between; gap:20px; padding:0 max(22px,4vw); max-width:1120px; margin:0 auto; }
  .collection h2{ font-size:clamp(28px,5vw,58px); font-weight:600; letter-spacing:-.035em; line-height:1.02; margin-top:16px; max-width:16ch; }
  .arrows{ display:flex; gap:10px; }
  .arrow{ width:46px; height:46px; border-radius:50%; cursor:pointer; background:transparent; box-shadow:inset 0 0 0 1px var(--hair); color:var(--ink); display:flex; align-items:center; justify-content:center; transition:box-shadow .2s, transform .15s; border:none; }
  .arrow:hover{ box-shadow:inset 0 0 0 1px rgba(255,255,255,.42); }
  .arrow:active{ transform:scale(.94); }
  .arrow[disabled]{ opacity:.3; cursor:default; }
  .arrow svg{ width:18px; height:18px; }
  @media (max-width:640px){ .arrows{ display:none; } }
  .rail{
    margin-top:6vh; display:flex; gap:26px; overflow-x:auto; scroll-snap-type:x mandatory;
    padding:10px max(22px,4vw) 30px; scrollbar-width:none; cursor:grab;
    -webkit-overflow-scrolling:touch; overscroll-behavior-x:contain; user-select:none;
  }
  .rail::-webkit-scrollbar{ display:none; }
  .rail.dragging{ cursor:grabbing; scroll-snap-type:none; }

  /* Collection card */
  .card{
    scroll-snap-align:center; flex:0 0 min(58vw,440px); height:min(64vh,500px);
    border-radius:22px; background:linear-gradient(175deg,#0f1013,#08090a);
    box-shadow:inset 0 0 0 1px var(--hair-soft);
    position:relative; overflow:hidden; display:flex; flex-direction:column;
    transition:box-shadow .3s, transform .3s;
  }
  .card:hover{ box-shadow:inset 0 0 0 1px rgba(255,255,255,.2); transform:translateY(-3px); }
  .card .glow{ position:absolute; inset:0; background:radial-gradient(56% 42% at 50% 36%, rgba(86,92,104,.22), transparent 62%); pointer-events:none; }
  .card .badge-soon{ position:absolute; top:18px; right:18px; z-index:5; height:24px; padding:0 11px; border-radius:12px; background:rgba(255,255,255,.07); box-shadow:inset 0 0 0 1px var(--hair); font-size:11px; letter-spacing:.18em; text-transform:uppercase; color:var(--ink-faint); font-weight:600; display:flex; align-items:center; }
  .card .card-stage{ flex:1; display:flex; align-items:center; justify-content:center; position:relative; z-index:2; }
  .card .card-stage .ring-arc{ width:min(82%,320px); height:min(42vh,300px); }
  .card .meta{ position:relative; z-index:3; padding:0 24px 24px; }
  .card .coll-tag{ font-size:11px; letter-spacing:.28em; text-transform:uppercase; color:var(--ink-faint); font-weight:600; }
  .card .state-badge{
    display:inline-flex; align-items:center; justify-content:center;
    height:24px; padding:0 10px; border-radius:999px;
    box-shadow:inset 0 0 0 1px var(--hair);
    color:var(--ink); font-size:10px; letter-spacing:.18em;
    text-transform:uppercase; font-weight:700;
    margin-top:10px;
  }
  .card .coll-name{ margin-top:10px; font-size:clamp(26px,3.6vw,42px); font-weight:600; letter-spacing:-.03em; }
  .card .row{ margin-top:16px; display:flex; align-items:center; justify-content:space-between; gap:14px; }
  .card .price{ font-size:18px; font-weight:600; letter-spacing:-.01em; }
  .card .more{ font-size:14px; color:var(--ink-dim); font-weight:500; display:inline-flex; align-items:center; gap:7px; transition:color .2s, gap .2s; }
  .card:hover .more{ color:var(--ink); gap:11px; }
  .card .more svg{ width:14px; height:14px; }
  .dots{ display:flex; gap:9px; justify-content:center; margin-top:4vh; }
  .dot{ width:7px; height:7px; border-radius:50%; background:var(--hair); transition:background .25s, transform .25s; }
  .dot.on{ background:var(--ink); transform:scale(1.25); }

  @media (max-width:760px){
    .section.promise{ padding:3vh 22px 12vh; }
    .section.features{ padding:8vh 22px 12vh; }
    .section.closing{ padding:14vh 22px 16vh; }
    .collection .topbar{ padding-left:22px; padding-right:22px; }
    .rail{
      gap:16px;
      padding-left:calc((100vw - min(72vw,310px)) / 2);
      padding-right:calc((100vw - min(72vw,310px)) / 2);
      scroll-padding-inline:calc((100vw - min(72vw,310px)) / 2);
      scroll-snap-type:x proximity;
      cursor:auto;
      touch-action:pan-x pan-y;
    }
    .card{
      flex-basis:min(72vw,310px);
      height:min(48vh,360px);
      min-height:320px;
      border-radius:18px;
    }
    .card .card-stage .ring-arc{
      width:min(78%,230px);
      height:min(24vh,180px);
      pointer-events:none;
    }
    .card .card-stage{ flex:.82; }
    .card .arc-item{ --size:29%; }
    .card .meta{ padding:0 18px 20px; }
    .card .coll-name{ font-size:clamp(22px,7vw,30px); }
    .card .price{ font-size:15px; }
    .card .more{ font-size:12.5px; }
  }

  /* ── Features ── */
  .features{ padding:8vh 0 14vh; border-top:1px solid var(--hair-soft); }
  .trio{ display:grid; grid-template-columns:repeat(3,1fr); gap:54px; }
  .feat .big{ font-size:clamp(34px,5vw,52px); font-weight:600; letter-spacing:-.03em; line-height:1; }
  .feat h3{ font-size:clamp(20px,2.6vw,26px); font-weight:600; letter-spacing:-.02em; }
  .feat p{ margin-top:14px; color:var(--ink-dim); font-size:15.5px; line-height:1.55; max-width:32ch; }
  @media (max-width:760px){ .trio{ grid-template-columns:1fr; gap:40px; } }

  /* ── Closing ── */
  .closing{ padding:16vh 0 18vh; text-align:center; }
  .closing h2{ font-size:clamp(40px,8vw,104px); font-weight:600; letter-spacing:-.045em; line-height:.96; text-wrap:balance; }
  .closing p{ margin-top:24px; color:var(--ink-dim); font-size:clamp(16px,2.2vw,20px); }
  .closing .ctas{ margin-top:40px; display:flex; gap:14px; justify-content:center; flex-wrap:wrap; }

  .footer{ border-top:1px solid var(--hair-soft); padding:40px max(22px,4vw); }
  .footer .wrap{ display:flex; align-items:center; justify-content:space-between; gap:20px; flex-wrap:wrap; }
  .footer .fb{ letter-spacing:.34em; color:var(--ink); font-weight:600; font-size:14px; }
  .footer .links{ display:flex; gap:24px; color:var(--ink-faint); font-size:13px; }
  .footer .links a:hover{ color:var(--ink-dim); }
  .footer .copy{ color:var(--ink-faint); font-size:12px; }

  .reveal{ opacity:0; transform:translateY(28px); transition:opacity 1s cubic-bezier(.16,1,.3,1), transform 1s cubic-bezier(.16,1,.3,1); }
  .reveal.in{ opacity:1; transform:none; }
  @media (max-width:760px){
    .reveal{
      opacity:1;
      transform:none;
      transition:none;
    }
    .hero-stage,
    .hero-stage .arc-item{
      will-change:auto;
    }
    .arc-item.is-mobile-disabled{
      display:none;
    }
  }
  @media (prefers-reduced-motion:reduce){ .reveal{ opacity:1; transform:none; transition:none; } }
</style>
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>

<nav class="nav">
  <a class="brand" href="<?php echo esc_url( home_url( '/' ) ); ?>">BAGUESHIP</a>
  <?php echo bagueship_topbar_markup( '' ); ?>
</nav>

<!-- ══ Hero ══ -->
<header class="hero section" id="top">
  <div class="hero-grid">
    <div class="hero-stage">
      <div class="model-stage">
        <div class="ring-arc" id="heroArc" aria-label="Bagues disponibles">
          <?php
          $hero_count = max( 1, count( $bagueship_home_hero_models ) );
          foreach ( $bagueship_home_hero_models as $hero_index => $hero_model ) :
              $center = ( $hero_count - 1 ) / 2;
              $offset = $hero_index - $center;
              $x      = 82 * $offset;
              $y      = 26 * abs( $offset ) - 20;
              $rotate = 15 * $offset;
              $scale  = 1 - ( 0.07 * abs( $offset ) );
              $z      = 10 - abs( (int) $offset );
              $depth  = 1 + ( 0.18 * abs( $offset ) );
          ?>
            <div class="arc-item" data-base-x="<?php echo esc_attr( $x ); ?>" data-base-y="<?php echo esc_attr( $y ); ?>" style="--x:<?php echo esc_attr( $x ); ?>%;--y:<?php echo esc_attr( $y ); ?>%;--r:<?php echo esc_attr( $rotate ); ?>deg;--s:<?php echo esc_attr( $scale ); ?>;--z:<?php echo esc_attr( $z ); ?>;--depth:<?php echo esc_attr( $depth ); ?>;">
              <model-viewer src="<?php echo esc_url( $hero_model['url'] ); ?>" alt="<?php echo esc_attr( $hero_model['name'] ); ?>" loading="eager" reveal="auto" auto-rotate auto-rotate-delay="0" rotation-per-second="9deg" camera-orbit="30deg 68deg 120%" environment-image="<?php echo esc_attr( $bagueship_steel_environment_url ); ?>" tone-mapping="aces" shadow-intensity="1.18" shadow-softness=".52" exposure=".82" interaction-prompt="none"></model-viewer>
            </div>
          <?php endforeach; ?>
        </div>
      </div>
    </div>

    <div class="hero-copy">
      <div class="eyebrow"><?php echo esc_html( 'Dernière collection' ); ?></div>
      <h1><?php echo esc_html( $bagueship_home_hero_collection['name'] ); ?></h1>
      <p class="sub"><?php echo esc_html( $bagueship_home_hero_collection['tagline'] ); ?></p>
      <div class="ctas">
        <a class="btn btn-primary" href="<?php echo esc_url( $bagueship_home_hero_collection['url'] ); ?>">Découvrir la collection</a>
        <a class="btn btn-ghost" href="#promesse">Notre promesse</a>
      </div>
    </div>
  </div>
</header>

<!-- ══ Collections ══ -->
<section class="collection" id="collection">
  <div class="topbar">
    <div>
      <div class="eyebrow reveal">Nos collections</div>
      <h2 class="reveal">Chaque collection,<br/>un caractère.</h2>
    </div>
    <div class="arrows reveal">
      <button class="arrow" id="prev" aria-label="Précédent" disabled>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M15 5 L8 12 L15 19"></path></svg>
      </button>
      <button class="arrow" id="next" aria-label="Suivant">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M9 5 L16 12 L9 19"></path></svg>
      </button>
    </div>
  </div>
  <div class="rail" id="rail"></div>
  <div class="dots" id="dots"></div>
</section>

<!-- ══ Promise ══ -->
<section class="section promise" id="promesse">
  <div class="wrap">
    <div class="head">
      <div class="eyebrow reveal">Notre promesse</div>
      <h2 class="reveal">Chaque bague est éprouvée avant de partir.</h2>
      <p class="lead reveal">Aucune pièce ne quitte l'atelier sans avoir traversé quatre contrôles. Pas de lot, pas de hasard : votre bague est inspectée, portée, vérifiée et scellée à la main.</p>
    </div>
    <div class="steps">
      <div class="step reveal"><div class="idx">01</div><h3>Inspection</h3><p>Examinée à la loupe, défaut par défaut. Géométrie, soudure invisible, arêtes.</p></div>
      <div class="step reveal"><div class="idx">02</div><h3>Test de port</h3><p>Portée et sollicitée 72 heures pour valider tenue, confort et résistance.</p></div>
      <div class="step reveal"><div class="idx">03</div><h3>Finition contrôlée</h3><p>Brossage et facettes vérifiés sous lumière rasante, puis nettoyage ultrasons.</p></div>
      <div class="step reveal"><div class="idx">04</div><h3>Scellée &amp; numérotée</h3><p>Emballée à la main, scellée, accompagnée de son certificat individuel.</p></div>
    </div>
    <div class="seal-row reveal">
      <div class="seal">
        <svg viewBox="0 0 48 48" fill="none" stroke="#f5f5f7" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 24.5 L21 31.5 L34 17.5"></path></svg>
      </div>
      <div class="txt">
        <strong>Certifié, scellé, garanti à vie.</strong>
        <p>Chaque pièce porte un numéro unique gravé à l'intérieur de l'anneau et reste couverte aussi longtemps que vous la portez.</p>
      </div>
    </div>
  </div>
</section>

<!-- ══ Features trio ══ -->
<section class="section features">
  <div class="wrap trio">
    <div class="feat reveal"><div class="big">316L</div><p>Acier inoxydable chirurgical. Hypoallergénique, ne ternit pas, ne rouille pas.</p></div>
    <div class="feat reveal"><h3>Faite main</h3><p>Usinée puis finie à la main en France, en séries volontairement courtes.</p></div>
    <div class="feat reveal"><h3>Garantie à vie</h3><p>Repolissage et entretien offerts. Une bague pensée pour traverser les années.</p></div>
  </div>
</section>

<!-- ══ Closing ══ -->
<section class="section closing">
  <div class="wrap">
    <h2 class="reveal">Trouvez<br/>la vôtre.</h2>
    <p class="reveal">Disponible en trois finitions, des tailles 48 à 68.</p>
    <div class="ctas reveal">
      <a class="btn btn-primary" href="<?php echo esc_url( wc_get_page_permalink( 'shop' ) ); ?>">Explorer la collection</a>
      <a class="btn btn-ghost" href="<?php echo esc_url( $bagueship_home_featured_product_url ); ?>">Configurer Abstract</a>
    </div>
  </div>
</section>

<?php echo bagueship_footer_markup(); ?>

<script>
(function(){
  const COLLS = <?php echo wp_json_encode( $bagueship_home_collections, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES ); ?>;
  const STEEL_ENV = <?php echo wp_json_encode( $bagueship_steel_environment_url, JSON_UNESCAPED_SLASHES ); ?>;
  const rail=document.getElementById('rail');
  const dotsEl=document.getElementById('dots');
  const isMobilePerformanceMode = () => window.innerWidth <= 760 || window.matchMedia('(pointer: coarse)').matches;
  const HERO_MOBILE_ROTATION_SPEED = '14deg';

  function keepHeroModelsRotating(root=document){
    if(!isMobilePerformanceMode()) return;
    root.querySelectorAll('.hero-stage model-viewer').forEach((viewer)=>{
      viewer.setAttribute('auto-rotate','');
      viewer.setAttribute('auto-rotate-delay','0');
      viewer.setAttribute('rotation-per-second',HERO_MOBILE_ROTATION_SPEED);
      if('autoRotate' in viewer) viewer.autoRotate = true;
      if('rotationPerSecond' in viewer) viewer.rotationPerSecond = HERO_MOBILE_ROTATION_SPEED;
    });
  }

  function applyMobilePerformanceMode(root=document){
    if(!isMobilePerformanceMode()) return;
    document.documentElement.classList.add('bagueship-mobile-performance');
    root.querySelectorAll('.ring-arc').forEach((arc)=>{
      const isHeroArc = !!arc.closest('.hero-stage');
      const limit = isHeroArc ? Math.min(4, arc.querySelectorAll('.arc-item').length) : 2;
      const arcItems=[...arc.querySelectorAll('.arc-item')];
      const startIndex=isHeroArc ? Math.max(0, Math.floor((arcItems.length - limit) / 2)) : 0;
      let keptIndex=0;
      arcItems.forEach((item,index)=>{
        const keep=index >= startIndex && index < startIndex + limit;
        if(keep){
          if(isHeroArc){
            const rel=keptIndex - (limit - 1) / 2;
            item.dataset.mobileBaseX=String(rel * 86);
            item.dataset.mobileBaseY=String(Math.abs(rel) * 10 - 8);
            item.style.setProperty('--r', (rel * 6).toFixed(1)+'deg');
            item.style.setProperty('--s', (1 - Math.abs(rel) * .06).toFixed(2));
            item.style.setProperty('--z', String(8 - Math.abs(rel)));
          }
          keptIndex++;
          return;
        }
        item.classList.add('is-mobile-disabled');
        item.querySelectorAll('model-viewer').forEach((viewer)=>{
          if(viewer.getAttribute('src')){
            viewer.dataset.mobileSrc = viewer.getAttribute('src');
            viewer.removeAttribute('src');
          }
        });
      });
    });
    root.querySelectorAll('model-viewer').forEach((viewer)=>{
      if(viewer.closest('.hero-stage')){
        viewer.setAttribute('auto-rotate','');
        viewer.setAttribute('auto-rotate-delay','0');
        viewer.setAttribute('rotation-per-second',HERO_MOBILE_ROTATION_SPEED);
      }else{
        viewer.setAttribute('auto-rotate','');
        viewer.setAttribute('rotation-per-second','5deg');
      }
      viewer.setAttribute('interaction-prompt','none');
      if(!viewer.closest('.hero-stage')){
        viewer.setAttribute('loading','lazy');
      }
      viewer.setAttribute('shadow-intensity','.55');
      viewer.setAttribute('shadow-softness','.38');
      viewer.setAttribute('exposure','.78');
    });
    keepHeroModelsRotating(root);
  }

  function ringArcMarkup(models){
    const safeModels = Array.isArray(models) ? models : [];
    const count = Math.max(1, safeModels.length);
    return '<div class="ring-arc" aria-hidden="true">'+safeModels.map((model, index)=>{
      const center = (count - 1) / 2;
      const offset = index - center;
      const x = (132 * offset).toFixed(2);
      const y = (24 * Math.abs(offset) - 18).toFixed(2);
      const rotate = (18 * offset).toFixed(2);
      const scale = (1 - (0.055 * Math.abs(offset))).toFixed(3);
      const z = Math.round(10 - Math.abs(offset));
      const depth = (1 + (0.14 * Math.abs(offset))).toFixed(3);
      return '<div class="arc-item" style="--x:'+x+'%;--y:'+y+'%;--r:'+rotate+'deg;--s:'+scale+';--z:'+z+';--depth:'+depth+';">'+
        '<model-viewer src="'+model.url+'" alt="'+model.name+'" loading="lazy" reveal="auto" auto-rotate rotation-per-second="9deg" camera-orbit="30deg 68deg 120%" environment-image="'+STEEL_ENV+'" tone-mapping="aces" shadow-intensity="1.08" shadow-softness=".55" exposure=".84" interaction-prompt="none"></model-viewer>'+
      '</div>';
    }).join('')+'</div>';
  }

  function setupHeroScrollSpread(){
    const hero=document.getElementById('heroArc');
    if(!hero) return;
    const heroSection=document.querySelector('.hero');
    const heroStage=document.querySelector('.hero-stage');
    const items=[...hero.querySelectorAll('.arc-item')];
    const viewers=[...hero.querySelectorAll('model-viewer')];
    const reduce=window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    if(reduce) return;
    if(isMobilePerformanceMode()){
      applyMobilePerformanceMode(hero);
      const wakeHeroRotation=()=>{
        keepHeroModelsRotating(hero);
        requestAnimationFrame(()=>keepHeroModelsRotating(hero));
      };
      viewers.forEach((viewer)=>{
        viewer.addEventListener('load', wakeHeroRotation, {passive:true});
        viewer.addEventListener('model-visibility', wakeHeroRotation, {passive:true});
      });
      const mobileState = new WeakMap();
      const updateMobile=()=>{
        const rect=heroSection ? heroSection.getBoundingClientRect() : {top:0};
        const total=Math.max(1, (heroSection ? heroSection.offsetHeight : window.innerHeight) - window.innerHeight);
        const scrollPart=Math.min(1, Math.max(0, -rect.top / total));
        const spread=.78 + scrollPart * .62;
        items.forEach((item)=>{
          const baseX=parseFloat(item.dataset.mobileBaseX || item.dataset.baseX || '0');
          const baseY=parseFloat(item.dataset.mobileBaseY || item.dataset.baseY || '0');
          const nextX=(baseX * spread).toFixed(2)+'%';
          const nextY=(baseY + (Math.abs(baseX) * scrollPart * .025)).toFixed(2)+'%';
          const previous=mobileState.get(item);
          if(!previous || previous.x !== nextX){
            item.style.setProperty('--x', nextX);
          }
          if(!previous || previous.y !== nextY){
            item.style.setProperty('--y', nextY);
          }
          mobileState.set(item, {x:nextX, y:nextY});
        });
        if(heroStage) heroStage.style.removeProperty('--hero-pin-y');
      };
      let mobileAnimating=false;
      let mobileActiveUntil=0;
      const runMobileScrollFrame=()=>{
        updateMobile();
        if(performance.now() < mobileActiveUntil){
          requestAnimationFrame(runMobileScrollFrame);
          return;
        }
        mobileAnimating=false;
      };
      const requestMobileUpdate=(duration=220)=>{
        mobileActiveUntil=Math.max(mobileActiveUntil, performance.now() + duration);
        if(mobileAnimating) return;
        mobileAnimating=true;
        requestAnimationFrame(runMobileScrollFrame);
      };
      window.addEventListener('scroll', ()=>requestMobileUpdate(260), {passive:true});
      window.addEventListener('touchstart', ()=>requestMobileUpdate(900), {passive:true});
      window.addEventListener('touchmove', ()=>requestMobileUpdate(420), {passive:true});
      window.addEventListener('touchend', ()=>{
        wakeHeroRotation();
        requestMobileUpdate(700);
      }, {passive:true});
      window.addEventListener('pointerup', ()=>{
        wakeHeroRotation();
        requestMobileUpdate(420);
      }, {passive:true});
      window.addEventListener('resize', ()=>requestMobileUpdate(260));
      wakeHeroRotation();
      updateMobile();
      return;
    }
    if(heroStage) heroStage.style.removeProperty('--hero-pin-y');
    items.forEach((item)=>{
      const baseX=parseFloat(item.dataset.baseX || '0');
      const baseY=parseFloat(item.dataset.baseY || '0');
      item.style.setProperty('--x', baseX.toFixed(1)+'%');
      item.style.setProperty('--y', baseY.toFixed(1)+'%');
    });
  }
  setupHeroScrollSpread();

  COLLS.forEach((coll,ci)=>{
    const a=document.createElement('a');
    a.className='card'; a.href = coll.url;
    a.innerHTML=
      '<div class="glow"></div>'+
      '<div class="card-stage">'+
        ringArcMarkup(coll.models)+
      '</div>'+
      '<div class="meta">'+
        '<div class="coll-tag">'+coll.label+'</div>'+
        (coll.state && coll.state !== 'available' ? '<div class="state-badge">'+coll.state_label+'</div>' : '')+
        '<div class="coll-name">'+coll.name+'</div>'+
        '<div class="row">'+
          '<span class="price">'+coll.from+'</span>'+
          '<span class="more">Découvrir '+
            '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M9 5 L16 12 L9 19"/></svg>'+
          '</span>'+
        '</div>'+
      '</div>';
    rail.appendChild(a);

    const d=document.createElement('span'); d.className='dot'+(ci===0?' on':''); dotsEl.appendChild(d);
  });
  applyMobilePerformanceMode();

  /* Rail nav */
  const cards=[...rail.querySelectorAll('.card')];
  const dots=[...dotsEl.children];
  const prev=document.getElementById('prev');
  const next=document.getElementById('next');
  function step(){
    const gap=parseFloat(getComputedStyle(rail).columnGap || getComputedStyle(rail).gap || '26') || 26;
    return cards[0].offsetWidth+gap;
  }
  function active(){ return Math.round(rail.scrollLeft/step()); }
  function sync(){
    const a=active();
    dots.forEach((d,i)=>d.classList.toggle('on',i===a));
    prev.disabled=rail.scrollLeft<8;
    next.disabled=rail.scrollLeft>rail.scrollWidth-rail.clientWidth-8;
  }
  prev.addEventListener('click',()=>rail.scrollBy({left:-step(),behavior:'smooth'}));
  next.addEventListener('click',()=>rail.scrollBy({left:step(),behavior:'smooth'}));
  rail.addEventListener('scroll',sync,{passive:true});
  window.addEventListener('resize',sync);
  if(window.matchMedia('(pointer: fine)').matches){
    let down=false,moved=false,sx=0,sl=0;
    rail.addEventListener('pointerdown',e=>{down=true;moved=false;sx=e.clientX;sl=rail.scrollLeft;rail.classList.add('dragging');});
    rail.addEventListener('pointermove',e=>{if(!down)return;const dx=e.clientX-sx;if(Math.abs(dx)>5)moved=true;rail.scrollLeft=sl-dx;});
    function endDrag(){if(!down)return;down=false;rail.classList.remove('dragging');}
    rail.addEventListener('pointerup',endDrag); rail.addEventListener('pointerleave',endDrag); rail.addEventListener('pointercancel',endDrag);
    cards.forEach(c=>c.addEventListener('click',e=>{if(moved)e.preventDefault();}));
  }
  setTimeout(sync,60);

  /* Reveal */
  if(isMobilePerformanceMode()){
    document.querySelectorAll('.reveal').forEach((el)=>el.classList.add('in'));
  }else{
    const io=new IntersectionObserver(es=>{es.forEach(e=>{if(e.isIntersecting){e.target.classList.add('in');io.unobserve(e.target);}});},{threshold:0.16,rootMargin:'0px 0px -7% 0px'});
    document.querySelectorAll('.reveal').forEach((el,i)=>{el.style.transitionDelay=(Math.min(i,5)*.06)+'s';io.observe(el);});
  }

  /* ── Topbar active state: hash only on the homepage ── */
  const navLinks = [...document.querySelectorAll('.nav .right a')];
  const setHashActiveNav = () => {
    navLinks.forEach((link) => {
      let isActive = false;
      try {
        isActive = new URL(link.href, location.origin).hash === location.hash && location.hash !== '';
      } catch {}
      link.classList.toggle('is-active', isActive);
      if (isActive) {
        link.setAttribute('aria-current', 'page');
      } else {
        link.removeAttribute('aria-current');
      }
    });
  };
  window.addEventListener('hashchange', setHashActiveNav);
  setHashActiveNav();
})();
</script>
  <?php wp_footer(); ?>
</body>
</html>
