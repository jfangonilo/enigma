require_relative 'test_helper'
require './lib/offset'

class OffsetTest < MiniTest::Test
  def setup
    Offset.stubs(:date).returns("090788")
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
