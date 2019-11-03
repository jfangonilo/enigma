require_relative 'test_helper'
require './lib/key'

class KeyTest < MiniTest::Test
  def setup
    @key = Key.new
    @key.stubs(:number).returns("01234")
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_random_number_array
    expected = ["0","1","2","3","4"]
    assert_equal expected, @key.number_array
  end

  def test_keys_array
    expected = ["01", "12", "23", "34"]
    assert_equal expected, @key.keys_array
  end

  def test_shift
    assert_equal [1, 12, 23, 34], @key.shifts
  end
end
