require_relative 'test_helper'
require './lib/date'

class EncodeDateTest < MiniTest::Test
  def setup
    @day = EncodeDate.new
    @day.stubs(:date).returns("090788")
  end

  def test_it_exists
    assert_instance_of EncodeDate, @day
  end

  def test_it_has_date_as_string
    assert_equal "090788", @day.date
    assert_instance_of String, @day.date
  end
end
