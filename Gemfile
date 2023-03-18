source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'
gem 'activerecord-sqlserver-adapter'
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use pg as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
gem 'redis_dashboard'

# Use hiredis for Redis connection pooling and faster serialization [https://github.com/redis/hiredis-rb]
gem 'hiredis', '~> 0.6.3'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'

  gem 'factory_bot_rails', '~> 6.2'            # https://github.com/thoughtbot/factory_bot_rails
  gem 'fasterer', '~> 0.10.0'
  gem 'overcommit'                             # https://github.com/sds/overcommit
  gem 'rspec-rails', '~> 6.0'                  # https://github.com/rspec/rspec-rails
  gem 'rubocop', '~> 1.40'
  gem 'rubocop-gitlab-security', '~> 0.1.1'
  gem 'rubocop-rails', '~> 2.17'
  gem 'rubocop-rspec', '~> 2.16'
  gem 'simplecov', '~> 0.22.0', require: false # https://github.com/simplecov-ruby/simplecov
  gem 'test-prof', '~> 1.1'                    # https://github.com/test-prof/test-prof
end

group :development, :test, :qa, :staging do
  gem 'letter_opener_web', '~> 2.0' # https://github.com/fgrehm/letter_opener_web
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem 'annotate', '~> 3.2'
  gem 'awesome_print'
  gem 'database_consistency', '~> 1.7', require: false # https://github.com/djezzzl/database_consistency
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'n_plus_one_control', '~> 0.6.2' # https://github.com/test-prof/test-prof
  gem 'selenium-webdriver'
  gem 'stimulus_reflex_testing' # https://github.com/podia/stimulus_reflex_testing
  gem 'webdrivers'
end

gem 'dotenv-rails', '~> 2.8'                 # https://github.com/bkeepers/dotenv

gem 'action_policy'                          # https://github.com/palkan/action_policy
# gem 'activerecord_json_validator'            # https://github.com/mirego/activerecord_json_validator
# gem 'acts_as_dag', github: 'rrn/acts_as_dag', branch: 'master' # https://github.com/rrn/acts_as_dag
# gem 'acts_as_list'                           # https://github.com/brendon/acts_as_list
# gem 'acts-as-taggable-on', '~> 9.0'          # https://github.com/mbleigh/acts-as-taggable-on
# gem 'addressable', '~> 2.8'                  # https://github.com/sporkmonger/addressable
# gem 'audited', '~> 5.1'                      # https://github.com/collectiveidea/audited
# AWS
# gem "aws-sdk", "~> 3"
# gem "aws-sdk-lambda", "~> 1"
gem 'aws-sdk-s3', require: false
# gem "aws-sdk-sns", "~> 1"
# gem "dynamo-store"

gem 'devise'                                 # https://github.com/heartcombo/devise
gem 'faker', '~> 3.0'                        # https://github.com/faker-ruby/faker - Move to develop test after app is stable
gem 'faraday', '~> 2.7'                      # https://github.com/lostisland/faraday
gem 'heroicon', '~> 1.0'                     # https://github.com/bharget/heroicon
gem 'inline_svg', '~> 1.8'                   # https://github.com/jamesmartin/inline_svg

gem 'liquid'                                 # https://github.com/shopify/liquid
gem 'mina', '~> 1.2'                         # https://github.com/mina-deploy/mina
gem 'mina1-yarn', '~> 0.1.0'                 # https://github.com/wootaw/mina-yarn
gem 'name_of_person', '~> 1.1'               # https://github.com/basecamp/name_of_person
gem 'optimism', '~> 0.5.0'                   # https://github.com/leastbad/optimism
gem 'pagy'                                   # https://github.com/ddnexus/pagy
gem 'responders', github: 'excid3/responders', branch: 'fix-redirect-status-config'
gem 'rolify'                                 # https://github.com/RolifyCommunity/rolify
gem 'rux-rails'                              # https://github.com/camertron/rux-rails
gem 'sequenced', '~> 4.0'                    # https://github.com/derrickreimer/sequenced
gem 'state_machines-activerecord'            # https://github.com/state-machines/state_machines-activerecord
gem 'stimulus_reflex', '= 3.5.0.pre9'        # https://github.com/stimulusreflex/stimulus_reflex
gem 'tailwindcss-rails', '~> 2.0'            # https://github.com/rails/tailwindcss-rails
gem 'turbo_boost-elements'                   # https://github.com/hopsoft/turbo_boost-elements
gem 'view_component'                         # https://github.com/ViewComponent/view_component
gem 'view_component_reflex'                  # https://github.com/joshleblanc/view_component_reflex
gem 'yajl-ruby', require: 'yajl'             # https://github.com/brianmario/yajl-ruby

gem 'lookbook', '~> 1.0'                     # https://github.com/ViewComponent/lookbook

gem 'brakeman'                               # https://github.com/presidentbeef/brakeman
gem 'bundler-audit'                          # https://github.com/rubysec/bundler-audit
gem 'rails_best_practices'                   # https://github.com/flyerhzm/rails_best_practices
gem 'ruby_audit'                             # https://github.com/civisanalytics/ruby_audit
gem 'rubycritic', require: false             # https://github.com/whitesmith/rubycritic
