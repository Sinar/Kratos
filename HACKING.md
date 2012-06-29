Kratos Hacker's Guide
=====================

Environment
-----------

### Quick Setup

    rvm install 1.9.3-p0
    rvm use 1.9.3-p0
    rvm gemset create kratos
    rvm gemset use kratos
    gem install bundler

Then, install the gems with:

    bundle install

Or (if you are not gonna develop but deploy):

    bundle install --without development

### Quick Setup (Windows)

    pik list -r
    pik install ruby 1.9.3-p0
    ...
  
### Upgrading Rails

    gem update rails
    rake rails:update

Database
--------

### Creation

The default settings use SQLite and if you are looking for a GUI tool, [SQLite Manager](http://code.google.com/p/sqlite-manager/)
is the right choice.

    rake db:drop db:create db:migrate

To insert the default set of data (especially as we want to fix the UUID of certain records), use:

    rake db:data:load_dir dir="fixtures/dumps"

The dumps in `fixtures/dumps` are created via:

    rake db:seed (please check commented lines in seeds.rb)
    rm -rf db/fixtures/dumps && rake db:data:dump_dir dir="fixtures/dumps"

### PostgreSQL

At the point of writing, Kratos is deployed to Heroku that requires a PostgreSQL set up.

[On a Ubuntu machine](http://stackoverflow.com/a/3116128/36397):

    sudo apt-get install postgresql libpq-dev
    bundle install

### Changes

If the schema is changed (certainly through `rake db:migrate`), besides of creating new dumps, you also need to do a [migration for your tests](http://stackoverflow.com/q/4949319) to work:

    rake db:test:load

This can also be achieved with:

    rake RAILS_ENV=test db:migrate

Running
-------

If you want to quickly boot up an instance, run:

    rails s

If it fails with missing development gems, install the gems by hand or run the production mode instead:

    rails -e production s

Libraries
---------

### Devise ###

#### Post Upgrade ####

It seems common that a major Devise upgrade breaks your application - introduction and removal of configuration entries.
Run this command after an upgrade to have configuration refreshed:

    rails g devise:install
