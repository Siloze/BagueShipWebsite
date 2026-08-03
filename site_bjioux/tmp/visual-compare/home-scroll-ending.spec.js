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

test('home reveals jewels upward and docks the logo above the footer', async ({ page }) => {
  await setup(page);
  await page.setViewportSize({ width: 1512, height: 870 });
  await page.goto('http://host.docker.internal:8080/', { waitUntil: 'networkidle' });

  const jewels = page.locator('[data-home-jewels]');
  const firstCard = page.locator('.home-jewel-card').first();
  await expect(firstCard).toHaveCount(1);

  await page.evaluate(() => window.scrollTo({ top: innerHeight * .9, behavior: 'instant' }));
  await expect(jewels).toHaveClass(/is-entered/);
  await page.waitForTimeout(220);
  await page.screenshot({ path: '/work/home-jewels-entering.png', fullPage: false });

  const catalogueGap = await page.evaluate(() => {
    const grid = document.querySelector('.home-jewels-grid').getBoundingClientRect();
    const closing = document.querySelector('[data-home-closing]').getBoundingClientRect();
    return closing.top - grid.bottom;
  });
  expect(catalogueGap).toBeLessThan(90);

  await page.locator('[data-home-closing]').scrollIntoViewIfNeeded();
  await page.evaluate(() => window.scrollTo({ top: document.documentElement.scrollHeight, behavior: 'instant' }));
  await page.waitForTimeout(1100);

  const ending = await page.evaluate(() => {
    const closingMark = document.querySelector('.home-closing__mark');
    const heroMark = document.querySelector('.eclipse-mark');
    return {
      closingOpacity: Number(getComputedStyle(closingMark).opacity),
      closingFilter: getComputedStyle(closingMark).filter,
      heroOpacity: Number(getComputedStyle(heroMark).opacity),
      bodyWidth: document.body.scrollWidth,
      viewportWidth: innerWidth,
    };
  });

  expect(ending.closingOpacity).toBeGreaterThan(.95);
  expect(['none', 'blur(0px)']).toContain(ending.closingFilter);
  expect(ending.heroOpacity).toBeLessThan(.05);
  expect(ending.bodyWidth).toBeLessThanOrEqual(ending.viewportWidth);
  await expect(page.locator('.home-footer')).toBeVisible();

  await page.screenshot({ path: '/work/home-closing-macbook.png', fullPage: false });
});

test('new home ending remains balanced on mobile', async ({ page }) => {
  await setup(page);
  await page.setViewportSize({ width: 390, height: 844 });
  await page.goto('http://host.docker.internal:8080/', { waitUntil: 'networkidle' });
  await page.evaluate(() => window.scrollTo({ top: document.documentElement.scrollHeight, behavior: 'instant' }));
  await page.waitForTimeout(900);

  const metrics = await page.evaluate(() => ({
    bodyWidth: document.body.scrollWidth,
    viewportWidth: innerWidth,
    footerVisible: document.querySelector('.home-footer').getBoundingClientRect().bottom <= innerHeight + 1,
  }));

  expect(metrics.bodyWidth).toBeLessThanOrEqual(metrics.viewportWidth);
  expect(metrics.footerVisible).toBeTruthy();
  await page.screenshot({ path: '/work/home-closing-mobile.png', fullPage: false });
});
