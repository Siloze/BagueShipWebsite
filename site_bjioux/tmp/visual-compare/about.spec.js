const { test, expect } = require('@playwright/test');
const fs = require('fs');

test.use({ viewport: { width: 1512, height: 870 } });

test('validate Eclipse about page and scroll story', async ({ page }) => {
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
  await page.goto('http://host.docker.internal:8080/promesse/', { waitUntil: 'networkidle' });
  await page.evaluate(() => document.fonts.ready);
  await page.screenshot({ path: '/work/about-hero.png' });

  const heroMetrics = await page.evaluate(() => ({
    viewport: { width: innerWidth, height: innerHeight },
    scrollWidth: document.documentElement.scrollWidth,
    displayReady: document.fonts.check('120px "Eclipse Display"'),
    titleFamily: getComputedStyle(document.querySelector('.hero-copy h1')).fontFamily,
    activeNav: document.querySelector('.nav-links .is-active')?.textContent.trim(),
    navHeight: document.querySelector('.nav').getBoundingClientRect().height,
    topbarLinks: [...document.querySelectorAll('.nav-links a')].map(link => link.textContent.trim()),
  }));

  expect(heroMetrics.scrollWidth).toBe(heroMetrics.viewport.width);
  expect(heroMetrics.displayReady).toBe(true);
  expect(heroMetrics.activeNav).toBe('À propos');
  expect(heroMetrics.topbarLinks).toEqual(['Collection', 'Bijoux', 'À propos']);

  await page.evaluate(() => {
    document.documentElement.style.scrollBehavior = 'auto';
    const story = document.querySelector('.material-story');
    scrollTo(0, story.offsetTop + (story.offsetHeight - innerHeight) * 0.5);
  });
  await page.waitForTimeout(260);
  await page.screenshot({ path: '/work/about-material.png' });

  const storyMetrics = await page.evaluate(() => {
    const steps = [...document.querySelectorAll('.material-step')];
    return {
      stickyTop: document.querySelector('.material-sticky').getBoundingClientRect().top,
      opacities: steps.map(step => Number(getComputedStyle(step).opacity)),
      modelOrbit: document.querySelector('#promiseModel')?.getAttribute('camera-orbit') || null,
      nav: [...document.querySelector('.nav').children].map(element => ({
        text: element.textContent.trim(),
        color: getComputedStyle(element).color,
        opacity: getComputedStyle(element).opacity,
        visibility: getComputedStyle(element).visibility,
      })),
    };
  });
  expect(Math.abs(storyMetrics.stickyTop)).toBeLessThan(2);
  expect(Math.max(...storyMetrics.opacities)).toBeGreaterThan(0.9);
  fs.writeFileSync('/work/about-metrics.json', JSON.stringify({ heroMetrics, storyMetrics }, null, 2));
});
