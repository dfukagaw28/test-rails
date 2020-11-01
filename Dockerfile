FROM ruby:2.6

RUN set -ex \
  && apt-get update \
  && apt-get install -y build-essential nodejs

WORKDIR /myapp

COPY ./Gemfile /myapp/Gemfile
COPY ./Gemfile.lock /myapp/Gemfile.lock

RUN set -ex \
  && bundle install

COPY ./myapp /myapp

RUN set -ex \
  && bundle install

EXPOSE 3000
