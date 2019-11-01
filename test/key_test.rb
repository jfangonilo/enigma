require_relative './test_helper'
require './lib/key'

class KeyTest < MiniTest::Test
  def setup
    @key = Key.new
    @mock_key = mock("key")
    @mock_key.number.returns(1234)
    # @mock_key.number_as_string.returns("01234")
    # 
    #
    # array_1 = ["0", "1", "2", "3", "4"]
    # @mock_key.number_string_as_array.returns(array_1)
    #
    #
    # array_2 = [["0", "1"],["1", "2"],["2", "3"],["3", "4"]]
    # @mock_key.keys_step_one.returns(array_2)
    #
    # array_3 = [["01"],["12"],["23"],["34"]]
    # @mock_key.keys_step_two.returns(array_3)
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_gets_number
    assert_equal 1234, @mock_key.number
  end

  def test_it_can_convert_to_string
    assert_equal "01234", @mock_key.number_as_string
  end

  def test_keys_step_one
    assert_equal ["0", "1", "2", "3", "4"], @mock_key.keys_step_one
  end

  def test_keys_step_two
    assert_equal [["01"],["12"],["23"],["34"]], @mock_key.keys_step_two
  end
end
