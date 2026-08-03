<?php
if ( ! defined( 'ABSPATH' ) ) { exit; }
global $product;
if ( ! $product instanceof WC_Product ) {
    $product = wc_get_product( get_the_ID() );
}
$product_id       = get_the_ID();
$product_name     = get_the_title();
$product_meta     = function_exists( 'bagueship_core_get_product_meta' ) ? bagueship_core_get_product_meta( $product_id ) : array();
$preorder_data    = function_exists( 'bagueship_product_preorder_data' ) ? bagueship_product_preorder_data( $product_id ) : array( 'enabled' => false, 'state' => 'available' );
$is_preorder      = ! empty( $preorder_data['enabled'] );
$is_upcoming      = 'upcoming' === ( $preorder_data['state'] ?? 'available' );
$product_price    = $product ? wp_strip_all_tags( $product->get_price_html() ) : '';
$product_short    = wp_strip_all_tags( get_the_excerpt() ?: '' );
$product_desc     = wp_strip_all_tags( get_the_content() ?: '' );
$steel_environment = function_exists( 'bagueship_steel_environment_url' ) ? bagueship_steel_environment_url() : 'legacy';

if ( $product && $is_preorder ) {
    $product_price = wp_strip_all_tags( wc_price( bagueship_preorder_price_for_product( $product, $product_id ) ) );
}

$variations = array();
$sizes      = array();
if ( $product && $product->is_type( 'variable' ) ) {
    foreach ( $product->get_children() as $variation_id ) {
        $variation = wc_get_product( $variation_id );
        if ( ! $variation ) { continue; }
        $attributes = $variation->get_attributes();
        $size = $attributes['pa_taille'] ?? $attributes['taille'] ?? '';
        if ( '' === $size ) { continue; }
        $size = (int) $size;
        $sizes[] = $size;
        $variations[ (string) $size ] = array(
            'id'    => $variation_id,
            'price' => $is_preorder ? wp_strip_all_tags( wc_price( bagueship_preorder_price_for_product( $variation, $product_id ) ) ) : wp_strip_all_tags( $variation->get_price_html() ),
        );
    }
}
$sizes = array_values( array_unique( array_filter( $sizes ) ) );
sort( $sizes );
$default_size = $sizes ? $sizes[0] : '';

$spec_material = $product_meta['matiere'] ?? 'Acier inoxydable 316L';
$spec_finish   = $product_meta['finition'] ?? 'Brossé & facetté';
$spec_profile  = $product_meta['largeur'] ?? "Bande 8 mm · 2,4 mm d'épaisseur";
$spec_weight   = $product_meta['poids_bijou'] ?? '14 g';
$spec_design   = $product_meta['fabrication'] ?? 'Sculpté en série courte';

$collection_products = array();
$collection_query = new WP_Query(
    array(
        'post_type'      => 'product',
        'post_status'    => 'publish',
        'posts_per_page' => -1,
        'orderby'        => 'menu_order title',
        'order'          => 'ASC',
    )
);
foreach ( $collection_query->posts as $collection_post ) {
    $collection_product = wc_get_product( $collection_post->ID );
    $collection_products[] = array(
        'id'       => (int) $collection_post->ID,
        'name'     => get_the_title( $collection_post ),
        'url'      => get_permalink( $collection_post ),
        'model'    => function_exists( 'bagueship_product_model_url' ) ? bagueship_product_model_url( (int) $collection_post->ID ) : '',
        'price'    => $collection_product ? wp_strip_all_tags( $collection_product->get_price_html() ) : '',
        'selected' => (int) $collection_post->ID === $product_id,
    );
}
wp_reset_postdata();
usort( $collection_products, static fn( $a, $b ) => (int) $b['selected'] <=> (int) $a['selected'] );

$notify_result = isset( $_GET['bagueship_notify'] ) ? sanitize_key( wp_unslash( $_GET['bagueship_notify'] ) ) : '';
?>
<!doctype html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title><?php echo esc_html( $product_name ); ?> — Eclipse</title>
  <style>
    :root{--bg:#050506;--ink:#f5f5f7;--dim:#a1a1a6;--faint:#6e6e73;--line:rgba(255,255,255,.1);--soft:rgba(255,255,255,.055);--ease:cubic-bezier(.16,1,.3,1);--font:-apple-system,BlinkMacSystemFont,"SF Pro Display","Helvetica Neue",Arial,sans-serif}
    *{box-sizing:border-box;margin:0;padding:0}html{background:var(--bg);overflow-x:clip}body{background:var(--bg);color:var(--ink);font-family:var(--font);-webkit-font-smoothing:antialiased;overflow-x:clip}a{color:inherit;text-decoration:none}
    .screen-reader-text{position:absolute;width:1px;height:1px;overflow:hidden;clip:rect(0,0,0,0)}
    .nav{position:fixed;inset:0 0 auto;z-index:90;height:52px;display:flex;align-items:center;padding:0 max(22px,4vw);background:rgba(6,6,8,.58);border-bottom:1px solid var(--soft);backdrop-filter:blur(18px) saturate(160%)}
    .brand{font-size:15px;font-weight:600;letter-spacing:.34em;padding-left:.34em}.nav .right{position:absolute;left:50%;transform:translateX(-50%);display:flex;gap:34px;color:var(--dim);font-size:13px;font-weight:700;letter-spacing:.2em;text-transform:uppercase}.nav .right a{position:relative;padding:18px 0 17px}.nav .right a:after{content:"";position:absolute;left:0;right:0;bottom:12px;height:1px;background:currentColor;transform:scaleX(0);transition:.3s var(--ease)}.nav .right a:hover:after,.nav .right .is-active:after{transform:scaleX(1)}.nav-actions{position:absolute;right:max(22px,4vw);top:50%;transform:translateY(-50%)}.cart-link{position:relative;width:38px;height:38px;display:grid;place-items:center;border-radius:50%}.cart-icon{width:28px;height:22px;fill:none;stroke:currentColor;stroke-width:1.65}.cart-count{position:absolute;right:-2px;top:1px;min-width:14px;height:14px;padding:0 4px;border-radius:20px;background:var(--ink);color:#08080a;font-size:9px;display:grid;place-items:center}

    .collection-scroll{position:relative;height:310vh}.collection-stage{position:sticky;top:0;height:100svh;overflow:hidden;background:radial-gradient(70% 55% at 50% 46%,rgba(73,80,95,.23),rgba(19,20,24,.05) 48%,transparent 72%)}
    .stage-head{position:absolute;z-index:10;left:max(22px,5vw);right:max(22px,5vw);top:94px;display:flex;justify-content:space-between;align-items:start;pointer-events:none}.stage-kicker{font-size:10px;color:var(--faint);letter-spacing:.3em;text-transform:uppercase}.stage-count{font-size:11px;color:var(--faint);letter-spacing:.18em}
    .collection-title{position:absolute;z-index:1;left:50%;top:48%;transform:translate(-50%,-50%);font-size:clamp(92px,20vw,260px);font-weight:600;letter-spacing:-.085em;line-height:.72;color:rgba(255,255,255,.028);white-space:nowrap;user-select:none}
    .orbit{position:absolute;inset:0}
    .orbit::before{content:"";position:absolute;left:50%;top:46%;width:min(70vmin,700px);height:min(70vmin,700px);transform:translate(-50%,-50%);border:1px solid rgba(255,255,255,.06);border-radius:50%;box-shadow:inset 0 0 64px rgba(92,101,120,.035);opacity:var(--orbit-opacity,.9)}
    .orbit-item{position:absolute;left:50%;top:46%;width:clamp(180px,22vmin,330px);height:clamp(180px,22vmin,330px);translate:-50% -50%;will-change:transform,opacity}
    .orbit-item model-viewer{width:100%;height:100%;--poster-color:transparent;background:transparent;pointer-events:none;filter:drop-shadow(0 28px 34px rgba(0,0,0,.65))}
    .orbit-label{position:absolute;left:50%;bottom:-22px;transform:translateX(-50%);width:max-content;max-width:80vw;text-align:center;opacity:.55;transition:.25s}.orbit-label strong{display:block;font-size:clamp(17px,2vw,24px);letter-spacing:-.025em}.orbit-label span{display:block;margin-top:6px;color:var(--faint);font-size:11px}
    .orbit-item.is-selected{z-index:15}.orbit-item.is-selected .orbit-label{opacity:1}.orbit-item a{position:absolute;inset:0;z-index:2}
    .scroll-note{position:absolute;z-index:20;left:50%;bottom:112px;transform:translateX(-50%);font-size:9px;color:var(--faint);letter-spacing:.28em;text-transform:uppercase;text-align:center}.scroll-note:after{content:"";display:block;margin:13px auto 0;width:1px;height:32px;background:linear-gradient(var(--faint),transparent)}

    .chosen-copy{position:absolute;z-index:12;left:50%;top:25%;width:min(90vw,760px);transform:translate(-50%,-50%);text-align:center;opacity:0;pointer-events:none}.chosen-copy .tag{font-size:10px;color:var(--faint);letter-spacing:.3em;text-transform:uppercase}.chosen-copy h1{margin-top:14px;font-size:clamp(48px,7.5vw,94px);line-height:.86;letter-spacing:-.065em}.chosen-copy p{margin:18px auto 0;max-width:46ch;color:var(--dim);font-size:clamp(14px,1.5vw,17px);line-height:1.5}
    .quick-specs{position:absolute;z-index:12;left:50%;bottom:calc(98px + 5vh);width:min(92vw,920px);transform:translateX(-50%);display:grid;grid-template-columns:repeat(3,1fr);border-block:1px solid var(--line);opacity:0}.quick-spec{padding:18px 26px;border-right:1px solid var(--line);opacity:0;transform:translateY(22px);will-change:opacity,transform}.quick-spec:last-child{border:0}.quick-spec small{display:block;color:var(--faint);font-size:9px;letter-spacing:.22em;text-transform:uppercase}.quick-spec strong{display:block;margin-top:8px;font-size:clamp(14px,1.7vw,18px)}

    .details{padding:18vh max(22px,4vw) 20vh}.details-inner{max-width:1100px;margin:auto;display:grid;grid-template-columns:.85fr 1.15fr;gap:10vw}.details h2{font-size:clamp(48px,7vw,88px);line-height:.91;letter-spacing:-.06em}.details-lead{margin-top:26px;color:var(--dim);font-size:18px;line-height:1.65}.detail-list{border-top:1px solid var(--line)}.detail-row{padding:27px 0;border-bottom:1px solid var(--line)}.detail-row small{display:block;color:var(--faint);font-size:9px;letter-spacing:.24em;text-transform:uppercase}.detail-row strong{display:block;margin-top:9px;font-size:clamp(20px,2.5vw,28px);letter-spacing:-.025em}
    .other-jewels{padding:4vh max(22px,4vw) 18vh}.other-inner{max-width:1100px;margin:auto}.other-head{display:flex;justify-content:space-between;align-items:end;margin-bottom:42px}.other-head h2{font-size:clamp(36px,5vw,62px);letter-spacing:-.05em}.other-head a{color:var(--dim);font-size:13px}.other-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:14px}.other-card{min-height:360px;position:relative;overflow:hidden;border-radius:20px;background:radial-gradient(circle at 50% 35%,rgba(84,91,105,.21),transparent 60%),#0a0a0c;border:1px solid var(--soft)}.other-card model-viewer{position:absolute;inset:0 0 75px;width:100%;height:calc(100% - 75px);pointer-events:none}.other-card div{position:absolute;left:20px;right:20px;bottom:18px;display:flex;justify-content:space-between;gap:12px}.other-card span{color:var(--dim);font-size:13px}

    .buybar{position:fixed;z-index:100;left:50%;bottom:18px;width:min(94vw,980px);transform:translateX(-50%);background:rgba(14,14,16,.88);border:1px solid rgba(255,255,255,.14);border-radius:22px;backdrop-filter:blur(22px) saturate(160%);box-shadow:0 18px 55px rgba(0,0,0,.55);padding:12px 12px 12px 20px}.buybar-main{display:grid;grid-template-columns:1fr auto auto auto;gap:12px;align-items:center}.buybar-product small{display:block;color:var(--faint);font-size:9px;letter-spacing:.21em;text-transform:uppercase}.buybar-product strong{display:block;margin-top:4px;font-size:16px}.buybar-price{font-size:18px;font-weight:650;white-space:nowrap}.size-toggle{appearance:none;height:46px;padding:0 17px;border:1px solid var(--line);border-radius:14px;background:transparent;color:var(--ink);font:600 12px var(--font);cursor:pointer}.buy-button{appearance:none;height:46px;padding:0 24px;border:0;border-radius:14px;background:var(--ink);color:#09090a;font:700 13px var(--font);cursor:pointer;transition:transform .2s}.buy-button:hover{transform:translateY(-2px)}.buy-button:disabled{opacity:.45;cursor:not-allowed;transform:none}.buy-options{display:none;padding:15px 0 3px;border-top:1px solid var(--soft);margin-top:12px}.buybar.is-open .buy-options{display:block}.size-list{display:flex;gap:8px;flex-wrap:wrap}.size-chip{appearance:none;width:42px;height:42px;border-radius:50%;border:1px solid var(--line);background:transparent;color:var(--ink);font:600 13px var(--font);cursor:pointer}.size-chip.is-active{background:var(--ink);color:#08080a;border-color:var(--ink)}
    .notify-options{display:grid;grid-template-columns:1fr auto;gap:8px}.notify-options input{min-width:0;height:44px;border:1px solid var(--line);border-radius:12px;background:#070708;color:var(--ink);padding:0 14px}.notify-options button{height:44px;border:0;border-radius:12px;padding:0 18px;background:var(--ink);font-weight:700}.notify-state{color:var(--dim);font-size:12px;margin-bottom:10px}
    .reveal{opacity:0;transform:translateY(35px);transition:opacity .9s var(--ease),transform .9s var(--ease)}.reveal.in{opacity:1;transform:none}

    @media(max-width:700px){
      .nav{display:grid;grid-template-columns:72px 1fr 34px;padding:0 10px;gap:8px}.brand{font-size:9px;letter-spacing:.1em}.nav .right{position:static;transform:none;justify-self:center;gap:13px;font-size:10px;letter-spacing:.1em}.nav-actions{position:static;transform:none;justify-self:end}.cart-link{width:34px;height:34px}
      .collection-scroll{height:290vh}.orbit::before{width:76vmin;height:76vmin;top:43%}.orbit-item{width:min(32vw,150px);height:min(32vw,150px);top:43%}.stage-head{top:78px}.collection-title{font-size:34vw}.scroll-note{bottom:130px}.chosen-copy{top:21%}.chosen-copy h1{font-size:15vw}.chosen-copy p{font-size:13px;margin-top:12px}.quick-specs{bottom:calc(112px + 3vh);grid-template-columns:1fr}.quick-spec{padding:10px 14px;border-right:0;border-bottom:1px solid var(--line);display:flex;justify-content:space-between;align-items:center}.quick-spec:last-child{border-bottom:0}.quick-spec strong{font-size:13px;margin:0;text-align:right}
      .details{padding-top:13vh}.details-inner{grid-template-columns:1fr;gap:8vh}.other-grid{grid-template-columns:1fr}.other-card{min-height:115vw}.other-card:nth-child(n+3){display:none}
      .buybar{bottom:8px;border-radius:18px;padding:10px 10px 10px 14px}.buybar-main{grid-template-columns:1fr auto}.buybar-price{font-size:14px}.size-toggle{grid-row:2;height:38px}.buy-button{grid-row:2;height:42px;padding:0 16px}.buybar-product strong{font-size:14px}
    }
    @media(prefers-reduced-motion:reduce){.collection-scroll{height:auto}.collection-stage{position:relative;min-height:110svh}.reveal{opacity:1;transform:none}.orbit-item:not(.is-selected){display:none}.orbit-item.is-selected{transform:translate3d(0,0,0)!important}.chosen-copy,.quick-specs{opacity:1!important}}
  </style>
  <?php wp_head(); ?>
</head>
<body <?php body_class( 'bagueship-product-experience' ); ?>>
<?php wp_body_open(); ?>
<nav class="nav">
  <a class="brand" href="<?php echo esc_url( home_url( '/' ) ); ?>">ECLIPSE</a>
  <?php echo bagueship_topbar_markup( 'collection' ); ?>
</nav>

<main>
  <section class="collection-scroll" id="collectionStory">
    <div class="collection-stage">
      <div class="stage-head"><div class="stage-kicker">La collection · Faites défiler</div><div class="stage-count"><?php echo esc_html( '01 / ' . str_pad( (string) count( $collection_products ), 2, '0', STR_PAD_LEFT ) ); ?></div></div>
      <div class="collection-title" aria-hidden="true">ECLIPSE</div>
      <div class="orbit" id="productOrbit">
        <?php foreach ( $collection_products as $index => $item ) : ?>
          <div class="orbit-item<?php echo $item['selected'] ? ' is-selected' : ''; ?>" data-index="<?php echo esc_attr( $index ); ?>" data-selected="<?php echo $item['selected'] ? '1' : '0'; ?>">
            <a href="<?php echo esc_url( $item['url'] ); ?>" aria-label="<?php echo esc_attr( 'Voir ' . $item['name'] ); ?>"></a>
            <?php if ( $item['model'] ) : ?>
              <model-viewer src="<?php echo esc_url( $item['model'] ); ?>" alt="<?php echo esc_attr( $item['name'] ); ?>" loading="<?php echo $item['selected'] ? 'eager' : 'lazy'; ?>" reveal="auto" auto-rotate auto-rotate-delay="0" rotation-per-second="<?php echo $item['selected'] ? '9deg' : '5deg'; ?>" camera-orbit="30deg 18deg 136%" environment-image="<?php echo esc_attr( $steel_environment ); ?>" tone-mapping="aces" exposure=".83" shadow-intensity="1.15" shadow-softness=".55" interaction-prompt="none"></model-viewer>
            <?php endif; ?>
            <div class="orbit-label"><strong><?php echo esc_html( $item['name'] ); ?></strong><span><?php echo esc_html( $item['price'] ); ?></span></div>
          </div>
        <?php endforeach; ?>
      </div>
      <div class="chosen-copy" id="chosenCopy">
        <div class="tag">Votre pièce</div>
        <h1><?php echo esc_html( $product_name ); ?></h1>
        <p><?php echo esc_html( $product_short ?: 'Une forme sculpturale en acier, dessinée pour capter la lumière et accompagner chaque geste.' ); ?></p>
      </div>
      <div class="quick-specs" id="quickSpecs">
        <div class="quick-spec"><small>Matière</small><strong><?php echo esc_html( $spec_material ); ?></strong></div>
        <div class="quick-spec"><small>Finition</small><strong><?php echo esc_html( $spec_finish ); ?></strong></div>
        <div class="quick-spec"><small>Profil</small><strong><?php echo esc_html( $spec_profile ); ?></strong></div>
      </div>
      <div class="scroll-note" id="scrollNote">Tourner la collection</div>
    </div>
  </section>
</main>

<aside class="buybar" id="buybar" aria-label="Acheter <?php echo esc_attr( $product_name ); ?>">
  <div class="buybar-main">
    <div class="buybar-product"><small><?php echo esc_html( $is_preorder ? 'Précommande' : 'Disponible' ); ?></small><strong><?php echo esc_html( $product_name ); ?></strong></div>
    <div class="buybar-price" id="buybarPrice"><?php echo esc_html( $product_price ); ?></div>
    <?php if ( ! $is_upcoming ) : ?>
      <?php if ( $sizes ) : ?><button class="size-toggle" id="sizeToggle" type="button">Taille <span id="sizeLabel"><?php echo esc_html( (string) $default_size ); ?></span>⌄</button><?php endif; ?>
      <button class="buy-button" id="buyButton" type="button"><?php echo esc_html( $is_preorder ? 'Précommander' : 'Ajouter au panier' ); ?></button>
    <?php else : ?>
      <button class="buy-button" id="notifyToggle" type="button">Me prévenir</button>
    <?php endif; ?>
  </div>
  <div class="buy-options">
    <?php if ( $is_upcoming ) : ?>
      <?php if ( $notify_result ) : ?><p class="notify-state"><?php echo esc_html( 'success' === $notify_result ? 'Adresse enregistrée. Nous vous préviendrons.' : 'Impossible d’enregistrer cette adresse.' ); ?></p><?php endif; ?>
      <form class="notify-options" method="post" action="<?php echo esc_url( admin_url( 'admin-post.php' ) ); ?>">
        <input type="hidden" name="action" value="bagueship_notify_me">
        <input type="hidden" name="product_id" value="<?php echo esc_attr( $product_id ); ?>">
        <?php wp_nonce_field( 'bagueship_notify_me_' . $product_id, 'bagueship_notify_nonce' ); ?>
        <input type="email" name="email" required placeholder="Votre adresse e-mail">
        <button type="submit">Confirmer</button>
      </form>
    <?php elseif ( $sizes ) : ?>
      <div class="size-list" aria-label="Choisir une taille">
        <?php foreach ( $sizes as $size ) : ?><button class="size-chip<?php echo $size === $default_size ? ' is-active' : ''; ?>" type="button" data-size="<?php echo esc_attr( $size ); ?>"><?php echo esc_html( $size ); ?></button><?php endforeach; ?>
      </div>
    <?php endif; ?>
  </div>
  <?php if ( ! $is_upcoming ) : ?>
    <form id="cartForm" method="post" action="<?php echo esc_url( get_permalink( $product_id ) ); ?>" hidden>
      <input type="hidden" name="add-to-cart" value="<?php echo esc_attr( $product ? $product->get_id() : $product_id ); ?>">
      <?php if ( $sizes ) : ?>
        <input type="hidden" name="variation_id" id="variationId" value="<?php echo esc_attr( $variations[ (string) $default_size ]['id'] ?? '' ); ?>">
        <input type="hidden" name="attribute_pa_taille" id="variationSize" value="<?php echo esc_attr( $default_size ); ?>">
      <?php endif; ?>
    </form>
  <?php endif; ?>
</aside>

<script>
(()=>{
  const story=document.getElementById('collectionStory');
  const orbit=document.getElementById('productOrbit');
  const items=[...document.querySelectorAll('.orbit-item')];
  const stageHead=document.querySelector('.stage-head');
  const collectionTitle=document.querySelector('.collection-title');
  const chosen=document.getElementById('chosenCopy');
  const specs=document.getElementById('quickSpecs');
  const specItems=[...document.querySelectorAll('.quick-spec')];
  const note=document.getElementById('scrollNote');
  const clamp=(n,a=0,b=1)=>Math.min(b,Math.max(a,n));
  const ease=n=>1-Math.pow(1-clamp(n),3);
  const updateStory=()=>{
    if(!story||matchMedia('(prefers-reduced-motion: reduce)').matches)return;
    const rect=story.getBoundingClientRect();
    const p=clamp(-rect.top/Math.max(1,story.offsetHeight-innerHeight));
    const mobile=innerWidth<700;
    const radius=Math.min(innerWidth,innerHeight)*(mobile?.29:.3);
    const spinProgress=clamp(p/.44);
    const spin=spinProgress*Math.PI*2;
    const extraction=ease((p-.44)/.34);
    const step=(Math.PI*2)/Math.max(1,items.length);
    if(orbit) orbit.style.setProperty('--orbit-opacity',String((1-extraction)*.9));
    if(stageHead) stageHead.style.opacity=1-extraction;
    if(collectionTitle) collectionTitle.style.opacity=1-extraction;
    items.forEach((item,index)=>{
      const selected=item.dataset.selected==='1';
      const label=item.querySelector('.orbit-label');
      const angle=(index*step)+spin;
      let x=Math.sin(angle)*radius;
      let y=-Math.cos(angle)*radius;
      let scale=.86;
      let opacity=1;
      if(selected){
        x*=1-extraction;
        y=(y*(1-extraction))+(extraction*innerHeight*(mobile?.08:.1));
        scale+=extraction*.08;
        if(label) label.style.opacity=1-extraction;
      }else{
        opacity*=1-extraction;
      }
      item.style.transform=`translate3d(${x}px,${y}px,0) scale(${scale})`;
      item.style.opacity=opacity;
      item.style.zIndex=String(selected&&p>.43?500:300+index);
    });
    const copyIn=ease((p-.5)/.2);
    if(chosen){
      const rise=(1-copyIn)*innerHeight*(mobile?.2:.25);
      chosen.style.opacity=copyIn;
      chosen.style.transform=`translate(-50%,calc(-50% + ${rise}px))`;
    }
    if(specs){
      const specsIn=ease((p-.67)/.12);
      specs.style.opacity=specsIn;
      specs.style.transform=`translateX(-50%) translateY(${(1-specsIn)*24}px)`;
      specItems.forEach((spec,index)=>{
        const reveal=ease((p-(.68+index*.045))/.1);
        spec.style.opacity=reveal;
        spec.style.transform=`translateY(${(1-reveal)*22}px)`;
      });
    }
    if(note)note.style.opacity=1-ease(p/.18);
  };
  let ticking=false;addEventListener('scroll',()=>{if(!ticking){ticking=true;requestAnimationFrame(()=>{updateStory();ticking=false})}},{passive:true});addEventListener('resize',updateStory);updateStory();

  const io=new IntersectionObserver(es=>es.forEach(e=>{if(e.isIntersecting){e.target.classList.add('in');io.unobserve(e.target)}}),{threshold:.13});
  document.querySelectorAll('.reveal').forEach(el=>io.observe(el));

  const bar=document.getElementById('buybar');
  const sizeToggle=document.getElementById('sizeToggle');
  const notifyToggle=document.getElementById('notifyToggle');
  [sizeToggle,notifyToggle].filter(Boolean).forEach(button=>button.addEventListener('click',()=>bar.classList.toggle('is-open')));
  const variationData=<?php echo wp_json_encode( $variations, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES ); ?>;
  document.querySelectorAll('.size-chip').forEach(chip=>chip.addEventListener('click',()=>{
    const size=chip.dataset.size;
    document.querySelectorAll('.size-chip').forEach(item=>item.classList.toggle('is-active',item===chip));
    document.getElementById('sizeLabel').textContent=size;
    document.getElementById('variationId').value=variationData[size]?.id||'';
    document.getElementById('variationSize').value=size;
    if(variationData[size]?.price)document.getElementById('buybarPrice').textContent=variationData[size].price;
    bar.classList.remove('is-open');
  }));
  const buy=document.getElementById('buyButton'),form=document.getElementById('cartForm');
  if(buy&&form)buy.addEventListener('click',()=>{buy.disabled=true;buy.textContent='Ajout…';form.submit()});
})();
</script>
<?php wp_footer(); ?>
</body>
</html>
