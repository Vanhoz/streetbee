# Streetbee test API

Small guide to deploy the app.

You need to have Docker and docker-compose installed.

## Getting started

* Run `docker-compose build` to build image, install gems and dependencies

* Start server with `docker-compose up`

* Create the database: `docker-compose run website rake db:create`

* Seed the user: `docker-compose run website rake db:seed`

* Get JWT token to authorize requests: `docker-compose run website rake auth:get_user_token`

* Run tests: `docker-compose run website bundle exec rspec`

## Requests

* Upload photos: `/uploads/upload`

* Get photos with pagination: `/uploads?page=1`
