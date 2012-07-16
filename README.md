## Code Critic
### Or, "Hey I just met you, and this is crazy, but here's some code so...review it maybe?"

Peer review some code

### Development Installation
Fork, then clone the repository to your development environment

    gem install bundler
    bundle install
    rake db:reset db:test:clone test

Run guard to run the tests as you develop:

    bundle exec guard

Then when you change files, blammo, tests will runnnnn.

Also, make a ./repos directory in `RAILS_ROOT`

If you're using xrono to auth in development, make sure to pull it down and add an oauth application for codecritic.  The redirect uri will need to be something like `http://localhost:3001/users/auth/xrono/callback`
