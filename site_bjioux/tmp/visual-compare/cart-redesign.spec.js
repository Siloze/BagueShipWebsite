const { test, expect } = require('@playwright/test');

async function prepare(page) {
  await page.context().addCookies([{
    name: 'bagueship_cookie_consent',
    value: 'accepted',
    domain: 'localhost',
    path: '/',
  }]);
  await page.route('http://localhost:8080/**', async route => {
    const response = await route.fetch({
      url: route.request().url().replace('localhost:8080', 'wordpress'),
    });
    await route.fulfill({
      response,
      headers: {
        ...response.headers(),
        'access-control-allow-origin': '*',
      },
    });
  });
}

test('cart uses product artwork and Eclipse editorial layout', async ({ browser }) => {
  const context = await browser.newContext({ viewport: { width: 1512, height: 982 } });
  const page = await context.newPage();
  await prepare(page);

  await page.goto('http://localhost:8080/?add-to-cart=288', { waitUntil: 'networkidle' });
  await page.goto('http://localhost:8080/panier/', { waitUntil: 'networkidle' });
  await page.evaluate(() => document.fonts.ready);

  await expect(page.locator('.cart-item')).toHaveCount(1);
  await expect(page.locator('.cart-item__name')).toContainText('GOTH');
  await expect(page.locator('model-viewer')).toHaveCount(0);
  await expect(page.locator('.cart-item__media img')).toBeVisible();
  await expect(page.locator('.cart-summary__title')).toContainText('RÉCAPITULATIF');

  const desktop = await page.evaluate(() => {
    const image = document.querySelector('.cart-item__media img');
    const shell = document.querySelector('.cart-shell').getBoundingClientRect();
    const content = document.querySelector('.cart-content').getBoundingClientRect();
    const summary = document.querySelector('.cart-summary').getBoundingClientRect();
    return {
      imageNaturalWidth: image.naturalWidth,
      imageNaturalHeight: image.naturalHeight,
      shellWidth: shell.width,
      contentWidth: content.width,
      summaryWidth: summary.width,
      overflow: document.documentElement.scrollWidth - innerWidth,
    };
  });
  expect(desktop.imageNaturalWidth).toBeGreaterThan(500);
  expect(desktop.imageNaturalHeight).toBeGreaterThan(500);
  expect(desktop.summaryWidth).toBeGreaterThan(450);
  expect(desktop.overflow).toBe(0);
  await page.screenshot({ path: '/work/cart-redesign-desktop.png', fullPage: true });

  await page.setViewportSize({ width: 390, height: 844 });
  await page.reload({ waitUntil: 'networkidle' });
  await page.evaluate(() => document.fonts.ready);
  const mobile = await page.evaluate(() => ({
    overflow: document.documentElement.scrollWidth - innerWidth,
    imageVisible: document.querySelector('.cart-item__media img').getBoundingClientRect().height > 0,
    summaryBelowContent:
      document.querySelector('.cart-summary').getBoundingClientRect().top >=
      document.querySelector('.cart-content').getBoundingClientRect().bottom - 1,
  }));
  expect(mobile).toEqual({ overflow: 0, imageVisible: true, summaryBelowContent: true });
  await page.screenshot({ path: '/work/cart-redesign-mobile.png', fullPage: true });

  await page.unrouteAll({ behavior: 'ignoreErrors' });
  await context.close();
});

test('empty cart keeps the same art direction', async ({ browser }) => {
  const context = await browser.newContext({ viewport: { width: 1512, height: 982 } });
  const page = await context.newPage();
  await prepare(page);
  await page.goto('http://localhost:8080/panier/', { waitUntil: 'networkidle' });
  await page.evaluate(() => document.fonts.ready);
  await expect(page.locator('.cart-shell.is-empty')).toBeVisible();
  await expect(page.locator('.cart-empty-art img')).toBeVisible();
  await expect(page.locator('model-viewer')).toHaveCount(0);
  await page.screenshot({ path: '/work/cart-empty-desktop.png', fullPage: true });
  await page.unrouteAll({ behavior: 'ignoreErrors' });
  await context.close();
});
