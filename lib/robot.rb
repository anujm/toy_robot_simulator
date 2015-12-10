class Robot
  attr_reader :position

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
