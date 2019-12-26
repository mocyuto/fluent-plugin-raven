require "helper"
require "fluent/plugin/out_raven.rb"

class RavenOutputTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  test "failure" do
    flunk
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Output.new(Fluent::Plugin::RavenOutput).configure(conf)
  end
end
