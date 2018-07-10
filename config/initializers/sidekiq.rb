Sidekiq.configure_server do |config|
  config.redis = if Rails.env.production?
                   { url: $redis, namespace: 'sidekiq' }
                 elsif Rails.env.staging?
                   { url: $redis, namespace: 'sidekiq' }
                 else
                   { url: 'redis://localhost:6379', namespace: 'sidekiq' }
                 end
end
