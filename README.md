

# README
## Ruby on rails course week 4 example

### How did I start this project?
*PREPARATIONS:* Create `.ruby-gemset`, `.ruby-version`, reload the folder `cd .` to create the gemset environment and run `gem install rails`
1. `rails new . --api -d=postgresql -T` -T doesn't add any test suite (default test suite for Rails is minitest - which _sucks_). `--api` creates the rails app in [API Mode](https://guides.rubyonrails.org/api_app.html)
  * run `rails db:create`
2. Install [Rspec for rails](https://github.com/rspec/rspec-rails) adding to the gemfile the following code:
```ruby
  group :development, :test do
    gem 'rspec-rails'
  end
```
3. `bundle`
4. run `rails generate rspec:install`
  * This command setups everything needed to run `rspec` in your app
  * Try to run `rspec` to check it's working
5. Add `rubocop`, `simplecov`, `factory_bot_rails`, `pry` and `faker` to the `Gemfile` and run `bundle`
```ruby
  group :development, :test do
    gem 'factory_bot_rails'
    gem 'pry'
    gem 'faker'
  end
  group :development do
    gem 'rubocop', '~> 0.59.0', require: false # Check version at the moment
  end
  group :test do
    gem 'simplecov'
  end
```
  * Add the following code to `spec/rails_helper.rb` file
  ```ruby
    require 'factory_bot'
    require 'simplecov'
    SimpleCov.start 'rails'


    RSpec.configure do |config|
      # other stuff inside
      config.include FactoryBot::Syntax::Methods # This allows you to call `create` instead of `FactoryBot.create` in the tests
    end
  ```
  6. Generation of people `rails g model person name:string image_url:string country_code:string`
  7. Generation of movies `rails g model movie name:string year:integer`
  8. Generation of a join class `Participation` to create a relationship between `person` and `movie`. `rails g model participation movie:references person:references role:string`
    * Add validations and relationships between them (director is a person as well)
    * Create factories for the three models
  9. Create controllers:
    * `rails g controller api/v1/people`
    * `rails g controller api/v1/movies`
    * Add routes with namespace
  10. Add `gem 'active_model_serializers'` to the gemfile and `bundle`
  11. Create serializers
  12. Create file `spec/support/json_response.rb` to have quick access to the json response
  * Add the following code to `spec/rails_helper.rb` file to autoload the helper we just created
  ```ruby
    require 'support/json_response'

    RSpec.configure do |config|
      # other stuff inside
      config.include JsonResponse
    end
  ```
