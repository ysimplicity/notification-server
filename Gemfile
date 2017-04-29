source 'https://rubygems.org'

ruby '2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.1'
gem 'mongoid', '~> 6.0', '>= 6.0.3'
gem 'mongoid_paranoia', '~> 0.3.0'
gem 'sucker_punch', '~> 2.0', '>= 2.0.2'
gem 'http', '~> 2.1'
gem 'parallel', '~> 1.10'

gem 'slim-rails', '~> 3.1', '>= 3.1.1'
gem 'rails-assets-milligram', '1.2.2', source: 'https://rails-assets.org'
gem 'rack-cors'

gem 'puma', '~> 3.6'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

group :production do
  gem 'heroku-deflater', '~> 0.6.3'
  gem 'rails_12factor'
end

group :development, :test do
  # Development
  gem 'awesome_print', '~> 1.7'
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
  gem 'i18n-tasks', '~> 0.9.11'

  # Debugging
  # Call 'byebug' anywhere in the code to stop execution
  # and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry-byebug', '~> 3.4', '>= 3.4.2'
  gem 'pry-doc', '~> 0.9.0'
  gem 'pry-rails', '~> 0.3.4'

  # Performance
  gem 'bullet', '~> 5.5'
  gem 'rack-mini-profiler', '~> 0.10.1'

  # Security
  gem 'brakeman', '~> 3.4', '>= 3.4.1'
  gem 'bundler-audit', '~> 0.5.0'

  # Quality
  gem 'parser', '~> 2.3', '>= 2.3.3.1'
  gem 'rubocop', '~> 0.47.1', require: false
  gem 'rubycritic', '~> 3.1', '>= 3.1.3'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %>
  # anywhere in the code.
  gem 'web-console'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
