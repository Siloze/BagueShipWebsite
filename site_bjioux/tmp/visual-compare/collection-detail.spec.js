const { test, expect } = require('@playwright/test');

const setup = async page => {
  await page.route('http://localhost:8080/**', async route => {
    const response = await route.fetch({
      url: route.request().url().replace('localhost', 'host.docker.internal'),
    });
    await route.fulfill({
      response,
      headers: { ...response.headers(), 'access-control-allow-origin': '*' },
    });
  });
};

test('collection cards open the immersive Origin detail', async ({ page }) => {
  await setup(page);
  await page.setViewportSize({ width: 1512, height: 870 });

  await page.goto('http://host.docker.internal:8080/boutique/', { waitUntil: 'networkidle' });
  const originLink = page.locator('.collection-card').filter({ hasText: 'Origin' }).first();
  await expect(originLink).toHaveAttribute('href', /product-category\/origin/);
  await originLink.click();
  await expect(page).toHaveURL(/product-category\/origin\/?$/);

  const cards = page.locator('.collection-product');
  await expect(cards).toHaveCount(4);
  await expect(page.locator('.collection-title')).toHaveText('Origin');

  const firstBox = await cards.nth(0).boundingBox();
  expect(firstBox.height).toBeGreaterThan(600);
  expect(firstBox.width).toBeGreaterThan(900);
  await expect(cards.nth(0)).toHaveClass(/is-active/);

  const activeImageFilter = await cards.nth(0).evaluate(el => getComputedStyle(el).filter);
  expect(activeImageFilter).toBe('none');

  await cards.nth(0).hover();
  await page.waitForTimeout(550);
  const overlayOpacity = await cards.nth(0).locator('.collection-product__content').evaluate(el => Number(getComputedStyle(el).opacity));
  expect(overlayOpacity).toBeGreaterThan(.9);

  await cards.nth(1).click();
  await expect(cards.nth(1)).toHaveClass(/is-active/, { timeout: 2500 });
  await expect(page.locator('#collectionActiveNumber')).toHaveText('02');
  await expect(page).toHaveURL(/product-category\/origin\/?$/);
  await page.waitForTimeout(900);
  expect(await cards.nth(1).evaluate(el => getComputedStyle(el).filter)).toBe('none');

  await page.screenshot({
    path: '/work/collection-origin-macbook.png',
    fullPage: false,
  });

  await expect(cards.nth(1)).toHaveAttribute('href', /product\/flamme\/?$/);
  await page.unrouteAll({ behavior: 'ignoreErrors' });
});

test('collection detail stays usable on mobile', async ({ page }) => {
  await setup(page);
  await page.setViewportSize({ width: 390, height: 844 });
  await page.goto('http://host.docker.internal:8080/product-category/origin/', { waitUntil: 'networkidle' });

  const metrics = await page.evaluate(() => ({
    bodyWidth: document.body.scrollWidth,
    viewportWidth: innerWidth,
    overlayOpacity: Number(getComputedStyle(document.querySelector('.collection-product__content')).opacity),
    cardHeight: document.querySelector('.collection-product').getBoundingClientRect().height,
  }));

  expect(metrics.bodyWidth).toBeLessThanOrEqual(metrics.viewportWidth);
  expect(metrics.overlayOpacity).toBe(1);
  expect(metrics.cardHeight).toBeGreaterThan(520);

  await page.screenshot({
    path: '/work/collection-origin-mobile.png',
    fullPage: false,
  });
  await page.unrouteAll({ behavior: 'ignoreErrors' });
});
