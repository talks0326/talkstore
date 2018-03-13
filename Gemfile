source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'devise' #ログイン機能用
gem 'paperclip', github: 'thoughtbot/paperclip' #画像保存用 imagemagicが必要
gem 'ridgepole' #DB
gem 'unicorn' #サーバー
gem 'httpclient' #http通信用
gem 'nokogiri' #xmlフォーマッティング
gem 'kaminari' #ページネーション
gem 'therubyracer'
gem 'roo' # fileインポート
gem 'annotate' #model管理
gem 'active_hash' #model用
gem "font-awesome-rails" #css
gem 'cocoon' #form
gem "jquery-rails" #jquery
#gem 'jvectormap-rails',github: 'camertron/jvectormap-rails' #for admin
gem 'jquery-ui-rails' #for admin
gem "meta-tags"
gem 'rails-i18n'
gem "geocoder"
gem "geokit-rails"
gem "rack-user_agent" #mobile判別
gem 'omniauth'
gem 'omniauth-facebook' #auth-facebook
gem 'statesman' # manage status
gem "koala"
gem 'jquery-countdown-rails'
gem 'compass-rails', github: 'Compass/compass-rails' #css

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]