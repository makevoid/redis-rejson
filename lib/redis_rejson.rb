require 'redis'
require_relative "redis_rejson/version"

class Redis

  module ReJSON
  end

  # key

  def json_set(key, value, p: nil)
    client.call json_cmd_two(:set, key, value, p)
  end

  def json_get(key, p: nil)
    client.call json_cmd_one(:get, key, p)
  end

  def json_type(key, p: nil)
    client.call json_cmd_one(:type, key, p)
  end

  def json_mget(key, p: nil)

  end

  # string

  def json_str_len(key, p: nil)
    client.call json_cmd_one(:strlen, key, p)
  end

  def json_str_append(key, value, p: nil)
    client.call json_cmd_two(:strappend, key, value, p)
  end

  # num

  def json_num_incr_by(key, value, p: nil)
    jto_i client.call json_cmd_two(:numincrby, key, value, p)
  end

  def json_num_incr(key, p: nil)
    jto_i client.call json_cmd_two(:numincrby, key, 1, p)
  end

  def json_num_mult_by(key, value, p: nil)
    jto_i client.call json_cmd_two(:nummultby, key, value, p)
  end

  def json_num_mult_double(key, p: nil)
    jto_i client.call json_cmd_two(:nummultby, key, 2, p)
  end


  # array

  def json_arr_append(key, value, p: nil)
    jto_i client.call json_cmd_two(:arrappend, key, value, p)
  end

  def json_arr_index(key, value, p: nil)
    jto_i client.call json_cmd_two(:arrindex, key, value, p)
  end

  def json_arr_insert(key, value, p: nil)
    jto_i client.call json_cmd_two(:arrinsert, key, value, p)
  end

  def json_arr_len(key, value, p: nil)
    jto_i client.call json_cmd_two(:arrlen, key, value, p)
  end

  # object

  # util

  private

  def jto_i(value)
    value.to_i
  end

  # json command, one parameter
  def json_cmd_one(cmd, key, path)
    unless path
      ["JSON.#{cmd.upcase}", key]
    else
      ["JSON.#{cmd.upcase}", key, path]
    end
  end

  # json command, two parameters
  def json_cmd_two(cmd, key, value, path)
    unless path
      ["JSON.#{cmd.upcase}", key, ".", value]
    else
      ["JSON.#{cmd.upcase}", key, path, value]
    end
  end

end
#
# redis.client.call(["JSON.SET", "foo",  ".", "\"bar\""])
# => "OK"
#
# irb(main):012:0> redis.client.call(["JSON.GET", "foo"])
