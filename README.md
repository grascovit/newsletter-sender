[![Build Status](https://travis-ci.org/grascovit/newsletter-sender.svg?branch=master)](https://travis-ci.org/grascovit/newsletter-sender)

# Newsletter Sender

Application created using Rails 5.2.0 and Ruby 2.5.1.

#### Setup
To get the application running, follow the steps below:
```shell
bundle install
```

Run `bundle exec figaro install`, copy the content from `config/application.yml.example` file to `config/application.yml` and fill the required data.

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