class Offset
  attr_reader :date

  def initialize
    @date = Time.new
  end

  def get_year_string
    @date.year.to_s.split(//).last(2).join
  end

  def method_name

  end

end
