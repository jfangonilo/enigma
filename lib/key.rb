class Key
  attr_reader :number

  def initialize
    @number = rand.to_s[2..6]
  end
end
