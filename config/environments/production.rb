# frozen_string_literal: true

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.log_level = :debug
  config.log_tags = [:request_id]
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: ENV['DEFAULT_HOST'] }
  config.action_mailer.delivery_method = :smtp
  config.force_ssl = true

  ActionMailer::Base.smtp_settings = {
    user_name: ENV['MAILER_USERNAME'],
    password: ENV['MAILER_PASSWORD'],
    domain: ENV['MAILER_DOMAIN'],
    address: ENV['MAILER_ADDRESS'],
    port: ENV['MAILER_PORT'],
    authentication: :plain,
    enable_starttls_auto: true
  }

  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end
