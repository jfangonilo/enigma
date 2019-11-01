class Key

  def random_five_digit_number
    rand(99999)
  end

  def number_as_string
    random_five_digit_number.to_s.rjust(5, "0")
  end

  def number_string_as_array
    number_as_string.chars
  end

  def keys_step_one
    keys = []
    number_string_as_array.each_cons(2) {|number| keys << number}
    keys
  end

  def keys_step_two
    keys = []
    keys_step_one.each {|key| keys << key.join}
    keys
  end
end
