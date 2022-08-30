# README

Welcome to the git repository for my message board!

View it live at [here](https://foxy-message-board.herokuapp.com)

To get this application running locally, you will need the following:

### Ruby version:
* `3.1.2`

### System dependencies:
* postgresql installed `brew install postgresql`

### Database creation:
* `bundle exec rake db:setup` and insert some data using `bundle exec rake db:fixtures:load` 

### How to run the tests:
* `bundle exec rspec`
