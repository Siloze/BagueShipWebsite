<?php
if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

$term = get_queried_object();
if ( ! $term instanceof WP_Term ) {
    wp_safe_redirect( wc_get_page_permalink( 'shop' ) );
    exit;
}

$meta        = function_exists( 'bagueship_collection_meta' ) ? bagueship_collection_meta( $term ) : array();
$tagline     = trim( (string) ( $meta['tagline'] ?? '' ) );
$description = trim( wp_strip_all_tags( term_description( $term ) ) );
$state       = (string) ( $meta['state'] ?? 'available' );
$products    = array();
$query       = new WP_Query(
    array(
        'post_type'      => 'product',
        'post_status'    => 'publish',
        'posts_per_page' => -1,
        'tax_query'      => array(
            array(
                'taxonomy' => 'product_cat',
                'field'    => 'term_id',
                'terms'    => array( (int) $term->term_id ),
            ),
        ),
        'orderby'        => array(
            'menu_order' => 'ASC',
            'title'      => 'ASC',
        ),
    )
);

foreach ( $query->posts as $product_post ) {
    $product = wc_get_product( $product_post->ID );
    if ( ! $product ) {
        continue;
    }

    $image_id = get_post_thumbnail_id( $product_post->ID );
    $products[] = array(
        'name'        => get_the_title( $product_post ),
        'url'         => get_permalink( $product_post ),
        'price'       => wp_strip_all_tags( $product->get_price_html() ),
        'description' => trim( wp_strip_all_tags( get_the_excerpt( $product_post ) ) ),
        'image'       => $image_id ? wp_get_attachment_image_url( $image_id, 'full' ) : '',
        'srcset'      => $image_id ? wp_get_attachment_image_srcset( $image_id, 'full' ) : '',
    );
}
wp_reset_postdata();

$product_count = count( $products );
$status_label  = function_exists( 'bagueship_collection_state_label' )
    ? bagueship_collection_state_label( $state )
    : 'Collection';
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo esc_html( $term->name ); ?> — Collection Eclipse</title>
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
    --night:#030303;
    --paper:#f7f7f5;
    --muted:#8a8a87;
    --edge:clamp(28px,3.85vw,74px);
    --font:"Eclipse Sans","Helvetica Neue",Arial,sans-serif;
  }
  *{box-sizing:border-box}
  html,body{margin:0;width:100%;height:100%;background:var(--night)}
  body.eclipse-collection-detail{
    overflow:hidden;
    color:var(--paper);
    background:
      radial-gradient(80vw 80vh at 50% 42%,rgba(255,255,255,.035),transparent 67%),
      var(--night);
    font-family:var(--font);
    font-weight:500;
    -webkit-font-smoothing:antialiased;
  }
  a{color:inherit;text-decoration:none}
  button{font:inherit}
  .screen-reader-text{
    position:absolute!important;
    width:1px;
    height:1px;
    padding:0;
    margin:-1px;
    overflow:hidden;
    clip:rect(0,0,0,0);
    white-space:nowrap;
    border:0;
  }

  .collection-detail{
    position:relative;
    width:100%;
    height:100svh;
    overflow:hidden;
    isolation:isolate;
  }
  .collection-detail::before{
    content:"";
    position:absolute;
    z-index:45;
    inset:0 0 auto;
    height:132px;
    background:linear-gradient(180deg,rgba(3,3,3,.94),rgba(3,3,3,.48) 57%,transparent);
    pointer-events:none;
  }

  .collection-identity{
    position:absolute;
    z-index:30;
    left:var(--edge);
    top:154px;
    width:min(185px,14vw);
    pointer-events:none;
  }
  .collection-eyebrow{
    margin:0;
    color:#929292;
    font-size:10px;
    font-weight:700;
    letter-spacing:.18em;
    line-height:1.4;
    text-transform:uppercase;
  }
  .collection-title{
    margin:20px 0 0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:clamp(58px,5.3vw,92px);
    font-weight:400;
    letter-spacing:.02em;
    line-height:.82;
    text-transform:uppercase;
  }
  .collection-tagline{
    margin:24px 0 0;
    color:#aaa;
    font-size:11px;
    font-weight:700;
    letter-spacing:.1em;
    line-height:1.65;
    text-transform:uppercase;
  }
  .collection-description{
    margin:22px 0 0;
    color:#747474;
    font-size:11px;
    line-height:1.65;
  }

  .collection-rail{
    position:relative;
    z-index:10;
    width:100%;
    height:100svh;
    overflow-x:hidden;
    overflow-y:auto;
    overscroll-behavior-y:contain;
    scroll-snap-type:y mandatory;
    scrollbar-width:none;
    padding:14svh 0;
    display:grid;
    justify-items:center;
    gap:4svh;
    perspective:1600px;
  }
  .collection-rail::-webkit-scrollbar{display:none}
  .collection-product{
    position:relative;
    display:block;
    width:min(66vw,1050px);
    height:72svh;
    flex:none;
    overflow:hidden;
    border:1px solid rgba(255,255,255,.13);
    background:#080808;
    scroll-snap-align:center;
    scroll-snap-stop:always;
    opacity:.28;
    filter:blur(6px) saturate(.6);
    transform:translateY(30px) scale(.92) rotateX(-1.6deg);
    transform-origin:center;
    transition:
      opacity .55s cubic-bezier(.16,1,.3,1),
      filter .55s cubic-bezier(.16,1,.3,1),
      transform .75s cubic-bezier(.16,1,.3,1),
      border-color .4s ease,
      box-shadow .55s ease;
    will-change:transform,filter,opacity;
  }
  .collection-product.is-before{
    transform:translateY(18px) scale(.925) rotateX(1.8deg);
  }
  .collection-product.is-after{
    transform:translateY(42px) scale(.925) rotateX(-1.8deg);
  }
  .collection-product.is-active{
    z-index:3;
    opacity:1;
    filter:none;
    transform:translateY(0) scale(1) rotateX(0);
    border-color:rgba(255,255,255,.25);
    box-shadow:0 35px 100px rgba(0,0,0,.58);
  }
  .collection-product.is-active:hover,
  .collection-product.is-active:focus-visible{
    transform:translateY(-9px) scale(1.006);
    border-color:rgba(255,255,255,.42);
    box-shadow:0 46px 125px rgba(0,0,0,.72);
    outline:0;
  }
  .collection-product__image{
    position:absolute;
    inset:0;
    width:100%;
    height:100%;
    max-width:none;
    object-fit:cover;
    object-position:center 43%;
    transform:scale(1.012);
    transition:transform 1.1s cubic-bezier(.16,1,.3,1),filter .5s ease;
  }
  .collection-product.is-active:hover .collection-product__image,
  .collection-product.is-active:focus-visible .collection-product__image{
    transform:scale(1.035);
    filter:brightness(1.05);
  }
  .collection-product::after{
    content:"";
    position:absolute;
    z-index:1;
    inset:0;
    background:
      linear-gradient(180deg,rgba(0,0,0,.08) 48%,rgba(0,0,0,.84) 100%),
      linear-gradient(90deg,rgba(0,0,0,.18),transparent 36%);
    opacity:.48;
    transition:opacity .5s ease;
    pointer-events:none;
  }
  .collection-product.is-active:hover::after,
  .collection-product.is-active:focus-visible::after{opacity:1}
  .collection-product__number{
    position:absolute;
    z-index:3;
    top:28px;
    left:32px;
    color:rgba(255,255,255,.68);
    font-size:10px;
    font-weight:700;
    letter-spacing:.18em;
  }
  .collection-product__content{
    position:absolute;
    z-index:3;
    left:40px;
    right:40px;
    bottom:35px;
    display:grid;
    grid-template-columns:minmax(0,1fr) auto;
    align-items:end;
    gap:40px;
    opacity:0;
    transform:translateY(18px);
    transition:opacity .45s ease,transform .6s cubic-bezier(.16,1,.3,1);
  }
  .collection-product.is-active:hover .collection-product__content,
  .collection-product.is-active:focus-visible .collection-product__content{
    opacity:1;
    transform:translateY(0);
  }
  .collection-product__name{
    margin:0;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:clamp(48px,4.5vw,76px);
    font-weight:400;
    letter-spacing:.025em;
    line-height:.85;
    text-transform:uppercase;
  }
  .collection-product__description{
    max-width:460px;
    margin:14px 0 0;
    color:#d0d0cd;
    font-size:12px;
    line-height:1.6;
  }
  .collection-product__aside{
    min-width:140px;
    text-align:right;
  }
  .collection-product__price{
    display:block;
    font-size:14px;
    font-weight:700;
    letter-spacing:.08em;
  }
  .collection-product__action{
    display:inline-flex;
    align-items:center;
    gap:16px;
    margin-top:16px;
    padding-bottom:6px;
    border-bottom:1px solid rgba(255,255,255,.65);
    font-size:10px;
    font-weight:700;
    letter-spacing:.14em;
    text-transform:uppercase;
  }
  .collection-product__action::after{
    content:"→";
    font-size:15px;
    line-height:.6;
    transition:transform .3s ease;
  }
  .collection-product:hover .collection-product__action::after{transform:translateX(5px)}

  .collection-progress{
    position:absolute;
    z-index:30;
    right:var(--edge);
    top:50%;
    width:48px;
    transform:translateY(-50%);
    text-align:right;
    pointer-events:none;
  }
  .collection-progress__count{
    display:block;
    color:#c9c9c7;
    font-size:10px;
    font-weight:700;
    letter-spacing:.13em;
  }
  .collection-progress__track{
    position:relative;
    display:block;
    width:1px;
    height:132px;
    margin:20px 4px 20px auto;
    background:#272727;
    overflow:hidden;
  }
  .collection-progress__fill{
    position:absolute;
    inset:0;
    background:#d7d7d5;
    transform:scaleY(var(--progress,<?php echo $product_count > 0 ? esc_attr( (string) ( 1 / $product_count ) ) : '1'; ?>));
    transform-origin:top;
    transition:transform .55s cubic-bezier(.16,1,.3,1);
  }
  .collection-progress__hint{
    display:block;
    color:#686868;
    font-size:8px;
    font-weight:700;
    letter-spacing:.14em;
    line-height:1.5;
    text-transform:uppercase;
  }
  .collection-current{
    position:absolute;
    z-index:30;
    left:var(--edge);
    bottom:34px;
    color:#777;
    font-size:9px;
    font-weight:700;
    letter-spacing:.15em;
    text-transform:uppercase;
    pointer-events:none;
  }
  .collection-current strong{
    color:#d0d0ce;
    font-weight:700;
  }
  .collection-empty{
    position:absolute;
    inset:0;
    display:grid;
    place-items:center;
    color:#8b8b8b;
    text-align:center;
  }
  .collection-empty a{
    display:inline-block;
    margin-top:22px;
    padding-bottom:5px;
    border-bottom:1px solid currentColor;
    color:#d0d0d0;
    font-size:11px;
    letter-spacing:.12em;
    text-transform:uppercase;
  }

  @media(max-width:1120px){
    .collection-identity{width:150px}
    .collection-description{display:none}
    .collection-product{width:min(70vw,850px)}
  }
  @media(max-width:760px){
    .collection-detail::before{height:118px}
    .collection-identity{
      top:119px;
      left:20px;
      width:auto;
      max-width:60vw;
    }
    .collection-title{margin-top:8px;font-size:44px}
    .collection-tagline,.collection-description{display:none}
    .collection-rail{
      padding:19svh 0 11svh;
      gap:5svh;
      scroll-padding-top:0;
    }
    .collection-product{
      width:calc(100vw - 36px);
      height:70svh;
      opacity:.22;
      filter:blur(4px) saturate(.65);
    }
    .collection-product.is-active{opacity:1}
    .collection-product__image{object-position:center 44%}
    .collection-product__content{
      left:22px;
      right:22px;
      bottom:24px;
      display:block;
      opacity:1;
      transform:none;
    }
    .collection-product__name{font-size:48px}
    .collection-product__description{
      max-width:85%;
      margin-top:9px;
      font-size:11px;
    }
    .collection-product__aside{
      display:flex;
      align-items:flex-end;
      justify-content:space-between;
      gap:15px;
      margin-top:16px;
      text-align:left;
    }
    .collection-product__action{margin-top:0}
    .collection-product::after{opacity:.9}
    .collection-progress{
      right:18px;
      top:140px;
      width:auto;
      transform:none;
    }
    .collection-progress__track,.collection-progress__hint{display:none}
    .collection-current{display:none}
  }
  @media(max-width:420px){
    .collection-product{height:66svh}
    .collection-product__name{font-size:42px}
    .collection-product__description{max-width:100%}
  }
  @media(prefers-reduced-motion:reduce){
    .collection-rail{scroll-behavior:auto}
    .collection-product,
    .collection-product__image,
    .collection-product__content{transition:none}
  }
  body.eclipse-collection-detail .bagueship-cookie-banner{display:none!important}
</style>
</head>
<body <?php body_class( 'eclipse-collection-detail' ); ?>>
<?php wp_body_open(); ?>

<main class="collection-detail">
  <?php
  echo bagueship_eclipse_topbar(
      array(
          'active'      => 'collection',
          'position'    => 'absolute',
          'brand_color' => '#f7f7f5',
          'items_color' => '#f7f7f5',
          'cart_color'  => '#f7f7f5',
      )
  );
  ?>

  <header class="collection-identity">
    <p class="collection-eyebrow">Collection / <?php echo esc_html( $status_label ); ?></p>
    <h1 class="collection-title"><?php echo esc_html( $term->name ); ?></h1>
    <?php if ( $tagline ) : ?>
      <p class="collection-tagline"><?php echo esc_html( $tagline ); ?></p>
    <?php endif; ?>
    <?php if ( $description ) : ?>
      <p class="collection-description"><?php echo esc_html( $description ); ?></p>
    <?php endif; ?>
  </header>

  <?php if ( $products ) : ?>
    <div class="collection-rail" id="collectionRail" aria-label="<?php echo esc_attr( 'Bijoux de la collection ' . $term->name ); ?>">
      <?php foreach ( $products as $index => $item ) : ?>
        <a
          class="collection-product<?php echo 0 === $index ? ' is-active' : ' is-after'; ?>"
          href="<?php echo esc_url( $item['url'] ); ?>"
          data-product-index="<?php echo esc_attr( (string) $index ); ?>"
          aria-label="<?php echo esc_attr( 'Découvrir ' . $item['name'] ); ?>"
        >
          <?php if ( $item['image'] ) : ?>
            <img
              class="collection-product__image"
              src="<?php echo esc_url( $item['image'] ); ?>"
              <?php if ( $item['srcset'] ) : ?>srcset="<?php echo esc_attr( $item['srcset'] ); ?>"<?php endif; ?>
              sizes="(max-width: 760px) calc(100vw - 36px), min(66vw, 1050px)"
              alt="<?php echo esc_attr( $item['name'] ); ?>"
              <?php echo 0 === $index ? 'fetchpriority="high"' : 'loading="lazy"'; ?>
            >
          <?php endif; ?>
          <span class="collection-product__number"><?php echo esc_html( str_pad( (string) ( $index + 1 ), 2, '0', STR_PAD_LEFT ) ); ?></span>
          <div class="collection-product__content">
            <div>
              <h2 class="collection-product__name"><?php echo esc_html( $item['name'] ); ?></h2>
              <p class="collection-product__description">
                <?php echo esc_html( $item['description'] ?: 'Une pièce Eclipse sculpturale, pensée pour affirmer sa propre trajectoire.' ); ?>
              </p>
            </div>
            <div class="collection-product__aside">
              <span class="collection-product__price"><?php echo esc_html( $item['price'] ); ?></span>
              <span class="collection-product__action">Voir la pièce</span>
            </div>
          </div>
        </a>
      <?php endforeach; ?>
    </div>

    <aside class="collection-progress" aria-hidden="true">
      <span class="collection-progress__count">
        <span id="collectionActiveNumber">01</span> / <?php echo esc_html( str_pad( (string) $product_count, 2, '0', STR_PAD_LEFT ) ); ?>
      </span>
      <span class="collection-progress__track">
        <span class="collection-progress__fill" id="collectionProgress"></span>
      </span>
      <span class="collection-progress__hint">Défiler<br>pour explorer</span>
    </aside>

    <p class="collection-current" aria-live="polite">
      Pièce actuelle — <strong id="collectionActiveName"><?php echo esc_html( $products[0]['name'] ); ?></strong>
    </p>
  <?php else : ?>
    <div class="collection-empty">
      <p>
        Cette collection se prépare.
        <br>
        <a href="<?php echo esc_url( wc_get_page_permalink( 'shop' ) ); ?>">Retour aux collections</a>
      </p>
    </div>
  <?php endif; ?>
</main>

<?php if ( $products ) : ?>
<script>
(()=>{
  const rail=document.getElementById('collectionRail');
  const cards=[...rail.querySelectorAll('[data-product-index]')];
  const number=document.getElementById('collectionActiveNumber');
  const name=document.getElementById('collectionActiveName');
  const progress=document.getElementById('collectionProgress');
  const productNames=<?php echo wp_json_encode( array_column( $products, 'name' ), JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES ); ?>;
  let activeIndex=-1;
  let frame=0;

  const activate=index=>{
    if(index===activeIndex&&cards[index].classList.contains('is-active'))return;
    activeIndex=index;
    cards.forEach((card,cardIndex)=>{
      card.classList.toggle('is-active',cardIndex===index);
      card.classList.toggle('is-before',cardIndex<index);
      card.classList.toggle('is-after',cardIndex>index);
      card.setAttribute('aria-current',cardIndex===index?'true':'false');
    });
    number.textContent=String(index+1).padStart(2,'0');
    name.textContent=productNames[index]||'';
    progress.style.setProperty('--progress',(index+1)/cards.length);
  };

  const measure=()=>{
    frame=0;
    const center=rail.getBoundingClientRect().top+rail.clientHeight/2;
    let nearest=0;
    let nearestDistance=Infinity;
    cards.forEach((card,index)=>{
      const rect=card.getBoundingClientRect();
      const distance=Math.abs(rect.top+rect.height/2-center);
      if(distance<nearestDistance){
        nearestDistance=distance;
        nearest=index;
      }
    });
    activate(nearest);
  };

  rail.addEventListener('scroll',()=>{
    if(!frame)frame=requestAnimationFrame(measure);
  },{passive:true});

  cards.forEach((card,index)=>{
    card.addEventListener('click',event=>{
      if(index===activeIndex)return;
      event.preventDefault();
      card.scrollIntoView({
        behavior:matchMedia('(prefers-reduced-motion: reduce)').matches?'auto':'smooth',
        block:'center'
      });
    });
  });

  window.addEventListener('resize',measure,{passive:true});
  activate(0);
})();
</script>
<?php endif; ?>

<?php wp_footer(); ?>
</body>
</html>
