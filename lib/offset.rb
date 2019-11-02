class Offset
  attr_reader :date

  def initialize
    @date = Time.new
  end

  def date_string
<<<<<<< HEAD
    date.strftime "%d%m%y"
=======
    @date.strftime "%d%m%y"
>>>>>>> ce5e71ffe54a1a33cc1303949f224ab6aaf46204
  end
end
