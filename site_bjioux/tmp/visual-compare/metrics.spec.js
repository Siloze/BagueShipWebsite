const { test } = require('@playwright/test');
const fs = require('fs');

test.use({ viewport: { width: 1920, height: 1080 } });

test('capture Eclipse home metrics', async ({ page }) => {
  await page.context().addCookies([{
    name: 'bagueship_cookie_consent',
    value: 'accepted',
    domain: '127.0.0.1',
    path: '/',
  }]);
  await page.goto('http://127.0.0.1:8080/', { waitUntil: 'networkidle' });
  await page.emulateMedia({ reducedMotion: 'reduce' });
  await page.screenshot({ path: '/work/home-clean.png' });

  const selectors = [
    '.eclipse-home',
    '.home-nav',
    '.wordmark',
    '.hero-kicker',
    '.hero-title',
    '.hero-description',
    '.universe-link',
    '.eclipse-mark',
    '.collection-index',
  ];
  const metrics = await page.evaluate((wantedSelectors) => {
    const result = {
      viewport: { width: innerWidth, height: innerHeight },
      document: {
        scrollWidth: document.documentElement.scrollWidth,
        scrollHeight: document.documentElement.scrollHeight,
        bodyScrollHeight: document.body.scrollHeight,
      },
      elements: {},
    };
    for (const selector of wantedSelectors) {
      const element = document.querySelector(selector);
      if (!element) continue;
      const box = element.getBoundingClientRect();
      const styles = getComputedStyle(element);
      result.elements[selector] = {
        x: box.x,
        y: box.y,
        width: box.width,
        height: box.height,
        fontFamily: styles.fontFamily,
        fontSize: styles.fontSize,
        lineHeight: styles.lineHeight,
      };
    }
    return result;
  }, selectors);
  fs.writeFileSync('/work/metrics.json', JSON.stringify(metrics, null, 2));
});
