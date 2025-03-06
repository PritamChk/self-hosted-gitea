#!/bin/sh
set -x
echo "Starting gitea"

echo "updating app.ini details. . . "

envsubst < /gitea/app.ini.template > /gitea/app.ini

cp /gitea/app.ini /gitea/bkp_app.ini

./giteabin web -c /gitea/app.ini
wait