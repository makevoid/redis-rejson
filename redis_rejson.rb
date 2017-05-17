require 'redis'

class Redis

  module ReJSON
  end

  def json_set(key, value)
    client.call ["JSON.SET", key,  ".", value]
  end

  def json_get(key)
    client.call ["JSON.GET", key]
  end

end
#
# redis.client.call(["JSON.SET", "foo",  ".", "\"bar\""])
# => "OK"
#
# irb(main):012:0> redis.client.call(["JSON.GET", "foo"])
