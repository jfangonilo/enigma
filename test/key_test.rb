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

  def test_generate_key
    number = "01234"
    assert_equal "01234", @key.valid_key(number)
    number = "00000"
    assert_equal "00000", @key.valid_key(number)
    number = "1234"
    refute_equal "1234", @key.valid_key(number)
    number = "123456"
    refute_equal "123456", @key.valid_key(number)
    number = "asfkkjhk"
    refute_equal "asfkkjhk", @key.valid_key(number)
  end
end
