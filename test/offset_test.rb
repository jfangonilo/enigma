require_relative 'test_helper'
require './lib/offset'

class OffsetTest < MiniTest::Test
  def setup
    @offset = Offset.new
    @offset.stubs(:date_string).returns("090788")
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_can_get_date
    assert_instance_of Time, @offset.date
  end

  def test_get_date_string
    assert_instance_of String, @offset.date_string
  end

  def test_date_int
    assert_equal 90_788, @offset.date_int
  end

  def test_date_squared
    assert_equal 8_242_460_944, @offset.date_squared
  end

  def test_offset_digits
    assert_equal ["0", "9", "4", "4"], @offset.digits_array
  end

  def test_letter_offsets
    assert_equal 0, @offset.a
    assert_equal 9, @offset.b
    assert_equal 4, @offset.c
    assert_equal 4, @offset.d
  end
end
