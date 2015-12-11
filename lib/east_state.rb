require 'state'

class EastState < State
  def initialize(context)
    super(context)
  end

  def left
    context.position = Position.new(context.position.point, Direction::NORTH)
    context.state = NorthState.new(context)
  end
end
