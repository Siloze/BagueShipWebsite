const { test, expect } = require('@playwright/test');
const fs = require('fs');

test.use({ viewport: { width: 390, height: 844 } });

test('Eclipse home has a dedicated mobile composition', async ({ page }) => {
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
  await page.goto('http://host.docker.internal:8080/index.php', { waitUntil: 'networkidle' });
  await page.evaluate(() => document.fonts.ready);
  await page.screenshot({ path: '/work/home-mobile-refonte.png' });

  const metrics = await page.evaluate(() => {
    const box = selector => {
      const rect = document.querySelector(selector).getBoundingClientRect();
      return { x: rect.x, y: rect.y, width: rect.width, height: rect.height, bottom: rect.bottom };
    };
    return {
      viewport: { width: innerWidth, height: innerHeight },
      document: {
        width: document.documentElement.scrollWidth,
        height: document.documentElement.scrollHeight,
      },
      hero: box('.hero-content'),
      title: box('.hero-title'),
      description: box('.hero-description'),
      mark: box('.eclipse-mark'),
      collections: box('.collection-index'),
      collectionCount: document.querySelectorAll('.collection-link').length,
    };
  });

  expect(metrics.document).toEqual(metrics.viewport);
  expect(metrics.title.width).toBeLessThanOrEqual(metrics.viewport.width - 40);
  expect(metrics.description.bottom).toBeLessThan(metrics.hero.bottom);
  expect(metrics.collectionCount).toBe(3);
  fs.writeFileSync('/work/home-mobile-refonte-metrics.json', JSON.stringify(metrics, null, 2));
});
