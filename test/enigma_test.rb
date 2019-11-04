require_relative 'test_helper'
require './lib/enigma'
require './lib/date'

class EnigmaTest < MiniTest::Test
  def test_it_exists
    enigma = Enigma.new("hello world", "01234", "090788")
    assert_instance_of Enigma, enigma
  end

  def test_it_has_alphabet
    enigma = Enigma.new("hello world", "01234", "090788")
    assert_instance_of Array, enigma.alphabet
  end

  def test_map
    enigma = Enigma.new("hello world", "01234", "090788")
    assert_instance_of String, enigma.map
  end

  def test_shift_for_key
    enigma = Enigma.new("hello world", "01234", "090788")
    assert_equal [1, 12, 23, 34], enigma.shift_for_key
  end

  def test_shift_for_date
    enigma = Enigma.new("hello world", "01234", "090788")
    assert_equal [0, 9, 4, 4], enigma.shift_for_date
  end

  def test_shifts
    enigma = Enigma.new("hello world", "01234", "090788")
    assert_equal [1, 21, 27, 38], enigma.shifts
  end

  def test_chop_message
    enigma = Enigma.new("hello world", "01234", "090788")
    expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]]
    assert_equal expected, enigma.chopped_message
  end

  def test_encrypt
    enigma = Enigma.new("hello world", "01234", "090788")
    expected = "izlwpuwzsfd"
    assert_equal expected, enigma.encrypt_message
  end

  def test_encrypt_chunk
    enigma = Enigma.new("hello world", "01234", "090788")
    original = ["h", "e", "l", "l"]
    expected = ["i", "z", "l", "w"]
    assert_equal expected, enigma.encrypt_chunk(original)
  end

  def test_decrypt
    encrypted_enigma = Enigma.new("izlwpuwzsfd", "01234", "090788")
    expected = "hello world"
    assert_equal expected, encrypted_enigma.decrypt_message
  end

  def test_decrypt_chunk
    encrypted_enigma = Enigma.new("izlwpuwzsfd", "01234", "090788")
    original = ["i", "z", "l", "w"]
    expected = ["h", "e", "l", "l"]
    assert_equal expected, encrypted_enigma.decrypt_chunk(original)
  end

  def test_encryption_hash_with_3_args
    message = "hello world!?"
    key = "02715"
    date = "040895"

    expected = {
      encryption: "keder ohulw!?",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, Enigma.encrypt(message, key, date)
  end

  def test_encryption_hash_without_date
    message = "hello world!?"
    key = "02715"
    assert_equal Date.string, Enigma.encrypt(message, key)[:date]
  end

  
end
