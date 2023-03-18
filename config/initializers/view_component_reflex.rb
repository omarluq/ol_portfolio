# frozen_string_literal: true

ViewComponentReflex::Engine.configure do |config|
  config.state_adapter = ViewComponentReflex::StateAdapter::Redis.new(
    redis_opts: {
      url: ENV.fetch('REDIS_URL'), driver: :hiredis
    },
    ttl: 3600
  )
end
