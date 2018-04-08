require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "Asia/Tokyo"
    config.i18n.default_locale = :ja
    I18n.available_locales = [:ja, :tw]
    config.i18n.load_path += Dir["#{Rails.root.to_s}/config/locales/**/*.yml"]
  end
end
