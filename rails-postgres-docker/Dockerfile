# Dockerfile
FROM ruby:3.1.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client

# Set working directory
WORKDIR /app

# Copy gem files and install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Copy the whole app
COPY . .

# Add entrypoint script
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Default command
CMD ["rails", "server", "-b", "0.0.0.0"]

