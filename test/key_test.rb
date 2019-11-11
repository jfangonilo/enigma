require_relative 'test_helper'
require './lib/key'

class KeyTest < MiniTest::Test
  def test_it_creates_5_digit_number_as_string
    assert Key.number.count("0123456789") == 5
  end
end
