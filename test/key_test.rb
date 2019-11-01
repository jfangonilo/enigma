require_relative 'test_helper'
require './lib/key'

class KeyTest < MiniTest::Test
  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_gets_number
    assert_instance_of Integer, @key.number
  end

  def test_it_can_convert_to_string
    @key.stubs(:number_as_string).returns("01234")
    assert_equal "01234", @key.number_as_string
  end

  def test_number_string_as_array
    array = ["0", "1", "2", "3", "4"]
    @key.stubs(:number_string_as_array).returns(array)
    assert_equal array, @key.number_string_as_array
  end

  def test_keys_hash
    array = [["0", "1"], ["1", "2"],["2", "3"],["3", "4"]]
    @key.stubs(:keys_array).returns(array)
    assert_equal array, @key.keys_array
  end

  def test_letter_keys
    @key.stubs(:a).returns(1)
    assert_equal 1, @key.a

    @key.stubs(:b).returns(12)
    assert_equal 12, @key.b

    @key.stubs(:c).returns(23)
    assert_equal 23, @key.c

    @key.stubs(:d).returns(34)
    assert_equal 34, @key.d
  end
end
