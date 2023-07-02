#!/usr/bin/env bash

echo "permission"

cp -p .env.example .env
php artisan key:generate
chmod -R 777 ./storage
chmod -R 777 ./bootstrap/cache