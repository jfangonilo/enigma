require_relative 'test_helper'
require './lib/shift'

class ShiftTest < MiniTest::Test
  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_a_shift
    assert_instance_of Integer, @shift.a
  end

  def test_b_shift
    assert_instance_of Integer, @shift.b
  end

  def test_c_shift
    assert_instance_of Integer, @shift.c
  end

  def test_d_shift
    assert_instance_of Integer, @shift.d
  end
end
