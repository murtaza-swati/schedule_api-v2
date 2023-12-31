![badge](https://app.travis-ci.com/DominikAlberski/schedule_api.svg?branch=main)
# Scheduler API

Simple API for scheduling appointments with doctors. Written in Ruby and Sinatra.

## Installation

Before installing, [download and install Ruby](https://www.ruby-lang.org/en/documentation/installation/).
Database is done in SQLite3. For mac you can install it with `brew install sqlite3`.

Dependencies are managed with [Bundler](https://bundler.io/).
Install gems with `bundle install`.
Setup database with `bundle exec rake db:create`.
Migrate the database with `bunde exec rake db:migrate`.
And seed it `bundle exec rake db:seed` (WIP)
Or you can run `bundle exec rake db:setup` to do all of the above.

## Usage

To run the server, run `ruby app` in the root directory of the project.
The server will be running on `localhost:4567`
Here is postman documentation: [postman](https://documenter.getpostman.com/view/5890252/2s9YR3dFpU)

## API
To use API, you need to create a Organization and know this organization api_key.
You can do this by running rake task `bundle exec rake organization:create\[organization_name,organization_email\]` you will recive organization api_key.
To authorize You need to make POST request to `/exchange_key` with `email` and `api_key` in body.
In response You will receive `access_token` that You need to use in all other requests to `/api/v1/*` in `Authorization` header.
You can check if Your token is valid by making GET request to `/api/v1`

### Endpoints

#### GET /api/v1
#### POST /exchange_key
#### GET /api/v1/doctors/:doctor_id/hours
#### GET /api/v1/doctors/:doctor_id/availability"
#### "POST /api/v1/doctors/:doctor_id/appointments"
#### "PUT /api/v1/doctors/:doctor_id/appointments/:appointment_id"
#### "DELETE /api/v1/doctors/:doctor_id/appointments/:appointment_id"

## Tests

Tests are written with RSpec. To run them, run `bundle exec rake` in the root directory of the project.
If You encounter database errors, run `RACK_ENV=test bundle exec rake db:create db:migrate` and then run the tests again.

latest coverage report:
[coverage](https://dominikalberski.github.io/schedule_api/#_AllFiles)

## License

This project is licensed under the MIT license.
