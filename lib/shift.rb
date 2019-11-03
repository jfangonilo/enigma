require_relative 'key'
require_relative 'offset'

class Shift
  attr_reader :key, :offset

  def initialize
    @key = Key.new
    @offset = Offset.new
  end

  def a
    @key.shifts[0] + @offset.shifts[0]
  end

  def b
    @key.shifts[1] + @offset.shifts[1]
  end

  def c
    @key.shifts[2] + @offset.shifts[2]
  end

  def d
    @key.shifts[3] + @offset.shifts[3]
  end
end
