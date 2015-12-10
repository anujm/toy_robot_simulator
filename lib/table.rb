require_relative 'position'

class Table
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def within_bounds?(point)
    point.x.between?(0, @length - 1) && point.y.between?(0, @breadth - 1)
  end
end
