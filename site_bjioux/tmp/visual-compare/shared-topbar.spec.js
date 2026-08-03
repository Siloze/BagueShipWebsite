const { test, expect } = require('@playwright/test');
const fs = require('fs');

test.use({ viewport: { width: 1512, height: 870 } });

test('all Eclipse pages use the shared topbar', async ({ page }) => {
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

  const routes = [
    ['home', '/'],
    ['collections', '/boutique/'],
    ['collectionDetail', '/product-category/origin/'],
    ['jewels', '/bijoux/'],
    ['about', '/promesse/'],
    ['product', '/product/big/'],
    ['cart', '/panier/'],
  ];
  const results = {};

  for (const [name, path] of routes) {
    await page.goto(`http://host.docker.internal:8080${path}`, { waitUntil: 'networkidle' });
    await page.evaluate(() => document.fonts.ready);
    results[name] = await page.evaluate(() => {
      const read = selector => {
        const element = document.querySelector(selector);
        const rect = element.getBoundingClientRect();
        const style = getComputedStyle(element);
        return {
          x: rect.x,
          y: rect.y,
          width: rect.width,
          height: rect.height,
          color: style.color,
          fontSize: style.fontSize,
        };
      };
      return {
        count: document.querySelectorAll('.eclipse-site-nav').length,
        nav: read('.eclipse-site-nav'),
        brand: read('.eclipse-site-nav__brand'),
        links: read('.eclipse-site-nav__links'),
        cart: read('.eclipse-site-nav__cart'),
        active: document.querySelector('.eclipse-site-nav .is-active')?.textContent.trim() || '',
      };
    });
  }

  const geometry = result => ({
    navHeight: result.nav.height,
    brandX: result.brand.x,
    brandY: result.brand.y,
    brandFont: result.brand.fontSize,
    linksX: result.links.x,
    linksY: result.links.y,
    linksFont: result.links.fontSize,
    cartY: result.cart.y,
    cartFont: result.cart.fontSize,
    cartRight: Math.round((1512 - result.cart.x - result.cart.width) * 1000) / 1000,
  });

  for (const result of Object.values(results)) {
    expect(result.count).toBe(1);
    expect(geometry(result)).toEqual(geometry(results.collections));
  }
  expect(results.collections.active).toBe('Collection');
  expect(results.collectionDetail.active).toBe('Collection');
  expect(results.jewels.active).toBe('Bijoux');
  expect(results.about.active).toBe('À propos');
  expect(results.product.active).toBe('Bijoux');
  expect(results.cart.active).toBe('Panier (0)');

  await page.screenshot({ path: '/work/cart-shared-topbar-desktop.png' });
  await page.setViewportSize({ width: 390, height: 844 });
  await page.reload({ waitUntil: 'networkidle' });
  await page.screenshot({ path: '/work/cart-shared-topbar-mobile.png' });
  const mobile = await page.evaluate(() => ({
    navHeight: document.querySelector('.eclipse-site-nav').getBoundingClientRect().height,
    brandFont: getComputedStyle(document.querySelector('.eclipse-site-nav__brand')).fontSize,
    linksFont: getComputedStyle(document.querySelector('.eclipse-site-nav__links')).fontSize,
    cartFont: getComputedStyle(document.querySelector('.eclipse-site-nav__cart')).fontSize,
  }));
  expect(mobile).toEqual({
    navHeight: 105,
    brandFont: '14px',
    linksFont: '10px',
    cartFont: '10px',
  });

  fs.writeFileSync('/work/shared-topbar-metrics.json', JSON.stringify({ results, mobile }, null, 2));
});
