Kratos Hacker's Guide
=====================

Environment
-----------

# Quick Setup

    rvm install 1.9.3-p0
    rvm use 1.9.3-p0
    rvm gemset create kratos
    rvm gemset use kratos
    gem install bundler
    bundle install

# Quick Setup (Windows)

    pik list -r
    pik install ruby 1.9.3-p0
    ...
  
# Upgrading Rails

    gem update rails
    rake rails:update

# Database

## Creation

The default settings use SQLite and if you are looking for a GUI tool, [SQLite Manager](http://code.google.com/p/sqlite-manager/)
is the right choice.

    rake db:drop db:create db:migrate

To insert the default set of data (especially as we want to fix the UUID of certain records), use:

    rake db:data:load_dir dir="fixtures/dumps"

The dumps in `fixtures/dumps` are created via:

    rake db:seed (works only for pre-20120314193450 migration)
    rm -rf db/fixtures/dumps && rake db:data:dump_dir dir="fixtures/dumps"

## Changes

If the schema is changed (certainly through `rake db:migrate`), besides of creating new dumps, you also need to do a [migration for your tests](http://stackoverflow.com/questions/4949319/factorygirl-rspec-rails-3-undefined-method-attribute) to work:

    rake db:test:load
