require_relative 'test_helper'
require './lib/alphabet'

class AlphabetTest < MiniTest::Test
  def setup
    @alphabet = Alphabet.new
  end

  def test_it_exists
    assert_instance_of Alphabet, @alphabet
  end

  def test_it_has_string_of_alphabet
    assert_equal "abcdefghijklmnopqrstuvwxyz ", Alphabet.default
  end
end
