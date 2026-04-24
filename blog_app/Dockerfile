FROM ruby:3.3.11

WORKDIR /app

# install system dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libmariadb-dev nodejs

# install bundler đúng version
RUN gem install bundler -v 4.0.10

# copy gem files
COPY Gemfile Gemfile.lock ./

# install gems
RUN bundle install

# copy source code
COPY . .

# start server
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0"]