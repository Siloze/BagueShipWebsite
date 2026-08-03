const { test } = require('@playwright/test');
const fs = require('fs');

test.use({ viewport: { width: 1530, height: 1012 } });

test('capture Eclipse product detail', async ({ page }) => {
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
  await page.goto('http://host.docker.internal:8080/product/abstract-openwork-cuff/', { waitUntil: 'networkidle' });
  await page.emulateMedia({ reducedMotion: 'reduce' });
  await page.evaluate(() => document.fonts.ready);
  await page.screenshot({ path: '/work/detail-reference.png' });
  const metrics = await page.evaluate(() => {
    const box = (selector) => {
      const element = document.querySelector(selector);
      if (!element) return null;
      const rect = element.getBoundingClientRect();
      return { x: rect.x, y: rect.y, width: rect.width, height: rect.height };
    };
    return {
      viewport: { width: innerWidth, height: innerHeight },
      document: {
        scrollWidth: document.documentElement.scrollWidth,
        scrollHeight: document.documentElement.scrollHeight,
      },
      fonts: {
        displayReady: document.fonts.check('64px "Eclipse Display"'),
        titleFamily: getComputedStyle(document.querySelector('.product-title')).fontFamily,
      },
      top: box('.product-top'),
      nav: box('.product-nav'),
      wordmark: box('.wordmark'),
      price: box('.product-price'),
      media: box('.product-media'),
      info: box('.product-info'),
      recommendations: box('.recommendations'),
      relatedCount: document.querySelectorAll('.related-card').length,
      cartForm: Boolean(document.querySelector('#cartForm')),
      visualStyles: {
        navDisplay: getComputedStyle(document.querySelector('.product-nav')).display,
        navOpacity: getComputedStyle(document.querySelector('.product-nav')).opacity,
        navZIndex: getComputedStyle(document.querySelector('.product-nav')).zIndex,
        wordmarkColor: getComputedStyle(document.querySelector('.wordmark')).color,
        priceColor: getComputedStyle(document.querySelector('.product-price')).color,
        priceOpacity: getComputedStyle(document.querySelector('.product-price')).opacity,
      },
    };
  });
  fs.writeFileSync('/work/detail-metrics.json', JSON.stringify(metrics, null, 2));

  await page.setViewportSize({ width: 1512, height: 870 });
  await page.reload({ waitUntil: 'networkidle' });
  await page.evaluate(() => document.fonts.ready);
  await page.screenshot({ path: '/work/detail-mac-desktop.png' });
  const macMetrics = await page.evaluate(() => {
    const prices = [...document.querySelectorAll('.related-price')].map(element => {
      const rect = element.getBoundingClientRect();
      return { top: rect.top, bottom: rect.bottom, text: element.textContent.trim() };
    });
    return {
      viewportHeight: innerHeight,
      scrollHeight: document.documentElement.scrollHeight,
      recommendationTop: document.querySelector('.recommendations').getBoundingClientRect().top,
      prices,
    };
  });
  fs.writeFileSync('/work/detail-mac-metrics.json', JSON.stringify(macMetrics, null, 2));
  if (!macMetrics.prices.every(price => price.bottom <= macMetrics.viewportHeight)) {
    throw new Error(`Recommendation prices exceed viewport: ${JSON.stringify(macMetrics.prices)}`);
  }
});
