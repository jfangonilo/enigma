require_relative 'test_helper'
require './lib/date'

class DateTest < MiniTest::Test
  def setup
    @day = Date.new
  end

  def test_it_exists
    assert_instance_of Date, @day
  end

end
