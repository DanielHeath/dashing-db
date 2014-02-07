# Dashing::Db

Backs Dashing dashboards onto a database instead of a filestore.

Makes deployment easier since it doesn't matter if history.yml gets overwritten.

Also makes deployment with passenger easier (still a PITA due to rufus-scheduler conflicting with the default PassengerSpawnMode)

## Installation

Add this line to your application's Gemfile:

    gem 'dashing-db'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dashing-db

## Usage

In your dashing `config.ru`:
```
  require 'sequel'
  require 'mysql2'
  db = Sequel.connect :adapter=>'mysql2', :host => 'localhost', :database => 'dashing'

  Sinatra::Application.set history: Dashing::Db::History.new(db)
  Sinatra::Application.set history_file: "/dev/null"
```

Feel free to use any database you feel like (as long as Sequel can connect to it).
Note that sqlite won't work with passenger as sqlite doesn't handle multiple processes accessing the same database and passenger runs multiple processes.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/dashing-db/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
