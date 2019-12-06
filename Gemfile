# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '~> 1.4.4', require: false
gem 'bootstrap', '~> 4.3.1'
gem 'devise', '~> 4.6.2'
gem 'figaro', '~> 1.1.1'
gem 'font-awesome-sass', '~> 5.8.1'
gem 'httparty', '~> 0.17.0'
gem 'jquery-rails', '~> 4.3.3'
gem 'kaminari', '~> 1.1.1'
gem 'pg', '~> 1.1.4'
gem 'puma', '~> 3.12.2'
gem 'rails', '~> 5.2.3'
gem 'rollbar', '~> 2.20.0'
gem 'sass-rails', '~> 5.0.7'
gem 'tinymce-rails', '~> 5.0.5'
gem 'turbolinks', '~> 5.2.0'
gem 'uglifier', '~> 4.1.20'

group :development, :test do
  gem 'byebug', '~> 11.0.1', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 5.0.2'
  gem 'rspec-rails', '~> 3.8.2'
  gem 'rubocop', '~> 0.70.0', require: false
  gem 'rubocop-rspec', '~> 1.33.0'
end

group :development do
  gem 'letter_opener', '~> 1.7.0'
  gem 'listen', '~> 3.1.5'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :test do
  gem 'faker', '~> 1.9.3'
  gem 'shoulda-matchers', '~> 4.0.1'
  gem 'simplecov', '~> 0.16.1', require: false
  gem 'webmock', '~> 3.5.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
