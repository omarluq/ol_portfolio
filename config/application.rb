# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OmarLuq
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.middleware.use ActionDispatch::Cookies
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join('lib')

    # Generators
    config.generators do |g|
      g.helper false
      g.assets false
      g.test_framework :rspec, fixture: false
      g.helper_specs false
      g.controller_specs true
      g.system_tests false
      g.view_specs false
      g.jbuilder false
      g.routing_specs false
    end

    # GZip all responses
    config.middleware.use Rack::Deflater

    # ViewComponent gem configuration
    config.view_component.preview_paths = [Rails.root.join('spec', 'previews', 'components')]
    config.view_component.generate.preview = true
    config.view_component.default_preview_layout = 'component_preview'
    config.view_component.show_previews = true

    # Lookbook gem configuration
    config.lookbook.project_name = 'Arrow Component Previews'
    config.lookbook.debug_menu = true
    config.lookbook.preview_params_options_eval = true
    config.lookbook.preview_display_options = {
      bg_color: '#fff', # default bg_color value
      theme: %w[light dark], # dynamic 'theme' display option
      lang: [
        %w[English en],
        %w[Spanish es]
      ]
    }
  end
end
