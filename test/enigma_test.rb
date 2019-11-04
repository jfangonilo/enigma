require_relative 'test_helper'
require './lib/enigma'
require './lib/date'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end
  # 
  # def test_it_exists
  #   assert_instance_of Enigma, @enigma
  # end
  #
  # def test_it_has_alphabet
  #   expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  #   assert_equal expected, @enigma.alphabet
  # end
  #
  # def test_map
  #   expected = "abcdefghijklmnopqrstuvwxyz "
  #   assert_equal expected, @enigma.map
  # end
  #
  # def test_shift_for_key
  #   @enigma.stubs(:key).returns("01234")
  #   @enigma.stubs(:date).returns("090788")
  #   assert_equal [1, 12, 23, 34], @enigma.shift_for_key
  # end
  #
  # def test_shift_for_date
  #   @enigma.stubs(:key).returns("01234")
  #   @enigma.stubs(:date).returns("090788")
  #   assert_equal [0, 9, 4, 4], @enigma.shift_for_date
  # end
  #
  # def test_shifts
  #   @enigma.stubs(:key).returns("01234")
  #   @enigma.stubs(:date).returns("090788")
  #   assert_equal [1, 21, 27, 38], @enigma.shifts
  # end
  #
  # def test_chop_message
  #   @enigma.stubs(:key).returns("01234")
  #   @enigma.stubs(:date).returns("090788")
  #   expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]]
  #   assert_equal expected, @enigma.chopped_message("hello world")
  # end
  #
  # def test_encrypt
  #   @enigma.stubs(:key).returns("01234")
  #   @enigma.stubs(:date).returns("090788")
  #   expected = "izlwpuwzsfd"
  #   assert_equal expected, @enigma.encrypt_message("hello world")
  # end
  #
  # def test_encrypt_chunk
  #   @enigma.stubs(:key).returns("01234")
  #   @enigma.stubs(:date).returns("090788")
  #   original = ["h", "e", "l", "l"]
  #   expected = ["i", "z", "l", "w"]
  #   assert_equal expected, @enigma.encrypt_chunk(original)
  # end
  #
  # def test_decrypt
  #   @enigma.stubs(:key).returns("01234")
  #   @enigma.stubs(:date).returns("090788")
  #   expected = "hello world"
  #   assert_equal expected, @enigma.decrypt_message("izlwpuwzsfd")
  # end
  #
  # def test_decrypt_chunk
  #   @enigma.stubs(:key).returns("01234")
  #   @enigma.stubs(:date).returns("090788")
  #   original = ["i", "z", "l", "w"]
  #   expected = ["h", "e", "l", "l"]
  #   assert_equal expected, @enigma.decrypt_chunk(original)
  # end

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
    skip
    message = "hello world!?"
    key = "02715"
    assert_equal Date.string, Enigma.encrypt(message, key)[:date]
  end

  def test_encryption_hash_with_only_message
    skip
    message = "hello world!?"
    assert Enigma.encrypt(message)[:encryption].length == message.length
  end

  def test_decryption_hash_with_3_args
    skip
    message = "keder ohulw!?"
    key = "02715"
    date = "040895"

    expected = {
      decryption: "hello world!?",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, Enigma.decrypt(message, key, date)
  end

  def test_decryption_hash_without_date
    skip
    message = "keder ohulw!?"
    key = "02715"
    assert_equal Date.string, Enigma.decrypt(message, key)[:date]
  end
end
