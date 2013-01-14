source 'https://rubygems.org'

gem 'rails', '3.2.11'
gem 'json'
gem 'twitter-bootstrap-rails'
gem 'jquery-rails'
gem "devise", "2.0.0"
gem 'active_link_to'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'savon'

group :test do
	gem 'capybara'
	gem 'cucumber-rails', require: false
	gem 'database_cleaner'
	gem 'factory_girl_rails', "~> 4.0"
	gem 'shoulda'
end

group :development, :test do
	gem 'sqlite3', '1.3.5'
	gem 'rspec-rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'therubyracer-heroku', '0.8.1.pre3' # you will need this too
  gem 'pg'
  gem 'google-analytics-rails'
end