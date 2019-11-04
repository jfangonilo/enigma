class Shift
  def self.rotation(key, date)
    shifts = [key_shift(key), date_shift(date)]
    shifts.transpose.map(&:sum)
  end

  def self.key_shift(key)
    key.chars.each_cons(2).map(&:join).map(&:to_i)
  end

  def self.date_shift(date)
    (date.to_i ** 2).to_s.chars.last(4).map(&:to_i)
  end
end
