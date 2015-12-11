require 'state'

class NorthState < State
  def initialize(context)
    super(context)
  end

  def left
    context.position = Position.new(context.position.point, Direction::WEST)
    context.state = WestState.new(context)
  end

  def right
    context.position = Position.new(context.position.point, Direction::EAST)
    context.state = EastState.new(context)
  end

  def move
    destination_point = Point.new(context.position.point.x, context.position.point.y + 1)
    context.position.point = destination_point
  end
end
