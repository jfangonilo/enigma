require_relative 'test_helper'
require './lib/key'

class KeyTest < MiniTest::Test
  def setup
    Key.stubs(:random_number).returns("01234")
  end

  def test_it_exists
    assert_instance_of Key, Key.new
  end

  def test_random_number_array
    expected = ["0","1","2","3","4"]
    assert_equal expected, Key.random_number_array
  end

  def test_keys_array
    expected = ["01", "12", "23", "34"]
    assert_equal expected, Key.keys_array
  end

  def test_shift
    assert_equal [1, 12, 23, 34], Key.shifts
  end
end
