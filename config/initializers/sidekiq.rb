Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:32768' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:32768' }
end
