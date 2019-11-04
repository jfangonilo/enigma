require_relative 'test_helper'
require './lib/shift'

class ShiftTest < MiniTest::Test
  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_key_shift
    assert_equal [1, 12, 23, 34], Shift.key_shift("01234")
  end

  def test_date_shift
    assert_equal [0, 9, 4, 4], Shift.date_shift("090788")
  end

  def test_rotation
    key = "01234"
    date = "090788"
    assert_equal [1, 21, 27, 38], Shift.rotation(key, date)
  end
end
