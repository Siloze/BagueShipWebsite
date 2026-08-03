<?php
/**
 * Template Name: Catalogue bijoux Eclipse
 */

if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

$shop_url   = function_exists( 'wc_get_page_permalink' ) ? wc_get_page_permalink( 'shop' ) : home_url( '/boutique/' );
$about_url  = function_exists( 'bagueship_page_url' ) ? bagueship_page_url( 'promesse' ) : home_url( '/promesse/' );
$cart_url   = function_exists( 'wc_get_cart_url' ) ? wc_get_cart_url() : home_url( '/panier/' );
$cart_count = function_exists( 'WC' ) && WC()->cart ? WC()->cart->get_cart_contents_count() : 0;
$jewels = function_exists( 'bagueship_get_catalogue_jewels' ) ? bagueship_get_catalogue_jewels() : array();

$jewel_type_labels = array(
    'bagues'    => 'Bagues',
    'colliers'  => 'Colliers',
    'bracelets' => 'Bracelets',
    'boucles'   => 'Boucles d’oreilles',
);
$available_jewel_types = array_values( array_unique( array_column( $jewels, 'type' ) ) );
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bijoux — Eclipse</title>
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
    --paper:#fff;
    --ink:#080808;
    --muted:#747474;
    --line:#d9d9d9;
    --night:#050505;
    --edge:clamp(30px,3.85vw,74px);
    --font:"Eclipse Sans","Helvetica Neue",Arial,sans-serif;
  }
  *{box-sizing:border-box}
  html,body{margin:0;min-height:100%;background:var(--paper)}
  body.eclipse-jewels-body{
    color:var(--ink);
    background:var(--paper);
    font-family:var(--font);
    font-weight:500;
    -webkit-font-smoothing:antialiased;
    overflow-x:hidden;
  }
  body.eclipse-jewels-body .woocommerce-store-notice,
  body.eclipse-jewels-body #cookie-law-info-bar,
  body.eclipse-jewels-body .cky-consent-container{display:none!important}
  a{color:inherit;text-decoration:none}
  button,select{font:inherit;color:inherit}
  .screen-reader-text{
    position:absolute!important;width:1px;height:1px;padding:0;margin:-1px;
    overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;border:0;
  }
  .jewels-page{
    width:100%;
    min-height:100svh;
    padding:0 var(--edge) 52px;
    background:var(--paper);
  }

  .jewels-nav{
    height:118px;
    display:grid;
    grid-template-columns:minmax(210px,1fr) auto minmax(210px,1fr);
    align-items:center;
  }
  .jewels-wordmark{
    justify-self:start;
    font-size:clamp(16px,1.25vw,24px);
    font-weight:700;
    letter-spacing:.42em;
    line-height:1;
  }
  .jewels-nav__links{
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
  .jewels-nav__links a{
    position:relative;
    padding:14px 0;
    white-space:nowrap;
  }
  .jewels-nav__links a:last-child{margin-left:8px}
  .jewels-nav__links a::after{
    content:"";
    position:absolute;
    left:0;right:0;
    bottom:7px;
    height:1px;
    background:currentColor;
    transform:scaleX(0);
    transform-origin:left;
    transition:transform .35s cubic-bezier(.16,1,.3,1);
  }
  .jewels-nav__links a:hover::after,
  .jewels-nav__links a.is-active::after{transform:scaleX(1)}
  .jewels-cart{
    position:relative;
    grid-column:3;
    justify-self:end;
    padding:14px 0;
    text-transform:uppercase;
    font-size:clamp(10px,.76vw,14px);
    font-weight:700;
    letter-spacing:.075em;
    white-space:nowrap;
  }

  .jewels-title{
    margin:13px 0 33px;
    font-family:"Eclipse Display","Arial Narrow",sans-serif;
    font-size:64px;
    font-weight:400;
    line-height:.94;
    letter-spacing:.012em;
    text-transform:uppercase;
  }
  .catalogue-toolbar{
    min-height:55px;
    display:flex;
    align-items:flex-start;
    justify-content:space-between;
    gap:28px;
    margin-bottom:8px;
  }
  .catalogue-filters{
    display:flex;
    align-items:flex-start;
    gap:55px;
    min-width:0;
  }
  .filter-button,
  .utility-button{
    position:relative;
    display:inline-flex;
    align-items:center;
    gap:10px;
    min-height:34px;
    padding:0 5px 8px;
    border:0;
    background:none;
    font-size:12px;
    font-weight:700;
    line-height:1;
    letter-spacing:.07em;
    text-transform:uppercase;
    white-space:nowrap;
    cursor:pointer;
  }
  .filter-button::after{
    content:"";
    position:absolute;
    left:5px;right:5px;bottom:0;
    height:2px;
    background:var(--ink);
    transform:scaleX(0);
    transform-origin:left;
    transition:transform .22s ease;
  }
  .filter-button:hover::after,
  .filter-button.is-active::after{transform:scaleX(1)}
  .chevron{
    width:8px;height:8px;
    border-right:1.5px solid currentColor;
    border-bottom:1.5px solid currentColor;
    transform:translateY(-2px) rotate(45deg);
  }
  .filter-mark{
    width:14px;height:14px;
    display:grid;
    grid-template-columns:repeat(3,1px);
    justify-content:space-around;
    align-items:center;
  }
  .filter-mark i{
    position:relative;
    width:1px;height:12px;
    background:currentColor;
  }
  .filter-mark i::after{
    content:"";
    position:absolute;
    left:-2px;
    width:5px;height:2px;
    background:currentColor;
  }
  .filter-mark i:nth-child(1)::after{top:3px}
  .filter-mark i:nth-child(2)::after{top:7px}
  .filter-mark i:nth-child(3)::after{top:1px}
  .sort-control{
    position:relative;
    flex:0 0 auto;
    margin-top:1px;
  }
  .sort-control select{
    height:33px;
    padding:0 24px 7px 4px;
    border:0;
    border-radius:0;
    background:transparent;
    appearance:none;
    font-size:12px;
    font-weight:700;
    letter-spacing:.07em;
    text-transform:uppercase;
    cursor:pointer;
  }
  .sort-control .chevron{
    position:absolute;
    right:3px;top:9px;
    pointer-events:none;
  }

  .jewels-grid{
    display:grid;
    grid-template-columns:repeat(4,minmax(0,1fr));
    column-gap:33px;
    row-gap:45px;
  }
  .jewel-card{
    min-width:0;
    opacity:1;
    transform:translateY(0);
    transition:opacity .26s ease,transform .35s cubic-bezier(.2,.75,.25,1);
  }
  .jewel-card[hidden]{display:none}
  .jewel-card.is-entering{
    opacity:0;
    transform:translateY(12px);
  }
  .jewel-media{
    position:relative;
    display:block;
    width:100%;
    aspect-ratio:1.42 / 1;
    overflow:hidden;
    background:
      radial-gradient(circle at 50% 46%,rgba(255,255,255,.025),transparent 31%),
      #050505;
  }
  .jewel-media::after{
    content:"";
    position:absolute;
    inset:0;
    border:1px solid rgba(255,255,255,.025);
    transition:background .35s ease;
  }
  .jewel-media img{
    display:block;
    width:100%;
    height:100%;
    object-fit:cover;
    object-position:center 44%;
    transition:transform .7s cubic-bezier(.16,1,.3,1),filter .4s ease;
  }
  .jewel-card:nth-child(n+5) .jewel-media{aspect-ratio:1.3 / 1}
  .jewel-card:hover .jewel-media img{transform:scale(1.025);filter:brightness(1.06)}
  .jewel-card:hover .jewel-media::after{background:rgba(255,255,255,.035)}
  .jewel-meta{
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
  .jewel-name{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
  .jewel-price{flex:0 0 auto;white-space:nowrap}
  .load-more-wrap{
    display:flex;
    justify-content:center;
    padding-top:77px;
  }
  .load-more{
    display:inline-flex;
    align-items:center;
    gap:31px;
    padding:10px 13px;
    border:0;
    background:transparent;
    font-size:12px;
    font-weight:700;
    letter-spacing:.07em;
    text-transform:uppercase;
    cursor:pointer;
  }
  .load-more span:last-child{
    font-size:28px;
    font-weight:400;
    line-height:.7;
  }
  .load-more[hidden]{display:none}

  /* MacBook and other short desktop viewports: keep the complete catalogue
     composition, including "Charger plus", inside the visible screen. */
  @media (min-width:761px) and (max-height:950px){
    .jewels-page{padding-bottom:20px}
    .jewels-title{
      margin:6px 0 19px;
      font-size:53px;
    }
    .catalogue-toolbar{
      min-height:45px;
      margin-bottom:5px;
    }
    .jewels-grid{row-gap:25px}
    .jewel-media{aspect-ratio:1.62 / 1}
    .jewel-card:nth-child(n+5) .jewel-media{aspect-ratio:1.5 / 1}
    .load-more-wrap{padding-top:24px}
  }

  @media(min-width:901px) and (min-aspect-ratio:16/10){
    .jewels-nav{height:92px}
    .jewels-wordmark{font-size:20px}
    .jewels-nav__links,.jewels-cart{font-size:12px}
  }

  @media (max-width:1180px){
    .catalogue-toolbar{display:block}
    .catalogue-filters{
      overflow-x:auto;
      gap:30px;
      padding-bottom:8px;
      scrollbar-width:none;
    }
    .catalogue-filters::-webkit-scrollbar{display:none}
    .sort-control{display:table;margin:8px 0 0 auto}
    .jewels-grid{grid-template-columns:repeat(3,minmax(0,1fr))}
  }
  @media (max-width:900px){
    :root{--edge:20px}
    .jewels-nav{
      height:105px;
      grid-template-columns:1fr auto;
    }
    .jewels-wordmark{font-size:14px}
    .jewels-nav__links{
      left:20px;
      right:20px;
      top:67px;
      justify-content:space-between;
      gap:14px;
      font-size:9px;
    }
    .jewels-cart{font-size:9px}
  }
  @media (max-width:760px){
    .jewels-wordmark{font-size:14px}
    .jewels-nav__links{font-size:10px}
    .jewels-cart{font-size:10px}
    .jewels-title{margin:25px 0 28px;font-size:52px}
    .catalogue-toolbar{margin-right:calc(var(--edge) * -1)}
    .catalogue-filters{padding-right:var(--edge)}
    .sort-control{margin-right:var(--edge)}
    .jewels-grid{grid-template-columns:repeat(2,minmax(0,1fr));gap:27px 12px}
    .jewel-media{aspect-ratio:1 / 1.08}
    .jewel-meta{display:block;font-size:10px;padding-top:8px}
    .jewel-name,.jewel-price{display:block}
    .jewel-price{margin-top:5px;color:var(--muted)}
    .load-more-wrap{padding-top:45px}
  }
</style>
</head>
<body <?php body_class( 'eclipse-jewels-body' ); ?>>
<?php wp_body_open(); ?>
<?php
echo bagueship_eclipse_topbar(
    array(
        'active'      => 'jewels',
        'brand_color' => '#080808',
        'items_color' => '#080808',
        'cart_color'  => '#080808',
    )
);
?>

<main class="jewels-page">
  <h1 class="jewels-title">Bijoux</h1>

  <section class="catalogue-toolbar" aria-label="Filtres du catalogue">
    <div class="catalogue-filters" role="group" aria-label="Type de bijou">
      <button class="filter-button is-active" type="button" data-filter="all" aria-pressed="true">Tous</button>
      <?php foreach ( $jewel_type_labels as $type_slug => $type_label ) : ?>
        <?php if ( in_array( $type_slug, $available_jewel_types, true ) ) : ?>
          <button class="filter-button" type="button" data-filter="<?php echo esc_attr( $type_slug ); ?>" aria-pressed="false"><?php echo esc_html( $type_label ); ?></button>
        <?php endif; ?>
      <?php endforeach; ?>
      <button class="utility-button" type="button" data-material-toggle aria-expanded="false">Matière <span class="chevron" aria-hidden="true"></span></button>
      <button class="utility-button" type="button" data-filter-toggle aria-expanded="false">Filtres <span class="filter-mark" aria-hidden="true"><i></i><i></i><i></i></span></button>
    </div>
    <label class="sort-control">
      <span class="screen-reader-text">Trier les bijoux</span>
      <select data-sort>
        <option value="featured">Tri : sélection</option>
        <option value="price-asc">Tri : prix croissant</option>
        <option value="price-desc">Tri : prix décroissant</option>
        <option value="name">Tri : nom</option>
      </select>
      <span class="chevron" aria-hidden="true"></span>
    </label>
  </section>

  <section class="jewels-grid" aria-live="polite" aria-label="Tous les bijoux">
    <?php foreach ( $jewels as $index => $jewel ) : ?>
      <article
        class="jewel-card"
        data-jewel
        data-type="<?php echo esc_attr( $jewel['type'] ); ?>"
        data-price="<?php echo esc_attr( (string) $jewel['raw_price'] ); ?>"
        data-name="<?php echo esc_attr( strtolower( $jewel['name'] ) ); ?>"
        data-date="<?php echo esc_attr( (string) $jewel['date'] ); ?>"
        data-order="<?php echo esc_attr( (string) $jewel['order'] ); ?>"
        <?php echo $index >= 8 ? 'hidden' : ''; ?>
      >
        <a class="jewel-media" href="<?php echo esc_url( $jewel['url'] ); ?>" aria-label="<?php echo esc_attr( $jewel['name'] ); ?>">
          <?php if ( $jewel['image'] ) : ?>
            <img src="<?php echo esc_url( $jewel['image'] ); ?>" alt="<?php echo esc_attr( $jewel['name'] ); ?>">
          <?php endif; ?>
        </a>
        <a class="jewel-meta" href="<?php echo esc_url( $jewel['url'] ); ?>">
          <span class="jewel-name"><?php echo esc_html( $jewel['name'] ); ?></span>
          <?php if ( '' !== $jewel['price'] ) : ?>
            <span class="jewel-price"><?php echo esc_html( $jewel['price'] ); ?></span>
          <?php endif; ?>
        </a>
      </article>
    <?php endforeach; ?>
  </section>

  <div class="load-more-wrap">
    <button class="load-more" type="button" data-load-more>
      <span>Charger plus</span><span aria-hidden="true">+</span>
    </button>
  </div>
</main>

<script>
(() => {
  document.body.classList.add('eclipse-jewels-body');

  const grid = document.querySelector('.jewels-grid');
  const cards = [...document.querySelectorAll('[data-jewel]')];
  const filters = [...document.querySelectorAll('[data-filter]')];
  const sort = document.querySelector('[data-sort]');
  const more = document.querySelector('[data-load-more]');
  let activeFilter = 'all';
  let visibleLimit = 8;

  const filteredCards = () => cards.filter(card => activeFilter === 'all' || card.dataset.type === activeFilter);

  const compare = (a, b) => {
    switch (sort.value) {
      case 'price-asc':
        return Number(a.dataset.price) - Number(b.dataset.price);
      case 'price-desc':
        return Number(b.dataset.price) - Number(a.dataset.price);
      case 'name':
        return a.dataset.name.localeCompare(b.dataset.name, 'fr');
      default:
        return Number(a.dataset.order) - Number(b.dataset.order) || Number(b.dataset.date) - Number(a.dataset.date);
    }
  };

  const render = (animate = false) => {
    const matches = filteredCards().sort(compare);
    cards.forEach(card => card.hidden = true);
    matches.forEach((card, index) => {
      grid.append(card);
      if (index < visibleLimit) {
        card.hidden = false;
        if (animate) {
          card.classList.add('is-entering');
          requestAnimationFrame(() => requestAnimationFrame(() => card.classList.remove('is-entering')));
        }
      }
    });
    more.hidden = matches.length <= visibleLimit;
  };

  filters.forEach(button => {
    button.addEventListener('click', () => {
      activeFilter = button.dataset.filter;
      visibleLimit = 8;
      filters.forEach(item => {
        const selected = item === button;
        item.classList.toggle('is-active', selected);
        item.setAttribute('aria-pressed', selected ? 'true' : 'false');
      });
      render(true);
    });
  });

  sort.addEventListener('change', () => render(true));
  more.addEventListener('click', () => {
    visibleLimit += 4;
    render(true);
  });

  render();
})();
</script>
<?php wp_footer(); ?>
</body>
</html>
