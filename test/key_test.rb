require_relative 'test_helper'
require './lib/key'

class KeyTest < MiniTest::Test
  def setup
    Key.stubs(:random_number).returns(["0","1","2","3","4"])
  end

  def test_keys_array
    expected = ["01", "12", "23", "34"]
    assert_equal expected, Key.keys_array
  end

  def test_shift
    assert_equal [1, 12, 23, 34], Key.shifts
  end
end
