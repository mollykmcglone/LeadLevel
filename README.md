# LeadLevel

#### An Epicodus group project built with Ruby, Sinatra, and PostgreSQL

#### By Molly McGlone, Alex Jacks, Bang Nguyen, and Matthew Giem, July 2016

## Description

An Epicodus group project to practice a many-to-many database with Active Record and Ruby.

* As a user, I can search for, add, update, and delete places.
* As a user, I can add, update and delete water testing reports for a specific place.
* As a user, I can see all of the water testing reports that have been added to a place.
* As a user, I want to be able to see the contact information for the person or organization that owns the place.

## Setup/Installation Requirements

To replicate, clone this repository to your local hard drive using this link: https://github.com/mollykmcglone/leadlevel.git

###Set up Databases:
```
$ postgres
(open new window)
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```
###Install and Run Bundler:
```
$ gem install bundler
$ bundle
```
###Run the Sinatra application:
```
$ ruby app.rb
Navigate to `localhost:4567` with a browser
```
## Support and contact details

Please contact me with any questions, concerns, or ideas at mollykmcglone@gmail.com

## Technologies Used

* Ruby
* Sinatra
* PostgreSQL
* Active Record
* HTML
* CSS
* Bootstrap

### License

MIT License

Copyright (c) 2016  **Molly McGlone, Alex Jacks, Bang Nguyen, and Matthew Giem**
