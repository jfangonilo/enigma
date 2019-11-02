class Offset
  attr_reader :date

  def initialize
    @date = Time.new
  end

  def get_year
    @date.year.split(//).last(2).join
  end

end
