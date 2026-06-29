(() => {
  const cookieName = 'bagueship_cookie_consent';
  const toggleActive = () => {
    const links = document.querySelectorAll('.nav .right a');
    const path = location.pathname.replace(/\/+$/, '') || '/';
    const hash = location.hash || '';
    links.forEach((link) => {
      try {
        const url = new URL(link.href, location.origin);
        const linkPath = url.pathname.replace(/\/+$/, '') || '/';
        const linkHash = url.hash || '';
        if (linkPath === path && linkHash === hash) {
          link.setAttribute('aria-current', 'page');
        } else if (!link.classList.contains('is-active')) {
          link.removeAttribute('aria-current');
        }
      } catch {}
    });
  };

  const initCookieBanner = () => {
    const banner = document.getElementById('bagueship-cookie-banner');
    if (!banner || document.cookie.includes(`${cookieName}=`)) {
      return;
    }

    const setConsent = (value) => {
      const maxAge = 60 * 60 * 24 * 365;
      document.cookie = `${cookieName}=${encodeURIComponent(value)}; path=/; max-age=${maxAge}; samesite=lax`;
      banner.hidden = true;
      window.location.reload();
    };

    banner.hidden = false;
    banner.querySelectorAll('[data-bagueship-cookie]').forEach((button) => {
      button.addEventListener('click', (event) => {
        event.preventDefault();
        const value = button.getAttribute('data-bagueship-cookie');
        if (!value) {
          return;
        }
        setConsent(value);
      });
    });
  };

  document.addEventListener('DOMContentLoaded', toggleActive);
  window.addEventListener('hashchange', toggleActive);
  document.addEventListener('DOMContentLoaded', initCookieBanner);
})();
