# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap', '~> 1.3.1', require: false
gem 'bootstrap', '~> 4.1.3'
gem 'devise', '~> 4.5.0'
gem 'figaro', '~> 1.1.1'
gem 'font-awesome-sass', '~> 5.2.0'
gem 'httparty', '~> 0.16.2'
gem 'jquery-rails', '~> 4.3.3'
gem 'kaminari', '~> 1.1.1'
gem 'pg', '~> 1.0.0'
gem 'puma', '~> 3.12.0'
gem 'rails', '~> 5.2.1'
gem 'rollbar', '~> 2.16.4'
gem 'sass-rails', '~> 5.0.7'
gem 'tinymce-rails', '~> 4.8.2'
gem 'turbolinks', '~> 5.1.1'
gem 'uglifier', '~> 4.1.18'

group :development, :test do
  gem 'byebug', '~> 10.0.2', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 4.10.0'
  gem 'rspec-rails', '~> 3.8.0'
  gem 'rubocop', '~> 0.58.2', require: false
  gem 'rubocop-rspec', '~> 1.27.0'
end

group :development do
  gem 'letter_opener', '~> 1.6.0'
  gem 'listen', '~> 3.1.5'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :test do
  gem 'faker', '~> 1.9.1'
  gem 'shoulda-matchers', '~> 3.1.2'
  gem 'simplecov', '~> 0.16.1', require: false
  gem 'webmock', '~> 3.4.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
