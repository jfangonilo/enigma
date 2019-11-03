class Key
  def self.random_number
    rand.to_s[2..6].chars
  end

  def self.keys_array
    random_number.each_cons(2).map {|number| number.join}
  end

  def self.shifts
    keys_array.map {|key| key.to_i}
  end
end
