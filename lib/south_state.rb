require 'state'

class SouthState < State
  def initialize(context)
    super(context)
  end

  def left
    context.position = Position.new(context.position.point, Direction::EAST)
    context.state = EastState.new(context)
  end
end
