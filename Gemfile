source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "sassc-rails", "2.1.2"
gem 'paper_trail'
gem 'devise', "~> 4.9.0"
gem 'kaminari', "~> 1.2.2"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'simple_form', '~> 5.2.0'
gem 'rufus-scheduler', '~> 3.8.2'
gem 'cancancan', '~> 3.5.0'

# Veio do repositorio com mazen
gem "shrine", "~> 3.4"
gem 'image_processing', '~> 1.12', '>= 1.12.2'
gem "city-state", "~> 0.1.0"
gem "rubocop-rails", "~> 2.19" # Verifica se código foi escrito da melhor forma
gem "breadcrumbs_on_rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "byebug"
  gem "rspec-rails", "~> 6.0"
end

group :development do
  gem "web-console"
  gem "bullet"          # Verifica se os selects podem ser melhorados
  gem 'rails-erd'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "simplecov", "~> 0.22.0", require: false
  gem "simplecov_json_formatter", "~> 0.1.4", require: false
end
