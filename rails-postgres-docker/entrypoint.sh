#!/bin/bash
set -e

# Wait for PostgreSQL
until pg_isready -h db -p 5432 -U postgres; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done

exec "$@"

