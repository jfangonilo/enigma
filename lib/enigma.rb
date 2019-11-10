require_relative 'key'
require_relative 'date'
require_relative 'shift'
require_relative 'alphabet'

class Enigma
  attr_reader :key, :date, :map

  def initialize
    @key = Key.number
    @date = Date.string
    @map = Alphabet.default
  end

  def encrypt(message, key = @key, date = @date)
    shifts = Shift.final(key, date)
    {encryption: encrypt_message(message, shifts), key: key, date: date}
  end

  def decrypt(message, key = @key, date = @date)
    shifts = Shift.final(key, date)
    {decryption: decrypt_message(message, shifts), key: key, date: date}
  end

  def encrypt_message(message, shifts)
    chopped(message).map {|chunk| encrypt_chunk(chunk, shifts)}.join
  end

  def decrypt_message(message, shifts)
    chopped(message).map {|chunk| decrypt_chunk(chunk, shifts)}.join
  end

  def encrypt_chunk(chunk, shifts)
    chunk.map.with_index do |letter, index|
      rotated_map = map.chars.rotate(shifts[index]).join
      chunk[index].tr(map, rotated_map) unless chunk[index].nil?
    end
  end

  def decrypt_chunk(chunk, shifts)
    chunk.map.with_index do |letter, index|
      rotated_map = map.chars.rotate(shifts[index]).join
      chunk[index].tr(rotated_map, map) unless chunk[index].nil?
    end
  end

  def chopped(message)
    message.each_char.each_slice(4).to_a
  end
end
