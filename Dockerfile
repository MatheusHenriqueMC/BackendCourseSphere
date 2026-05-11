FROM ruby:3.2.11

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev dos2unix

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN dos2unix bin/* && chmod +x bin/*

EXPOSE 3000

ENTRYPOINT ["bin/docker-entrypoint"]
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]