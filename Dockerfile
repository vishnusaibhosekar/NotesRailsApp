# Dockerfile

# Base image with Ruby pre-installed
FROM ruby:latest

# Install SQLite dependencies
RUN apt-get update -qq && apt-get install -y sqlite3 libsqlite3-dev

# Set up a working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN gem install bundler
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
