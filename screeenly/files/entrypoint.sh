#!/bin/sh
set -eu

CMD=apache2-foreground
USER=www-data

# if the first arg starts with "-" pass it to program
if [ "${1#-}" != "$1" ]; then
  set -- "$CMD" "$@"
fi

envsubst < /var/www/html/.env > /var/www/html/.env.tmp
mv /var/www/html/.env.tmp /var/www/html/.env

if [ -z "${APP_KEY:-}" ]; then
  echo "\033[0;31mERROR: APP_KEY is not set. Using random key.\033[0m"
  php artisan key:generate --force
fi

if [ "$DB_CONNECTION" = "sqlite" ]; then
  su -s /bin/bash www-data -c "touch $DB_DATABASE"
fi

php artisan migrate --force

exec "$@"
