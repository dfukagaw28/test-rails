FROM ruby:2.6

RUN set -ex \
  && apt-get update \
  && apt-get install -y build-essential nodejs

WORKDIR /myapp

RUN set -ex \
  && gem install sqlite3 -v 1.3.13 \
  && gem install rails -v 5.2.4 \
  && rails new . --force --skip-bundle

RUN set -ex \
  && sed -i "s/gem 'sqlite3'/gem 'sqlite3', '< 1.4'/" Gemfile

RUN set -ex \
  && bundle install

EXPOSE 3000
