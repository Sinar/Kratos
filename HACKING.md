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

The default settings use SQLite and if you are looking for a GUI tool, [SQLite Manager](http://code.google.com/p/sqlite-manager/)
is the right choice.

    rake db:drop db:create db:migrate db:seed
