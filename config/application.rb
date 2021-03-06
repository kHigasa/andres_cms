require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AndresCms
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Initialize language
    config.i18n.default_locale = :ja
    # Load every locales
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    # Set JST(view-only)
    config.time_zone = 'Tokyo'
    # Setting log
    config.logger = Logger.new(STDOUT)
    # Rack cors
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3035/'
        resource '*', headers: :any, methods: %i[get post put patch delete options]
      end
    end

    # Adapter for active_job queue
    config.active_job.queue_adapter = :sidekiq

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.generators do |g|
      g.template_engine :slim
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       model_specs: true,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.stylesheets    false
      g.javascripts    false
      g.helper         false
      g.channel        assets: false
    end
  end
end
