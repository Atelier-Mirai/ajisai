source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# テンプレートエンジンに slim を利用する
gem 'slim-rails'
# フロントエンドフレームワークとして、Fomantic-UI を利用する
gem 'fomantic-ui-sass'
# 文字列に含まれるURLを自動的にリンク化する
gem 'rails_autolink'

group :development, :test do
  gem 'better_errors'       # エラー画面を見やすく
  gem 'binding_of_caller'   # ページフッターにデバッグ情報表示
  gem 'pry'
  gem 'pry-rails'           # rails consoleでirbの代わりにpryを使う
  gem 'pry-byebug'          # デバッグを実施
  gem 'hirb'                # console上のモデル出力を整形
  gem 'hirb-unicode'        # console上のモデル出力を整形
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # ja.yml 生成用
  gem 'i18n_generators'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # gem 'rspec-rails'
  # gem 'spring-commands-rspec'
  # gem 'factory_bot_rails'
  # テスト結果を見やすく表示
  gem 'minitest'
  gem 'minitest-reporters'
end

# warning 抑制のために
gem 'warning'

# 検索機能
gem 'ransack'

# Amazon S3 サービスを利用する
gem "aws-sdk-s3", require: false
