class Offset
  attr_reader :date

  def initialize
    @date = Time.new
  end

  def date_string
    @date.strftime "%d%m%y"
  end
end
