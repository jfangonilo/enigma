class EncodeDate
  attr_reader :date

  def initialize(date = nil)
    @date = valid_date(date)
  end

  def valid_date(date)
    if date.nil? || date.count("0123456789") != 6
      today
    else
      date
    end
  end

  def today
    Time.new.strftime "%d%m%y"
  end
end
