# frozen_string_literal: true

require 'sidekiq/web'

redis_cfg = { url: ENV['REDIS_URL'] }
# redis_cfg[:namespace] = "youtube-sharing"
redis_cfg[:password] = ENV['REDIS_PWD'] if ENV['REDIS_PWD'].present?

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
end

Sidekiq.configure_server do |config|
  config.redis = redis_cfg
end

Sidekiq.configure_client do |config|
  config.redis = redis_cfg
end