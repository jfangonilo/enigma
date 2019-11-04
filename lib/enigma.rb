require_relative 'key'
require_relative 'date'

class Enigma
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def encrypt(message, key = Key.number, date = EncodeDate.date)
    enigma = Enigma.new(message, key, date)
    encrypt_hash = {}
    encrypt_hash[:encryption] = enigma.encrypt_message
    encrypt_hash[:key] = enigma.key
    encrypt_hash[:date] = enigma.date
    encrypt_hash
  end

  def encrypt_message
    chopped_message.reduce([]) do |translation, chunk|
      translation << encrypt_chunk(chunk)
    end.join
  end

  def decrypt_message
    chopped_message.reduce([]) do |translation, chunk|
      translation << decrypt_chunk(chunk)
    end.join
  end

  def encrypt_chunk(chunk)
    chunk.to_enum.with_index.map do |letter, index|
      rotated_map = alphabet.rotate(shifts[index]).join
      chunk[index].tr(map, rotated_map) unless chunk[index].nil?
    end
  end

  def decrypt_chunk(chunk)
    chunk.to_enum.with_index.map do |letter, index|
      rotated_map = alphabet.rotate(shifts[index]).join
      chunk[index].tr(rotated_map, map) unless chunk[index].nil?
    end
  end

  def chopped_message
    message.chars.each_slice(4).to_a
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def map
    alphabet.join
  end

  def shifts
    shifts = [shift_for_key, shift_for_date]
    shifts.transpose.map(&:sum)
  end

  def shift_for_key
    @key.chars.each_cons(2).map(&:join).map(&:to_i)
  end

  def shift_for_date
    (@date.to_i ** 2).to_s.chars.last(4).map(&:to_i)
  end
end
