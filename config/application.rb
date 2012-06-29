require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Kratos
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # While precompiling assets, you can prevent initializing your application and connecting to the database
    # See: https://devcenter.heroku.com/articles/rails3x-asset-pipeline-cedar#troubleshooting
    config.assets.initialize_on_precompile = false

    # Secure your cookie-based session.
    # http://guides.rubyonrails.org/security.html#session-storage
    # http://rubyonrailsdevelopment.pl/archives/secure-cookies-in-ruby-on-rails
    config.action_dispatch.session = {
        :key => '_app_session',
        # A better way to handle config if pull out from Heroku: http://icebergist.com/posts/paperclip-heroku-and-amazon-s3-credentials
        :secret => ENV['SESSION_SECRET'] || 'fu8cked15ap25up2EnoadroaqLULZ4ep',
        :expire_after => 3600
    }

    # https://github.com/jeffp/enumerated_attribute
    config.gem "enumerated_attribute"
    
    # CanCan
    config.gem "cancan"

  end
end
