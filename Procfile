web: bin/rails server -p $PORT -e $RAILS_ENV
frontend: bin/webpack-dev-server
worker: bundle exec sidekiq -C config/sidekiq.yml
