Kratos's Deployment Guide
=========================

Heroku
------

### Git Push

[Deployment to Heroku](https://devcenter.heroku.com/articles/git) is a no-brainer:

    git push heroku

### Assets ###

If you are using the Cedar stack, Heroku automatically compiles your assets. Refer to its [guide](https://devcenter.heroku.com/articles/rails3x-asset-pipeline-cedar#troubleshooting)
if things don't happen as you wish it to be.

### Database ###

To backup (or download for troubleshooting purpose) the remote database, use [taps](https://devcenter.heroku.com/articles/taps).
You can push your local DB to Heroku too.
