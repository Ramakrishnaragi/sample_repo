#!/bin/bash
set -e

# Wait for PostgreSQL to be ready
until pg_isready -h $DATABASE_HOST -p 5432; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done

# Run the migrations or prepare the database (optional)
bundle exec rake db:prepare

# Remove a potentially pre-existing server.pid
rm -f /myapp/tmp/pids/server.pid

exec "$@"
