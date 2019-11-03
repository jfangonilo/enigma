require_relative 'key'
require_relative 'date'

class Enigma
  attr_reader :message, :key, :date

  def initialize
    @message = "hello world"
    @key = Key.new
    @date = EncodeDate.new
  end

  def shift_for_key
    key.chars.each_cons(2).map {|number| number.join}.map {|key| key.to_i}
  end

  def shift_for_date
    (date.to_i ** 2).to_s.chars.last(4).map {|offset| offset.to_i}
  end

  def chop_message
    message.chars.each_slice(4).to_a
  end
end
