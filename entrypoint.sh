#!/bin/bash
set -e
shopt -s extglob

if ! [ -e user/config/system.yaml ]; then
  echo >&2 "No /user data found - writing default..."
  rsync -a /tmp/grav-$GRAV_VERSION/user/ /var/www/html/user
fi
chown -Rf www-data:www-data user || true
echo >&2 "Grav has been successfully installed!"

exec "$@"
