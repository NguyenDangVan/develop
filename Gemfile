source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 5.2.1"
gem "puma", "~> 3.11"
gem "bcrypt", "3.1.12"
gem "devise"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "ffaker"
gem "config"
gem "kaminari"
gem "carrierwave"
gem "mini_magick"
gem "ransack"
gem "chartkick"
gem "groupdate"
gem "sidekiq"
gem "redis-namespace"
gem "jquery-ui-rails"
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "3.3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false
gem "jquery-rails"
gem "carrierwave-ffmpeg"
gem "closure_tree"
gem "impressionist"
gem "social-share-button"
gem "ckeditor"
gem "public_activity"

group :development, :test do
  gem "sqlite3"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end

group :production do
  gem "pg", "0.20.0"
  gem "fog", "1.42"
end
