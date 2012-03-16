#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
# See: http://stackoverflow.com/questions/6181312/how-to-fix-the-uninitialized-constant-rakedsl-problem-on-heroku
require 'rake/dsl_definition'

Kratos::Application.load_tasks
