FROM ruby:2.6

RUN set -ex \
  && apt-get update \
  && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /myapp

COPY ./Gemfile /myapp/Gemfile
COPY ./Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY ./myapp /myapp

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
