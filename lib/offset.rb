class Offset
  attr_reader :date

  def initialize
    @date = Time.new
  end

  def date_string
    date.strftime("%d%m%y")
  end

  def date_int
    date_string.to_i
  end

  def date_squared
    date_int ** 2
  end

  def digits_array
    date_squared.to_s.chars.last(4)
  end

  def a
    digits_array[0].to_i
  end

  def b
    digits_array[1].to_i
  end

  def c
    digits_array[2].to_i
  end

  def d
    digits_array[3].to_i
  end
end
