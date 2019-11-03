class Key
  def self.number
    rand.to_s[2..6]
  end

  def self.number_array
    number.chars
  end

  def self.keys_array
    number_array.each_cons(2).map {|number| number.join}
  end

  def self.shifts
    keys_array.map {|key| key.to_i}
  end
end
