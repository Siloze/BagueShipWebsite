#!/bin/sh
set -eu

if [ $# -lt 2 ]; then
  echo "Usage: $0 <sql_dump> <wp_content_tar>" >&2
  exit 1
fi

SQL_DUMP="$1"
WP_CONTENT_TAR="$2"
ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

sudo docker exec -i site_bjioux-db-1 mariadb -ubagueship -pbagueship bagueship < "$SQL_DUMP"
sudo rm -rf "$ROOT_DIR/wordpress/wp-content"/*
sudo tar -xzf "$WP_CONTENT_TAR" -C "$ROOT_DIR/wordpress/wp-content"
