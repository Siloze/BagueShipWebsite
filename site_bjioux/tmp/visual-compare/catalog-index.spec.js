const { test, expect } = require('@playwright/test');
const fs = require('fs');

test.use({ viewport: { width: 1512, height: 870 } });

test('collections and jewels mirror WooCommerce data', async ({ page }) => {
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

  await page.goto('http://host.docker.internal:8080/boutique/', { waitUntil: 'networkidle' });
  const collections = await page.locator('.collection-card').evaluateAll(cards => cards.map(card => ({
    name: card.querySelector('.card-title').textContent.trim(),
    count: card.querySelector('.card-count').textContent.trim(),
    href: card.href,
  })));
  expect(collections.map(item => item.name)).toEqual(['Abstract', 'Finger', 'Coming soon']);
  expect(collections.map(item => item.count)).toEqual(['2 pièces', '2 pièces', '—']);
  expect(collections.slice(0, 2).every(item => item.href.includes('/product-category/'))).toBe(true);
  await page.screenshot({ path: '/work/collections-live-data.png' });

  await page.goto('http://host.docker.internal:8080/bijoux/', { waitUntil: 'networkidle' });
  const jewels = await page.locator('[data-jewel]').evaluateAll(cards => cards.map(card => ({
    name: card.querySelector('.jewel-name').textContent.trim(),
    price: card.querySelector('.jewel-price')?.textContent.trim() || '',
    href: card.querySelector('.jewel-media').href,
    type: card.dataset.type,
  })));
  expect(jewels.map(item => item.name)).toEqual([
    'Abstract Openwork Cuff',
    'Wavy Silver Cuff',
    'Chrome Embrace',
    'Curved Bar Silver Ring',
  ]);
  expect(jewels).toHaveLength(4);
  expect(jewels.every(item => item.price && item.href.includes('/product/') && item.type === 'bagues')).toBe(true);
  await expect(page.locator('[data-load-more]')).toBeHidden();
  await expect(page.locator('[data-filter]')).toHaveCount(2);
  await page.screenshot({ path: '/work/bijoux-live-data.png' });

  await page.goto('http://host.docker.internal:8080/', { waitUntil: 'networkidle' });
  const homeCollections = await page.locator('.collection-name').allTextContents();
  expect(homeCollections.map(name => name.trim())).toEqual(['Abstract', 'Finger', 'Coming soon']);

  fs.writeFileSync('/work/catalog-index-metrics.json', JSON.stringify({ collections, jewels, homeCollections }, null, 2));
});
