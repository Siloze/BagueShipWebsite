#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
BACKUP_DIR="$ROOT_DIR/backups"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"

mkdir -p "$BACKUP_DIR"

sudo docker exec site_bjioux-db-1 mariadb-dump -ubagueship -pbagueship bagueship > "$BACKUP_DIR/bagueship-$STAMP.sql"
sudo tar -czf "$BACKUP_DIR/bagueship-wp-content-$STAMP.tar.gz" -C "$ROOT_DIR/wordpress/wp-content" .

printf '%s\n' "$BACKUP_DIR/bagueship-$STAMP.sql"
printf '%s\n' "$BACKUP_DIR/bagueship-wp-content-$STAMP.tar.gz"
