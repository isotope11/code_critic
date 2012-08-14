Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://localhost:6379/01', :namespace => 'code_critic' }
end
Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://localhost:6379/01', :namespace => 'code_critic' }
end
