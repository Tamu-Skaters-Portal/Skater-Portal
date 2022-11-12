# README

This README would normally document whatever steps are necessary to get the
application up and running.

Introduction:
The Tamu Skater Portal web app was developed as a central page for all things TAMU Skaters. 
On the web app you can find information on the org and find links to join it. 
It is also used as a data tracker/organizer for all things the organization needs.

Things you may want to cover:

* System versions
  * Ruby 3.2.1
  * Rails 7.0.2
  * DOcker version 20.10.17
  * PostgreSQL 12.12

* Gemfiles
  * RuboCop
  * Brakeman
  * Simplecov

* Installation
  * Run: git clone https://github.com/your_github_here.git 

* Test command
  * rspec spec/

* Execute Code
  * cd (to the repo)
  * docker run --rm -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest
  * cd (to app)
  * bundle install
  * rails webpacker:install
  * rails db:create 
  * rails db:migrate

* Running the app
  * rails server --binding=0.0.0.0
  * then go to your localhost

* Deployment
  * The repo is linked to the heroku pipeline, so merging to main will result in automatic deployment

* Support
  * Users seeking support can run the web app and join the organization discord. There you will find a channel for support from the developers    
