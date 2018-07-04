source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'haml'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'simple_form'
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'devise'
gem 'pundit'
gem 'rubocop'
gem 'omniauth-google-oauth2'

# grape
gem "grape"
gem "grape-swagger"
gem "grape-swagger-rails"

# pagination
gem "grape-kaminari"
gem "kaminari"
gem "kaminari-grape"

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'dotenv-rails'
  gem 'faker'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'bullet'
  gem 'rubocop'
  gem 'annotate'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
  gem 'shoulda-matchers'
  gem 'capybara'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
