class Key
  attr_reader :number

  def initialize(number = nil)
    @number = valid_key(number)
  end

  def valid_key(number)
    if number.nil? || number.count("0123456789") != 5
      random_number
    else
      number
    end
  end

  def random_number
    rand.to_s[2..6]
  end
end
