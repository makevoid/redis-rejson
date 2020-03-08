# Redis ReJSON

Redis ReJSON (v4 Module - json manipulation) adapter for Ruby's Redis-rb - status: beta release

For a more complete implementation look at the newer https://rubygems.org/gems/rejson-rb

For an ORM build on top of `redis-rjson-rb` check out https://github.com/makevoid/redijson_models


#### Installation

Compile the ReJSON module - configure redis (you need v4) to load it ( loadmodule /etc/redis/modules/rejson/rejson.so in `redis.conf` )


Documentation of ReJSON - https://redislabsmodules.github.io/rejson/commands/#jsonstrlen

---

## API:

```rb
R = Redis.new(db: 14)

R.json_get "foo" # => "bar"

R.json_set "foo", '"baz"' # => "OK"

R.json_get "foo", p: "." # every command comes with *path selectors* support (you can traverse json arrays and objects and set child values - . is the root)

R.json_type "foo" # => "string" # returns the ype of the value at the given key

R.json_str_len "foo" # => 3

```

else, check the specs ( https://github.com/makevoid/redis-rejson-rb/blob/master/spec/redis_rejson_spec.rb ) or the implementation itself (super simple atm)

---

### Install

Add this gem to your gemfile:

```
gem "redis_rejson"
```

Then run bundle:

```
bundle
```

---

Enjoy :)

@makevoid
