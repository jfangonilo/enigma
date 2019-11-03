require_relative 'key'
require_relative 'offset'

class Shift
  def self.a
    Key.shifts[0] + Offset.shifts[0]
  end

  def self.b
    Key.shifts[1] + Offset.shifts[1]
  end

  def self.c
    Key.shifts[2] + Offset.shifts[2]
  end

  def self.d
    Key.shifts[3] + Offset.shifts[3]
  end
end
