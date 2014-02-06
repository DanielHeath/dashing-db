# Dashing::Db

Backs Dashing dashboards onto a database instead of a filestore.
You want this (or something like it) if you're using Passenger to run Dashing.

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
## Contributing

1. Fork it ( http://github.com/<my-github-username>/dashing-db/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
