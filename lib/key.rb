class Key
  attr_reader :number

  def initialize
    @number = rand.to_s[2..6]
  end

  def number_string_as_array
    number.chars
  end

  def keys_array
    keys = []
    number_string_as_array.each_cons(2) {|number| keys << number}
    keys.map {|key| key.join}
  end

  def a
    keys_array[0].to_i
  end

  def b
    keys_array[1].to_i
  end

  def c
    keys_array[2].to_i
  end

  def d
    keys_array[3].to_i
  end
end
