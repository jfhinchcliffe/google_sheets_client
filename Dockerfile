# Minial Ruby image
FROM ruby:2.7.0-alpine
# Matches volumes value in docker-compose
WORKDIR /home/app
# Matches port we map from container to localhost in docker-compose
ENV PORT 3000
EXPOSE $PORT

RUN gem install bundler
# Minimal (from what Ellis and Hinchy can tell) required services for a Rails app on Ruby Alpine
RUN apk add --update --no-cache nodejs yarn postgresql-client postgresql-dev build-base tzdata
# Runs this command on image start. -b 0.0.0.0 sets so it doesn't care what source IP is, just accept the traffic.
CMD ["bin/rails", "server", "-b", "0.0.0.0"]