<?php
if ( ! defined( 'ABSPATH' ) ) { exit; }
$bagueship_promise_model = '';
$bagueship_promise_product = get_page_by_path( 'abstract-openwork-cuff', OBJECT, 'product' );
if ( $bagueship_promise_product && function_exists( 'bagueship_product_model_url' ) ) {
    $bagueship_promise_model = bagueship_product_model_url( (int) $bagueship_promise_product->ID );
}
if ( ! $bagueship_promise_model ) {
    $bagueship_promise_model_path = get_stylesheet_directory() . '/assets/models/abstract-openwork-cuff.glb';
    if ( file_exists( $bagueship_promise_model_path ) ) {
        $bagueship_promise_model = add_query_arg(
            'v',
            (string) filemtime( $bagueship_promise_model_path ),
            get_stylesheet_directory_uri() . '/assets/models/abstract-openwork-cuff.glb'
        );
    }
}
$bagueship_promise_environment = function_exists( 'bagueship_steel_environment_url' ) ? bagueship_steel_environment_url() : 'legacy';
$bagueship_shop_url = function_exists( 'wc_get_page_permalink' ) ? wc_get_page_permalink( 'shop' ) : home_url( '/boutique/' );
$bagueship_jewels_url = function_exists( 'bagueship_page_url' ) ? bagueship_page_url( 'bijoux' ) : home_url( '/bijoux/' );
$bagueship_cart_url = function_exists( 'wc_get_cart_url' ) ? wc_get_cart_url() : home_url( '/panier/' );
$bagueship_cart_count = function_exists( 'WC' ) && WC()->cart ? WC()->cart->get_cart_contents_count() : 0;
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
  <meta charset="<?php bloginfo( 'charset' ); ?>">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Notre promesse — Eclipse</title>
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
      --bg:#020202;--panel:#070707;--ink:#f7f7f7;--dim:#a3a3a3;--faint:#6f6f6f;
      --line:rgba(255,255,255,.14);--soft:rgba(255,255,255,.075);
      --ease:cubic-bezier(.16,1,.3,1);
      --font:"Eclipse Sans","Helvetica Neue",Arial,sans-serif;
      --display:"Eclipse Display","Arial Narrow",sans-serif;
      --edge:clamp(28px,3.85vw,74px);
    }
    *{box-sizing:border-box;margin:0;padding:0}
    html{background:var(--bg);scroll-behavior:smooth;overflow-x:clip}
    body.eclipse-about-body{background:var(--bg);color:var(--ink);font-family:var(--font);font-weight:500;-webkit-font-smoothing:antialiased;overflow-x:clip}
    a{color:inherit;text-decoration:none}.screen-reader-text{position:absolute;width:1px;height:1px;overflow:hidden;clip:rect(0,0,0,0)}
    .nav{
      position:fixed;inset:0 0 auto;z-index:80;
      height:118px;
      display:grid;
      grid-template-columns:minmax(210px,1fr) auto minmax(210px,1fr);
      align-items:center;
      padding:0 var(--edge);
      background:rgba(2,2,2,.96);
      isolation:isolate;
      transform:translateZ(0);
      color:var(--ink);
      font-family:var(--font);
      font-size:16px;
    }
    .nav>*{position:relative;z-index:1}
    .nav .brand{display:block;justify-self:start;gap:0;font-size:clamp(16px,1.25vw,24px);font-weight:700;letter-spacing:.42em;line-height:1}
    .nav-links{
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
    .nav-links a{position:relative;padding:14px 0;white-space:nowrap}
    .nav-links a:last-child{margin-left:8px}
    .nav-links a:after{
      content:"";position:absolute;left:0;right:0;bottom:7px;height:1px;
      background:currentColor;transform:scaleX(0);transform-origin:left;
      transition:transform .35s var(--ease);
    }
    .nav-links a:hover:after,.nav-links a.is-active:after{transform:scaleX(1)}
    .nav .cart-link{
      display:block;
      grid-column:3;
      justify-self:end;
      padding:14px 0;
      text-transform:uppercase;
      font-size:clamp(10px,.76vw,14px);
      font-weight:700;
      letter-spacing:.075em;
      white-space:nowrap;
    }

    .promise-hero{min-height:112svh;display:grid;place-items:center;text-align:center;padding:15vh 22px 18vh;position:relative;overflow:hidden}
    .promise-hero:before{
      content:"";position:absolute;width:min(72vw,960px);aspect-ratio:1;border-radius:50%;
      border:1px solid rgba(255,255,255,.11);
      background:radial-gradient(circle,rgba(255,255,255,.075),rgba(255,255,255,.018) 43%,transparent 70%);
      filter:blur(.1px);animation:breathe 7s ease-in-out infinite;
    }
    @keyframes breathe{50%{transform:scale(1.08);opacity:.72}}
    .hero-copy{position:relative;z-index:2;max-width:1120px}.eyebrow{color:var(--faint);font-size:10px;font-weight:700;letter-spacing:.24em;text-transform:uppercase}
    .hero-copy h1{margin-top:24px;font-family:var(--display);font-size:clamp(84px,14vw,190px);font-weight:400;letter-spacing:.005em;line-height:.88;text-transform:uppercase}
    .hero-copy p{max-width:610px;margin:38px auto 0;color:var(--dim);font-size:clamp(14px,1.35vw,18px);line-height:1.6;text-wrap:balance}
    .scroll-cue{position:absolute;bottom:34px;left:50%;transform:translateX(-50%);color:var(--faint);font-size:9px;letter-spacing:.3em;text-transform:uppercase}.scroll-cue:after{content:"";display:block;width:1px;height:48px;margin:14px auto -34px;background:linear-gradient(var(--faint),transparent)}

    .material-story{height:330vh;position:relative}.material-sticky{position:sticky;top:0;height:100svh;overflow:hidden;display:grid;grid-template-columns:1fr 1fr;align-items:center;padding:70px max(22px,7vw) 34px}
    .material-sticky:before{content:"";position:absolute;inset:0;background:radial-gradient(50% 60% at 72% 50%,rgba(255,255,255,.085),transparent 70%)}
    .material-copy{position:relative;z-index:4;max-width:580px}.material-step{position:absolute;left:0;top:50%;width:100%;opacity:0;transform:translateY(calc(-50% + 44px));transition:opacity .18s linear}
    .material-step h2{margin-top:18px;font-family:var(--display);font-size:clamp(62px,8vw,116px);line-height:.8;letter-spacing:.01em;font-weight:400;text-transform:uppercase}.material-step p{margin-top:26px;max-width:48ch;color:var(--dim);font-size:clamp(14px,1.25vw,17px);line-height:1.65}
    .material-index{color:var(--faint);font-size:10px;font-weight:700;letter-spacing:.2em}.material-model{position:relative;z-index:2;grid-column:2;width:min(62vw,720px);height:min(74vw,760px);justify-self:center;filter:drop-shadow(0 30px 50px #000)}
    .material-model model-viewer{width:100%;height:100%;--poster-color:transparent;background:transparent}
    .alloy{position:absolute;right:var(--edge);bottom:38px;z-index:4;text-align:right}.alloy strong{display:block;font-family:var(--display);font-size:clamp(66px,9vw,128px);font-weight:400;line-height:.75;letter-spacing:.01em}.alloy span{display:block;margin-top:15px;color:var(--faint);font-size:9px;font-weight:700;letter-spacing:.2em;text-transform:uppercase}

    .statement{padding:22vh var(--edge);border-top:1px solid var(--soft)}.statement-inner{max-width:1260px;margin:auto}.statement blockquote{font-family:var(--display);font-size:clamp(58px,8vw,116px);font-weight:400;letter-spacing:.01em;line-height:.91;max-width:14ch;text-transform:uppercase}.statement blockquote span{color:var(--faint)}.statement p{margin:42px 0 0 auto;max-width:470px;color:var(--dim);font-size:15px;line-height:1.7}

    .controls{padding:5vh var(--edge) 20vh}.controls-head{max-width:1260px;margin:0 auto 9vh}.controls-head h2{margin-top:20px;max-width:13ch;font-family:var(--display);font-size:clamp(62px,8vw,112px);font-weight:400;line-height:.86;letter-spacing:.01em;text-transform:uppercase}
    .control-list{max-width:1260px;margin:auto;border-top:1px solid var(--line)}.control{display:grid;grid-template-columns:90px .8fr 1.2fr;gap:28px;padding:42px 0;border-bottom:1px solid var(--line);align-items:start}.control-num{color:var(--faint);font-size:10px;font-weight:700;letter-spacing:.2em}.control h3{font-size:clamp(21px,2vw,30px);letter-spacing:-.02em}.control p{color:var(--dim);font-size:14px;line-height:1.7;max-width:48ch}

    .proofs{padding:17vh var(--edge);background:#050505;border-block:1px solid var(--soft)}.proof-grid{max-width:1260px;margin:auto;display:grid;grid-template-columns:repeat(3,1fr)}.proof{min-height:310px;padding:38px;border-right:1px solid var(--line);display:flex;flex-direction:column;justify-content:space-between}.proof:last-child{border:0}.proof strong{font-family:var(--display);font-size:clamp(68px,8vw,118px);font-weight:400;letter-spacing:.01em;line-height:.85}.proof h3{font-size:18px;margin-bottom:12px}.proof p{color:var(--dim);font-size:14px;line-height:1.6}
    .promise-close{text-align:center;padding:22vh 22px 24vh}.promise-close h2{font-family:var(--display);font-size:clamp(80px,12vw,170px);font-weight:400;line-height:.76;letter-spacing:.01em;text-transform:uppercase}.promise-close p{margin:28px auto 0;color:var(--dim);font-size:15px}.promise-close a{display:inline-flex;align-items:center;height:52px;margin-top:38px;padding:0 30px;border:1px solid var(--ink);border-radius:0;background:var(--ink);color:#050505;font-size:11px;font-weight:700;letter-spacing:.12em;text-transform:uppercase;transition:background .3s var(--ease),color .3s var(--ease)}.promise-close a:hover{background:transparent;color:var(--ink)}
    .reveal{opacity:0;transform:translateY(38px);transition:opacity 1s var(--ease),transform 1s var(--ease)}.reveal.in{opacity:1;transform:none}
    body.eclipse-about-body .bagueship-footer{margin-top:0;background:#020202;font-family:var(--font)}

    /* Restrained editorial scale for desktop. The scroll choreography stays
       unchanged while the content no longer overwhelms a laptop screen. */
    @media(min-width:901px){
      .promise-hero{padding-top:13vh;padding-bottom:14vh}
      .promise-hero:before{width:min(58vw,760px)}
      .hero-copy{max-width:900px}
      .hero-copy h1{font-size:clamp(72px,8.5vw,128px);line-height:.92}
      .hero-copy p{
        max-width:560px;
        margin-top:30px;
        font-size:14px;
        line-height:1.65;
      }
      .material-sticky{padding-inline:max(22px,8vw)}
      .material-copy{max-width:500px}
      .material-step h2{font-size:clamp(52px,5vw,76px);line-height:.84}
      .material-step p{
        margin-top:20px;
        max-width:45ch;
        font-size:14px;
        line-height:1.6;
      }
      .material-model{
        width:min(34vw,480px);
        height:min(42vw,540px);
      }
      .alloy strong{font-size:clamp(52px,5.4vw,80px)}
      .alloy span{margin-top:10px}
      .statement{padding-block:14vh}
      .statement-inner{max-width:1120px}
      .statement blockquote{font-size:clamp(48px,5.2vw,78px);line-height:.94}
      .statement p{margin-top:32px;font-size:14px}
      .controls{padding-top:3vh;padding-bottom:14vh}
      .controls-head{max-width:1120px;margin-bottom:6vh}
      .controls-head h2{font-size:clamp(50px,5.2vw,78px);line-height:.9}
      .control-list{max-width:1120px}
      .control{grid-template-columns:70px .8fr 1.2fr;padding:32px 0}
      .control h3{font-size:clamp(19px,1.7vw,26px)}
      .control p{font-size:13px}
      .proofs{padding-block:12vh}
      .proof-grid{max-width:1120px}
      .proof{min-height:250px;padding:30px}
      .proof strong{font-size:clamp(54px,5vw,76px)}
      .proof h3{font-size:16px}
      .proof p{font-size:13px}
      .promise-close{padding-top:15vh;padding-bottom:17vh}
      .promise-close h2{font-size:clamp(68px,7.5vw,110px);line-height:.8}
      .promise-close p{font-size:14px}
    }

    @media(min-width:901px) and (min-aspect-ratio:16/10){
      .nav{height:92px}
      .nav .brand{font-size:20px}
      .nav-links,.nav .cart-link{font-size:12px}
    }
    @media(max-width:900px){
      :root{--edge:20px}
      .nav{height:105px;grid-template-columns:1fr auto;padding:0 var(--edge)}
      .nav .brand{font-size:14px}
      .nav-links{
        left:var(--edge);right:var(--edge);top:67px;
        justify-content:space-between;gap:14px;font-size:10px;
      }
      .nav .cart-link{font-size:10px}
    }
    @media(max-width:700px){
      .promise-hero{min-height:100svh}.hero-copy h1{font-size:clamp(64px,25vw,105px)}.hero-copy p{margin-top:34px}
      .material-sticky{display:block;padding:70px 22px 32px}.material-copy{height:43%;}.material-step{top:50%}.material-step h2{font-size:clamp(43px,14vw,68px)}.material-step p{font-size:15px}.material-model{position:absolute;left:50%;bottom:3%;transform:translateX(-50%);width:100vw;height:55vh}.alloy{bottom:24px}.alloy strong{font-size:58px}
      .statement{padding-block:16vh}.statement p{margin-left:0}.control{grid-template-columns:42px 1fr}.control p{grid-column:2}.proof-grid{grid-template-columns:1fr}.proof{min-height:250px;border-right:0;border-bottom:1px solid var(--line);padding:32px 0}
    }
    @media(max-width:560px){
      :root{--edge:20px}
      .nav{height:105px}
      .nav .brand{font-size:14px;letter-spacing:.32em}
      .nav-links{top:67px;font-size:10px;letter-spacing:.055em}
      .nav .cart-link{font-size:10px}
    }
    @media(prefers-reduced-motion:reduce){*{animation:none!important;scroll-behavior:auto!important}.reveal{opacity:1;transform:none;transition:none}.material-story{height:auto}.material-sticky{position:relative;min-height:150vh}.material-step{position:relative;top:auto;transform:none;opacity:1;margin:10vh 0}}
  </style>
</head>
<body <?php body_class( 'bagueship-promise eclipse-about-body' ); ?>>
<?php wp_body_open(); ?>
<?php
echo bagueship_eclipse_topbar(
    array(
        'active'      => 'about',
        'position'    => 'fixed',
        'brand_color' => '#f7f7f7',
        'items_color' => '#f7f7f7',
        'cart_color'  => '#f7f7f7',
        'background'  => 'rgba(2,2,2,.96)',
    )
);
?>

<main>
  <header class="promise-hero">
    <div class="hero-copy">
      <div class="eyebrow">La promesse Eclipse</div>
      <h1>L'acier.<br>Sans détour.</h1>
      <p>Un bijou que l'on garde doit résister à la vie réelle. Nous avons choisi un matériau franc, contrôlé chaque pièce et retiré tout le reste.</p>
    </div>
    <div class="scroll-cue">Découvrir</div>
  </header>

  <section class="material-story" id="matiere">
    <div class="material-sticky">
      <div class="material-copy">
        <article class="material-step" data-step="0">
          <div class="material-index">01 · LA MATIÈRE</div>
          <h2>316L.<br>Rien à cacher.</h2>
          <p>Un acier inoxydable chirurgical choisi pour sa stabilité. Hypoallergénique, dense et résistant à la corrosion, il ne ternit pas et ne rouille pas.</p>
        </article>
        <article class="material-step" data-step="1">
          <div class="material-index">02 · LE GESTE</div>
          <h2>Sculpté,<br>puis fini.</h2>
          <p>Chaque volume est usiné avec précision, puis repris à la main. Les surfaces mates retiennent l'ombre ; les arêtes polies attrapent la lumière.</p>
        </article>
        <article class="material-step" data-step="2">
          <div class="material-index">03 · LE PORT</div>
          <h2>Fait pour<br>rester.</h2>
          <p>Le métal supporte l'eau, la chaleur et le quotidien. Une matière froide au premier contact, qui prend ensuite votre température et votre histoire.</p>
        </article>
      </div>
      <?php if ( $bagueship_promise_model ) : ?>
        <div class="material-model">
          <model-viewer id="promiseModel" src="<?php echo esc_url( $bagueship_promise_model ); ?>" alt="Bijou Eclipse en acier 316L" loading="eager" reveal="auto" camera-orbit="25deg 70deg 118%" environment-image="<?php echo esc_attr( $bagueship_promise_environment ); ?>" tone-mapping="aces" exposure=".84" shadow-intensity="1.25" shadow-softness=".55" interaction-prompt="none"></model-viewer>
        </div>
      <?php endif; ?>
      <div class="alloy"><strong>316L</strong><span>Acier chirurgical</span></div>
    </div>
  </section>

  <section class="statement">
    <div class="statement-inner">
      <blockquote class="reveal">La beauté ne suffit pas. <span>La pièce doit tenir sa promesse.</span></blockquote>
      <p class="reveal">Nous produisons en séries courtes pour regarder chaque bijou comme une pièce unique : sa géométrie, son confort et sa finition, avant qu'il ne quitte l'atelier.</p>
    </div>
  </section>

  <section class="controls">
    <header class="controls-head reveal"><div class="eyebrow">Avant l'envoi</div><h2>Quatre contrôles. Une seule signature.</h2></header>
    <div class="control-list">
      <article class="control reveal"><div class="control-num">01</div><h3>Inspection</h3><p>Examinée à la loupe, défaut par défaut. Géométrie, jonctions et arêtes sont contrôlées sous plusieurs angles.</p></article>
      <article class="control reveal"><div class="control-num">02</div><h3>Test de port</h3><p>Portée et sollicitée pendant 72 heures pour valider sa tenue, son confort et sa résistance dans des conditions réelles.</p></article>
      <article class="control reveal"><div class="control-num">03</div><h3>Finition contrôlée</h3><p>Brossage et facettes vérifiés sous lumière rasante, puis nettoyage aux ultrasons pour une surface nette, sans compromis.</p></article>
      <article class="control reveal"><div class="control-num">04</div><h3>Scellée &amp; numérotée</h3><p>Emballée à la main, scellée et accompagnée de son certificat individuel avant son départ.</p></article>
    </div>
  </section>

  <section class="proofs">
    <div class="proof-grid">
      <article class="proof reveal"><strong>72h</strong><div><h3>Testée au porté</h3><p>Pour vérifier l'équilibre et le confort, pas seulement l'apparence.</p></div></article>
      <article class="proof reveal"><strong>316L</strong><div><h3>Acier chirurgical</h3><p>Hypoallergénique, stable, résistant à l'eau et à la corrosion.</p></div></article>
      <article class="proof reveal"><strong>01/01</strong><div><h3>Contrôle individuel</h3><p>Chaque pièce est inspectée, nettoyée, scellée et certifiée.</p></div></article>
    </div>
  </section>

  <section class="promise-close">
    <div class="eyebrow reveal">La suite vous appartient</div>
    <h2 class="reveal">Porter<br>la matière.</h2>
    <p class="reveal">Des bijoux conçus pour traverser les années.</p>
    <a class="reveal" href="<?php echo esc_url( $bagueship_jewels_url ); ?>">Voir tous les bijoux</a>
  </section>
</main>

<?php echo bagueship_footer_markup(); ?>
<script>
(()=>{
  const story=document.querySelector('.material-story');
  const steps=[...document.querySelectorAll('.material-step')];
  const model=document.getElementById('promiseModel');
  const clamp=(n,a=0,b=1)=>Math.min(b,Math.max(a,n));
  const update=()=>{
    if(!story||matchMedia('(prefers-reduced-motion: reduce)').matches)return;
    const rect=story.getBoundingClientRect();
    const progress=clamp(-rect.top/Math.max(1,story.offsetHeight-innerHeight));
    steps.forEach((step,index)=>{
      const center=index/(steps.length-1);
      const distance=Math.abs(progress-center);
      const opacity=clamp(1-distance*4.2);
      step.style.opacity=opacity;
      step.style.transform=`translateY(calc(-50% + ${(progress-center)*-70}px))`;
    });
    if(model) model.setAttribute('camera-orbit',`${25+progress*290}deg ${70-progress*12}deg ${118-progress*12}%`);
  };
  let ticking=false;
  addEventListener('scroll',()=>{if(!ticking){ticking=true;requestAnimationFrame(()=>{update();ticking=false})}},{passive:true});
  addEventListener('resize',update);
  update();
  const io=new IntersectionObserver(entries=>entries.forEach(entry=>{if(entry.isIntersecting){entry.target.classList.add('in');io.unobserve(entry.target)}}),{threshold:.14});
  document.querySelectorAll('.reveal').forEach(el=>io.observe(el));
})();
</script>
<?php wp_footer(); ?>
</body>
</html>
