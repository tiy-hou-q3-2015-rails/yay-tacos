YayTacos
=========

[![Build Status](https://travis-ci.org/tiy-hou-q3-2015-rails/yay-tacos.svg?branch=master)](https://travis-ci.org/tiy-hou-q3-2015-rails/yay-tacos)


A Taco joint.


Abilities:

* Sign in and Sign Up
* Buy tacos

TODO:

* EAT TACOS

Getting Setup
---------------

1. Create a `config/application.yml`
1. set `stripe_api_key` and `stripe_publishable_key` in config/application.yml

Environment Variables (MUST SET UP)
------

Follow instructions in Getting setup or else it will break

```
config/initializers/payola.rb:  config.secret_key = ENV['stripe_api_key']
config/initializers/payola.rb:  config.publishable_key = ENV['stripe_publishable_key']
```
