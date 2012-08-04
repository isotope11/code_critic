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

Also, make a `~/tmp/repos` directory and set the following ENV variable in your `~/.bashrc`:

    export CODE_CRITIC_LOCAL_CLONES_DIR='~/tmp/repos'

If you're using xrono to auth in development, make sure to pull it down and add an oauth application for codecritic.  The redirect uri will need to be something like `http://localhost:3001/users/auth/xrono/callback`

You'll also want to set these ENV vars for your local xrono setup with valid values:

    export XRONO_OAUTH_URL="http://localhost:3000"
    export CODE_CRITIC_APP_ID="appid"
    export CODE_CRITIC_APP_SECRET="secret"
