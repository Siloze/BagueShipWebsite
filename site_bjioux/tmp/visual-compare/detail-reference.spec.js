const { test, expect } = require('@playwright/test');
const fs = require('fs');

const setup = async page => {
  await page.route('http://localhost:8080/**', async route => {
    const response = await route.fetch({
      url: route.request().url().replace('localhost', 'host.docker.internal'),
    });
    await route.fulfill({ response, headers: { ...response.headers(), 'access-control-allow-origin': '*' } });
  });
};

const readMetrics = async page => page.evaluate(() => {
  const box = selector => {
    const element = document.querySelector(selector);
    const rect = element.getBoundingClientRect();
    return { x: rect.x, y: rect.y, width: rect.width, height: rect.height, right: rect.right, bottom: rect.bottom };
  };
  const image = document.querySelector('.product-main-image');
  return {
    viewport: { width: innerWidth, height: innerHeight },
    top: box('.product-top'),
    media: box('.product-media'),
    stage: box('.product-image-stage'),
    mainImage: box('.product-main-image'),
    mainImageStyle: {
      width: getComputedStyle(image).width,
      height: getComputedStyle(image).height,
      objectFit: getComputedStyle(image).objectFit,
    },
    firstThumb: box('.media-thumb'),
    collectionLabel: box('.product-collection-label'),
    features: box('.product-features'),
    purchase: box('.purchase-area'),
    price: box('.product-price'),
    recommendations: box('.recommendations'),
    firstRelated: box('.related-card'),
    firstRelatedMedia: box('.related-media'),
    firstRelatedPrice: box('.related-price'),
    relatedColumns: getComputedStyle(document.querySelector('.related-grid')).gridTemplateColumns,
  };
});

test('product detail follows detail.png proportions', async ({ page }) => {
  await setup(page);
  const results = {};

  for (const viewport of [
    { name: 'reference', width: 1530, height: 1012 },
    { name: 'macbook', width: 1512, height: 870 },
  ]) {
    await page.setViewportSize(viewport);
    await page.goto('http://host.docker.internal:8080/product/big/', { waitUntil: 'networkidle' });
    await page.evaluate(() => document.fonts.ready);
    results[viewport.name] = await readMetrics(page);
    await page.screenshot({ path: `/work/detail-${viewport.name}-comparison.png`, fullPage: false });
  }

  expect(results.reference.top.height).toBeGreaterThan(680);
  expect(results.reference.top.height).toBeLessThan(700);
  expect(results.reference.stage.width).toBeGreaterThan(results.reference.stage.height);
  expect(results.reference.firstThumb.width).toBeGreaterThanOrEqual(118);
  expect(results.reference.firstRelated.width).toBeGreaterThan(285);
  expect(results.reference.firstRelated.width).toBeLessThan(310);
  expect(results.reference.firstRelatedMedia.height).toBeLessThan(180);

  expect(results.macbook.top.height).toBe(630);
  const macbookEdgeGaps = [
    results.macbook.stage.x - results.macbook.firstThumb.right,
    results.macbook.media.right - results.macbook.stage.right,
    results.macbook.media.bottom - results.macbook.stage.bottom,
  ];
  expect(Math.max(...macbookEdgeGaps) - Math.min(...macbookEdgeGaps)).toBeLessThan(2);
  expect(results.macbook.stage.y - results.macbook.media.y).toBeGreaterThan(Math.max(...macbookEdgeGaps) + 30);
  expect(results.macbook.firstThumb.y).toBeGreaterThanOrEqual(145);
  expect(results.macbook.collectionLabel.y).toBeGreaterThanOrEqual(70);
  expect(results.macbook.purchase.right).toBeLessThan(results.macbook.price.x);
  expect(results.macbook.purchase.y - results.macbook.features.bottom).toBeGreaterThanOrEqual(44);
  expect(results.macbook.firstRelatedMedia.width).toBeLessThan(315);
  expect(results.macbook.firstRelatedPrice.bottom).toBeLessThanOrEqual(870);

  fs.writeFileSync('/work/detail-reference-metrics.json', JSON.stringify(results, null, 2));
});
