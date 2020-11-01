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

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
