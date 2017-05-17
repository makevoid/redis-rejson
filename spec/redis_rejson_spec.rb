require "spec_helper"

describe "RedisReJSON" do

  R = Redis.new(db: 14)

  before :all do
    R.flushdb
  end

  it "gets a blank value" do
    foo = R.json_get "foo"
    foo.should be_nil
  end

  it "sets blank value" do
    foo = R.json_set "foo", "\"bar\""
    foo.should eq "OK"
  end

  it "gets a value" do
    foo = R.json_get "foo"
    foo.should eq "\"bar\""
  end
end
