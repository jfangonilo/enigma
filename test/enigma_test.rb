require_relative 'test_helper'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    @enigma.stubs(:key).returns("01234")
    @enigma.stubs(:date).returns("090788")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_shift_for_key
    assert_equal [1, 12, 23, 34], @enigma.shift_for_key
  end
end
