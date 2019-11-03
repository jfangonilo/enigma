require_relative 'key'
require_relative 'date'

class Enigma
  attr_reader :message, :key, :date, :alphabet

  def initialize
    @message = ""
    @key = Key.new
    @date = EncodeDate.new
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def shift_for_key
    key.chars.each_cons(2).map {|number| number.join}.map {|key| key.to_i}
  end

  def shift_for_date
    (date.to_i ** 2).to_s.chars.last(4).map {|offset| offset.to_i}
  end

  def shifts
    shifts = [shift_for_key, shift_for_date]
    shifts.transpose.map {|shift| shift.sum}
  end

  def chop_message
    message.chars.each_slice(4).to_a
  end

  def encrypt_message
    chop_message.reduce([]) do |translation, chunk|
      translation << chunk[0].tr(alphabet.join, alphabet.rotate(shifts[0]).join) unless chunk[0].nil?
      translation << chunk[1].tr(alphabet.join, alphabet.rotate(shifts[1]).join) unless chunk[1].nil?
      translation << chunk[2].tr(alphabet.join, alphabet.rotate(shifts[2]).join) unless chunk[2].nil?
      translation << chunk[3].tr(alphabet.join, alphabet.rotate(shifts[3]).join) unless chunk[3].nil?
      translation
    end.join
  end
end
