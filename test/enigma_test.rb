require_relative 'test_helper'
require './lib/enigma'
require './lib/shift'

class EnigmaTest < MiniTest::Test
  def setup
    Shift.stubs(:a).returns(1)
    Shift.stubs(:b).returns(21)
    Shift.stubs(:c).returns(27)
    Shift.stubs(:d).returns(38)
  end

  def test_it_exists
    assert_instance_of Enigma, Enigma.new
  end
end
