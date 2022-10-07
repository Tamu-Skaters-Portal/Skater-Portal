# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* System versions
Ruby 3.2.1
Rails 7.0.2
DOcker version 20.10.17
PostgreSQL 12.12

* Gemfiles
RuboCop
Brakeman
Simplecov

* test command
rspec spec/

* Execute Code
cd (to the repo)
docker run --rm -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest
cd (to app)
bundle install
rails webpacker:install
rails db:create 
rails db:migrate

* Running the app
rails server --binding=0.0.0.0
then go to your localhost

