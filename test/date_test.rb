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
  end

  def test_valid_date
    date = "031119"
    assert_equal "031119", @day.valid_date(date)
    date = "010120"
    assert_equal "010120", @day.valid_date(date)
    date = "aflkha"
    refute_equal "aflkha", @day.valid_date(date)
    date = "0121"
    refute_equal "0121", @day.valid_date(date)
    date = "1414111"
    refute_equal "1414111", @day.valid_date(date)
  end
end
