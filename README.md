filecoin-ruby
=============

![Ruby](https://github.com/subvisual/filecoin-ruby/workflows/Ruby/badge.svg)

Interface to the Filecoin network APIs in Ruby.


Installation
------------

Add this line to your application's Gemfile:

```ruby
gem "filecoin", "~> 0.3.0"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install filecoin


Usage
-----

```ruby
# FILECOIN_URL="https://filecoin.example.com:1234"
# FILECOIN_TOKEN="asdfghjkl"
Filecoin.chain_head
```

`Filecoin` exposes all the API methods for applications that prefer to load
configuration from environment variables. These methods are implemented by
`Filecoin::Client` which is abstracted away in this case.


### Client

Clients are initialized with the URI to the target API server. This URI can be
provided as a `URI` object, or as a `String`. If omitted, `Filecoin::Client`
defaults to the value of the `FILECOIN_URL` environment variable.

```ruby
# with a URI object
Filecoin::Client.new(uri: URI("https://filecoin.example.com:1234"))

# with a String
Filecoin::Client.new(uri: "https://filecoin.example.com:1234")

# from the FILECOIN_URL environment variable
Filecoin::Client.new
```

Some methods in the [Filecoin Node API] require special [permissions]. To use
any such method, you'll have to provide your authentication token to the
client, either on initialization or through the `FILECOIN_TOKEN` environment
variable.

```ruby
# with a token String
Filecoin::Client.new(token: "asdfghjkl")

# from the FILECOIN_TOKEN environment variable
Filecoin::Client.new
```

For each supported method of the [Filecoin Node API] there is a respective
method in `Filecoin::Client`. For instance, to call `Filecoin.ChainHead` use
`Filecoin::Client#chain_head`.

Some methods require their parameters to follow a hard-to-describe structure.
In such cases, use the respective type class to make things simpler.

All methods return the server's JSON parsed response as a plain `Hash`.


### Supported Filecoin Node API methods

- [x] `Filecoin.ChainHead`
- [x] `Filecoin.ClientGetDealInfo`
- [x] `Filecoin.ClientQueryAsk`
- [x] `Filecoin.ClientStartDeal`
- [x] `Filecoin.NetPeers`

For more information on each supported method, check
[the wiki](https://github.com/subvisual/filecoin-ruby/wiki/Supported-Methods).


Development
-----------

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake` to run the linter and tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to [rubygems.org].


Contributing
------------

Bug reports and pull requests are welcome on GitHub at
https://github.com/subvisual/filecoin-ruby.

This project was created to provide a Ruby interface for projects we at
Subvisual are actively working on. We are not aiming to provide an exaustive
interface for the time being, and will focus our development efforts as needed.

We welcome anyone interested in helping the development of this project to
contribute directly with a pull request. Otherwise, please feel free to request
any features you feel are missing in an issue. We will do our best to comply,
within reason and the limits of our own availability.


License
-----

filecoin-ruby is copyright &copy; 2020 Subvisual, Lda.

It is open-source, made available for free, and is subject to the terms in
its [license].


About
-----

filecoin-ruby was created and is maintained with :heart: by
[Subvisual][subvisual].

[![Subvisual][subvisual-logo]][subvisual]


[Filecoin Node API]: https://github.com/filecoin-project/lotus/blob/master/api/api_full.go
[permissions]: https://lotu.sh/en+api#what-authorization-level-should-i-use-21853
[license]: ./LICENSE.txt
[rubygems.org]: https://rubygems.org
[subvisual]: http://subvisual.com
[subvisual-logo]: https://raw.githubusercontent.com/subvisual/guides/master/github/templates/logos/blue.png

