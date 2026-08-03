const { test } = require('@playwright/test');
const fs = require('fs');

test.use({ viewport: { width: 1780, height: 1180 } });

test('capture Eclipse collections page', async ({ page }) => {
  await page.context().addCookies([{
    name: 'bagueship_cookie_consent',
    value: 'accepted',
    domain: 'localhost',
    path: '/',
  }]);
  await page.goto('http://localhost:8080/boutique/', { waitUntil: 'networkidle' });
  await page.emulateMedia({ reducedMotion: 'reduce' });
  await page.screenshot({ path: '/work/collections-reference.png' });
  const metrics = await page.evaluate(() => {
    const box = (selector) => {
      const element = document.querySelector(selector);
      if (!element) return null;
      const rect = element.getBoundingClientRect();
      return {
        x: rect.x,
        y: rect.y,
        width: rect.width,
        height: rect.height,
      };
    };
    return {
      viewport: { width: innerWidth, height: innerHeight },
      document: {
        scrollWidth: document.documentElement.scrollWidth,
        scrollHeight: document.documentElement.scrollHeight,
      },
      cardCount: document.querySelectorAll('.collection-card').length,
      fonts: {
        displayReady: document.fonts.check('72px "Eclipse Display"'),
        titleFamily: getComputedStyle(document.querySelector('.collections-title')).fontFamily,
        titleSize: getComputedStyle(document.querySelector('.collections-title')).fontSize,
        cardFamily: getComputedStyle(document.querySelector('.card-title')).fontFamily,
      },
      intro: box('.collections-intro'),
      grid: box('.collection-grid'),
      card: box('.collection-card'),
      bottomLink: box('.all-collections'),
    };
  });
  fs.writeFileSync('/work/collections-metrics.json', JSON.stringify(metrics, null, 2));
});
