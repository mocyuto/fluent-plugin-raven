# frozen_string_literal: true

require 'helper'
require 'fluent/plugin/out_raven'

class RavenOutputTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  sub_test_case 'configure' do
    test 'check default' do
      d = nil
      assert_raise do
        d = create_driver('')
      end
    end
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Output.new(Fluent::Plugin::RavenOutput).configure(conf)
  end
end
