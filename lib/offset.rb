class Offset
  attr_reader :date

  def initialize
    @date = Time.new.strftime("%d%m%y")
  end

  def date_squared
    (date.to_i)**2
  end

  def date_sqrd_str
    date_squared.to_s
  end

  def date_sqrd_array
    date_sqrd_str.chars
  end

  def offset_array
    date_sqrd_array.last(4)
  end

  def shifts
    offset_array.map {|number| number.to_i}
  end
end
