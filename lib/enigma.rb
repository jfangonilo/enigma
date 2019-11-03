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
    message.chars
  end

  def chunk_message
    chop_message.each_slice(4).to_a
  end

  def encrypt_message
    a_shift = shifts[0]
    b_shift = shifts[1]
    c_shift = shifts[2]
    d_shift = shifts[3]

    # message1 = chop_message
    message2 = chunk_message
    message2.map do |chunk|
      translated = []
      translated << chunk[0].tr(alphabet.join, alphabet.rotate(a_shift).join) unless chunk[0].nil?
      translated << chunk[1].tr(alphabet.join, alphabet.rotate(b_shift).join) unless chunk[1].nil?
      translated << chunk[2].tr(alphabet.join, alphabet.rotate(c_shift).join) unless chunk[2].nil?
      translated << chunk[3].tr(alphabet.join, alphabet.rotate(d_shift).join) unless chunk[3].nil?
      translated
    end.flatten.join
  end
end
