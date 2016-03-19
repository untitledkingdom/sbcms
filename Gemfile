source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails',            '5.0.0.beta3'
gem 'haml-rails'
gem 'rails-settings-cached'
gem 'bcrypt',           '~> 3.1.7'
gem 'active_model_serializers', '0.10.0.rc3'
gem 'puma'

# contains rails5 fixes not yet merged to rails repository!
gem 'activerecord-session_store', github: 'Partyista/activerecord-session_store'

gem 'uglifier',         '>= 1.3.0'
gem 'coffee-rails'
gem 'therubyracer',     platforms: :ruby
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'

gem 'bootstrap-sass',   '~> 3.3.6'
gem 'bootswatch-rails'
gem 'kaminari',         github: 'amatsuda/kaminari'

gem 'httparty'

gem 'pry-rails'
gem 'tzinfo-data',      platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'pg'
  gem 'rails_stdout_logging'
end

group :development, :test do
  gem 'byebug'
  gem 'sqlite3'
end

group :development do
  gem 'spring'
  gem 'listen',         '~> 3.0.5'
  gem 'annotate',       github: 'ctran/annotate_models'
end

group :test do
  gem 'minitest-rails', github: 'blowmage/minitest-rails', branch: 'rails5'
  gem 'simplecov',      require: false
end
