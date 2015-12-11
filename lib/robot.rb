require 'unplaced_state'

class Robot
  attr_accessor :position, :state

  def initialize
    @state = UnplacedState.new(self)
  end

  def place(position)
    @position = position
  end

  def left
    if @position.direction == Direction::NORTH
      @position = Position.new(position.point, Direction::WEST)
    elsif @position.direction == Direction::EAST
      @position = Position.new(position.point, Direction::NORTH)
    elsif @position.direction == Direction::SOUTH
      @position = Position.new(position.point, Direction::EAST)
    elsif @position.direction == Direction::WEST
      @position = Position.new(position.point, Direction::SOUTH)
    end
  end
end
