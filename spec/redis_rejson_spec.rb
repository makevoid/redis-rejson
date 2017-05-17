require "spec_helper"

describe "RedisReJSON" do

  R = Redis.new(db: 14)

  before :all do
    R.flushdb
  end

  # keys

  it "gets a blank value" do
    foo = R.json_get "foo"
    foo.should be_nil
  end

  it "sets a value" do
    set = R.json_set "foo", '"bar"'
    set.should eq "OK"
  end

  it "gets a value" do
    foo = R.json_get "foo"
    foo.should eq '"bar"'
  end

  it "gets a value (w/ p)" do
    foo = R.json_get "foo", p: "."
    foo.should eq '"bar"'
  end

  it "gets the type" do
    type = R.json_type "foo"
    type.should eq "string"
  end

  it "gets the length of a string" do
    foo = R.json_str_len "foo"
    foo.should eq 3
  end

  # string

  it "appends to a string" do
    foo = R.json_str_append "foo", '"baz"'
    foo.should eq 6
    foo = R.json_get "foo"
    foo.should eq '"barbaz"'
  end

  it "sets a value (w/ path)" do
    set = R.json_set "foo", '{"a": "b"}', p: "."
    set.should eq "OK"
    set = R.json_set "foo", '"bar"', p: "a"
    set.should eq "OK"
    foo = R.json_get "foo", p: "a"
    foo.should eq '"bar"'
  end

  it "gets the length of a string" do
    len = R.json_str_len "foo"
    len = R.json_str_len "foo", p: "a"

  end

  # num

  it "increments a num" do
    set = R.json_set "num", '0'
    set.should eq "OK"
    num = R.json_num_incr_by "num", 1
    num.should eq 1
    num = R.json_num_incr_by "num", 2
    num.should eq 3
  end

  it "increments a num (numincr 1 - easier api)" do
    num = R.json_num_incr "num"
    num.should eq 4
  end

  it "multiplies a num by x" do
    num = R.json_num_mult_by "num", 2
    num.should eq 8
  end

  it "multiplies a num (double)" do
    num = R.json_num_mult_by "num", 2
    num.should eq 16
  end

  # arrays

  # TODO

  # objects

  # utils



end
