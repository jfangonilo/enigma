class Key
  attr_reader :number

  def initialize
    @number = rand(99999)
  end

  def number_as_string
    @number.to_s.rjust(5, "0")
  end

  def number_string_as_array
    number_as_string.chars
  end

  def group_number_string
    keys = []
    number_string_as_array.each_cons(2) {|number| keys << number}
    keys
  end

  def keys_array
    group_number_string.map {|key| key.join}
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
