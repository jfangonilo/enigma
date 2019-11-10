class Shift
  def self.final(key, date)
    [key(key), date(date)].transpose.map(&:sum)
  end

  def self.key(key)
    key.chars.each_cons(2).map(&:join).map(&:to_i)
  end

  def self.date(date)
    (date.to_i ** 2).to_s.chars.last(4).map(&:to_i)
  end
end
