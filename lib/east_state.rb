require 'state'

class EastState < State
  def initialize(context)
    super(context)
  end

  def left
    context.position = Position.new(context.position.point, Direction::NORTH)
    context.state = NorthState.new(context)
  end

  def right
    context.position = Position.new(context.position.point, Direction::SOUTH)
    context.state = SouthState.new(context)
  end

  def move
    destination_point = Point.new(context.position.point.x + 1, context.position.point.y)
    context.position.point = destination_point
  end
end
