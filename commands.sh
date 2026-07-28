#!/usr/bin/env bash

case "$1" in
  up)
    docker compose up -d
    ;;

  down)
    docker compose down
    ;;

  build)
    docker compose build
    ;;

  logs)
    docker compose logs -f backend
    ;;

  db:migrate)
    echo "Running database migrations... (ENV=development)"
    docker compose exec backend npm run migrate:run
    echo "Updated database!"
    ;;

  db:migrate:prod)
    echo "Running database migrations... (ENV=production)"
    docker compose exec backend npm run migrate:run:prod
    echo "Updated database!"
    ;;
esac