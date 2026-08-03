# Instructions

- Following Playwright test failed.
- Explain why, be concise, respect Playwright best practices.
- Provide a snippet of code with the fix, if possible.

# Test info

- Name: cart-redesign.spec.js >> empty cart keeps the same art direction
- Location: cart-redesign.spec.js:76:1

# Error details

```
Error: route.fetch: connect ECONNREFUSED 192.168.156.4:8080
Call log:
  - → GET http://wordpress/panier/
    - user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36
    - accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
    - accept-encoding: gzip,deflate,br
    - accept-language: en-US
    - cookie: bagueship_cookie_consent=accepted
    - upgrade-insecure-requests: 1
    - sec-ch-ua: "Not=A?Brand";v="99", "HeadlessChrome";v="151", "Chromium";v="151"
    - sec-ch-ua-mobile: ?0
    - sec-ch-ua-platform: "Linux"
  - ← 301 Moved Permanently
    - date: Fri, 31 Jul 2026 21:56:35 GMT
    - server: Apache/2.4.68 (Debian)
    - x-powered-by: PHP/8.3.32
    - expires: Wed, 11 Jan 1984 05:00:00 GMT
    - cache-control: no-cache, must-revalidate, max-age=0, private
    - x-redirect-by: WordPress
    - location: http://wordpress:8080/panier/
    - content-length: 0
    - keep-alive: timeout=5, max=100
    - connection: Keep-Alive
    - content-type: text/html; charset=UTF-8
  - → GET http://wordpress:8080/panier/
    - user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36
    - accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
    - accept-encoding: gzip,deflate,br
    - accept-language: en-US
    - upgrade-insecure-requests: 1
    - sec-ch-ua: "Not=A?Brand";v="99", "HeadlessChrome";v="151", "Chromium";v="151"
    - sec-ch-ua-mobile: ?0
    - sec-ch-ua-platform: "Linux"
    - host: wordpress:8080

```

# Test source

```ts
  1  | const { test, expect } = require('@playwright/test');
  2  | 
  3  | async function prepare(page) {
  4  |   await page.context().addCookies([{
  5  |     name: 'bagueship_cookie_consent',
  6  |     value: 'accepted',
  7  |     domain: 'localhost',
  8  |     path: '/',
  9  |   }]);
  10 |   await page.route('http://localhost:8080/**', async route => {
> 11 |     const response = await route.fetch({
     |                                  ^ Error: route.fetch: connect ECONNREFUSED 192.168.156.4:8080
  12 |       url: route.request().url().replace('localhost:8080', 'wordpress'),
  13 |     });
  14 |     await route.fulfill({
  15 |       response,
  16 |       headers: {
  17 |         ...response.headers(),
  18 |         'access-control-allow-origin': '*',
  19 |       },
  20 |     });
  21 |   });
  22 | }
  23 | 
  24 | test('cart uses product artwork and Eclipse editorial layout', async ({ browser }) => {
  25 |   const context = await browser.newContext({ viewport: { width: 1512, height: 982 } });
  26 |   const page = await context.newPage();
  27 |   await prepare(page);
  28 | 
  29 |   await page.goto('http://localhost:8080/?add-to-cart=288', { waitUntil: 'networkidle' });
  30 |   await page.goto('http://localhost:8080/panier/', { waitUntil: 'networkidle' });
  31 |   await page.evaluate(() => document.fonts.ready);
  32 | 
  33 |   await expect(page.locator('.cart-item')).toHaveCount(1);
  34 |   await expect(page.locator('.cart-item__name')).toContainText('GOTH');
  35 |   await expect(page.locator('model-viewer')).toHaveCount(0);
  36 |   await expect(page.locator('.cart-item__media img')).toBeVisible();
  37 |   await expect(page.locator('.cart-summary__title')).toContainText('RÉCAPITULATIF');
  38 | 
  39 |   const desktop = await page.evaluate(() => {
  40 |     const image = document.querySelector('.cart-item__media img');
  41 |     const shell = document.querySelector('.cart-shell').getBoundingClientRect();
  42 |     const content = document.querySelector('.cart-content').getBoundingClientRect();
  43 |     const summary = document.querySelector('.cart-summary').getBoundingClientRect();
  44 |     return {
  45 |       imageNaturalWidth: image.naturalWidth,
  46 |       imageNaturalHeight: image.naturalHeight,
  47 |       shellWidth: shell.width,
  48 |       contentWidth: content.width,
  49 |       summaryWidth: summary.width,
  50 |       overflow: document.documentElement.scrollWidth - innerWidth,
  51 |     };
  52 |   });
  53 |   expect(desktop.imageNaturalWidth).toBeGreaterThan(500);
  54 |   expect(desktop.imageNaturalHeight).toBeGreaterThan(500);
  55 |   expect(desktop.summaryWidth).toBeGreaterThan(450);
  56 |   expect(desktop.overflow).toBe(0);
  57 |   await page.screenshot({ path: '/work/cart-redesign-desktop.png', fullPage: true });
  58 | 
  59 |   await page.setViewportSize({ width: 390, height: 844 });
  60 |   await page.reload({ waitUntil: 'networkidle' });
  61 |   await page.evaluate(() => document.fonts.ready);
  62 |   const mobile = await page.evaluate(() => ({
  63 |     overflow: document.documentElement.scrollWidth - innerWidth,
  64 |     imageVisible: document.querySelector('.cart-item__media img').getBoundingClientRect().height > 0,
  65 |     summaryBelowContent:
  66 |       document.querySelector('.cart-summary').getBoundingClientRect().top >=
  67 |       document.querySelector('.cart-content').getBoundingClientRect().bottom - 1,
  68 |   }));
  69 |   expect(mobile).toEqual({ overflow: 0, imageVisible: true, summaryBelowContent: true });
  70 |   await page.screenshot({ path: '/work/cart-redesign-mobile.png', fullPage: true });
  71 | 
  72 |   await page.unrouteAll({ behavior: 'ignoreErrors' });
  73 |   await context.close();
  74 | });
  75 | 
  76 | test('empty cart keeps the same art direction', async ({ browser }) => {
  77 |   const context = await browser.newContext({ viewport: { width: 1512, height: 982 } });
  78 |   const page = await context.newPage();
  79 |   await prepare(page);
  80 |   await page.goto('http://localhost:8080/panier/', { waitUntil: 'networkidle' });
  81 |   await page.evaluate(() => document.fonts.ready);
  82 |   await expect(page.locator('.cart-shell.is-empty')).toBeVisible();
  83 |   await expect(page.locator('.cart-empty-art img')).toBeVisible();
  84 |   await expect(page.locator('model-viewer')).toHaveCount(0);
  85 |   await page.screenshot({ path: '/work/cart-empty-desktop.png', fullPage: true });
  86 |   await page.unrouteAll({ behavior: 'ignoreErrors' });
  87 |   await context.close();
  88 | });
  89 | 
```