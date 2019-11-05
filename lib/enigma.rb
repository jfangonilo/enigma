require_relative 'key'
require_relative 'date'
require_relative 'shift'

class Enigma
  def initialize
    @key = Key.number
    @date = Date.string
  end

  def encrypt(message, key = @key, date = @date)
    shifts = Shift.final(key, date)
    { encryption: encrypt_message(message, shifts), key: key, date: date }
  end

  def decrypt(message, key = @key, date = @date)
    shifts = Shift.final(key, date)
    { decryption: decrypt_message(message, shifts), key: key, date: date }
  end

  def encrypt_message(message, shifts)
    chopped_message(message).reduce([]) do |translation, chunk|
      translation << encrypt_chunk(chunk, shifts)
    end.join
  end

  def decrypt_message(message, shifts)
    chopped_message(message).reduce([]) do |translation, chunk|
      translation << decrypt_chunk(chunk, shifts)
    end.join
  end

  def encrypt_chunk(chunk, shifts)
    chunk.map.with_index do |letter, index|
      rotated_map = alphabet.rotate(shifts[index]).join
      chunk[index].tr(map, rotated_map) unless chunk[index].nil?
    end
  end

  def decrypt_chunk(chunk, shifts)
    chunk.map.with_index do |letter, index|
      rotated_map = alphabet.rotate(shifts[index]).join
      chunk[index].tr(rotated_map, map) unless chunk[index].nil?
    end
  end

  def chopped_message(message)
    message.each_char.each_slice(4).to_a
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def map
    alphabet.join
  end
end
