#!/bin/sh
set -eu

cd /var/www/html

if [ ! -f wp-load.php ]; then
  wp core download --allow-root --force
fi

for _ in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
  [ -f wp-config.php ] && break
  sleep 2
done

if [ ! -f wp-config.php ]; then
  wp config create \
    --allow-root \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$WORDPRESS_DB_PASSWORD" \
    --dbhost="$WORDPRESS_DB_HOST" \
    --skip-check
fi

until wp db query 'SELECT 1' --allow-root >/dev/null 2>&1; do
  sleep 3
done

if ! wp core is-installed --allow-root >/dev/null 2>&1; then
  wp core install \
    --allow-root \
    --url="$WORDPRESS_SITE_URL" \
    --title="$WORDPRESS_BLOG_TITLE" \
    --admin_user="$WORDPRESS_ADMIN_USER" \
    --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL"
fi

wp option update home "$WORDPRESS_SITE_URL" --allow-root >/dev/null
wp option update siteurl "$WORDPRESS_SITE_URL" --allow-root >/dev/null
wp rewrite flush --hard --allow-root >/dev/null

wp plugin is-installed woocommerce --allow-root >/dev/null 2>&1 || wp plugin install woocommerce --activate --allow-root
wp theme is-installed bagueship --allow-root >/dev/null 2>&1 || true
wp theme activate bagueship --allow-root
wp plugin is-installed bagueship-core --allow-root >/dev/null 2>&1 || wp plugin activate bagueship-core --allow-root

wp eval-file /scripts/seed.php --allow-root

exit 0
