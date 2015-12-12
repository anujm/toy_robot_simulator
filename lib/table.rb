require 'position'
require 'direction'

class Table
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def within_bounds?(point)
    point.x.between?(0, @length - 1) && point.y.between?(0, @breadth - 1)
  end

  DIRECTION_TO_EDGE_CHECK_ALGORITHM_MAP = {
      Direction::NORTH => :at_northern_edge?,
      Direction::SOUTH => :at_southern_edge?,
      Direction::EAST => :at_eastern_edge?,
      Direction::WEST => :at_western_edge?
  }

  def at_edge?(position)
    self.send(DIRECTION_TO_EDGE_CHECK_ALGORITHM_MAP[position.direction], position)
  end

  private

  def at_northern_edge?(position)
    (position.point.y + 1 == @breadth) && position.direction == Direction::NORTH
  end

  def at_southern_edge?(position)
    position.point.y == 0 && position.direction == Direction::SOUTH
  end

  def at_eastern_edge?(position)
    (position.point.x + 1 == @length) && position.direction == Direction::EAST
  end

  def at_western_edge?(position)
    (position.point.x == 0) && position.direction == Direction::WEST
  end
end
