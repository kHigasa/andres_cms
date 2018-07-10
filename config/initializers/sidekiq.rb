Sidekiq.configure_server do |config|
  config.redis = if Rails.env.production?
                   { url: 'redis://', namespace: 'sidekiq' }
                 elsif Rails.env.staging?
                   { url: 'redis://rediscloud:wYLFiSgQ27rdgke7PXVRSxraxSDX7BFL@redis-14632.c12.us-east-1-4.ec2.cloud.redislabs.com:14632', namespace: 'sidekiq' }
                 else
                   { url: 'redis://localhost:6379', namespace: 'sidekiq' }
                 end
end
