class Key
  attr_reader :number

  def initialize
    @number = rand.to_s[2..6]
  end

  def number_array
    number.chars
  end

  def keys_array
    number_array.each_cons(2).map {|number| number.join}
  end

  def shifts
    keys_array.map {|key| key.to_i}
  end
end
