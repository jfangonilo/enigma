class Offset
  def self.date
    Time.new.strftime("%d%m%y")
  end

  def self.offset_array
    ((date.to_i)**2).to_s.chars.last(4)
  end

  def self.shifts
    offset_array.map {|offset| offset.to_i}
  end
end
