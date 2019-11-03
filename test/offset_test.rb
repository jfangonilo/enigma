require_relative 'test_helper'
require './lib/offset'

class OffsetTest < MiniTest::Test
  def setup
    Offset.stubs(:date).returns("090788")
  end

  def test_it_exists
    assert_instance_of Offset, Offset.new
  end

  def test_date_squared
    assert_equal 8_242_460_944, Offset.date_squared
  end

  def test_date_squared_to_str
    assert_equal "8242460944", Offset.date_sqrd_str
  end

  def test_date_sqrd_array
    expected = ["8", "2", "4", "2", "4", "6", "0", "9", "4", "4"]
    assert_equal expected, Offset.date_sqrd_array
  end

  def test_offset_array
    expected = ["0", "9", "4", "4"]
    assert_equal expected, Offset.offset_array
  end

  def test_offset_shifts
    expected = [0, 9, 4, 4]
    assert_equal expected, Offset.shifts
  end
end
