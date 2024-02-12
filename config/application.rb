require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EscalaT
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.exceptions_app = self.routes

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    config.time_zone = File.read("/etc/timezone").chomp rescue 'Brasilia' # altera o time zone para a aplicação
    # config.eager_load_paths << Rails.root.join("extras")
    I18n.config.available_locales = 'pt-BR'
    I18n.default_locale = 'pt-BR'
    I18n.locale = 'pt-BR'
  end
end
