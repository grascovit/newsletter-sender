[![Build Status](https://travis-ci.org/grascovit/newsletter-sender.svg?branch=master)](https://travis-ci.org/grascovit/newsletter-sender)

# Newsletter Sender

Web application that eases the sending of press release emails using ElasticEmail API and a simple UI.

#### Requirements
- Ruby 2.6.3
- Rails 5.2.3
- PostgreSQL 9.5+

#### Setup
To get the application running, follow the steps below:
```shell
bundle install
```

Create a `config/application.yml` file, copy the content from `config/application.yml.example` file to it and fill the values.

After this, execute the following steps:
```shell
rails db:setup
```
Finally, run it:
```shell
rails s
```

#### Tests
To run the test suite, run:
```shell
bundle exec rspec
```

#### Static code analysis
To run Rubocop, run:
```shell
rubocop -a
```