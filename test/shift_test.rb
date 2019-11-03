require_relative 'test_helper'
require './lib/shift'
require './lib/offset'
require './lib/key'

class ShiftTest < MiniTest::Test
  def setup
    Key.stubs(:random_number).returns("01234")
    Offset.stubs(:date).returns("090788")
  end

  def test_a_shift
    assert_equal 1, Shift.a
  end

  def test_b_shift
    assert_equal 21, Shift.b
  end

  def test_c_shift
    assert_equal 27, Shift.c
  end

  def test_d_shift
    assert_equal 38, Shift.d
  end

end
