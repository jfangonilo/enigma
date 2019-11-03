class EncodeDate
  attr_reader :date

  def initialize
    @date = Time.new.strftime "%d%m%y"
  end
end
