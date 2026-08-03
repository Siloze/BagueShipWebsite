const { test, expect } = require('@playwright/test');
const fs = require('fs');

const openHome = async page => {
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
};

test('home scroll transition and catalogue', async ({ page }) => {
  await page.setViewportSize({ width: 1512, height: 870 });
  await openHome(page);

  const initial = await page.evaluate(() => {
    const mark = document.querySelector('.eclipse-mark');
    const rect = mark.getBoundingClientRect();
    return {
      scrollHeight: document.documentElement.scrollHeight,
      viewportHeight: innerHeight,
      cards: document.querySelectorAll('.home-jewel-card').length,
      markTop: rect.top,
      markTransform: getComputedStyle(mark).transform,
      columns: getComputedStyle(document.querySelector('.home-jewels-grid')).gridTemplateColumns.split(' ').length,
    };
  });

  expect(initial.scrollHeight).toBeGreaterThan(initial.viewportHeight * 1.5);
  expect(initial.cards).toBeGreaterThan(0);
  expect(initial.columns).toBe(4);
  await page.screenshot({ path: '/work/home-scroll-top.png', fullPage: false });

  await page.evaluate(() => scrollTo(0, innerHeight * .58));
  await page.waitForTimeout(250);
  const moved = await page.evaluate(() => {
    const mark = document.querySelector('.eclipse-mark');
    return {
      top: mark.getBoundingClientRect().top,
      transform: getComputedStyle(mark).transform,
    };
  });
  expect(moved.top).toBeLessThan(initial.markTop);
  expect(moved.transform).not.toBe(initial.markTransform);

  await page.locator('[data-home-jewels]').scrollIntoViewIfNeeded();
  await page.waitForTimeout(800);
  await page.screenshot({ path: '/work/home-scroll-catalogue-desktop.png', fullPage: false });

  const visibleCards = await page.locator('.home-jewel-card.is-visible').count();
  expect(visibleCards).toBe(initial.cards);

  await page.setViewportSize({ width: 390, height: 844 });
  await page.reload({ waitUntil: 'networkidle' });
  await page.evaluate(() => document.fonts.ready);
  await page.locator('[data-home-jewels]').scrollIntoViewIfNeeded();
  await page.waitForTimeout(800);

  const mobile = await page.evaluate(() => ({
    columns: getComputedStyle(document.querySelector('.home-jewels-grid')).gridTemplateColumns.split(' ').length,
    overflowX: document.documentElement.scrollWidth - document.documentElement.clientWidth,
    cards: document.querySelectorAll('.home-jewel-card').length,
  }));
  expect(mobile.columns).toBe(2);
  expect(mobile.overflowX).toBe(0);
  expect(mobile.cards).toBe(initial.cards);
  await page.screenshot({ path: '/work/home-scroll-catalogue-mobile.png', fullPage: false });

  fs.writeFileSync('/work/home-scroll-catalogue-metrics.json', JSON.stringify({ initial, moved, mobile }, null, 2));
});
