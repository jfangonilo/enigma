require_relative 'test_helper'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    # @enigma.stubs(:message).returns("hello world")
    # @enigma.stubs(:key_string).returns("01234")
    # @enigma.stubs(:date_string).returns("090788")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_alphabet
    assert_instance_of Array, @enigma.alphabet
  end

  def test_map
    assert_instance_of String, @enigma.map
  end

  def test_shift_for_key
    @enigma.stubs(:key_string).returns("01234")
    assert_equal [1, 12, 23, 34], @enigma.shift_for_key
  end

  def test_shift_for_date
    @enigma.stubs(:date_string).returns("090788")
    assert_equal [0, 9, 4, 4], @enigma.shift_for_date
  end

  def test_shifts
    @enigma.stubs(:key_string).returns("01234")
    @enigma.stubs(:date_string).returns("090788")
    assert_equal [1, 21, 27, 38], @enigma.shifts
  end

  def test_chop_message
    message = "hello world"
    expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]]
    assert_equal expected, @enigma.chopped_message(message)
  end

  def test_encrypt
    @enigma.stubs(:key_string).returns("01234")
    @enigma.stubs(:date_string).returns("090788")
    message = "hello world"
    expected = "izlwpuwzsfd"
    assert_equal expected, @enigma.encrypt_message(message)
  end

  def test_encrypt_chunk
    @enigma.stubs(:key_string).returns("01234")
    @enigma.stubs(:date_string).returns("090788")
    original = ["h", "e", "l", "l"]
    expected = ["i", "z", "l", "w"]
    assert_equal expected, @enigma.encrypt_chunk(original)
  end

  def test_decrypt
    @enigma.stubs(:key_string).returns("01234")
    @enigma.stubs(:date_string).returns("090788")
    message = "izlwpuwzsfd"
    expected = "hello world"
    assert_equal expected, @enigma.decrypt_message(message)
  end

  def test_decrypt_chunk
    @enigma.stubs(:key_string).returns("01234")
    @enigma.stubs(:date_string).returns("090788")
    original = ["i", "z", "l", "w"]
    expected = ["h", "e", "l", "l"]
    assert_equal expected, @enigma.decrypt_chunk(original)
  end

  def test_encryption_hash
    message = "hello world"
    key = "01234"
    date = "090788"
    require "pry"; binding.pry
    @enigma.encrypt(message, key, date)
  end
end
