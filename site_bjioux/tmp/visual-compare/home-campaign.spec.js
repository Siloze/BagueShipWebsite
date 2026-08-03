const { test, expect } = require('@playwright/test');

test('home campaign image is framed on desktop and mobile', async ({ page }) => {
  await page.route('http://localhost:8080/**', async route => {
    const response = await route.fetch({
      url: route.request().url().replace('localhost', 'host.docker.internal'),
    });
    await route.fulfill({ response, headers: { ...response.headers(), 'access-control-allow-origin': '*' } });
  });

  for (const viewport of [
    { name: 'desktop', width: 1512, height: 870 },
    { name: 'mobile', width: 390, height: 844 },
  ]) {
    await page.setViewportSize(viewport);
    await page.goto('http://host.docker.internal:8080/index.php', { waitUntil: 'networkidle' });
    await page.evaluate(() => {
      scrollTo(0, 0);
      return document.fonts.ready;
    });
    const image = page.locator('.campaign-image');
    await expect(image).toBeVisible();
    expect(await image.evaluate(node => node.naturalWidth)).toBeGreaterThan(0);
    await page.screenshot({ path: `/work/home-campaign-${viewport.name}.png`, fullPage: false });
  }
});
