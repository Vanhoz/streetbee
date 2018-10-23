FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /streetbee
WORKDIR /streetbee
COPY Gemfile /streetbee/Gemfile
COPY Gemfile.lock /streetbee/Gemfile.lock
RUN bundle install
COPY . /streetbee
CMD puma -C config/puma.rb