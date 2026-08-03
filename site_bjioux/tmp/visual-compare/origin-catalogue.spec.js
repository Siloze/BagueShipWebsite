const { test, expect } = require('@playwright/test');
const fs = require('fs');

const installLocalAssetRoute = async page => {
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
};

const open = async (page, path) => {
  await page.goto(`http://host.docker.internal:8080${path}`, { waitUntil: 'networkidle' });
  await page.evaluate(() => document.fonts.ready);
};

test('Origin is the only live catalogue and every product image is wired', async ({ page }) => {
  await page.setViewportSize({ width: 1512, height: 870 });
  await installLocalAssetRoute(page);

  await open(page, '/bijoux/');
  const jewels = await page.evaluate(() => ({
    names: [...document.querySelectorAll('.jewel-name')].map(node => node.textContent.trim()),
    cards: document.querySelectorAll('.jewel-card').length,
    images: [...document.querySelectorAll('.jewel-media img')].map(image => ({
      src: image.currentSrc || image.src,
      width: image.naturalWidth,
    })),
  }));
  expect(jewels.names).toEqual(['BIG', 'FLAMME', 'THIN', 'GOTH']);
  expect(jewels.cards).toBe(4);
  expect(jewels.images).toHaveLength(4);
  expect(jewels.images.every(image => image.width > 0)).toBeTruthy();
  await expect(page.locator('[data-filter="boucles"]')).toBeVisible();
  await page.locator('[data-filter="boucles"]').click();
  await expect(page.locator('.jewel-card:not([hidden]) .jewel-name')).toHaveText(['GOTH']);
  await page.locator('[data-filter="all"]').click();
  await page.screenshot({ path: '/work/origin-bijoux-desktop.png', fullPage: false });

  await open(page, '/boutique/');
  const collections = await page.evaluate(() => ({
    titles: [...document.querySelectorAll('.card-title')].map(node => node.textContent.trim()),
    originImageWidth: document.querySelector('.collection-card__image')?.naturalWidth || 0,
  }));
  expect(collections.titles).toEqual(['Origin', 'Coming soon']);
  expect(collections.originImageWidth).toBeGreaterThan(0);
  await page.screenshot({ path: '/work/origin-collection-desktop.png', fullPage: false });

  await open(page, '/product/big/');
  const detail = await page.evaluate(() => ({
    title: document.querySelector('.product-title')?.textContent.trim(),
    mainWidth: document.querySelector('.product-main-image')?.naturalWidth || 0,
    thumbs: document.querySelectorAll('[data-product-image]').length,
    relatedNames: [...document.querySelectorAll('.related-name')].map(node => node.textContent.trim()),
    fakeRelated: [...document.querySelectorAll('.related-name')].some(node =>
      /Obscura|Vigor|Nexus|Fortis/i.test(node.textContent)
    ),
  }));
  expect(detail.title).toBe('BIG');
  expect(detail.mainWidth).toBeGreaterThan(0);
  expect(detail.thumbs).toBe(3);
  expect(detail.relatedNames).toEqual(['FLAMME', 'THIN', 'GOTH']);
  expect(detail.fakeRelated).toBeFalsy();

  const initialSource = await page.locator('.product-main-image').getAttribute('src');
  await page.locator('[data-product-image]').nth(1).click();
  await page.waitForTimeout(300);
  await expect(page.locator('.product-main-image')).not.toHaveAttribute('src', initialSource);
  await page.screenshot({ path: '/work/origin-big-detail-desktop.png', fullPage: false });

  await open(page, '/index.php');
  await page.locator('[data-home-jewels]').scrollIntoViewIfNeeded();
  const home = await page.evaluate(() => ({
    names: [...document.querySelectorAll('.home-jewel-name')].map(node => node.textContent.trim()),
    loadedImages: [...document.querySelectorAll('.home-jewel-media img')].filter(image => image.naturalWidth > 0).length,
  }));
  expect(home.names).toEqual(['BIG', 'FLAMME', 'THIN', 'GOTH']);
  expect(home.loadedImages).toBe(4);

  await open(page, '/promesse/');
  const aboutModel = await page.evaluate(() => {
    const model = document.querySelector('model-viewer');
    return {
      exists: Boolean(model),
      source: model?.getAttribute('src') || '',
    };
  });
  expect(aboutModel.exists).toBeTruthy();
  expect(aboutModel.source).not.toBe('');

  await page.setViewportSize({ width: 390, height: 844 });
  await open(page, '/product/goth/');
  await page.screenshot({ path: '/work/origin-goth-detail-mobile.png', fullPage: false });
  const mobile = await page.evaluate(() => ({
    overflowX: document.documentElement.scrollWidth - document.documentElement.clientWidth,
    thumbs: document.querySelectorAll('[data-product-image]').length,
    mainWidth: document.querySelector('.product-main-image')?.naturalWidth || 0,
    title: document.querySelector('.product-title')?.textContent.trim(),
    size: document.querySelector('#sizeSelect option')?.textContent.trim(),
    hasVariationField: Boolean(document.querySelector('#variationId')),
  }));
  expect(mobile.overflowX).toBe(0);
  expect(mobile.thumbs).toBe(3);
  expect(mobile.mainWidth).toBeGreaterThan(0);
  expect(mobile.title).toBe('GOTH');
  expect(mobile.size).toBe('Taille unique');
  expect(mobile.hasVariationField).toBeFalsy();

  fs.writeFileSync('/work/origin-catalogue-metrics.json', JSON.stringify({
    jewels,
    collections,
    detail,
    home,
    aboutModel,
    mobile,
  }, null, 2));
});
