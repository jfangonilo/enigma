require_relative 'test_helper'
require './lib/enigma'
require './lib/shift'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_map
    expected = "abcdefghijklmnopqrstuvwxyz "
    assert_equal expected, @enigma.map
  end

  def test_chop_message
    expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]]
    assert_equal expected, @enigma.chopped("hello world")
  end

  def test_encrypt
    @enigma.stubs(:key).returns("01234")
    @enigma.stubs(:date).returns("090788")
    shifts = Shift.final(@enigma.key, @enigma.date)
    expected = "izlwpuwzsfd"
    assert_equal expected, @enigma.encrypt_message("hello world", shifts)
  end

  def test_encrypt_chunk
    @enigma.stubs(:key).returns("01234")
    @enigma.stubs(:date).returns("090788")
    shifts = Shift.final(@enigma.key, @enigma.date)
    original = ["h", "e", "l", "l"]
    expected = ["i", "z", "l", "w"]
    assert_equal expected, @enigma.encrypt_chunk(original, shifts)
  end

  def test_decrypt
    @enigma.stubs(:key).returns("01234")
    @enigma.stubs(:date).returns("090788")
    shifts = Shift.final(@enigma.key, @enigma.date)
    expected = "hello world"
    assert_equal expected, @enigma.decrypt_message("izlwpuwzsfd", shifts)
  end

  def test_decrypt_chunk
    @enigma.stubs(:key).returns("01234")
    @enigma.stubs(:date).returns("090788")
    shifts = Shift.final(@enigma.key, @enigma.date)
    original = ["i", "z", "l", "w"]
    expected = ["h", "e", "l", "l"]
    assert_equal expected, @enigma.decrypt_chunk(original, shifts)
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
    assert_equal expected, @enigma.encrypt(message, key, date)
  end

  def test_encryption_hash_without_date
    message = "hello world!?"
    key = "02715"
    assert_equal Date.string, @enigma.encrypt(message, key)[:date]
  end

  def test_encryption_hash_with_only_message
    message = "hello world!?"
    assert @enigma.encrypt(message)[:encryption].length == message.length
  end

  def test_decryption_hash_with_3_args
    message = "keder ohulw!?"
    key = "02715"
    date = "040895"

    expected = {
      decryption: "hello world!?",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt(message, key, date)
  end

  def test_decryption_hash_without_date
    message = "keder ohulw!?"
    key = "02715"
    assert_equal Date.string, @enigma.decrypt(message, key)[:date]
  end
end
