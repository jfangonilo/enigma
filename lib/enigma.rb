require_relative 'key'
require_relative 'date'

class Enigma
  attr_reader :message, :key, :date

  def initialize
    @message = ""
    @key = Key.new
    @date = EncodeDate.new
  end

  def encrypt_message(message)
    chopped_message(message).reduce([]) do |translation, chunk|
      translation << encrypt_chunk(chunk)
    end.join
  end

  def encrypt_chunk(chunk)
    chunk.to_enum.with_index.map do |letter, index|
      rotated_map = alphabet.rotate(shifts[index]).join
      chunk[index].tr(map, rotated_map) unless chunk[index].nil?
    end
  end

  def decrypt_message(message)
    chopped_message(message).reduce([]) do |translation, chunk|
      translation << decrypt_chunk(chunk)
    end.join

  end

  def decrypt_chunk(chunk)
    chunk.to_enum.with_index.map do |letter, index|
      rotated_map = alphabet.rotate(shifts[index]).join
      chunk[index].tr(rotated_map, map) unless chunk[index].nil?
    end
  end

  def chopped_message(message)
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
    shifts.transpose.map {|shift| shift.sum}
  end

  def shift_for_key
    key.chars.each_cons(2).map {|number| number.join}.map {|key| key.to_i}
  end

  def shift_for_date
    (date.to_i ** 2).to_s.chars.last(4).map {|offset| offset.to_i}
  end
end
