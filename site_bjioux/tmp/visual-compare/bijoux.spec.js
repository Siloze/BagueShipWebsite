const { test, expect } = require('@playwright/test');
const fs = require('fs');

test.use({ viewport: { width: 1530, height: 1012 } });

test('capture Eclipse jewellery catalogue', async ({ page }) => {
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
  await page.goto('http://host.docker.internal:8080/bijoux/', { waitUntil: 'networkidle' });
  await page.emulateMedia({ reducedMotion: 'reduce' });
  await page.evaluate(() => document.fonts.ready);
  await page.screenshot({ path: '/work/bijoux-reference.png' });

  const metrics = await page.evaluate(() => {
    const box = (selector) => {
      const element = document.querySelector(selector);
      if (!element) return null;
      const rect = element.getBoundingClientRect();
      return { x: rect.x, y: rect.y, width: rect.width, height: rect.height };
    };
    return {
      url: location.href,
      viewport: { width: innerWidth, height: innerHeight },
      document: {
        scrollWidth: document.documentElement.scrollWidth,
        scrollHeight: document.documentElement.scrollHeight,
      },
      fonts: {
        displayReady: document.fonts.check('64px "Eclipse Display"'),
        titleFamily: getComputedStyle(document.querySelector('.jewels-title')).fontFamily,
      },
      nav: box('.jewels-nav'),
      title: box('.jewels-title'),
      toolbar: box('.catalogue-toolbar'),
      grid: box('.jewels-grid'),
      firstCard: box('.jewel-card:not([hidden])'),
      media: box('.jewel-card:not([hidden]) .jewel-media'),
      loadMore: box('.load-more'),
      visibleCards: [...document.querySelectorAll('[data-jewel]')].filter(card => !card.hidden).length,
      totalCards: document.querySelectorAll('[data-jewel]').length,
      activeNav: document.querySelector('.jewels-nav__links .is-active')?.textContent.trim(),
    };
  });

  expect(metrics.visibleCards).toBe(8);
  expect(metrics.activeNav).toBe('Bijoux');
  fs.writeFileSync('/work/bijoux-metrics.json', JSON.stringify(metrics, null, 2));

  await page.locator('[data-filter="colliers"]').click();
  await expect(page.locator('[data-jewel]:visible')).toHaveCount(2);
  await page.locator('[data-filter="all"]').click();
  await page.locator('[data-load-more]').click();
  await expect(page.locator('[data-jewel]:visible')).toHaveCount(12);
  await page.locator('[data-sort]').selectOption('price-asc');
  await expect(page.locator('[data-jewel]:visible').first()).toHaveAttribute('data-price', '109');

  await page.setViewportSize({ width: 1512, height: 870 });
  await page.reload({ waitUntil: 'networkidle' });
  await page.evaluate(() => document.fonts.ready);
  await page.screenshot({ path: '/work/bijoux-mac-desktop.png' });
  const macMetrics = await page.evaluate(() => ({
    viewportHeight: innerHeight,
    scrollHeight: document.documentElement.scrollHeight,
    loadMore: (() => {
      const rect = document.querySelector('[data-load-more]').getBoundingClientRect();
      return { top: rect.top, bottom: rect.bottom, hidden: document.querySelector('[data-load-more]').hidden };
    })(),
  }));
  expect(macMetrics.scrollHeight).toBeLessThanOrEqual(macMetrics.viewportHeight);
  expect(macMetrics.loadMore.bottom).toBeLessThanOrEqual(macMetrics.viewportHeight);
  fs.writeFileSync('/work/bijoux-mac-metrics.json', JSON.stringify(macMetrics, null, 2));
});
