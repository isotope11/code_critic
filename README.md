## Code Critic
### Or, "Hey I just met you, and this is crazy, but here's some code, so review it maybe?"

Peer review some code

### Development Installation
Fork, then clone the repository to your development environment

    gem install bundler
    bundle install
    rake db:reset db:test:clone test

Run guard to run the tests as you develop:

    bundle exec guard

Then when you change files, blammo, tests will runnnnn.
