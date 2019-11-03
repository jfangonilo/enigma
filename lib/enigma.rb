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

end
