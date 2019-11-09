# README

## Zomato-Clone

### In this web app two types of users are available: 
  * Viewer / User
  * Admin

#### Viewer / User:
  * Can sign up using facebook, Google or Email.
  * Can sign in using facebook, Google or Email.
  * Can add mobile numbers or change profile pics, password etc.
  * Can book a table on any restaurant or edit booked table.
  * Can order food online from any restaurant or can cancel order.
  * Can search nearby restaurant, restaurant category etc.

#### Admin:
  Admin can access all the feature.
  
  ** Note: In seed file Admin user details:
           Email: krishna@gmail.com
           Password: 123456789

### Things you may want to cover:
  * Ruby version: 2.6.3
  * Rails version: 6.0.0
  * Elastic Search version: 7.4.2
  * Database: MySql version: 8.0.18

### Note:
  * Before running rails server, please confirm that elasticsearch running, else you get some faraday connection errors.

### Third Parties packages:
  * Google Maps API
  * Geocoder gem
  * Google Omniauth Oauth2
  * Facebook Omniauth
  * jquery timepicker
  * jquery datepicker
  * raty-js
  * elasticsearch-model
  * elasticsearch-rails
  * Bootstrap
  * jQuery
  * lightbox2

### Steps to run Zomato-Clone

Go to "Elasticsearch/bin" directory then,
1. Run "./elasticsearch"

Go to "Zomato-Clone" cloned directory then,

2. Run "yarn install --check-files" to to sync node-modules
3. Run "bundle install"
4. Run "rails db:create db:migrate"
5. Run "rails db:seed"
6. Run "rails s"