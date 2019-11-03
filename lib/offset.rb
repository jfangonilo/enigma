class Offset
  def self.date
    Time.new.strftime("%d%m%y")
  end

  def self.date_squared
    (date.to_i)**2
  end

  def self.date_sqrd_str
    date_squared.to_s
  end

  def self.date_sqrd_array
    date_sqrd_str.chars
  end

  def self.offset_array
    date_sqrd_array.last(4)
  end

  def self.shifts
    offset_array.map {|offset| offset.to_i}
  end
end
