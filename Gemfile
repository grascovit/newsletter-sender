# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '~> 1.4.5', require: false
gem 'bootstrap', '~> 4.4.1'
gem 'devise', '~> 4.7.1'
gem 'figaro', '~> 1.1.1'
gem 'font-awesome-sass', '~> 5.12.0'
gem 'httparty', '~> 0.17.3'
gem 'jquery-rails', '~> 4.3.5'
gem 'kaminari', '~> 1.2.0'
gem 'pg', '~> 1.2.2'
gem 'puma', '~> 4.3.1'
gem 'rails', '~> 5.2.4.1'
gem 'rollbar', '~> 2.23.2'
gem 'sass-rails', '~> 5.1.0'
gem 'tinymce-rails', '~> 5.1.5'
gem 'uglifier', '~> 4.2.0'

group :development, :test do
  gem 'factory_bot_rails', '~> 5.1.1'
  gem 'pry', '~> 0.12.2'
  gem 'rspec-rails', '~> 3.9.0'
  gem 'rubocop', '~> 0.79.0', require: false
  gem 'rubocop-rspec', '~> 1.37.1'
end

group :development do
  gem 'letter_opener', '~> 1.7.0'
  gem 'listen', '~> 3.2.1'
  gem 'spring', '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :test do
  gem 'faker', '~> 2.10.1'
  gem 'shoulda-matchers', '~> 4.2.0'
  gem 'simplecov', '~> 0.18.1', require: false
  gem 'webmock', '~> 3.8.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
