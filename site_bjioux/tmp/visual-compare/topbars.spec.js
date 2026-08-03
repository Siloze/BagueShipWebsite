const { test, expect } = require('@playwright/test');
const fs = require('fs');

test.use({ viewport: { width: 1512, height: 870 } });

test('topbars share the exact Eclipse geometry', async ({ page }) => {
  await page.context().addCookies([{
    name: 'bagueship_cookie_consent',
    value: 'accepted',
    domain: 'host.docker.internal',
    path: '/',
  }]);
  await page.route('http://localhost:8080/**', async route => {
    const response = await route.fetch({
      url: route.request().url().replace('localhost', 'host.docker.internal'),
    });
    await route.fulfill({
      response,
      headers: {
        ...response.headers(),
        'access-control-allow-origin': '*',
      },
    });
  });

  const readTopbar = async (path, selectors) => {
    await page.goto(`http://host.docker.internal:8080${path}`, { waitUntil: 'networkidle' });
    await page.evaluate(() => document.fonts.ready);
    return page.evaluate((selectors) => {
      const box = selector => {
        const rect = document.querySelector(selector).getBoundingClientRect();
        const style = getComputedStyle(document.querySelector(selector));
        return {
          x: rect.x,
          y: rect.y,
          width: rect.width,
          height: rect.height,
          fontSize: style.fontSize,
          letterSpacing: style.letterSpacing,
          fontFamily: style.fontFamily,
          fontWeight: style.fontWeight,
          lineHeight: style.lineHeight,
        };
      };
      return {
        nav: box(selectors.nav),
        brand: box(selectors.brand),
        links: box(selectors.links),
        cart: box(selectors.cart),
      };
    }, selectors);
  };

  const collection = await readTopbar('/boutique/', {
    nav: '.collections-nav',
    brand: '.wordmark',
    links: '.main-links',
    cart: '.cart-link',
  });
  const jewels = await readTopbar('/bijoux/', {
    nav: '.jewels-nav',
    brand: '.jewels-wordmark',
    links: '.jewels-nav__links',
    cart: '.jewels-cart',
  });
  const about = await readTopbar('/promesse/', {
    nav: '.nav',
    brand: '.brand',
    links: '.nav-links',
    cart: '.cart-link',
  });

  const geometry = item => ({
    navHeight: item.nav.height,
    brandX: item.brand.x,
    brandY: item.brand.y,
    brandFont: item.brand.fontSize,
    brandTracking: item.brand.letterSpacing,
    linksX: item.links.x,
    linksY: item.links.y,
    linksFont: item.links.fontSize,
    cartX: item.cart.x,
    cartY: item.cart.y,
    cartFont: item.cart.fontSize,
  });

  fs.writeFileSync('/work/topbars-metrics.json', JSON.stringify({ collection, jewels, about }, null, 2));
  expect(geometry(jewels)).toEqual(geometry(collection));
  expect(geometry(about)).toEqual(geometry(collection));
  await page.screenshot({ path: '/work/about-topbar-aligned.png' });
});
