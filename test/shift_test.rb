require_relative 'test_helper'
require './lib/shift'

class ShiftTest < MiniTest::Test
  def test_key_shift
    assert_equal [1, 12, 23, 34], Shift.key("01234")
  end

  def test_date_shift
    assert_equal [0, 9, 4, 4], Shift.date("090788")
  end

  def test_rotation
    key = "01234"
    date = "090788"
    assert_equal [1, 21, 27, 38], Shift.final(key, date)
  end
end
